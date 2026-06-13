// Program.cs (C# 7.3 compatible)
// NuGet: Install-Package SSH.NET
// Reference: System.Configuration
//
// Features:
// - Handles Report Pundit raw file (pipe or CSV delimiter)
// - Supports MONTH/BACKFILL files (multi-date): aggregates by Date+Hour and generates 24 rows per date
//   -> Multi-date generates ONE FILE PER BUSINESS DATE (prevents overwriting)
// - Daily file naming (single-date): default filename uses TODAY date (per requirement)
// - GST checkbox default from App.config (Defaults.ForceGst)
// - GST Registered normalization: "Y or N" -> Y (only N if starts with N)
// - SFTP fix for "Resource busy / in progress" rename: unique temp name + delete/rename retry + idempotent skip

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

// SSH.NET
using Renci.SshNet;
using Renci.SshNet.Common;

namespace SalesDataConverterApp
{
    // ==========================================
    // UI LAYER: MAIN FORM
    // ==========================================
    public class MainForm : Form
    {
        private TextBox _txtInputPath;
        private TextBox _txtMachineIdOverride;
        private TextBox _txtBatchIdOverride;
        private CheckBox _chkRecalcGst;
        private TextBox _txtPreview;
        private Button _btnBrowse;
        private Button _btnConvert;
        private Button _btnPush;
        private Button _btnOpenLogs;
        private ListBox _lblStatus;
        private ProgressBar _progressBar;

        private string _currentOutputFile = "";
        private List<string> _currentOutputFiles = new List<string>();

        private readonly ConverterEngine _engine;
        private readonly SftpService _sftpService;

        public MainForm()
        {
            _engine = new ConverterEngine();
            _sftpService = new SftpService();

            InitializeComponent();
            InitializeLogger();
        }

        private void InitializeLogger()
        {
            FileLogger.Instance.LogInfo("Application Started (v" + AppConfig.GetString("App.Version", "2.7") + ").");
            UpdateStatus("System Ready. Logs are being recorded locally.");
        }

        private void InitializeComponent()
        {
            this.Text = "Sales Utility v" + AppConfig.GetString("App.Version", "2.7") + " (Format Update - No Padding)";
            this.Size = new Size(950, 850);
            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;

            Label lblTitle = new Label
            {
                Text = "Sales Data Conversion Utility",
                Font = new Font("Segoe UI", 16, FontStyle.Bold),
                Location = new Point(20, 20),
                Size = new Size(500, 35)
            };

            _btnOpenLogs = new Button { Text = "📂 Open Log History", Location = new Point(700, 20), Size = new Size(160, 30) };
            _btnOpenLogs.Click += delegate
            {
                try
                {
                    string dir = FileLogger.Instance.GetLogDirectory();
                    if (!Directory.Exists(dir))
                    {
                        MessageBox.Show("Log directory not found.", "Logs", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return;
                    }
                    Process.Start("explorer.exe", dir);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Failed to open logs: " + ex.Message, "Logs", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            };

            Label lblFile = new Label
            {
                Text = "1. Select Input CSV/TXT",
                Location = new Point(20, 70),
                Size = new Size(300, 20),
                Font = new Font("Segoe UI", 9, FontStyle.Bold)
            };

            _txtInputPath = new TextBox { Location = new Point(20, 95), Size = new Size(740, 25), ReadOnly = true };

            _btnBrowse = new Button { Text = "Browse...", Location = new Point(770, 93), Size = new Size(90, 27) };
            _btnBrowse.Click += BtnBrowse_Click;

            GroupBox gpOverrides = new GroupBox { Text = "Contingency Overrides", Location = new Point(20, 135), Size = new Size(840, 100), Font = new Font("Segoe UI", 9) };

            Label lblMach = new Label { Text = "Machine ID:", Location = new Point(15, 35), Size = new Size(80, 20) };
            _txtMachineIdOverride = new TextBox { Location = new Point(100, 32), Size = new Size(150, 25), MaxLength = 12 };

            Label lblBatch = new Label { Text = "Batch ID:", Location = new Point(280, 35), Size = new Size(80, 20) };
            _txtBatchIdOverride = new TextBox { Location = new Point(370, 32), Size = new Size(150, 25), MaxLength = 12 };

            _chkRecalcGst = new CheckBox { Text = "Force Recalculate GST (9%)", Location = new Point(550, 32), Size = new Size(250, 25), ForeColor = Color.Red };
            _chkRecalcGst.Checked = AppConfig.GetBool("Defaults.ForceGst", true);

            Label lblNote = new Label
            {
                Text = "* Fixes source tax rate errors.",
                Location = new Point(550, 60),
                Size = new Size(280, 20),
                Font = new Font("Segoe UI", 8, FontStyle.Italic),
                ForeColor = Color.Gray
            };

            gpOverrides.Controls.AddRange(new Control[] { lblMach, _txtMachineIdOverride, lblBatch, _txtBatchIdOverride, _chkRecalcGst, lblNote });

            _btnConvert = new Button
            {
                Text = "STEP 2: CONVERT & PREVIEW",
                Location = new Point(20, 250),
                Size = new Size(415, 50),
                BackColor = Color.LightSteelBlue,
                Font = new Font("Segoe UI", 10, FontStyle.Bold),
                Enabled = false
            };
            _btnConvert.Click += BtnConvert_Click;

            _btnPush = new Button
            {
                Text = "STEP 3: PUSH TO VENDOR",
                Location = new Point(445, 250),
                Size = new Size(415, 50),
                BackColor = Color.LightGreen,
                Font = new Font("Segoe UI", 10, FontStyle.Bold),
                Enabled = false
            };
            _btnPush.Click += BtnPush_Click;

            Label lblPreview = new Label { Text = "Preview:", Location = new Point(20, 310), Size = new Size(200, 20), Font = new Font("Segoe UI", 9, FontStyle.Bold) };
            _txtPreview = new TextBox
            {
                Location = new Point(20, 335),
                Size = new Size(840, 250),
                Multiline = true,
                ReadOnly = true,
                ScrollBars = ScrollBars.Both,
                Font = new Font("Consolas", 9),
                BackColor = Color.Black,
                ForeColor = Color.LimeGreen
            };

            _progressBar = new ProgressBar { Location = new Point(20, 600), Size = new Size(840, 15), Visible = false };
            Label lblLog = new Label { Text = "Live Activity Log:", Location = new Point(20, 625), Size = new Size(150, 20) };
            _lblStatus = new ListBox { Location = new Point(20, 645), Size = new Size(840, 100) };

            this.Controls.AddRange(new Control[] { lblTitle, _btnOpenLogs, lblFile, _txtInputPath, _btnBrowse, gpOverrides, _btnConvert, _btnPush, lblPreview, _txtPreview, _progressBar, lblLog, _lblStatus });
        }

        private void BtnBrowse_Click(object sender, EventArgs e)
        {
            try
            {
                using (OpenFileDialog ofd = new OpenFileDialog { Filter = "Report Files (*.csv, *.txt)|*.csv;*.txt" })
                {
                    if (ofd.ShowDialog() == DialogResult.OK)
                    {
                        if (new FileInfo(ofd.FileName).Length == 0) throw new Exception("The selected file is empty (0 bytes).");

                        _txtInputPath.Text = ofd.FileName;
                        _btnConvert.Enabled = true;

                        FileLogger.Instance.LogInfo("User selected file: " + ofd.FileName);
                        UpdateStatus("File loaded ready for conversion.");
                    }
                }
            }
            catch (Exception ex)
            {
                FileLogger.Instance.LogError("File selection failed", ex);
                MessageBox.Show("Error: " + ex.Message, "File Selection Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private async void BtnConvert_Click(object sender, EventArgs e)
        {
            _currentOutputFile = "";
            _currentOutputFiles = new List<string>();
            _btnPush.Enabled = false;

            string mOverride = (_txtMachineIdOverride.Text ?? "").Trim();
            string bOverride = (_txtBatchIdOverride.Text ?? "").Trim();
            bool forceGst = _chkRecalcGst.Checked;

            if (string.IsNullOrWhiteSpace(mOverride)) mOverride = AppConfig.GetString("Defaults.MachineId", "").Trim();
            if (string.IsNullOrWhiteSpace(bOverride)) bOverride = AppConfig.GetString("Defaults.BatchId", "").Trim();

            List<DateTime> dates = _engine.PeekDistinctDates(_txtInputPath.Text);

            if (dates.Count == 0)
            {
                MessageBox.Show("No valid Date rows detected in the input file.", "No Data", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (dates.Count == 1)
            {
                // DAILY mode: filename uses TODAY per requirement (even if input date is yesterday)
                string today = DateTime.Now.ToString("yyyyMMdd");
                string machineForName = !string.IsNullOrWhiteSpace(mOverride) ? mOverride : "UNKNOWN";
                string defaultName = "H" + machineForName + "_" + today + ".txt";

                using (SaveFileDialog sfd = new SaveFileDialog { Filter = "Text files (*.txt)|*.txt", FileName = defaultName })
                {
                    if (sfd.ShowDialog() != DialogResult.OK) return;

                    _currentOutputFile = sfd.FileName;

                    ToggleUI(false);
                    UpdateStatus("Converting (single-day mode)...");
                    FileLogger.Instance.LogInfo("Conversion started (single-day).");

                    ConverterEngine.ConversionResult result = await _engine.ConvertFileAsync(_txtInputPath.Text, _currentOutputFile, mOverride, bOverride, forceGst, false);

                    ToggleUI(true);

                    if (!result.Success)
                    {
                        foreach (string err in result.Errors) UpdateStatus(err);
                        MessageBox.Show("Conversion failed. Check logs.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }

                    _currentOutputFiles = new List<string>(result.OutputFiles);
                    _txtPreview.Text = File.ReadAllText(_currentOutputFile, Encoding.UTF8);
                    _btnPush.Enabled = true;

                    UpdateStatus("OK: Generated " + result.RowsProcessed + " rows.");
                    MessageBox.Show("Conversion Complete.", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                // BACKFILL/MONTH mode: generate one file per business date to avoid overwriting.
                using (FolderBrowserDialog fbd = new FolderBrowserDialog())
                {
                    fbd.Description = "Multiple dates detected (" + dates.Count + "). Select OUTPUT FOLDER to generate one file per date.";
                    if (fbd.ShowDialog() != DialogResult.OK) return;

                    string outputFolder = fbd.SelectedPath;

                    ToggleUI(false);
                    UpdateStatus("Converting (multi-day mode)...");
                    FileLogger.Instance.LogInfo("Conversion started (multi-day). Output folder: " + outputFolder);

                    ConverterEngine.ConversionResult result = await _engine.ConvertFileAsync(_txtInputPath.Text, outputFolder, mOverride, bOverride, forceGst, true);

                    ToggleUI(true);

                    if (!result.Success)
                    {
                        foreach (string err in result.Errors) UpdateStatus(err);
                        MessageBox.Show("Conversion failed. Check logs.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }

                    _currentOutputFiles = new List<string>(result.OutputFiles);
                    _currentOutputFile = _currentOutputFiles.Count > 0 ? _currentOutputFiles[0] : "";

                    var sb = new StringBuilder();
                    sb.AppendLine("MULTI-DAY MODE");
                    sb.AppendLine("Generated files: " + _currentOutputFiles.Count);
                    sb.AppendLine("Output folder: " + outputFolder);
                    sb.AppendLine("");
                    if (!string.IsNullOrWhiteSpace(_currentOutputFile))
                    {
                        sb.AppendLine("First file preview: " + Path.GetFileName(_currentOutputFile));
                        sb.AppendLine("------------------------------------------------------------");
                        sb.AppendLine(File.ReadAllText(_currentOutputFile, Encoding.UTF8));
                    }
                    _txtPreview.Text = sb.ToString();

                    _btnPush.Enabled = true;

                    UpdateStatus("OK: Generated " + result.OutputFiles.Count + " file(s).");
                    MessageBox.Show("Conversion Complete.", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
        }

        private async void BtnPush_Click(object sender, EventArgs e)
        {
            ToggleUI(false);
            UpdateStatus("Pushing to SFTP...");
            FileLogger.Instance.LogInfo("SFTP push started.");

            try
            {
                _progressBar.Visible = true;
                _progressBar.Style = ProgressBarStyle.Marquee;

                List<string> filesToSend = (_currentOutputFiles != null && _currentOutputFiles.Count > 0)
                    ? _currentOutputFiles
                    : (!string.IsNullOrWhiteSpace(_currentOutputFile) ? new List<string> { _currentOutputFile } : new List<string>());

                if (filesToSend.Count == 0)
                    throw new Exception("No output file to upload. Please run Step 2 first.");

                int ok = 0;
                for (int i = 0; i < filesToSend.Count; i++)
                {
                    string f = filesToSend[i];
                    UpdateStatus("SFTP: Uploading " + (i + 1) + "/" + filesToSend.Count + " -> " + Path.GetFileName(f));
                    bool success = await _sftpService.UploadFileAsync(f, UpdateStatus, CancellationToken.None);
                    if (!success) throw new Exception("Upload failed for: " + Path.GetFileName(f));
                    ok++;
                }

                UpdateStatus("SFTP: Upload GOOD ✅ (" + ok + "/" + filesToSend.Count + ")");
                FileLogger.Instance.LogInfo("SFTP: Upload GOOD (" + ok + "/" + filesToSend.Count + ")");
                MessageBox.Show("Transfer Complete. Uploaded " + ok + " file(s).", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                UpdateStatus("SFTP: Upload NOT GOOD ❌ - " + ex.Message);
                FileLogger.Instance.LogError("SFTP upload failed", ex);
                MessageBox.Show("Upload Failed: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                _progressBar.Visible = false;
                ToggleUI(true);
            }
        }

        private void ToggleUI(bool enabled)
        {
            _btnConvert.Enabled = enabled && !string.IsNullOrWhiteSpace(_txtInputPath.Text);
            _btnBrowse.Enabled = enabled;
            _btnPush.Enabled = enabled && ((_currentOutputFiles != null && _currentOutputFiles.Count > 0) || !string.IsNullOrWhiteSpace(_currentOutputFile));

            _progressBar.Style = enabled ? ProgressBarStyle.Blocks : ProgressBarStyle.Marquee;
            _progressBar.Visible = !enabled;
        }

        private void UpdateStatus(string msg)
        {
            if (InvokeRequired) { Invoke(new Action(() => UpdateStatus(msg))); return; }
            _lblStatus.Items.Add("[" + DateTime.Now.ToString("HH:mm:ss") + "] " + msg);
            _lblStatus.TopIndex = _lblStatus.Items.Count - 1;
        }
    }

    // ==========================================
    // DOMAIN LOGIC: CONVERSION ENGINE (multi-date + Date+Hour aggregation)
    // ==========================================
    public class ConverterEngine
    {
        private Dictionary<string, int> _columnMap;
        private char _delimiter;

        public class ConversionResult
        {
            public bool Success { get; set; }
            public int RowsProcessed { get; set; }
            public List<string> Errors { get; set; } = new List<string>();
            public string OutputPath { get; set; }
            public List<string> OutputFiles { get; set; } = new List<string>();
        }

        private class AggRow
        {
            public string MachineID;
            public string BatchID;
            public DateTime Date;
            public int Hour;
            public int ReceiptCount;
            public int Pax;
            public decimal GTO;
            public decimal GST;
            public decimal Discount;
            public decimal Service;
            public decimal Cash;
            public decimal Nets;
            public decimal Visa;
            public decimal Master;
            public decimal Amex;
            public decimal Voucher;
            public decimal Others;
            public string GSTReg;
        }

        public List<DateTime> PeekDistinctDates(string inputPath)
        {
            var set = new HashSet<DateTime>();

            try
            {
                string[] lines = File.ReadAllLines(inputPath, Encoding.UTF8);
                if (lines.Length == 0) return new List<DateTime>();

                string firstLine = CleanBOM(lines[0]);
                _delimiter = DetectDelimiter(firstLine);
                bool hasHeader = IsHeaderRow(firstLine, _delimiter);

                _columnMap = hasHeader ? MapHeaders(firstLine, _delimiter) : CreateDefaultMap();
                int startIndex = hasHeader ? 1 : 0;

                for (int i = startIndex; i < lines.Length; i++)
                {
                    if (string.IsNullOrWhiteSpace(lines[i])) continue;
                    string[] cols = lines[i].Split(_delimiter);

                    DateTime dt;
                    if (TryParseDateAny(GetValue(cols, "Date"), out dt))
                        set.Add(dt.Date);
                }
            }
            catch { }

            var list = new List<DateTime>(set);
            list.Sort();
            return list;
        }

        public async Task<ConversionResult> ConvertFileAsync(string inputPath, string outputPathOrFolder, string machineOverride, string batchOverride, bool forceGst, bool multiMode)
        {
            return await Task.Run(() =>
            {
                var result = new ConversionResult { OutputPath = outputPathOrFolder };

                try
                {
                    string[] lines = File.ReadAllLines(inputPath, Encoding.UTF8);
                    if (lines.Length == 0) throw new Exception("Input file is empty.");

                    string firstLine = CleanBOM(lines[0]);
                    _delimiter = DetectDelimiter(firstLine);
                    bool hasHeader = IsHeaderRow(firstLine, _delimiter);

                    _columnMap = hasHeader ? MapHeaders(firstLine, _delimiter) : CreateDefaultMap();
                    int startIndex = hasHeader ? 1 : 0;

                    // key = yyyyMMdd|HH
                    var agg = new Dictionary<string, AggRow>();

                    for (int i = startIndex; i < lines.Length; i++)
                    {
                        if (string.IsNullOrWhiteSpace(lines[i])) continue;

                        string[] cols = lines[i].Split(_delimiter);

                        DateTime dt;
                        if (!TryParseDateAny(GetValue(cols, "Date"), out dt)) continue;

                        int hour;
                        if (!int.TryParse((GetValue(cols, "Hour") ?? "").Trim(), out hour)) continue;
                        if (hour < 0 || hour > 23) continue;

                        string key = dt.ToString("yyyyMMdd") + "|" + hour.ToString("D2");

                        AggRow r;
                        if (!agg.TryGetValue(key, out r))
                        {
                            r = new AggRow();
                            r.Date = dt.Date;
                            r.Hour = hour;
                            r.GSTReg = "Y";
                            agg[key] = r;
                        }

                        string m = !string.IsNullOrWhiteSpace(machineOverride) ? machineOverride : GetValue(cols, "Machine ID", "MachineID");
                        string b = !string.IsNullOrWhiteSpace(batchOverride) ? batchOverride : GetValue(cols, "Batch ID", "BatchID");
                        if (!string.IsNullOrWhiteSpace(m)) r.MachineID = m.Trim();
                        if (!string.IsNullOrWhiteSpace(b)) r.BatchID = b.Trim();

                        r.ReceiptCount += ParseInt(GetValue(cols, "Receipt Count", "ReceiptCount"));
                        r.Pax += ParseInt(GetValue(cols, "No of Pax", "Pax", "No. of Pax"));

                        r.GTO += ParseDec(GetValue(cols, "GTO Sales", "GTOSales"));
                        r.GST += ParseDec(GetValue(cols, "GST"));
                        r.Discount += ParseDec(GetValue(cols, "Discount"));
                        r.Service += ParseDec(GetValue(cols, "Service Charge", "ServiceCharge"));

                        r.Cash += ParseDec(GetValue(cols, "Cash"));
                        r.Nets += ParseDec(GetValue(cols, "NETS"));
                        r.Visa += ParseDec(GetValue(cols, "Visa"));
                        r.Master += ParseDec(GetValue(cols, "MasterCard"));
                        r.Amex += ParseDec(GetValue(cols, "Amex"));
                        r.Voucher += ParseDec(GetValue(cols, "Voucher"));
                        r.Others += ParseDec(GetValue(cols, "Others"));

                        // Normalize GSTReg
                        string gstRaw = (GetValue(cols, "GST Registered", "GSTRegistered") ?? "").Trim().ToUpperInvariant();
                        r.GSTReg = gstRaw.StartsWith("N") ? "N" : "Y";
                    }

                    // Determine dates present
                    var dateSet = new HashSet<DateTime>();
                    foreach (var kv in agg) dateSet.Add(kv.Value.Date);
                    var dateList = new List<DateTime>(dateSet);
                    dateList.Sort();

                    // Final fallback machine/batch
                    string finalMachine = !string.IsNullOrWhiteSpace(machineOverride) ? machineOverride.Trim() : AppConfig.GetString("Defaults.MachineId", "").Trim();
                    string finalBatch = !string.IsNullOrWhiteSpace(batchOverride) ? batchOverride.Trim() : AppConfig.GetString("Defaults.BatchId", "").Trim();
                    if (string.IsNullOrWhiteSpace(finalMachine)) finalMachine = "00000000";
                    if (string.IsNullOrWhiteSpace(finalBatch)) finalBatch = "000000000000";

                    if (!multiMode)
                    {
                        DateTime d = dateList[0];
                        WriteOneDay(outputPathOrFolder, d, agg, finalMachine, finalBatch, forceGst);
                        result.OutputFiles.Add(outputPathOrFolder);
                        result.Success = true;
                        result.RowsProcessed = 24;
                        return result;
                    }

                    if (!Directory.Exists(outputPathOrFolder)) Directory.CreateDirectory(outputPathOrFolder);

                    foreach (DateTime d in dateList)
                    {
                        string yyyymmdd = d.ToString("yyyyMMdd");
                        string outFile = Path.Combine(outputPathOrFolder, "H" + finalMachine + "_" + yyyymmdd + ".txt");
                        WriteOneDay(outFile, d, agg, finalMachine, finalBatch, forceGst);
                        result.OutputFiles.Add(outFile);
                    }

                    result.Success = true;
                    result.RowsProcessed = result.OutputFiles.Count * 24;
                }
                catch (Exception ex)
                {
                    result.Success = false;
                    result.Errors.Add("Error: " + ex.Message);
                    FileLogger.Instance.LogError("Conversion Failed", ex);
                }

                return result;
            });
        }

        private void WriteOneDay(string outFile, DateTime day, Dictionary<string, AggRow> agg, string machine, string batch, bool forceGst)
        {
            var lines = new List<string>();

            string ddMMyyyy = day.ToString("ddMMyyyy");
            string yyyymmdd = day.ToString("yyyyMMdd");

            for (int h = 0; h < 24; h++)
            {
                string key = yyyymmdd + "|" + h.ToString("D2");
                AggRow r;
                if (!agg.TryGetValue(key, out r))
                {
                    r = new AggRow();
                    r.MachineID = machine;
                    r.BatchID = batch;
                    r.Date = day;
                    r.Hour = h;
                    r.GSTReg = "Y";
                }

                string m = !string.IsNullOrWhiteSpace(r.MachineID) ? r.MachineID.Trim() : machine;
                string b = !string.IsNullOrWhiteSpace(r.BatchID) ? r.BatchID.Trim() : batch;

                decimal gstFinal = r.GST;
                if (forceGst) gstFinal = Round2(r.GTO * 0.09m);

                const char pipe = '|';
                var sb = new StringBuilder();

                // Output order (v2.7)
                sb.Append(m).Append(pipe);
                sb.Append(PadLeft(b, 12, '0')).Append(pipe);
                sb.Append(ddMMyyyy).Append(pipe);
                sb.Append(h.ToString("D2")).Append(pipe);

                sb.Append(r.ReceiptCount.ToString(CultureInfo.InvariantCulture)).Append(pipe);
                sb.Append(FormatMoney(r.GTO)).Append(pipe);
                sb.Append(FormatMoney(gstFinal)).Append(pipe);
                sb.Append(FormatMoney(r.Discount)).Append(pipe);
                sb.Append(FormatMoney(r.Service)).Append(pipe);

                sb.Append(r.Pax.ToString(CultureInfo.InvariantCulture)).Append(pipe);

                sb.Append(FormatMoney(r.Cash)).Append(pipe);
                sb.Append(FormatMoney(r.Nets)).Append(pipe);
                sb.Append(FormatMoney(r.Visa)).Append(pipe);
                sb.Append(FormatMoney(r.Master)).Append(pipe);
                sb.Append(FormatMoney(r.Amex)).Append(pipe);
                sb.Append(FormatMoney(r.Voucher)).Append(pipe);
                sb.Append(FormatMoney(r.Others)).Append(pipe);

                string gstReg = (r.GSTReg ?? "Y").Trim().ToUpperInvariant();
                gstReg = gstReg.StartsWith("N") ? "N" : "Y";
                sb.Append(gstReg);

                lines.Add(sb.ToString());
            }

            File.WriteAllLines(outFile, lines.ToArray(), Encoding.UTF8);
        }

        private static decimal Round2(decimal v) { return Math.Round(v, 2, MidpointRounding.AwayFromZero); }
        private static string FormatMoney(decimal v) { return Round2(v).ToString("F2", CultureInfo.InvariantCulture); }

        private static int ParseInt(string s)
        {
            int n;
            if (int.TryParse((s ?? "").Trim(), out n)) return n;

            decimal d;
            if (decimal.TryParse((s ?? "").Trim().Replace(" ", ""), NumberStyles.Number, CultureInfo.InvariantCulture, out d))
                return (int)d;

            return 0;
        }

        private static decimal ParseDec(string s)
        {
            // handles "1 339.36"
            string clean = (s ?? "").Trim().Replace(" ", "");
            decimal d;
            if (decimal.TryParse(clean, NumberStyles.Number, CultureInfo.InvariantCulture, out d)) return d;
            if (decimal.TryParse(clean, NumberStyles.Number, CultureInfo.CurrentCulture, out d)) return d;
            return 0m;
        }

        private static bool TryParseDateAny(string s, out DateTime dt)
        {
            dt = DateTime.MinValue;
            string v = (s ?? "").Trim();
            if (v == "") return false;

            DateTime tmp;
            if (DateTime.TryParseExact(v, "ddMMyyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out tmp)) { dt = tmp; return true; }
            if (DateTime.TryParseExact(v, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out tmp)) { dt = tmp; return true; }
            if (DateTime.TryParseExact(v, "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out tmp)) { dt = tmp; return true; }
            if (DateTime.TryParseExact(v, "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out tmp)) { dt = tmp; return true; }
            if (DateTime.TryParseExact(v, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out tmp)) { dt = tmp; return true; }
            if (DateTime.TryParse(v, CultureInfo.InvariantCulture, DateTimeStyles.None, out tmp)) { dt = tmp; return true; }

            return false;
        }

        private string CleanBOM(string text) { return string.IsNullOrEmpty(text) ? text : text.Trim('\uFEFF', '\u200B'); }
        private char DetectDelimiter(string header) { return header.Contains("|") ? '|' : ','; }
        private bool IsHeaderRow(string line, char delimiter) { string u = line.ToUpperInvariant(); return u.Contains("MACHINE") || u.Contains("DATE"); }

        private Dictionary<string, int> MapHeaders(string headerLine, char delimiter)
        {
            var map = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
            var headers = headerLine.Split(delimiter);
            for (int i = 0; i < headers.Length; i++) map[headers[i].Trim().Trim('"')] = i;
            return map;
        }

        // Matches Report Pundit raw file order:
        // Machine|Batch|Date|Hour|GSTReg|Receipt|GTO|GST|Discount|Pax|Service|Cash|NETS|Master|Amex|Visa|Voucher|Others
        private Dictionary<string, int> CreateDefaultMap()
        {
            return new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase)
            {
                { "Machine ID", 0 }, { "MachineID", 0 },
                { "Batch ID", 1 }, { "BatchID", 1 },
                { "Date", 2 },
                { "Hour", 3 },
                { "GST Registered", 4 }, { "GSTRegistered", 4 },
                { "Receipt Count", 5 }, { "ReceiptCount", 5 },
                { "GTO Sales", 6 }, { "GTOSales", 6 },
                { "GST", 7 },
                { "Discount", 8 },
                { "No of Pax", 9 }, { "Pax", 9 }, { "No. of Pax", 9 },
                { "Service Charge", 10 }, { "ServiceCharge", 10 },
                { "Cash", 11 },
                { "NETS", 12 },
                { "MasterCard", 13 },
                { "Amex", 14 },
                { "Visa", 15 },
                { "Voucher", 16 },
                { "Others", 17 }
            };
        }

        private string GetValue(string[] rowCols, params string[] possibleNames)
        {
            foreach (var name in possibleNames)
            {
                if (_columnMap != null && _columnMap.ContainsKey(name))
                {
                    int index = _columnMap[name];
                    if (index >= 0 && index < rowCols.Length) return rowCols[index];
                }
            }
            return "";
        }

        private static string PadLeft(string s, int width, char pad)
        {
            s = (s ?? "").Trim();
            if (s.Length >= width) return s;
            return s.PadLeft(width, pad);
        }
    }

    // ==========================================
    // SFTP SERVICE (busy-rename safe)
    // ==========================================
    public sealed class SftpService
    {
        public async Task<bool> UploadFileAsync(string localFilePath, Action<string> uiStatus, CancellationToken ct)
        {
            if (string.IsNullOrWhiteSpace(localFilePath))
                throw new ArgumentException("Local file path is required.", nameof(localFilePath));
            if (!File.Exists(localFilePath))
                throw new FileNotFoundException("Local file not found.", localFilePath);

            Exception last = null;

            for (int attempt = 1; attempt <= SftpConfig.MaxRetries; attempt++)
            {
                ct.ThrowIfCancellationRequested();

                try
                {
                    return await Task.Run(() =>
                    {
                        var auth = new PasswordAuthenticationMethod(SftpConfig.Username, SftpConfig.Password);
                        var connInfo = new ConnectionInfo(SftpConfig.Host, SftpConfig.Port, SftpConfig.Username, auth);

                        using (var client = new SftpClient(connInfo))
                        {
                            client.HostKeyReceived += (s, e) =>
                            {
                                string actual = "SHA256:" + ComputeSha256Base64(e.HostKey);
                                LogBoth(uiStatus, "SFTP: Server HostKey Fingerprint: " + actual);

                                if (!string.IsNullOrWhiteSpace(SftpConfig.ExpectedHostKeySha256))
                                {
                                    bool ok = string.Equals(actual, SftpConfig.ExpectedHostKeySha256, StringComparison.Ordinal);
                                    e.CanTrust = ok;
                                    if (!ok) throw new Exception("SFTP host key mismatch. Expected " + SftpConfig.ExpectedHostKeySha256 + ", got " + actual);
                                }
                                else
                                {
                                    e.CanTrust = true;
                                }
                            };

                            client.ConnectionInfo.Timeout = TimeSpan.FromMilliseconds(SftpConfig.ConnectTimeoutMs);
                            client.OperationTimeout = TimeSpan.FromMilliseconds(SftpConfig.OperationTimeoutMs);
                            client.KeepAliveInterval = TimeSpan.FromSeconds(SftpConfig.KeepAliveSec);

                            string endpoint = SftpConfig.Host + ":" + SftpConfig.Port;
                            LogBoth(uiStatus, "SFTP: Connecting to " + endpoint + " (attempt " + attempt + "/" + SftpConfig.MaxRetries + ")");
                            client.Connect();

                            if (!client.IsConnected)
                            {
                                LogBoth(uiStatus, "SFTP: Connection NOT GOOD ❌ (IsConnected=false)");
                                throw new Exception("SFTP connection failed.");
                            }

                            LogBoth(uiStatus, "SFTP: Connection GOOD ✅");

                            EnsureRemoteDirectory(client, SftpConfig.RemoteDirectory);

                            string remoteFinal = CombineRemote(SftpConfig.RemoteDirectory, Path.GetFileName(localFilePath));
                            string remoteTemp = remoteFinal + ".uploading." + Guid.NewGuid().ToString("N");

                            LogBoth(uiStatus, "SFTP: Uploading (temp) -> " + remoteTemp);

                            using (var fs = File.OpenRead(localFilePath))
                            {
                                client.UploadFile(fs, remoteTemp, true);
                            }

                            long localSize = new FileInfo(localFilePath).Length;

                            // Verify temp file size
                            var tempAttrs = client.GetAttributes(remoteTemp);
                            if (tempAttrs.Size != localSize)
                            {
                                try { client.DeleteFile(remoteTemp); } catch { }
                                throw new IOException("Upload size mismatch. Local=" + localSize + ", RemoteTemp=" + tempAttrs.Size);
                            }

                            // If final exists and same size => skip replace (idempotent)
                            if (client.Exists(remoteFinal))
                            {
                                try
                                {
                                    var finalAttrs = client.GetAttributes(remoteFinal);
                                    if (finalAttrs != null && finalAttrs.Size == localSize)
                                    {
                                        LogBoth(uiStatus, "SFTP: Final exists same size. Skip replace: " + remoteFinal);
                                        try { client.DeleteFile(remoteTemp); } catch { }
                                        client.Disconnect();
                                        return true;
                                    }
                                }
                                catch { }

                                DeleteWithRetry(client, remoteFinal, uiStatus);
                            }

                            RenameWithRetry(client, remoteTemp, remoteFinal, uiStatus);

                            client.Disconnect();
                            LogBoth(uiStatus, "SFTP: Upload GOOD ✅ (completed)");
                            return true;
                        }
                    }, ct);
                }
                catch (OperationCanceledException) { throw; }
                catch (SshAuthenticationException ex)
                {
                    LogBoth(uiStatus, "SFTP: Connection NOT GOOD ❌ (authentication failed)");
                    FileLogger.Instance.LogError("SFTP authentication failed", ex);
                    throw new Exception("SFTP authentication failed. Check Login ID / Password.", ex);
                }
                catch (Exception ex)
                {
                    last = ex;
                    LogBoth(uiStatus, "SFTP: Attempt " + attempt + " NOT GOOD ❌ - " + ex.Message);
                    FileLogger.Instance.LogError("SFTP upload failed (attempt " + attempt + ")", ex);
                }

                int delayMs = Math.Min(8000, 500 * (int)Math.Pow(2, attempt - 1));
                await Task.Delay(delayMs, ct);
            }

            throw new Exception("SFTP upload failed after " + SftpConfig.MaxRetries + " attempts.", last);
        }

        private static void RenameWithRetry(SftpClient client, string oldPath, string newPath, Action<string> uiStatus)
        {
            int maxAttempts = 10;
            int delayMs = 1000;

            for (int i = 1; i <= maxAttempts; i++)
            {
                try
                {
                    LogBoth(uiStatus, "SFTP: Finalize rename attempt " + i + " -> " + Path.GetFileName(newPath));
                    client.RenameFile(oldPath, newPath);
                    return;
                }
                catch (SftpException ex)
                {
                    string msg = (ex.Message ?? "").ToLowerInvariant();
                    bool busy = msg.Contains("resource busy") || msg.Contains("in progress") || msg.Contains("busy");

                    if (!busy || i == maxAttempts) throw;

                    LogBoth(uiStatus, "SFTP: Rename busy, retrying in " + (delayMs / 1000.0).ToString("0.0") + "s");
                    Thread.Sleep(delayMs);
                    delayMs = Math.Min(delayMs * 2, 15000);
                }
            }
        }

        private static void DeleteWithRetry(SftpClient client, string path, Action<string> uiStatus)
        {
            int maxAttempts = 8;
            int delayMs = 800;

            for (int i = 1; i <= maxAttempts; i++)
            {
                try
                {
                    LogBoth(uiStatus, "SFTP: Deleting existing final (attempt " + i + "): " + Path.GetFileName(path));
                    client.DeleteFile(path);
                    return;
                }
                catch (SftpException ex)
                {
                    string msg = (ex.Message ?? "").ToLowerInvariant();
                    bool busy = msg.Contains("resource busy") || msg.Contains("in progress") || msg.Contains("busy");

                    if (!busy || i == maxAttempts) throw;

                    Thread.Sleep(delayMs);
                    delayMs = Math.Min(delayMs * 2, 8000);
                }
            }
        }

        private static string ComputeSha256Base64(byte[] data)
        {
            using (var sha = SHA256.Create())
            {
                return Convert.ToBase64String(sha.ComputeHash(data));
            }
        }

        private static void EnsureRemoteDirectory(SftpClient client, string remoteDir)
        {
            if (string.IsNullOrWhiteSpace(remoteDir) || remoteDir == ".") return;

            string[] parts = remoteDir.Replace('\\', '/').Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            string path = remoteDir.StartsWith("/") ? "/" : "";

            foreach (string part in parts)
            {
                path = (path == "/" ? "/" + part : path + "/" + part);
                if (!client.Exists(path)) client.CreateDirectory(path);
            }
        }

        private static string CombineRemote(string dir, string file)
        {
            string d = (dir ?? ".").Replace('\\', '/').TrimEnd('/');
            if (string.IsNullOrWhiteSpace(d) || d == ".") return file;
            return d + "/" + file;
        }

        private static void LogBoth(Action<string> uiStatus, string msg)
        {
            if (uiStatus != null) uiStatus(msg);
            FileLogger.Instance.LogInfo(msg);
        }
    }

    // ==========================================
    // ENTRY
    // ==========================================
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.Run(new MainForm());
        }
    }

    // ==========================================
    // APP.CONFIG HELPER
    // ==========================================
    public static class AppConfig
    {
        public static string GetString(string key, string defaultValue = "")
        {
            string v = ConfigurationManager.AppSettings[key];
            return string.IsNullOrWhiteSpace(v) ? defaultValue : v.Trim();
        }

        public static int GetInt(string key, int defaultValue)
        {
            int n;
            return int.TryParse(GetString(key, ""), out n) ? n : defaultValue;
        }

        public static bool GetBool(string key, bool defaultValue)
        {
            string s = GetString(key, "");
            bool b;
            if (bool.TryParse(s, out b)) return b;
            if (s == "1") return true;
            if (s == "0") return false;
            return defaultValue;
        }
    }

    // ==========================================
    // FILE LOGGER (SINGLETON)
    // ==========================================
    public sealed class FileLogger
    {
        private static readonly Lazy<FileLogger> _lazy = new Lazy<FileLogger>(() => new FileLogger());
        public static FileLogger Instance { get { return _lazy.Value; } }

        private readonly string _logDir;
        private readonly object _lock = new object();

        private FileLogger()
        {
            _logDir = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "SalesDataConverterApp",
                "Logs");
            Directory.CreateDirectory(_logDir);
        }

        public string GetLogDirectory() { return _logDir; }

        public void LogInfo(string message) { Write("INFO", message); }

        public void LogError(string message, Exception ex)
        {
            Write("ERROR", message + " | " + ex.GetType().Name + ": " + ex.Message + "\r\n" + ex.StackTrace);
        }

        private void Write(string level, string message)
        {
            try
            {
                string file = Path.Combine(_logDir, "SalesUtility_" + DateTime.Now.ToString("yyyyMMdd") + ".log");
                string line = "[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "] [" + level + "] " + message;
                lock (_lock)
                {
                    File.AppendAllText(file, line + Environment.NewLine, Encoding.UTF8);
                }
            }
            catch { }
        }
    }

    // ==========================================
    // SFTP CONFIG (FROM APP.CONFIG)
    // ==========================================
    internal static class SftpConfig
    {
        public static string Host { get { return AppConfig.GetString("Sftp.Host", ""); } }
        public static int Port { get { return AppConfig.GetInt("Sftp.Port", 22); } }
        public static string Username { get { return AppConfig.GetString("Sftp.Username", ""); } }
        public static string Password { get { return AppConfig.GetString("Sftp.Password", ""); } }
        public static string RemoteDirectory { get { return AppConfig.GetString("Sftp.RemoteDirectory", "."); } }
        public static string ExpectedHostKeySha256 { get { return AppConfig.GetString("Sftp.ExpectedHostKeySha256", ""); } }

        public static int ConnectTimeoutMs { get { return AppConfig.GetInt("Sftp.ConnectTimeoutMs", 15000); } }
        public static int OperationTimeoutMs { get { return AppConfig.GetInt("Sftp.OperationTimeoutMs", 45000); } }
        public static int KeepAliveSec { get { return AppConfig.GetInt("Sftp.KeepAliveSec", 20); } }
        public static int MaxRetries { get { return AppConfig.GetInt("Sftp.MaxRetries", 3); } }
    }
}