<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.iCDSAnalysis.Result" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>iCDSAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">iCDS Analysis </asp:Label>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatDescLbl" runat="server" CssClass="Graytitle">iCDS Container Details </asp:Label><asp:Label
                    ID="DateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="depotLbl" runat="server">Depot</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">                
                <asp:Label ID="depotdescrlbl" runat="server"></asp:Label>
            </td>
        </tr>        
        <tr>
            <td class="style2">
                <asp:Label ID="TypeLbl" runat="server">Type</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="TypeDescrLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
      <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" GridLines="None"
        AutoGenerateColumns="false" GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false"
        FilterType="Classic" AllowSorting="true" BorderStyle="Solid" ExportSettings-UseItemStyles="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting">
       <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="false" Name="Master"
            Width="100%">
            <Columns>
                <telerik:GridBoundColumn HeaderText="Account" DataField="accode" >
                </telerik:GridBoundColumn>
               <telerik:GridBoundColumn HeaderText="MovementType" DataField="src" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="TransactionNo" DataField="srcno" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="SrcTypeDescr" DataField="srctypedescr" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="Depot" DataField="depotcode" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="TransDate" DataField="transdate" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>				
				<telerik:GridBoundColumn HeaderText="TransStatusDescr" DataField="TransStatusDescr" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="ContainerNo" DataField="SKUCode" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="SizeType" DataField="SizeType" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="GradeType" DataField="GoodsDescr" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="Condition" DataField="Condition" >
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="RentalRate" DataField="RentalRate" DataFormatString="{0:#,0.##}">
				<ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="DHCAmount" DataField="DHCAmount" DataFormatString="{0:#,0.##}">
				<ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="DetentionAmount" DataField="DetentionAmount" DataFormatString="{0:#,0.##}">
				<ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="DemurrageAmount" DataField="DemurrageAmount" DataFormatString="{0:#,0.##}">
				<ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>  
				<telerik:GridBoundColumn HeaderText="WashingAmount" DataField="WashingAmount" DataFormatString="{0:#,0.##}">
				<ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="RepairAmount" DataField="RepairAmount" DataFormatString="{0:#,0.##}">
				<ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="totalcollection" DataField="totalcollection" DataFormatString="{0:#,0.##}">
				<ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn> 
				<telerik:GridBoundColumn HeaderText="TransType" DataField="TransType" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Adddate" DataField="adddate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
				<telerik:GridBoundColumn HeaderText="StatusColor" DataField="StatusColor" Display="false" >
                </telerik:GridBoundColumn>	
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
