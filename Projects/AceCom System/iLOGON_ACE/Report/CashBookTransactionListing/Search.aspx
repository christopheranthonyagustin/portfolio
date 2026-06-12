<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.CashBookTransactionListing.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBookTransactionListing</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 21px;
        }
        .style2
        {
            height: 21px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr class="style1">
            <td valign="top" >
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>    
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td >
                &nbsp;&nbsp;Status
            </td>
        </tr>
        <tr>
            <td style="width: 800px" valign="top">
                &nbsp;&nbsp;<telerik:RadListBox runat="server" ID="CBHStatusList" Height="120px"
                    Width="200px" ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedCBHStatusList"
                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                    AutoPostBackOnTransfer="true" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                    OnTransferred="CBHStatusList_Transferred">
                </telerik:RadListBox>
                <telerik:RadListBox runat="server" ID="SelectedCBHStatusList" Height="120px" Width="200px"
                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                    AllowDelete="false">
                </telerik:RadListBox>
                <br />
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
        CssClass="white" OnClick="CompileBtn_Click" OnClientClick=" busyBox.Show();">
    </asp:Button>&nbsp;<input class="white" value="Reset" type="reset">
    <br />
    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>
