<%@ Page Language="c#" CodeBehind="SkuPack2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.SkuPack2" %>

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
                <div class="pagetitle">
                    <asp:Label ID="SkuLbl" runat="server"></asp:Label></div>
                <asp:Label ID="PackLbl" Font-Italic="True" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;<asp:Button
                    ID="SaveBtn" runat="server" Text="Save" CssClass="detailButton" OnClick="SaveBtn_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="PackDG" runat="server" AutoGenerateColumns="False" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn Visible="False">
                    <ItemTemplate>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:BoundColumn Visible="False" DataField="skuId" SortExpression="skuId" HeaderText="SKU">
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="UOM" DataField="uom" SortExpression="uom" ItemStyle-HorizontalAlign="Center">
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Unit Type" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="UnitTypeCB" runat="server"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Sell Unit" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="SellUnitCB" runat="server"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="QtyTxt" runat="server" Width="60"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqQtyVal" runat="server" ControlToValidate="QtyTxt"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                            ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <asp:CompareValidator ID="ZeroVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                            ErrorMessage="#" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UPC">
                    <ItemTemplate>
                        <asp:TextBox ID="UPCTxt" runat="server" Width="80"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Length">
                    <ItemTemplate>
                        <asp:TextBox ID="LengthTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="LengthVal" runat="server" ControlToValidate="LengthTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Width">
                    <ItemTemplate>
                        <asp:TextBox ID="WidthTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="WidthVal" runat="server" ControlToValidate="WidthTxt" EnableClientScript="True"
                            ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Height">
                    <ItemTemplate>
                        <asp:TextBox ID="HeightTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="HeightVal" runat="server" ControlToValidate="HeightTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Volume">
                    <ItemTemplate>
                        <asp:TextBox ID="VolTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="VolVal" runat="server" ControlToValidate="VolTxt" EnableClientScript="True"
                            ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Gross Weight">
                    <ItemTemplate>
                        <asp:TextBox ID="WeightTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="WeightVal" runat="server" ControlToValidate="WeightTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Net Weight">
                    <ItemTemplate>
                        <asp:TextBox ID="NetWeightTxt" runat="server" Width="80"></asp:TextBox>
                        <asp:CompareValidator ID="NetWeightVal" runat="server" ControlToValidate="NetWeightTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
