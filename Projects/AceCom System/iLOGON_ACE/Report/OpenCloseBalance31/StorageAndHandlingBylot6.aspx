<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorageAndHandlingBylot6.aspx.cs" Inherits="iWMS.Web.Report.OpenCloseBalance.StorageAndHandlingBylot6" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Open Close Report by Condition's Format 1</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
    
    </head>
<body  bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
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
                        height="20" runat="server" /></a>
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
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Open Close Balance by Condition Report</asp:Label>
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
        <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="false" UseAccessibleHeader="True"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="RadGrid1_GridExporting">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="From" DataField="frdate" UniqueName="Frdate" DataFormatString="{0:dd/MMM/yyyy}" >
                    </telerik:GridBoundColumn>
                                    
                    <telerik:GridBoundColumn HeaderText="To" DataField="todate" UniqueName="Todate" DataFormatString="{0:dd/MMM/yyyy}" >
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" UniqueName="SKUCode" >                   
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="SKUDescr" DataField="skudescr" UniqueName="SKUDescr" >
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="Lot No" DataField="lot4" DataFormatString="{0:N}" >
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="OPQTY" DataField="OPQTY" ItemStyle-HorizontalAlign="Right" >
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="Opening Net Wgt" DataField="OPNWT" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="INQty" DataField="INQty" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn HeaderText="INNWT" DataField="INNWT" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="OUTQty" DataField="OUTQty" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn HeaderText="OUTNWT" DataField="OUTNWT" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="CLQTY" DataField="CLQTY" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn HeaderText="CLNWT" DataField="CLNWT" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="OPNWT" DataField="OPNWT" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>                
                    
                    <telerik:GridBoundColumn HeaderText="StorageQty" DataField="StorageQty" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="StorageWt" DataField="StorageWt" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView> 
    </telerik:RadGrid>
    </div>
    <br />
    <div style="height: 90% ; width : 50%" id="div1">
        <telerik:RadGrid ID="ResultDG2" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007" OnItemDataBound="ResultDG2_ItemDataBound">
                    
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>            
            <MasterTableView AllowMultiColumnSorting="true" >
                <Columns>
                    
                    <telerik:GridBoundColumn HeaderText="FrSite" DataField="FrSite" UniqueName="FrSite"  >
                    <HeaderStyle Wrap="true" />
                    <ItemStyle Wrap="true"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToSite" DataField="ToSite" UniqueName="ToSite"  >
                    <HeaderStyle Wrap="true" />
                    <ItemStyle Wrap="true"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FrTransNo" DataField="frtransno" UniqueName="frTransNo" >                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToTransNo" DataField="totransno" UniqueName="toTransNo" >                   
                    </telerik:GridBoundColumn>                
                    <telerik:GridBoundColumn HeaderText="TransDate" DataField="transdate" UniqueName="transdate" DataFormatString="{0:dd/MMM/yyyy}" >                    
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" UniqueName="Remarks" >
                    <HeaderStyle Wrap="true" />
                    <ItemStyle Wrap="true"></ItemStyle>
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText=">10MT" DataField=">10MT"  >                  
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="<=10MT" DataField="<=10MT"  >                  
                    </telerik:GridBoundColumn>
                </Columns>              
                
            </MasterTableView> 
    </telerik:RadGrid>
    </div>
    </form>
</body>
</html>