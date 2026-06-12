<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result6.aspx.cs" Inherits="iWMS.Web.Report.iCMSInventoryAsAt.Result6" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head runat="server">
    <title>iCMSInventoryAsAt</title>
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
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">iCMS Inventory As At </asp:Label><asp:Label
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
                <asp:Label ID="deLbl" runat="server">Depot</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="DepotLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="sizetypeLbl" runat="server">SizeType</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="sizetypeDescrLbl" runat="server"></asp:Label>
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
                <asp:Label ID="FormatDescLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" GroupPanelPosition="Top"
        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="true" CellPadding="2" UseAccessibleHeader="True"
        ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
        <MasterTableView AllowMultiColumnSorting="true">
            <Columns>
                <telerik:GridTemplateColumn AllowFiltering="false">
                    <HeaderTemplate>
                        S/No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex + 1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account" />
                <telerik:GridBoundColumn DataField="ContainerNo" SortExpression="ContainerNo" HeaderText="ContainerNo" />
                <telerik:GridBoundColumn DataField="SizeTypeDescr" SortExpression="SizeTypeDescr" HeaderText="SizeType" />
                <telerik:GridBoundColumn DataField="Condition" SortExpression="Condition" HeaderText="Condition"/>
              <%--  <telerik:GridBoundColumn DataField="SKUGrossWt" SortExpression="SKUGrossWt" HeaderText="GrossWt" DataFormatString="{0:#,0.##}" />--%>
                <telerik:GridBoundColumn DataField="Depot" SortExpression="Depot" HeaderText="DepotCode" />
                <telerik:GridBoundColumn DataField="CustomerRef" SortExpression="CustomerRef"
                    HeaderText="CustomerRef" />
                <telerik:GridBoundColumn DataField="StoringDate" SortExpression="StoringDate" HeaderText="StoringDate"
                    DataFormatString="{0:dd/MMM/yyyy}" />
                <telerik:GridBoundColumn DataField="EmptyLaden" SortExpression="EmptyLaden" HeaderText="EmptyLaden"/>
                <telerik:GridBoundColumn DataField="GradeType" SortExpression="GradeType" HeaderText="GradeType"/>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
