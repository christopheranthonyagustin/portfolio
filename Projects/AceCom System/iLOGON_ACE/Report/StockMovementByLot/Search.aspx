<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.StockMovementByLot.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="HEAD1" runat="server">
    <title>StockMovement</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/row.js" type="text/javascript"></script>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            height: 20px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td valign="top" width="30%">
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
                                    <asp:Label ID="ReportNameLbl" runat="server">Stock Movement by Lot </asp:Label></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                <asp:Button ID="CompileBtn" runat="server" CssClass="detailbutton" OnClick="CompileBtn_Click"
                    Text="Compile" OnClientClick="return busyBox.Show();" />
                &nbsp;<input class="detailbutton" type="reset" value="Reset" /><br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript" language="JavaScript1.2">
    // Instantiate our BusyBox object
    var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>
