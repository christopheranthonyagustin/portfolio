<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamIncentiveAdd.aspx.cs" Inherits="iWMS.Web.Master.Personnel.TeamIncentiveAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TeamIncentiveAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="AddBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        &nbsp;
        <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" class="white" />
        <br />
        <br />
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>&nbsp;<asp:Label ID="PerLbl" runat="server">Personnel</asp:Label><br />
                    &nbsp;<telerik:RadListBox runat="server" ID="PersonnelList" Height="350px" Width="200px"
                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPersonnelList"
                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                        Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                        OnTransferred="PersonnelList_Transferred" CausesValidation="false">
                    </telerik:RadListBox>
                    <telerik:RadListBox runat="server" ID="SelectedPersonnelList" Height="350px" Width="200px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false" CausesValidation="false">
                    </telerik:RadListBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
