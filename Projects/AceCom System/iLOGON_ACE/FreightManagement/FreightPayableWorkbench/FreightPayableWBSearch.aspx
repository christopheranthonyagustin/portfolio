<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightPayableWBSearch.aspx.cs" 
    Inherits="iWMS.Web.FreightManagement.FreightPayableWorkbench.FreightPayableWBSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightPayableWBSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server"  defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div class="pagetitle">
            <br />&nbsp;
            <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
        </div>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" 
            CausesValidation="false" SelectedIndex="0" Skin="Office2007"></telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td rowspan="9" colspan="9" valign="top">
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>                            
                        </table>
                        <table>
                            <tr>
                                <td rowspan="9" colspan="9" valign="top">
                                    <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="ListBoxUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>&nbsp; Invoice
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  valign="top">&nbsp;
                                                     <telerik:RadTextBox runat="server" ID="InvoiceTxt" TextMode="SingleLine" Enabled="true">
                                                    </telerik:RadTextBox>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>&nbsp; VendorName
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">&nbsp;
                                                <telerik:RadComboBox ID="VendorNameList" runat="server" DataTextField="Descr" DataValueField="Item" AutoPostBack="true"
                                                     HighlightTemplatedItems="true" Filter="Contains" RenderMode="Lightweight" Skin="WebBlue" Width="170px"
                                                     EnableLoadOnDemand="true" OnItemsRequested="VendorNameList_ItemsRequested">
                                                </telerik:RadComboBox>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>&nbsp; Invoice Date
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">&nbsp;
                                            <telerik:RadDatePicker ID="InvoiceDate" runat="server" Width="155"
                                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>                             
                        </table> <br />
                        <table border="0" cellpadding="0" cellspacing="0" width="70%">   
                            <tr>                         
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>&nbsp; Branch
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 400px" valign="top">&nbsp;
                                        <telerik:RadListBox ID="BranchList" runat="server" AllowDelete="false" AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false"
                                            AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px" OnTransferred="BranchList_Transferred"
                                            SelectionMode="Multiple" Skin="Sunset" TransferMode="Move" TransferToID="SelectedBranchList" Width="200px">
                                        </telerik:RadListBox>
                                                &nbsp;
                                        <telerik:RadListBox ID="SelectedBranchList" runat="server" AllowDelete="false" AllowReorder="false"
                                            ButtonSettings-AreaWidth="35px" Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px">
                                        </telerik:RadListBox>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>Department
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 400px" valign="top">
                                                <telerik:RadListBox ID="DepartmentList" runat="server" AllowDelete="false" AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false"
                                                    AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px" OnTransferred="DepartmetList_Transferred"
                                                    SelectionMode="Multiple" Skin="Sunset" TransferMode="Move" TransferToID="SelectedDepartmentList" Width="200px">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox ID="SelectedDepartmentList" runat="server" AllowDelete="false" AllowReorder="false"
                                                    ButtonSettings-AreaWidth="35px" Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px">
                                                </telerik:RadListBox>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>