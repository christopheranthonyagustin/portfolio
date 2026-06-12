<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockBalancebyLot4lot6.aspx.cs" Inherits="iWMS.Web.Report.OpenCloseBalance.StockBalancebyLot4lot6" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Open Close Report by Condition</title>
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
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Open Close Balance by Condition</asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
                       
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="siteCodelbl" runat="server">Site</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="SiteLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="userLbl1" runat="server">SKU Group</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="SKUGrouplbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="fmtlbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="FormatLbl" runat="server"></asp:Label>
            </td>
        </tr>          
               
    </table>
    <div style="height: 90%" id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="RadGrid1_GridExporting">
         <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <ClientEvents OnGridCreated="onGridCreated" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" >                
                <Columns>
                    <telerik:GridBoundColumn HeaderText="From" DataField="frdate" UniqueName="Frdate" DataFormatString="{0:dd/MMM/yyyy}" >
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="To" DataField="todate" UniqueName="Todate" DataFormatString="{0:dd/MMM/yyyy}" >
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Group" DataField="SkuGroup" >
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Material Code" DataField="skucode" UniqueName="SKUCode" >
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Material Name" DataField="skudescr" >
                    </telerik:GridBoundColumn>
                </Columns>
                 <Columns>
                    <telerik:GridBoundColumn HeaderText="W/H Code" DataField="lot6" UniqueName="WHCode" >
                    </telerik:GridBoundColumn>
                </Columns>
                 <Columns>
                    <telerik:GridBoundColumn HeaderText="Lot No" DataField="lot4" DataFormatString="{0:N}" >
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" >
                    </telerik:GridBoundColumn>
                </Columns>
                 <Columns>
                    <telerik:GridBoundColumn HeaderText="Opening Qty" DataField="OPQTY" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}">
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Opening Net Wgt" DataField="OPNWT" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}">
                    </telerik:GridBoundColumn>
                </Columns>
                 <Columns>
                    <telerik:GridBoundColumn HeaderText="Incoming Qty" DataField="INQty" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}">
                    </telerik:GridBoundColumn>
                </Columns>
                 <Columns>
                    <telerik:GridBoundColumn HeaderText="Incoming Net Wgt" DataField="INNWT" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}">
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Outgoing Qty" DataField="OUTQty" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}">
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Outgoing Net Wgt" DataField="OUTNWT" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}"> 
                    </telerik:GridBoundColumn>
                </Columns>
                 <Columns>
                    <telerik:GridBoundColumn HeaderText="Balance Qty" DataField="CLQTY" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}">
                    </telerik:GridBoundColumn>
                </Columns>
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Balance Net Wgt" DataField="CLNWT" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.####}">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView> 
    </telerik:RadGrid>
    </div>
    </form>
</body>
</html>