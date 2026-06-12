<%@ Page Language="c#" CodeBehind="UomConfig.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.UomConfig" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PickDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="SkuPackLbl" runat="server" CssClass="pagetitle" Visible="False">SKU Pack :</asp:Label>
                <asp:Label ID="DescrLbl" runat="server" CssClass="pagetitle"></asp:Label><asp:Label
                    ID="UOMConfigLbl" runat="server" CssClass="pagetitle" Visible="False">UOM Config</asp:Label>
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                <asp:Button Style="z-index: 0" ID="BackButton" runat="server" CssClass="detailButton"
                    Text="< Back" Visible="True" CausesValidation="False" OnClick="BackButton_Click">
                </asp:Button>&nbsp;
                <asp:Button ID="AddBtn" runat="server" Text="+ Config" CssClass="detailButton" OnClick="AddBtn_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" BorderStyle="None" GridLines="Both"
            CellPadding="2" AutoGenerateColumns="False" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel"
            OnUpdateCommand="ResultDG_Update" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="UomCfgEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="UomConfig_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete UOM Config"
                                runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="UomCfgUpdate" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="UomCfgCancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        Site
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="SiteList" DataMember="" DataTextField="Descr" DataValueField="Item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(siteDS,DataBinder.Eval(Container.DataItem, "sitecode").ToString())%>'
                            DataSource='<%# siteDS%>' runat="server" />
                        <asp:RequiredFieldValidator ID="SiteListReq" ControlToValidate="SiteList" runat="server"
                            EnableClientScript="True" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "sitedescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        UOM
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="uom" runat="server" Text='<%# uom%>'>
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="pfloccode" SortExpression="pfloccode" HeaderText="PF.Loc">
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        Max.Qty(EA)
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="MaxQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "maxqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="MaxQtyVal" runat="server" ControlToValidate="MaxQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "maxqty") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        Min.Qty(EA)
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="MinQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "minqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="MinQtyVal" runat="server" ControlToValidate="MinQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "minqty") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        Reorder Qty
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="ReorderQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "reorderqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="ReorderQtyVal" runat="server" ControlToValidate="ReorderQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "reorderqty") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        Max.Allc. Qty
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="MaxAllcQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "maxallcqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="MaxAllcQtyVal" runat="server" ControlToValidate="MaxAllcQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "maxallcqty") %>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        Over Max.
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkOverMax" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "overmaxbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkOverMaxEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "overmaxbool", "False")) %>'
                            runat="server" />
                    </EditItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark">
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
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
