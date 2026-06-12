<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.IssueListingByFinalizedDate.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>IssueSummaryByShippedDate</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 36px;
        }
        .style4
        {
            width: 6.15%;
        }
        .style5
        {
            width: 5.25%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" width="30%">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
            <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">
                            &nbsp;IssueType
                        </td>
                    <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="IssueTypeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedIssueTypeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="IssueTypeList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedIssueTypeList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                        </tr>
                        <td class="style4">
                            &nbsp;Status
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 400" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="StatusList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedStatusList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="StatusList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedStatusList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="Sunset" AllowDelete="false">
                            </telerik:RadListBox>
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
            <tr>
            <td valign="top" width="70%">
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><br />
                &nbsp;<telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Skin="WebBlue" Text="Compile"
                    CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();">
                </telerik:RadButton>&nbsp;
                <%--<input class="detailButton" value="Reset" type="reset" />--%>
                <telerik:RadButton ID="resetBtn" runat="server" Skin="WebBlue" Text="Reset" CssClass="detailbutton">
                </telerik:RadButton>
                <telerik:RadButton ID="AddScheduleBtn" runat="server" Skin="WebBlue" Text="Add Schedule" Visible="False"
                    CssClass="detailButton" OnClick="AddScheduleBtn_Click"></telerik:RadButton>
                <br />
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
                &nbsp;
                <br />
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
