<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.InventoryByLot.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InventoryByLot</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%">
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
                                name="checkall" />&nbsp;ALL
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <br />
                            <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" RepeatColumns="3" Width="511px"
                                CellSpacing="4" CellPadding="5" OnSelectedIndexChanged="DisplayChkBoxList_SelectedIndexChanged">
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
                <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
                    CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();">
                </asp:Button>&nbsp;<input class="detailButton" value="Reset" type="reset" />
                <asp:Button ID="AddScheduleBtn" runat="server" Text="Add Schedule" Visible="False"
                    CssClass="detailButton" OnClick="AddScheduleBtn_Click"></asp:Button>
                <br />
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
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
