<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARSubledgerHead.aspx.cs" Inherits="iWMS.Web.Accounting.ARSubledger.ARSubledgerHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ARSubledgerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function selectAll(invoker) {
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
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                &nbsp;
                 <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                     OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="SuspendBtn" runat="server" CssClass="white" Text="Suspend"
                    OnClick="SuspendBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="PrintInvoicebtn" runat="server" CssClass="LongLabelBlue" Text="Print Invoice"
                    OnClick="PrintInvoicebtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                 <asp:Button ID="PeppolEInvoicebtn" runat="server" CssClass="LongLabelGreen" Text="&nbsp;&nbsp;&nbsp;&nbsp;Peppol &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E-Invoice &nbsp;&nbsp;"
                     OnClick="PeppolEInvoicebtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="SwitchCustomerbtn" runat="server" CssClass="LongLabelWhite" Text="Switch Customer"
                    OnClick="SwitchCustomerbtnbtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                 <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                     OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" HeaderText="BranchCode" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Number" UniqueName="Number" SortExpression="Number" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ARNumber">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo"
                                HeaderText="InvoiceNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ARDate" UniqueName="ARDate" SortExpression="ARDate"
                                HeaderText="ARDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PeriodCode" UniqueName="PeriodCode" SortExpression="PeriodCode" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Period">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TypeDescr" UniqueName="TypeDescr" SortExpression="TypeDescr" AllowFiltering="false"
                                HeaderText="Type" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Source" UniqueName="Source" SortExpression="Source" AllowFiltering="false"
                                HeaderText="Source" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn FilterControlWidth="0px" DataField="CustCode" UniqueName="CustCode" HeaderText="CustomerCode" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustName" UniqueName="CustName" HeaderText="CustomerName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CurrCode" UniqueName="CurrCode" HeaderText="Currency" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Amount" UniqueName="Amount" HeaderText="Amount" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks1" UniqueName="remarks1" SortExpression="remarks1" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Remarks1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks2" UniqueName="remarks2" SortExpression="remarks2" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Remarks2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CategoryDescr" UniqueName="CategoryDescr" SortExpression="CategoryDescr" ShowFilterIcon="false"
                                HeaderText="Category" FilterControlWidth="0px" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Type" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustName" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
