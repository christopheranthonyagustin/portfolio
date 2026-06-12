<%@ Page Language="c#" CodeBehind="CustLotHistResult.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.CustomsLotHistory.CustLotHistResult" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CustomsLotNoHistory</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            height: 19px;
        }
        </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
			<table width="100%">
        <tr>
            <td>
                <table class="GrayTitle">
                    <tr class="graytitle">
                        <td colspan="3">
                            <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                        </td>
                        <td width="70%" align="right">
                            <A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="CustLotNoHistLbl" runat="server">Customs Lot Number History</asp:Label>
                            &nbsp;<asp:Label ID="LotLbl" runat="server"></asp:Label>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
                        </td>
                        <td>
                            :
                        </td>
                        <td colspan="2">
                            <asp:Label ID="NowLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                      <tr>
                        <td>
                            <asp:Label ID="ShowNotUsedOnlyTextLbl" runat="server" CssClass="Graytitle">ShowNotUsedOnly</asp:Label>
                        </td>
                        <td>
                            :
                        </td>
                        <td colspan="2">
                            <asp:Label ID="ShowNotUsedOnlyLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="div-datagrid" style="height: auto">
                    <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                        GridLines="Both" CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <Columns>
                            <asp:BoundColumn DataField="lotid" HeaderText="lotid" Visible="false"></asp:BoundColumn>
                            <asp:BoundColumn DataField="accode" HeaderText="Account"></asp:BoundColumn>
                            <asp:BoundColumn DataField="lot4" HeaderText="CustomsLotNo"></asp:BoundColumn>
                            <asp:BoundColumn DataField="skucode" HeaderText="Sku"></asp:BoundColumn>
                            <asp:BoundColumn DataField="skudescr" HeaderText="Descr"></asp:BoundColumn>
                            <asp:BoundColumn DataField="permitno" HeaderText="PermitNo"></asp:BoundColumn>
                            <asp:BoundColumn DataField="jobno" HeaderText="JobNo"></asp:BoundColumn>
                            <asp:BoundColumn DataField="rcno" HeaderText="ReceiptNo"></asp:BoundColumn>
                            <asp:BoundColumn DataField="remarks" HeaderText="Remarks"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid></div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
