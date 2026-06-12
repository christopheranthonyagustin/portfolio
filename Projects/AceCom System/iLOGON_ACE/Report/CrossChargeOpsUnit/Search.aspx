<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.CrossChargeOpsUnit.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CrossChargeOpsUnit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="ModuleTitle" align="right">
                <div class="rounded-box1" style="width: 30%; background-color: #660000;">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>
                    </div>
                    <div class="box-contents1" style="font-size: 10pt; font-weight: bold; left: 2px;
                        padding: 3px 5px 5px 3px;">
                        &nbsp;<asp:Label ID="ReportLbl" runat="server">Cross Charge Ops Unit</asp:Label></div>
                </div>
            </td>
        </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td style="height: 5px">
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="60%">
                    <tr>
                        <td colspan="2">
                            RecoverFromOpsUnit
                        </td>
                     </tr>
                     <tr>
                        <td width="25%">
                            <asp:ListBox ID="CargoPackTypeList" runat="server" Rows="10" SelectionMode="Multiple" Width="90%" />
                        </td>
                        <td width="10%" align="center">
                            <br />
                            <br />
                            <asp:Button ID="SelectBtn" runat="server" CssClass="detailbutton" OnClick="SelectBtn_Click"
                                Text=" >> " />
                            <br />
                            <br />
                            <asp:Button ID="RemoveBtn" runat="server" CssClass="detailbutton" OnClick="RemoveBtn_Click"
                                Text=" << " />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="SelectedList" runat="server" Rows="10" SelectionMode="Multiple"
                                Width="90%" Style="background-color: Yellow;" />
                        </td>
                        <td width="25%">&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 5px">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="CompileBtn" runat="server" CssClass="detailbutton" OnClick="CompileBtn_Click"
                    Text="Compile" OnClientClick="return busyBox.Show();" />
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
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
