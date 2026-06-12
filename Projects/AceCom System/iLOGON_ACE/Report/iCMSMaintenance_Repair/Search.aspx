<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.iCMSMaintenance_Repair.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>iCMSMaintenance_Repair</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <br />
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Run"/>
                    &nbsp;
                <br />
                    &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
        <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
            <tr>
                <td width="25%">Depot
                <br />
                    <telerik:RadListBox runat="server" ID="AvailList" Height="120px" Width="300px" ButtonSettings-AreaWidth="35px"
                        AllowTransfer="true" TransferToID="SelectedAvailList" TransferMode="Move" AllowTransferDuplicates="false"
                        SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                        AutoPostBackOnTransfer="true" OnTransferred="AvailList_Transferred">
                    </telerik:RadListBox>
                </td>
                <td width="25%">
                    <br />
                    <telerik:RadListBox runat="server" ID="SelectedAvailList" Height="120px" Width="300px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false" Style="background-color: Yellow;">
                    </telerik:RadListBox>
                </td>
                <td width="50%">&nbsp;
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="50%">
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>            
        </table>
    </form>
</body>
</html>
