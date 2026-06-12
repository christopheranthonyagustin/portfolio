<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SplitRatio.aspx.cs"
    Inherits="iWMS.Web.Job.BookingOrder.SplitRatio" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Split Ratio</title>
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
        <table border="0" cellspacing="0" cellpadding="0" width="100%" height="40">
            <tr>
                <td align="left">
                    <asp:Button ID="SplitChargeBtn" CssClass="white" runat="server" OnClick="SplitChargeBtn_Click"
                        Visible="true" Text="SplitCharge" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ChargeBtn" CssClass="blue" runat="server" OnClick="ChargeBtn_Click"
                        Visible="true" Text="Charge" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;                
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
                EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="SkuSiteEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="DeleteJBAcRatio" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete SkuSite"
                                    align="middle" runat="server"></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="SkuSiteUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="SkuSiteCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="billaccountname" HeaderText="BillAccount">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "accode")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="BillAccountCombo" runat="server"
                                DropDownHeight="150px" Skin="Sunset" DataSource='<%# BillAccountListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillAccountListDS,DataBinder.Eval(Container.DataItem, "billacid").ToString())%>'
                                DataTextField="code" DataValueField="acid" RenderMode="Lightweight" Filter="Contains" AutoPostBack="true" CausesValidation="false">
                            </telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="billaccountnameReqVal" runat="server" ControlToValidate="BillAccountCombo" ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="quantity" HeaderText="Quantity">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "qty")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="QuantityText" Skin="Office2007" Width="100px" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "qty") %>'>
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="QTxtCompVal" runat="server" ControlToValidate="QuantityText"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                            <asp:CompareValidator ID="QTxtZeroVal" runat="server" ControlToValidate="QuantityText"
                                EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn SortExpression="UOM" UniqueName="UOM" HeaderText="UOM">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "uomtypedescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="uomDDL" runat="server" Skin="WebBlue" DataSource='<%# uomListDS %>' DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomListDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn SortExpression="status" UniqueName="status" HeaderText="Status" ReadOnly="true">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "statusdescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="statusDDL" runat="server" Skin="WebBlue" DataSource='<%# statusDS %>' DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                        HeaderText="EditUser" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuId" SortExpression="skuId" Display="False" UniqueName="skuId"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jbid" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="billacid" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
