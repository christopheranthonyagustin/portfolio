<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionItemMasterItemPack.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionItemMaster.DistributionItemMasterItemPack" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ItemPack</title>
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
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" CommandItemDisplay="Top" DataKeyNames="ItemUOMId" EditMode="InPlace">
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
                            <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.ItemUOMid")%>' onclick="return confirm('Confirm delete?')"
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

                    <telerik:GridTemplateColumn HeaderText="UOM">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemUOM") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="pack" runat="server" DataTextField="descr" DataValueField="item"
                                DataSource='<%# packListDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(packListDS,DataBinder.Eval(Container.DataItem, "itemuom").ToString())%>'
                                AutoPostBack="true">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="sellunit" SortExpression="sellunit" UniqueName="sellunit"
                        HeaderText="Sell Unit">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "sellunit") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="SellUnitCB" runat="server"></asp:CheckBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Qty">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemQty") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="QtyTxt" runat="server" Width="60"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqQtyVal" runat="server" ControlToValidate="QtyTxt"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            <asp:CompareValidator ID="ZeroVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="Length" SortExpression="Length" UniqueName="Length"
                        HeaderText="Length">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Length") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="LengthTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="LengthVal" runat="server" ControlToValidate="LengthTxt"
                                EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Width" SortExpression="Width" UniqueName="Width"
                        HeaderText="Width">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Width") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="WidthTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="WidthVal" runat="server" ControlToValidate="WidthTxt" EnableClientScript="True"
                                ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Height" SortExpression="Height" UniqueName="Height"
                        HeaderText="Height">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Height") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="HeightTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="HeightVal" runat="server" ControlToValidate="HeightTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Vol" SortExpression="Vol" UniqueName="Vol"
                        HeaderText="Volume">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Vol") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="VolTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="VolVal" runat="server" ControlToValidate="VolTxt" EnableClientScript="True"
                                ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="Wt" SortExpression="Wt" UniqueName="Wt" HeaderText="Weight">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Wt") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="WeightTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="WeightVal" runat="server" ControlToValidate="WeightTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="NetWt" SortExpression="NetWt" UniqueName="NetWt"
                        HeaderText="Net Weigth">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "NetWt") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="NetWeightTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="NetWeightVal" runat="server" ControlToValidate="NetWeightTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="InExLengthBy" SortExpression="InExLengthBy" UniqueName="InExLengthBy"
                        HeaderText="InExLengthBy">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "InExLengthBy") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="InExLengthByTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="InExLengthByVal" runat="server" ControlToValidate="InExLengthByTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="InExWidthBy" SortExpression="InExWidthBy" UniqueName="InExWidthBy"
                        HeaderText="InExWidthBy">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "InExWidthBy") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="InExWidthByTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="InExWidthByVal" runat="server" ControlToValidate="InExWidthByTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="InExHeightBy" SortExpression="InExHeightBy" UniqueName="InExHeightBy"
                        HeaderText="InExHeightBy">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "InExHeightBy") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="InExHeightByTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="InExHeightByVal" runat="server" ControlToValidate="InExHeightByTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="WholeLoose">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "WholeLoose") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="WholeLooseList" runat="server" DataTextField="descr" DataValueField="item"
                                DataSource='<%# wholeLooseListDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(wholeLooseListDS,DataBinder.Eval(Container.DataItem, "wholeloose").ToString())%>'
                                AutoPostBack="true">
                            </telerik:RadComboBox>
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
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
