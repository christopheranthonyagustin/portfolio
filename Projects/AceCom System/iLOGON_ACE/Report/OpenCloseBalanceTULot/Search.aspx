<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OpenCloseBalanceTULot.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <table width="100%">
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="ModuleTitle" align="right">
                <div class="rounded-box1" style="background-color: #660000; width: 30%">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>
                    </div>
                    <div class="box-contents1" style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px;
                        font-size: 10pt; font-weight: bold; padding-top: 3px; left: 2px">
                        <asp:Label ID="ReportNameLbl" runat="server">Open Close Balance by TU Lot</asp:Label></div>
                </div>
            </td>
        </tr>
    </table>
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td valign="top" width="30%">
                <table id="Table2">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%">
                <table id="Table3" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" type="checkbox"
                                name="checkall">&nbsp;ALL
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                            <br>
                            <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" Width="511px" CellSpacing="4"
                                RepeatColumns="3" CellPadding="5">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="ExcelCompileBtn" runat="server" Text="Export" Visible="false" CssClass="detailbutton"
                    OnClick="CompileBtn_Click"></asp:Button>
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" Visible="true" CssClass="detailbutton"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></asp:Button>&nbsp;<input
                        class="detailbutton" value="Reset" type="reset"><br>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
       // Instantiate our BusyBox object
       var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>
