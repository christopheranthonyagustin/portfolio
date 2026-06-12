<%@ Page Language="c#" CodeBehind="SkuPack.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.SkuPack" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuPack</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="SkuPackLbl" runat="server" CssClass="pagetitle" Visible="False">SKU Pack :</asp:Label><asp:Label
                    ID="SkuLbl" runat="server" CssClass="pagetitle"></asp:Label><br>
                <asp:Label ID="PackLbl" Font-Italic="True" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;<asp:Button
                    ID="AddPackBtn" runat="server" Text="+ Pack" CssClass="detailButton" OnClick="AddPackBtn_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="PackDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="PackDG_Cancel"
            OnUpdateCommand="PackDG_Update" OnEditCommand="PackDG_Edit" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PackEdit"
                            ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                            CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="PackDelete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Sku Pack"
                                align="absmiddle" runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="PackUpdate" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="PackCancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:BoundColumn Visible="False" DataField="skuId" SortExpression="skuId" HeaderText="SKU">
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="UOM">
                    <EditItemTemplate>
                        <asp:DropDownList ID="pack" DataMember="" DataTextField="descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(packListDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'
                            DataSource='<%# packListDS%>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "descr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Unit Type">
                    <EditItemTemplate>
                        <asp:CheckBox ID="UnitTypeCB" runat="server"></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "unittype") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Sell Unit">
                    <EditItemTemplate>
                        <asp:CheckBox ID="SellUnitCB" runat="server"></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "sellunit") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Qty">
                    <EditItemTemplate>
                        <asp:TextBox ID="QtyTxt" runat="server" Width="60"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqQtyVal" runat="server" ControlToValidate="QtyTxt"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                            ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <asp:CompareValidator ID="ZeroVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                            ErrorMessage="#" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "qty") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="upc" SortExpression="upc" HeaderText="UPC">
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Length">
                    <EditItemTemplate>
                        <asp:TextBox ID="LengthTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="LengthVal" runat="server" ControlToValidate="LengthTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "length") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Width">
                    <EditItemTemplate>
                        <asp:TextBox ID="WidthTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="WidthVal" runat="server" ControlToValidate="WidthTxt" EnableClientScript="True"
                            ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "width") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Height">
                    <EditItemTemplate>
                        <asp:TextBox ID="HeightTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="HeightVal" runat="server" ControlToValidate="HeightTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "height") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Volume">
                    <EditItemTemplate>
                        <asp:TextBox ID="VolTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="VolVal" runat="server" ControlToValidate="VolTxt" EnableClientScript="True"
                            ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "vol") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Gross Weight">
                    <EditItemTemplate>
                        <asp:TextBox ID="WeightTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="WeightVal" runat="server" ControlToValidate="WeightTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "wt") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Net Weight">
                    <EditItemTemplate>
                        <asp:TextBox ID="NetWeightTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="NetWeightVal" runat="server" ControlToValidate="NetWeightTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "netwt") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
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
