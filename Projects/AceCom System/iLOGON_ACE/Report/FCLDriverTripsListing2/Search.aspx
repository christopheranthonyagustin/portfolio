<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.FCLDriverTripsListing2.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <title>FCLDriverTripsListing</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            width: 30%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" class="style1" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="14%">
                                        Equipment Type&nbsp;
                                    </td>
                                    <td width="25%">
                                        <asp:ListBox ID="ShipTypeList" runat="server" Rows="6" SelectionMode="Multiple" Width="100%" />
                                    </td>
                                    <td width="13%" align="center">
                                        <br />
                                        <br />
                                        <asp:Button ID="SelectBtn" runat="server" CssClass="white" OnClick="SelectBtn_Click"
                                            Text=" Select" />
                                        <br />
                                        <br />
                                        <asp:Button ID="RemoveBtn" runat="server" CssClass="white" OnClick="RemoveBtn_Click"
                                            Text="Remove" />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                    <td width="25%">
                                        <asp:ListBox ID="SelectedShipTypeList" runat="server" Rows="6" SelectionMode="Multiple"
                                            Width="90%" Style="background-color: Yellow;" />
                                    </td>
                                    <td width="23%">
                                    </td>
                                </tr>
                                <tr style="height: 5px">
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Assigned Driver:
                                    </td>
                                    <td colspan="4">
                                        <asp:DropDownList ID="AssignDriverDDL" runat="server" Width="24%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
                    CssClass="white" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();">
                </asp:Button>&nbsp;<input class="white" value="Reset" type="reset">
                <br />
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
       // Instantiate our BusyBox object
       var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
