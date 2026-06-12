<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EqpLocationListingResult.aspx.cs" Inherits="iWMS.Web.Report.EqpLocationListing.EqpLocationListingResult" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head runat="server">
		<title>Equipment Location Listing</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
</head>
<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table width="100%">
				<tr class="graytitle">
					<td>
					  <asp:Label ID="companyName" runat="server" /><br />  
					  <asp:Label ID="reportTitle" runat="server" />
					</td>
					<td align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
			</table>
				
		    <telerik:RadGrid ID="ResultDG" runat="server" GridLines="Both" AutoGenerateColumns="false"
            AllowSorting="False" BorderStyle="Solid" OnNeedDataSource="ResultDG_NeedDataSource"  OnGridExporting="ResultDG_GridExporting"
            Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect = "true" />
            </ClientSettings>
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" >
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn>
                    <HeaderTemplate>
                        S/No
                    </HeaderTemplate>
                    <ItemTemplate>
                    <%#Container.ItemIndex%>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="A" ItemStyle-Wrap="true">
                    <ItemTemplate>
                        <asp:Label ID="type1" Text = '<%#Eval("Type01") %>' runat="server" />
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="B" ItemStyle-Wrap="true">
                    <ItemTemplate>
                        <asp:Label ID="type2" Text= '<%#Eval("Type02") %>' runat="server" />
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="C" ItemStyle-Wrap="true">
                    <ItemTemplate>
                        <asp:Label ID="type3" Text= '<%#Eval("Type03") %>' runat="server" />
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="D" ItemStyle-Wrap="true">
                    <ItemTemplate>
                        <asp:Label ID="type4" Text= '<%#Eval("Type04") %>' runat="server" />
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="E" ItemStyle-Wrap="true">
                    <ItemTemplate>
                        <asp:Label ID="type5" Text= '<%#Eval("Type05") %>' runat="server" />
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
