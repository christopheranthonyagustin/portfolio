<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkshopOrderForm.aspx.cs" Inherits="iWMS.Web.Job.WorkshopOrder.WorkshopOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Form Page</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="ServiceOrderBtn" runat="server" CssClass="LongLabelBlue" Text="Service Order"
                                OnClick="ServiceOrderBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                        </td>
                    </tr>
                </table>

                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                                OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="BillBtn" runat="server" CssClass="white" Text="Bill"
                                OnClick="BillBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="UndoBillBtn" runat="server" CssClass="white" Text="UndoBill"
                                OnClick="UndoBillBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="PrintInvoiceBtn" runat="server" CssClass="LongLabelBlue" Text="Print Invoice"
                                OnClick="PrintInvoiceBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />

                            <br />
                            <br />
                        </td>
                    </tr>
                </table>

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="true" AllowSorting="true"
                    AllowFilteringByColumn="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="WorkshopOrderItemId" Name="MainGrid" TableLayout="Fixed">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="EditImgBtn"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="EditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ImgCopy" ImageUrl="../../image/copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy WorkshopOrderItem Register"
                                        OnClick="ImgCopy_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="delImg"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="Delete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="InvNo" DataField="InvNo" SortExpression="InvNo" UniqueName="InvNo"
                                HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SequenceNo" DataField="SequenceNo" SortExpression="SequenceNo" UniqueName="SequenceNo"
                                HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OrderItemType" DataField="OrderItemTypeDescr" SortExpression="OrderItemTypeDescr" UniqueName="OrderItemTypeDescr"
                                HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OrderItemCategory" DataField="OrderItemCategory" SortExpression="OrderItemCategory" UniqueName="OrderItemCategory"
                                HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OrderItemDescription" DataField="OrderItemDescription" SortExpression="OrderItemDescription" UniqueName="OrderItemDescription"
                                HeaderStyle-Width="180px" ItemStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OrderItemQty" DataField="OrderItemQty" SortExpression="OrderItemQty" UniqueName="OrderItemQty"
                                HeaderStyle-Width="100px" ItemStyle-Width="100px" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OrderItemUnitRate" DataField="OrderItemUnitRate" SortExpression="OrderItemUnitRate" UniqueName="OrderItemUnitRate"
                                AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OrderItemAmount" DataField="OrderItemAmount" SortExpression="OrderItemAmount" UniqueName="OrderItemAmount"
                                AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OrderItemUOM" DataField="OrderItemUOM" SortExpression="OrderItemUOM" UniqueName="OrderItemUOM"
                                AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TaxType" DataField="TaxType" SortExpression="TaxType" UniqueName="TaxType"
                                AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Personnel" DataField="PersonnelName" SortExpression="PersonnelName" UniqueName="PersonnelName"
                                AllowFiltering="false" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="DateTimeStart" DataField="DateTimeStart" SortExpression="DateTimeStart" UniqueName="DateTimeStart"
                                DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="DateTimeEnd" DataField="DateTimeEnd" SortExpression="DateTimeEnd" UniqueName="DateTimeEnd"
                                DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalHours" DataField="TotalHours" SortExpression="TotalHours" UniqueName="TotalHours"
                                AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes"
                                AllowFiltering="false" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" SortExpression="StatusDescr" UniqueName="Status"
                                HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WorkshopOrderId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DRId" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="BillRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="UndoBillPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="PrintInvoiceRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
