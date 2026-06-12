<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result2.aspx.cs" Inherits="iWMS.Web.Graphlet.iCMSStoringOrderAnalysis.Result2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>iCMSStoringOrderAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 6%;
        }
    </style>
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
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">iCMS Storing Order Analysis </asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatDescLbl" runat="server" CssClass="Graytitle">Outstanding Storing Order As At </asp:Label><asp:Label
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
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="true" AllowSorting="true" Skin="Office2007" AllowFilteringByColumn="true"
        OnNeedDataSource="ResultDG_NeedDataSource" OnDetailTableDataBind="ResultDG_DetailTableDataBind" ongridexporting="ResultDG_GridExporting">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true" Selecting-AllowRowSelect="true" />
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
            HierarchyLoadMode="Client">
            <DetailTables>
                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" Width="100%" SkinID="Telerik"
                    AllowFilteringByColumn="false" >
                    <Columns>
                        <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" ColumnGroupName="id"
                            SortExpression="id" UniqueName="id" Reorderable="true" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="skucode" AllowFiltering="true"
                            SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ContainerType" DataField="skusizetype" AllowFiltering="true"
                            SortExpression="skusizetype" UniqueName="skusizetype" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CommodityDescr" DataField="lot5" AllowFiltering="true"
                            SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="StoringDate" DataField="lot1" AllowFiltering="true"
                            SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Condition" DataField="lot6" AllowFiltering="true"
                            SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vessel" DataField="lot12" AllowFiltering="true"
                            SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Voyage" DataField="lot13" AllowFiltering="true"
                            SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="RentalRate" DataField="lot7" AllowFiltering="true"
                            SortExpression="lot7" UniqueName="lot7" Reorderable="true" DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Currency" DataField="lot9" AllowFiltering="true"
                            SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TaxType" DataField="lot10" AllowFiltering="true"
                            SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillPeriod" DataField="lot11" AllowFiltering="true"
                            SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                            SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Depot"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="StoringOrderNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rchadddate" SortExpression="rchadddate" HeaderText="StoringOrderAddDate" 
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="SizeType " >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="noofpkg" SortExpression="noofpkg" HeaderText="Total " AllowFiltering="false" 
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G2}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="StoredQty" SortExpression="StoredQty" HeaderText="Stored " AllowFiltering="false" 
                ItemStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OSQty" SortExpression="OSQty" HeaderText="O/S" AllowFiltering="false" 
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G2}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="ReleaseOrderNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="poldescr" SortExpression="poldescr" HeaderText="POL">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="poddescr" SortExpression="poddescr" HeaderText="POD">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
