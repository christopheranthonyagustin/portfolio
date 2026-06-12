
<%@ Page Language="c#" CodeBehind="ReleaseOrder4.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrder4" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReleaseOrder4</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
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
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    
    <br>
    <div id="div-datagrid">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <br />
                &nbsp;<asp:Button ID="addRoDetl" runat="server" Text="AddItem" CssClass="detailButton"
                    OnClick="addRoDetl_Click"></asp:Button>
                &nbsp;<asp:Button ID="submitOrderBtn" runat="server" Text="ProceedToOrder" 
                    CssClass="detailButton" onclick="submitOrderBtn_Click"
                    ></asp:Button>
                &nbsp;<br />
                <br />
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="ResultDG_Cancel"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" VerticalAlign="Top"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCB" runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="roDetlEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="IsOrderDelete"
                            runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <a onclick="return confirm('Confirm to Proceed?')">
                            <asp:ImageButton runat="server" Visible="True" ID="IsOrderUpdate" ImageUrl="..\..\image\floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton></a>
                        <asp:ImageButton runat="server" Visible="True" ID="IsOrderCancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn Visible="False" HeaderText="No">
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Account">
                    <EditItemTemplate>
                        <asp:DropDownList Width="150px" ID="AccountDdl" DataTextField="code" DataValueField="acid"
                            DataSource='<%# CurrentUser.AccountDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrentUser.AccountDS,DataBinder.Eval(Container.DataItem, "accode").ToString())%>'
                            runat="server" AutoPostBack="true" OnSelectedIndexChanged="AccountDdl_SelectedIndexChanged">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "accode")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="acid" SortExpression="acid" Visible="false" HeaderText="acid" />
                <asp:BoundColumn DataField="skuid" SortExpression="skuid" Visible="false" HeaderText="skuid" />
                <asp:TemplateColumn HeaderText="SKU/CustomsLot">
                    <EditItemTemplate>
                        <input id="SkuIdHidden" type="hidden" runat="server" />
                        <asp:TextBox Width="200px" ID="SkucodeTxt" runat="server" AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "skucode3") %>'
                            OnTextChanged="SkucodeTxt_TextChanged"></asp:TextBox>
                        <asp:DropDownList Width="200px" ID="SkucodeDdl" DataTextField="Code3" DataValueField="id"
                            runat="server" AutoPostBack="true" OnSelectedIndexChanged="SkucodeDdl_SelectedIndexChanged"
                            Visible="false" />
                      <%--  <asp:RequiredFieldValidator ID="ReqSKUListVal" runat="server" ControlToValidate="SkucodeTxt"
                            ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "skucode3") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="CustomsLot">
                    <EditItemTemplate>
                        <asp:TextBox Width="80px" ID="Lot4Txt" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                            Visible="false" />
                        <asp:DropDownList Width="150px" ID="Lot4Ddl" DataTextField="lot4" DataValueField="lotid"
                            runat="server" AutoPostBack="true" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "Lot4") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox Width="80px" ID="QtyTxt" runat="server" AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "uomqty","{0:#,0.##}") %>' />
                        <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt"
                            ErrorMessage="*" />
                        <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        <asp:CompareValidator ID="QtyTxtZeroVal" runat="server" ControlToValidate="QtyTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="GreaterThan" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "uomqty", "{0:#,0.##}") %><br />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UOM">
                    <EditItemTemplate>
                        <asp:TextBox Width="80px" ID="UOMTxt" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "uomdescr") %>'
                            Visible="false" />
                        <asp:DropDownList Width="80px" ID="UOMDdl" DataTextField="descr" DataValueField="uom"
                            runat="server" AutoPostBack="true" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "uomdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="SpecialInstruction">
                    <EditItemTemplate>
                        <asp:TextBox Width="200px" ID="InstTxt" runat="server" TextMode="MultiLine" Value='<%# DataBinder.Eval(Container.DataItem, "SpecialInstruction") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "specialinstruction")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Remarks">
                    <EditItemTemplate>
                        <asp:TextBox Width="200px" ID="RemarksTxt" runat="server" TextMode="MultiLine" Value='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
