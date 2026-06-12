<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrSummaryQuoDetl.aspx.cs"
    Inherits="iWMS.Web.Job.DebitNote.DrSummaryQuoDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DrSummaryQuoDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server"></asp:Label></div>
            </td>
            <td align="right">
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td>
                <asp:Button ID="serarchBtn" runat="server" CssClass="white" Text="Search"
                    OnClick="serachBtn_Click"></asp:Button>
                &nbsp;<asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" OnClick="add">
                </asp:Button>&nbsp;<asp:Button ID="CloseBtn" runat="server" CssClass="white"
                    Text="Close" OnClick="CloseBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" HorizontalAlign="Left"></ItemStyle>
            <Columns>
                <asp:TemplateColumn HeaderText="id" HeaderStyle-HorizontalAlign="Center" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                        <asp:Label ID="QuDtTaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' />
                        <asp:Label ID="chargedescr2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr2") %>'></asp:Label>
                        <asp:Label ID="chargecode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                        <asp:Label ID="chargeid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "chargeid") %>'></asp:Label>
                        <asp:Label ID="taxtype" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>'></asp:Label>
                        <asp:Label ID="arglcode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "arglcode") %>'></asp:Label>
                        <asp:Label ID="seqno" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "seqno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="chargedescr" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:TextBox ID="QtyTxt" runat="server" Width="60"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="unitrateuom" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrateuom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:TextBox ID="UnitRateTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Minimum Charge" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="mincharge" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="RemarksTxt" runat="server" Width="300" TextMode="MultiLine"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
