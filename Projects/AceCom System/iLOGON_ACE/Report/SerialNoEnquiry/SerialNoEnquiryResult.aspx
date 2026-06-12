<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SerialNoEnquiryResult.aspx.cs"
    Inherits="iWMS.Web.Report.SerialNoEnquiry.SerialNoEnquiryResult" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>SerialNoEnquiryResult</title>
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
    <table>
        <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                Serial No. Enquiries
            </td>
            <td align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="OutputLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" 
            AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            >
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU code" SortExpression="SKU" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" HeaderText="SKU Descr" SortExpression="skudescr" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SerialNo" HeaderText="SerialNo" SortExpression="SerialNo" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Source" HeaderText="Source" SortExpression="Source" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Date" HeaderText="Date" SortExpression="Date" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Parter" HeaderText="Parter" SortExpression="Parter" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno1" HeaderText="TUNO1" SortExpression="TUNO1" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno2" HeaderText="TUNO2" SortExpression="TUNO2" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loccode" HeaderText="Location" SortExpression="loccode" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="QTY" HeaderText="Qty" SortExpression="Qty" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            </telerik:RadGrid>
                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" 
            AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound"
            >
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU code" SortExpression="SKU" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" HeaderText="SKU Descr" SortExpression="skudescr" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SerialNo" HeaderText="SerialNo" SortExpression="SerialNo" ItemStyle-Wrap="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="QTY" HeaderText="QTY" SortExpression="QTY" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            </telerik:RadGrid>
            </td>
        </tr>
    </table>
    <div style="height: 90%" id="div-datagrid">
    </div>
    </form>
</body>
</html>
