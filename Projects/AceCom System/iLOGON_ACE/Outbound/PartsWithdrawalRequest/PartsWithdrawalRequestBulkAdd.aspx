<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartsWithdrawalRequestBulkAdd.aspx.cs" Inherits="iWMS.Web.Outbound.PartsWithdrawalRequest.PartsWithdrawalRequestBulkAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bulk Add @ Parts Withdrawal Request</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id, true)" CssClass="white" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <br />

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="false" AllowPaging="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SLLTId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU" SortExpression="SKU"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUDescription" HeaderText="SKU Description" SortExpression="SKUDescription"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Location" HeaderText="Location" SortExpression="Location"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="UOM" HeaderText="UOM" SortExpression="UOM"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AvailableQty" HeaderText="AvailableQty" SortExpression="AvailableQty"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="RequestedQty" HeaderText="RequestedQty">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="RequestedQtyTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestedQty") %>' Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="RequestedQtyTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator runat="server" ControlToValidate="RequestedQtyTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="SKUId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LotId" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
