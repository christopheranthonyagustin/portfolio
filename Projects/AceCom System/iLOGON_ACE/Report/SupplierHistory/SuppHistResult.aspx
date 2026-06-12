<%@ Page Language="c#" CodeBehind="SuppHistResult.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.SupplierHistory.SuppHistResult" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SuppHistResult</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="1" cellpadding="1" border="0">
        <tr>
            <td>
                <table class="BoldText">
                    <tr>
                        <td>
                            <asp:Label ID="AccountTextLbl" runat="server" CssClass="Graytitle">Account</asp:Label>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SuppCodeTextLbl" runat="server" CssClass="Graytitle">Supplier Code</asp:Label>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="SuppCodeLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SuppNameTextLbl" runat="server" CssClass="Graytitle">Supplier Name</asp:Label>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="SuppNameLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="FromDateTextLbl" runat="server" CssClass="Graytitle">From Date</asp:Label>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ToDateTextLbl" runat="server" CssClass="Graytitle">To Date</asp:Label>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="ResultDG" runat="server" Width="100%" AutoGenerateColumns="False"
                    CellPadding="2" GridLines="Both" BorderStyle="None">
                    <AlternatingItemStyle Wrap="False" BackColor="Gainsboro"></AlternatingItemStyle>
                    <ItemStyle Wrap="False" ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                    <HeaderStyle ForeColor="White" BackColor="#9E9E9E" Wrap="False"></HeaderStyle>
                    <Columns>
                        <asp:BoundColumn DataField="rcdate" HeaderText="Receive Date" DataFormatString="{0:dd/MMM/yyyy}">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="line" HeaderText="Line"></asp:BoundColumn>
                        <asp:BoundColumn DataField="skucode" HeaderText="SKU Code"></asp:BoundColumn>
                        <asp:BoundColumn DataField="skucode2" HeaderText="SKU Code2"></asp:BoundColumn>
                        <asp:BoundColumn DataField="skudescr" HeaderText="SKU Description"></asp:BoundColumn>
                        <asp:BoundColumn DataField="rcid" HeaderText="Receipt #"></asp:BoundColumn>
                        <asp:BoundColumn DataField="pono" HeaderText="PO #"></asp:BoundColumn>
                        <asp:BoundColumn DataField="quantity" HeaderText="Quantity"></asp:BoundColumn>
                        <asp:BoundColumn DataField="uomdescr" HeaderText="UOM"></asp:BoundColumn>
                        <asp:BoundColumn DataField="lot7" HeaderText="Unit Price"></asp:BoundColumn>
                        <asp:BoundColumn DataField="amount" HeaderText="Amount"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
