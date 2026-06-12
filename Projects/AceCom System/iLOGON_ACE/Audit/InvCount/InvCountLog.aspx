<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountLog.aspx.cs" Inherits="iWMS.Web.Audit.InvCount.InvCountLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InvCountLog</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
    <div style="height: 80%" id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" 
            OnPageIndexChanged="ResultDG_PageIndexChanged">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn>
					  <HeaderTemplate>
							S/N
						</HeaderTemplate>
						<ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
						</ItemTemplate>
					</telerik:GridTemplateColumn>
					<telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
						<HeaderStyle Wrap="False"></HeaderStyle>
						<ItemStyle Wrap="False"></ItemStyle>
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
						<HeaderStyle Wrap="False"></HeaderStyle>
						<ItemStyle Wrap="False"></ItemStyle>
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
						<HeaderStyle Wrap="False"></HeaderStyle>
						<ItemStyle Wrap="False"></ItemStyle>
					</telerik:GridBoundColumn>
				</Columns>
			</MasterTableView>
		</telerik:RadGrid>
    </div>
    </form>
</body>
</html>
