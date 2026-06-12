<%@ Page Language="c#" CodeBehind="AccountRateSkuGroupUOM.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.AccountRate.AccountRateSkuGroupUOM" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AccountRateSkuGroupUOM</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server"></asp:Label></div>
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;<asp:Button
                    ID="SaveBtn" runat="server" Text=" Save " CssClass="detailButton" OnClick="SaveBtn_Click">
                </asp:Button>&nbsp;
                <asp:Button Style="z-index: 0" ID="ResetBtn" runat="server" Text=" Reset " CssClass="detailButton"
                    OnClick="ResetBtn_Click"></asp:Button>&nbsp;
                <asp:Button Style="z-index: 0" ID="BackBtn" runat="server" Text="< Back" CssClass="detailButton"
                    OnClick="BackBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="RateDG" runat="server" AutoGenerateColumns="False" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" HorizontalAlign="Center"></ItemStyle>
            <Columns>
                <asp:BoundColumn Visible="False" DataField="skuGrpId" SortExpression="skuGrpId" HeaderText="SKU Group Id">
                </asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="uom" SortExpression="uom" HeaderText="UOM">
                </asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="wholeloose" SortExpression="wholeloose"
                    HeaderText="WholeLoose"></asp:BoundColumn>
                <asp:BoundColumn DataField="skugrpdescr" SortExpression="skugrpdescr" HeaderText="SKU Group"
                    ItemStyle-Font-Bold="True"></asp:BoundColumn>
                <asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="wholeloosedescr" SortExpression="wholeloosedescr" HeaderText="W/L">
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Storage" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <table border="0">
                            <tr>
                                <td bgcolor="LightYellow" align="center">
                                    Calc
                                </td>
                                <td bgcolor="LightBlue" align="center">
                                    1 $
                                    <asp:TextBox ID="StorageRate1Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "storagerateperuom1")) %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="StorageRate1Val" runat="server" ControlToValidate="StorageRate1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                                <td bgcolor="LightGreen" align="center">
                                    2 $
                                    <asp:TextBox ID="StorageRate2Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "storagerateperuom2")) %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="StorageRate2Val" runat="server" ControlToValidate="StorageRate2Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="center">
                                    <asp:DropDownList ID="StorageCalcList" DataTextField="Descr" DataValueField="Item"
                                        runat="server" DataSource='<%# calcListDS%>' />
                                </td>
                                <td align="center">
                                    <%-->--%>
                                    <asp:TextBox ID="StorageQtyBreak1Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "storageqtybrk1")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="StorageQtyBreak1Val" runat="server" ControlToValidate="StorageQtyBreak1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><%--$--%>
                                    <asp:TextBox ID="StorageQtyBreakRate1Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "storageqtybrkrateperuom1")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="StorageQtyBreakRate1Val" runat="server" ControlToValidate="StorageQtyBreakRate1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                                <td align="center">
                                    <%-->--%>
                                    <asp:TextBox ID="StorageQtyBreak2Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "storageqtybrk2")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="StorageQtyBreak2Val" runat="server" ControlToValidate="StorageQtyBreak2Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><%--$--%>
                                    <asp:TextBox ID="StorageQtyBreakRate2Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "storageqtybrkrateperuom2")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="StorageQtyBreakRate2Val" runat="server" ControlToValidate="StorageQtyBreakRate2Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Handling In">
                    <ItemTemplate>
                        <table border="0">
                            <tr>
                                <td bgcolor="LightYellow" align="center">
                                    Calc
                                </td>
                                <td bgcolor="LightBlue" align="center">
                                    1 $
                                    <asp:TextBox ID="iHandlingRate1Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "ihandlingrateperuom1")) %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="iHandlingRate1Val" runat="server" ControlToValidate="iHandlingRate1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="iHandlingRate2Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "ihandlingrateperuom2")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="iHandlingRate2Val" runat="server" ControlToValidate="iHandlingRate2Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="iHandlingCalcList" DataTextField="Descr" DataValueField="Item"
                                        runat="server" DataSource='<%# calcListDS%>' />
                                </td>
                                <td colspan="2">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Handling Out">
                    <ItemTemplate>
                        <table border="0">
                            <tr>
                                <td bgcolor="LightYellow" align="center">
                                    Calc
                                </td>
                                <td bgcolor="LightBlue" align="center">
                                    1 $
                                    <asp:TextBox ID="oHandlingRate1Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "ohandlingrateperuom1")) %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="oHandlingRate1Val" runat="server" ControlToValidate="oHandlingRate1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="oHandlingRate2Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "ohandlingrateperuom2")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="oHandlingRate2Val" runat="server" ControlToValidate="oHandlingRate2Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="oHandlingCalcList" DataTextField="Descr" DataValueField="Item"
                                        runat="server" DataSource='<%# calcListDS%>' />
                                </td>
                                <td colspan="2">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="XDock">
                    <ItemTemplate>
                        <table border="0">
                            <tr>
                                <td bgcolor="LightYellow" align="center">
                                    Calc
                                </td>
                                <td bgcolor="LightBlue" align="center">
                                    1 $
                                    <asp:TextBox ID="xdHandlingRate1Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "xdhandlingrateperuom1")) %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="xdHandlingRat1Val" runat="server" ControlToValidate="xdHandlingRate1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="xdHandlingRate2Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "xdhandlingrateperuom2")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="xdHandlingRate2Val" runat="server" ControlToValidate="xdHandlingRate2Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="xdHandlingCalcList" DataTextField="Descr" DataValueField="Item"
                                        runat="server" DataSource='<%# calcListDS%>' />
                                </td>
                                <td colspan="2">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="BG">
                    <ItemTemplate>
                        <table border="0">
                            <tr>
                                <td bgcolor="LightYellow" align="center">
                                    Calc
                                </td>
                                <td bgcolor="LightBlue" align="center">
                                    1 $
                                    <asp:TextBox ID="bgRate1Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "bgrateperuom1")) %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="bgRat1Val" runat="server" ControlToValidate="bgRate1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="bgRate2Txt" runat="server" Width="40" Value='<%# DisplayValue(DataBinder.Eval(Container.DataItem, "bgrateperuom2")) %>'
                                        Visible="false">
                                    </asp:TextBox>
                                    <asp:CompareValidator ID="bgRate2Val" runat="server" ControlToValidate="bgRate2Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="bgCalcList" DataTextField="Descr" DataValueField="Item" runat="server"
                                        DataSource='<%# calcListDS%>' />
                                </td>
                                <td colspan="2">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid></div>
    </form>
</body>
</html>
