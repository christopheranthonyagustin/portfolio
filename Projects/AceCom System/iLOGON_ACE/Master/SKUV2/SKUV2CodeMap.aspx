<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2CodeMap.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2CodeMap" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SKUV2CodeMap</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
</head>
<body>
    <form id="Form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
                EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CodeMapEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="DeleteCodeMap" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete SkuCodeMap"
                                    align="absmiddle" runat="server"></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="CodeMapUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="CodeMapCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn SortExpression="SubProductCode" UniqueName="SubProductCode" HeaderText="SubProductCode">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "SubProductCode") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="SubProductCodeTxt" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "SubProductCode") %>'>
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn SortExpression="SubOwnerCode" UniqueName="SubOwnerCode" HeaderText="SubOwnerCode">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "SubOwnerCodeDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="SubOwnerCodeDDL" runat="server" Skin="WebBlue" DataSource='<%# subOwnerCodeListDS %>' DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(subOwnerCodeListDS,DataBinder.Eval(Container.DataItem, "SubOwnerCode").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn SortExpression="UOM" UniqueName="UOM" HeaderText="UOM">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "uomdescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="uomDDL" runat="server" Skin="WebBlue" DataSource='<%# uomListDS %>' DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomListDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        UniqueName="statusdescr" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy}" UniqueName="adddate" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        UniqueName="adduser" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy}" UniqueName="editdate" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        UniqueName="edituser" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuId" SortExpression="skuId" Display="False" UniqueName="skuId"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
