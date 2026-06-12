<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionItemMasterItemPricing.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionItemMaster.DistributionItemMasterItemPricing" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ItemPricing</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

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
    <form id="Form1" method="post" runat="server" defaultbutton="">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="SkuPackLbl" runat="server" CssClass="pagetitle" Visible="False"></asp:Label><br>
                    <asp:Label ID="PackLbl" Font-Italic="True" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="PackDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="PackDG_NeedDataSource" Skin="Metro" OnItemDataBound="PackDG_ItemDataBound" OnItemCommand="PackDG_ItemCommand"
            OnUpdateCommand="PackDG_Update" OnEditCommand="PackDG_Edit" OnCancelCommand="PackDG_Cancel">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" CommandItemDisplay="Top" DataKeyNames="ItemPricingId" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PackEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.ItemPricingId")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="PackDelete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Sku Pack"
                                    align="absmiddle" runat="server"></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="PackUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="PackCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Channel">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ChannelDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="ChannelIdList" runat="server" DataTextField="descr" DataValueField="item"
                                DataSource='<%# ChannelIdListDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChannelIdListDS,DataBinder.Eval(Container.DataItem, "ChannelId").ToString())%>'
                                AutoPostBack="true">
                            </telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="ReqQtyVal" runat="server" ControlToValidate="ChannelIdList"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="UOM">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemUOM") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="pack" runat="server" DataTextField="descr" DataValueField="item"
                                DataSource='<%# ItemUOMListDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ItemUOMListDS,DataBinder.Eval(Container.DataItem, "itemuom").ToString())%>'
                                AutoPostBack="true">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="PriceCalculationQualifier" HeaderText="PriceCalculationQualifier">
                        <%--                        <HeaderStyle Wrap="false" Width="60px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px" />--%>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "PriceCalculationQualifier")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList runat="server" ID="PriceCalculatinQualifierDDL" DataSource='<%# PriceCalculationQualifierDS%>'
                                Skin="WebBlue" DataTextField="descr" DataValueField="item" Width="90%" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PriceCalculationQualifierDS,DataBinder.Eval(Container.DataItem, "PriceCalculationQualifier").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="PriceCalculationFactor">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "PriceCalculationFactor") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="PriceCalculationFactorTxt" runat="server" Width="120"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Sell Price">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "SellingPrice") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="SellingPriceTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Currency">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CurrencyCode") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="CurrencyList" runat="server" DataTextField="descr" DataValueField="item"
                                DataSource='<%# CurrencyListDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrencyListDS,DataBinder.Eval(Container.DataItem, "CurrencyCode").ToString())%>'
                                AutoPostBack="true">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Status">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemPricingStatusDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemPricingStatusDescr") %>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SellingPrice" Visible="false">
                    </telerik:GridBoundColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
