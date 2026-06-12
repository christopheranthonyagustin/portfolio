<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobSelectForm.aspx.cs"
    Inherits="iWMS.Web.Job.DebitNote.JobSelectForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>MultiJob</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="javascript:window.focus();">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td valign="top">
                    <table id="Table2">
                        <tr>
                            <td>
                                <asp:Label ID="jobno1_lbl" runat="server" Text="JobNo1" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno1_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno2_lbl" runat="server" Text="JobNo2" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno2_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno3_lbl" runat="server" Text="JobNo3" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno3_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno4_lbl" runat="server" Text="JobNo4" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno4_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno5_lbl" runat="server" Text="JobNo5" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno5_txt" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="jobno6_lbl" runat="server" Text="JobNo6" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno6_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno7_lbl" runat="server" Text="JobNo7" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno7_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno8_lbl" runat="server" Text="JobNo8" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno8_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno9_lbl" runat="server" Text="JobNo9" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno9_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno10_lbl" runat="server" Text="JobNo10" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno10_txt" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="jobno11_lbl" runat="server" Text="JobNo11" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno11_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno12_lbl" runat="server" Text="JobNo12" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno12_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno13_lbl" runat="server" Text="JobNo13" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno13_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno14_lbl" runat="server" Text="JobNo14" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno14_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno15_lbl" runat="server" Text="JobNo15" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno15_txt" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="jobno16_lbl" runat="server" Text="JobNo16" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno16_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno17_lbl" runat="server" Text="JobNo17" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno17_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno18_lbl" runat="server" Text="JobNo18" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno18_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno19_lbl" runat="server" Text="JobNo19" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno19_txt" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="jobno20_lbl" runat="server" Text="JobNo20" Font-Bold="true" />
                                <br />
                                <asp:TextBox ID="jobno20_txt" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" ID="saveBtn" Text="Save" OnClick="saveBtn_Click" CssClass="white" OnClientClick="disableBtn(this.id,false)" ToolTip="Save" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" ID="closeBtn" Text="Close" OnClick="closeBtn_Click" CssClass="white" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
