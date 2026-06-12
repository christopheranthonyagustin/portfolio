<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseInvoiceSearch.aspx.cs"
    Inherits="iWMS.Web.Job.PurchaseInvoice.PurchaseInvoiceSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PurchaseInvoice</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" Visible="true"
            Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search" />
        &nbsp;
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
            CssClass="errorLabel"></asp:Label>
        <br />
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

        <%--Ticket #5789: SMPL : Enhancement to Purchase Invoice Register (PIHEAD) Pt 12
    Added by JL, 19th May 2016--%>
        <table border="0" cellpadding="0" cellspacing="0" width="50%">
            <tr>
                <label style="font-size:12px">Status</label>
                <td width="25%">
                    <telerik:RadListBox runat="server" ID="PIList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                        AllowTransfer="true" TransferToID="SelectedPIList" TransferMode="Move" AllowTransferDuplicates="false"
                        SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                        AutoPostBackOnTransfer="true" OnTransferred="PIList_Transferred">
                    </telerik:RadListBox>
                </td>

                <td>
                    <telerik:RadListBox runat="server" ID="SelectedPIList" Height="120px" Width="200px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false" BackColor="Yellow">
                    </telerik:RadListBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
