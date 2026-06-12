<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.StockBalanceByLot.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>StockBalance</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td>
                Report
            </td>
            <td>
                :
            </td>
            <td>
                Stock Balance By Lot
            </td>
            <td width="80%" align="right">
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="customerLbl1" runat="server">Customer</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="customerLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="dateLbl1" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="dateLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div style="height: 90%" id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" UseAccessibleHeader="True" CellPadding="2"
            GridLines="Both" BorderStyle="None" AutoGenerateColumns="false">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:BoundColumn DataField="skucode" HeaderText="SKU" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="skulotdescr" HeaderText="SKU Descr" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="number" HeaderText="RecieptNo" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="rcdate" HeaderText="RecieptDate" DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="exref2" HeaderText="CustomerRef" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot4" HeaderText="lot4" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot1" HeaderText="lot1" DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot5" HeaderText="lot5" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot6" HeaderText="lot6" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot7" HeaderText="lot7" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot2" HeaderText="lot2" DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot8" HeaderText="lot8" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot3" HeaderText="lot3" DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lhubal" HeaderText="Qty" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right"
                    DataFormatString="{0:#,0.##}" />
                <asp:BoundColumn DataField="lhuuom" HeaderText="Uom" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="vol" HeaderText="Vol" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundColumn DataField="wt" HeaderText="Wt" ItemStyle-HorizontalAlign="Right" />
            </Columns>
        </asp:DataGrid></div>
    </form>
</body>
</html>
