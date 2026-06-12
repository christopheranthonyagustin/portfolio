<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2Pack.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2Pack" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>SkuV2Pack</title>
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
    <form id="Form1" method="post" runat="server" defaultbutton="AddPackBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="AddPackBtn" runat="server" Text="New" CssClass="white" OnClick="AddPackBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;
                <asp:Button ID="DeleteAllBtn" runat="server" class="white" Text="Delete" OnClick="DeleteAllBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true" />
                    <br />
                    <asp:Label ID="SkuPackLbl" runat="server" CssClass="pagetitle" Visible="False"></asp:Label>
                    <br/>
                    <asp:Label ID="PackLbl" Font-Italic="True" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="PackDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="PackDG_NeedDataSource" Skin="Metro" OnItemDataBound="PackDG_ItemDataBound"
            OnUpdateCommand="PackDG_Update" OnEditCommand="PackDG_Edit" OnCancelCommand="PackDG_Cancel">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="25" DataKeyNames="id" EditMode="InPlace">
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
                            <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
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
                    <telerik:GridBoundColumn DataField="skuId" SortExpression="skuId" HeaderText="SKU"
                        Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="UOM">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "descr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="pack" DataMember="" DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(packListDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'
                                DataSource='<%# packListDS%>' runat="server" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Unit Type">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "unittype") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="UnitTypeCB" runat="server"></asp:CheckBox>
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
                            <%# DataBinder.Eval(Container.DataItem, "qty") %>
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
                    <telerik:GridTemplateColumn HeaderText="WholeLoose">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "wholelooseDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="WholeLooseList" DataMember="" DataTextField="Descr" DataValueField="Item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(wholeLooseListDS,DataBinder.Eval(Container.DataItem, "wholeloose").ToString())%>'
                                DataSource='<%# wholeLooseListDS%>' runat="server" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Category">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "uomcatDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="categorylist" DataMember="" DataTextField="Descr" DataValueField="Item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomCatListDS,DataBinder.Eval(Container.DataItem, "uomcat").ToString())%>'
                                DataSource='<%# uomCatListDS%>' runat="server" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="upc" SortExpression="upc" UniqueName="upc"
                        HeaderText="UPC">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "upc") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="UpcTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "upc") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="length" SortExpression="length" UniqueName="length"
                        HeaderText="Length">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "length") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="LengthTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="LengthVal" runat="server" ControlToValidate="LengthTxt"
                                EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="width" SortExpression="width" UniqueName="width"
                        HeaderText="Width">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "width") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="WidthTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="WidthVal" runat="server" ControlToValidate="WidthTxt" EnableClientScript="True"
                                ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="height" SortExpression="height" UniqueName="height"
                        HeaderText="Height">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "height") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="HeightTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="HeightVal" runat="server" ControlToValidate="HeightTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="vol" SortExpression="vol" UniqueName="vol"
                        HeaderText="Volume">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "vol") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="VolTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="VolVal" runat="server" ControlToValidate="VolTxt" EnableClientScript="True"
                                ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="wt" SortExpression="wt" UniqueName="wt" HeaderText="Gross Weight">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "wt") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="WeightTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="WeightVal" runat="server" ControlToValidate="WeightTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="netwt" SortExpression="netwt" UniqueName="netwt"
                        HeaderText="Net Weight">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "netwt") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="NetWeightTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="NetWeightVal" runat="server" ControlToValidate="NetWeightTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="ExtLength" SortExpression="ExtLength" UniqueName="ExtLength"
                        HeaderText="ExtLength">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ExtLength")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ExtLengthTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="ExtLengthVal" runat="server" ControlToValidate="ExtLengthTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="ExtWidth" SortExpression="ExtWidth" UniqueName="ExtWidth"
                        HeaderText="ExtWidth">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ExtWidth")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ExtWidthTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="ExtWidthVal" runat="server" ControlToValidate="ExtWidthTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="ExtHeight" SortExpression="ExtHeight" UniqueName="ExtHeight"
                        HeaderText="ExtHeight">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ExtHeight")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ExtHeightTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="ExtHeightVal" runat="server" ControlToValidate="ExtHeightTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="ExtVol" SortExpression="ExtVol" UniqueName="ExtVol"
                        HeaderText="ExtVolume">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ExtVol")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ExtVolTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="ExtVolVal" runat="server" ControlToValidate="ExtVolTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="ExtWt" SortExpression="ExtWt" UniqueName="ExtWt"
                        HeaderText="ExtWt">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ExtWt")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ExtWtTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="ExtWtVal" runat="server" ControlToValidate="ExtWtTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="ExtNetWt" SortExpression="ExtNetWt" UniqueName="ExtNetWt"
                        HeaderText="ExtNetWt">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ExtNetWt")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ExtNetWtTxt" runat="server" Width="80"></asp:TextBox>
                            <asp:CompareValidator ID="ExtNetWtVal" runat="server" ControlToValidate="ExtNetWtTxt"
                                EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
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
