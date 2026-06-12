<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DSOQHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrderQuotation.DSOQHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="~/Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Sales Order Quotation</title>
     <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function SelectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked
                }
            }
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ApproveBtn" runat="server" CssClass="white" Text="Approve"
                                OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="RejectBtn" runat="server" CssClass="white" Text="Reject"
                                OnClick="RejectBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;                        
                            <asp:Button ID="SalesOrderBtn" runat="server" CssClass="white" Text="Sales Order"
                                OnClick="SalesOrderBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;                        
                            <asp:Button ID="SalesOrderQuotationBtn" runat="server" CssClass="LongLabelBlue" Text="Sales Order Quotation"
                                OnClick="SalesOrderQuotationBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                                OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="470" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SalesOrderQuotationId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="SelectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="EditImgBtn"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="EditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntityCode" SortExpression="EntityCode" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderQuotationNo" UniqueName="SalesOrderQuotationNo" SortExpression="SalesOrderQuotationNo"
                                HeaderText="Number" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" HeaderStyle-Width="300px" ItemStyle-Width="300px"
                                HeaderText="CustomerName">
                            </telerik:GridBoundColumn>                
                            <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" SortExpression="BranchCode" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                HeaderText="BranchCode">
                            </telerik:GridBoundColumn>                         
                            <telerik:GridBoundColumn DataField="DepartmentCode" UniqueName="DepartmentCode" SortExpression="DepartmentCode" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                HeaderText="DepartmentCode">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="ChannelCode" UniqueName="ChannelCode" SortExpression="ChannelCode" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="ChannelCode">
                            </telerik:GridBoundColumn>  
                            <telerik:GridBoundColumn DataField="SalesOrderQuotationDate" UniqueName="SalesOrderQuotationDate" SortExpression="SalesOrderQuotationDate"
                                HeaderText="SalesOrderQuotationDate" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                            </telerik:GridBoundColumn>    
                            <telerik:GridBoundColumn DataField="WarehouseCode" UniqueName="WarehouseCode" SortExpression="WarehouseCode"
                                HeaderText="WarehouseCode" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="CurrencyCode" UniqueName="CurrencyCode" SortExpression="CurrencyCode"
                                HeaderText="CurrencyCode" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PaymentTermDescr" UniqueName="PaymentTermDescr" SortExpression="PaymentTermDescr"
                                HeaderText="PaymentTerm" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PaymentMethodDescr" UniqueName="PaymentMethodDescr" SortExpression="PaymentMethodDescr"
                                HeaderText="PaymentMethod" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesManCodeDescr" UniqueName="SalesManCodeDescr" SortExpression="SalesManCodeDescr"
                                HeaderText="SalesManCode" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ShipToCode" UniqueName="ShipToCode" SortExpression="ShipToCode"
                                HeaderText="ShipToCode" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToAddress" UniqueName="ShipToAddress" SortExpression="ShipToAddress"
                                HeaderText="ShipToAddress" HeaderStyle-Width="300px" ItemStyle-Width="300px">
                            </telerik:GridBoundColumn>                           
                            <telerik:GridBoundColumn DataField="ShipToCountryCode" UniqueName="ShipToCountryCode" HeaderText="ShipToCountryCode" SortExpression="ShipToCountryCode"
                                 HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>                           
                            <telerik:GridBoundColumn DataField="BillToCode" UniqueName="BillToCode" SortExpression="BillToCode"
                                HeaderText="BillToCode" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillToAddress" UniqueName="BillToAddress" SortExpression="BillToAddress"
                                HeaderText="BillToAddress" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>  
                            <telerik:GridBoundColumn DataField="BillToCountryCode" UniqueName="BillToCountryCode" SortExpression="BillToCountryCode"
                                HeaderText="BillToCountryCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequestBy" UniqueName="RequestBy" SortExpression="RequestBy"
                                HeaderText="RequestBy" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequestOn" UniqueName="RequestOn" SortExpression="RequestOn"
                                HeaderText="RequestOn" HeaderStyle-Width="140px" ItemStyle-Width="140px" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveBy" UniqueName="ApproveBy" SortExpression="ApproveBy"
                                HeaderText="ApproveBy" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveOn" UniqueName="ApproveOn" SortExpression="ApproveOn"
                                HeaderText="ApproveOn" HeaderStyle-Width="130px" ItemStyle-Width="130px" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveStatusDescr" UniqueName="ApproveStatusDescr" SortExpression="ApproveStatusDescr"
                                HeaderText="ApproveStatus" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" HeaderStyle-Width="220px" ItemStyle-Width="220px"
                                HeaderText="Notes">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderQuotationStatusDescr" UniqueName="SalesOrderQuotationStatusDescr" SortExpression="SalesOrderQuotationStatusDescr"
                                HeaderText="Status" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate"
                                HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy hh:mm}" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser"
                                HeaderText="AddUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate"
                                HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy hh:mm}" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser"
                                HeaderText="EditUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderQuotationStatusColorCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderQuotationStatus" Display="false">
                            </telerik:GridBoundColumn> 
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
