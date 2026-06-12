<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVSDetl.aspx.cs" Inherits="iWMS.Web.Sales.Quotation_V.QuotationVSDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>QUSDet</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;<asp:Button ID="AddDetailBtn" runat="server" Text="Add" CssClass="white"
                        OnClick="AddDetailBtn_Click" OnClientClick="disableBtn(this.id,true)" ToolTip="Add" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;<asp:Label ID="DescrLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
                    <br />
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <asp:DataGrid ID="QUSDetDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="QUSDetDG_Cancel"
                OnUpdateCommand="QUSDetDG_Update" OnEditCommand="QUSDetDG_Edit" GridLines="Both"
                CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="SkuGrpUOMEdit" ImageUrl="..\..\image\pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="QUSDetDelete"
                                runat="server">
                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete UOM"
                                    runat="server"></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="QUSDetUpdate" ImageUrl="..\..\image\floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="QUSDetCancel" ImageUrl="..\..\image\arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn Visible="False" DataField="qudtId" SortExpression="qudtId" HeaderText="QudtId"></asp:BoundColumn>
                    <%--  <asp:TemplateColumn HeaderText="UOM">
                    <EditItemTemplate>
                        <asp:DropDownList ID="UOMList" DataTextField="Descr" DataValueField="Item" runat="server"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(packListDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'
                            DataSource='<%# packListDS%>' />
                        <asp:RequiredFieldValidator ID="ReqUOMListVal" runat="server" ControlToValidate="UOMList"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "uomdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>--%>
                    <asp:TemplateColumn HeaderText="Zone" ItemStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ZoneList" Enabled="True" DataTextField="Descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ZoneListDS,DataBinder.Eval(Container.DataItem, "zonecode").ToString())%>'
                                runat="server" DataSource='<%# ZoneListDS%>' Width="100px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "zonecode")%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="QtyTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#0}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0}")%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Rate" ItemStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="RateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "rate", "{0:#,0.00}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "rate", "{0:#,0.00}")%>
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

