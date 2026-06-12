<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InLotValueLog.aspx.cs" Inherits="iWMS.Web.Audit.InLotValue.IntLotValueLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InLotValueLog</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
  <form id="form1" method="post" runat="server">
     <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td class="pagetitle">&nbsp;</td>
				</tr>
		  </table>
			<br>
      <div style="HEIGHT: 80%" id="div-datagrid">
      <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
        AllowFilteringByColumn="true"  OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
         <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                         <HeaderTemplate>
								S/N
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.ItemIndex+1%>
							</ItemTemplate>
							</telerik:GridTemplateColumn>                  
                            <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type" AllowFiltering="false" AllowSorting="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="category" SortExpression="category" HeaderText="Category" AllowFiltering="false" AllowSorting="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="beforevalue" SortExpression="beforevalue" HeaderText="BeforeValue" AllowFiltering="false" AllowSorting="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="aftervalue" SortExpression="aftervalue" HeaderText="AfterValue" AllowFiltering="false" AllowSorting="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tablename" SortExpression="tablename" HeaderText="TableName" AllowFiltering="false" AllowSorting="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks" AllowFiltering="false" AllowSorting="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                         </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
   
    </form>
</body>
</html>
