<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.StockMovementByLot.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
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
                Stock Movement By Lot
            </td>
            <td width="80%" align="right">
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="customerLbl1" runat="server">Account</asp:Label>
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
        <tr class="graytitle">
            <td>
                <asp:Label ID="Label1" runat="server">Sku</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="skuLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div style="height: 90%" id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" UseAccessibleHeader="True" CellPadding="2"
            GridLines="Both" BorderStyle="None" AutoGenerateColumns="false">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:BoundColumn DataField="transdate" HeaderText="TransDate" DataFormatString="{0:dd/MMM/yyyy HH:mm}"
                    ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="skucode" HeaderText="SKU" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="skucode2" HeaderText="SKU Code 2" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="skudescr" HeaderText="SKU Descr" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="skugroup" HeaderText="SKU Group" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="srcnumber" HeaderText="SrcNo" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="srctypedescr" HeaderText="SrcType" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="loccode" HeaderText="Location" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="tuno1" HeaderText="Tuno1" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="tuno2" HeaderText="Tuno2" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="qty" HeaderText="Qty" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right"
                    DataFormatString="{0:#,0.##}" />
                <asp:BoundColumn DataField="adduser" HeaderText="DoneBy" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot4" HeaderText="lot4" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot5" HeaderText="lot5" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot6" HeaderText="lot6" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot9" HeaderText="lot9" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot10" HeaderText="lot10" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot11" HeaderText="lot11" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot12" HeaderText="lot12" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot13" HeaderText="lot13" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot14" HeaderText="lot14" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot15" HeaderText="lot15" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot16" HeaderText="lot16" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot17" HeaderText="lot17" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot18" HeaderText="lot18" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot19" HeaderText="lot19" ItemStyle-Wrap="false" />
                <asp:BoundColumn DataField="lot20" HeaderText="lot20" ItemStyle-Wrap="false" />
            </Columns>
        </asp:DataGrid></div>
    </form>
</body>
</html>
