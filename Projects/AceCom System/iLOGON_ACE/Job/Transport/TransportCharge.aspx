<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportCharge.aspx.cs"
    Inherits="iWMS.Web.Job.Transport.TransportCharge" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TransportCharge</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                <asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" Text="Save" OnClick="SaveBtn_Click">
                </asp:Button>&nbsp; &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid">
        <asp:DataGrid ID="JBChargeDG" runat="server" AutoGenerateColumns="False" GridLines="Both"
            CellPadding="2" DataKeyField="qudtid" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" HorizontalAlign="Left"></ItemStyle>
            <Columns>
                <asp:BoundColumn Visible="False" DataField="acid" SortExpression="acid" HeaderText="acid">
                </asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="jbid" SortExpression="jbid" HeaderText="jbid">
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="jbchargeid" HeaderStyle-HorizontalAlign="Center"
                    Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="jbchargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "jbchargeid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="qudtid" HeaderStyle-HorizontalAlign="Center" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qudtid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Charge"
                    ItemStyle-Font-Bold="True"></asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:TextBox ID="QtyTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.00}") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="UnitRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="FCAmt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="FcAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt", "{0:#,0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="RemarksTxt" runat="server" Width="300" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
