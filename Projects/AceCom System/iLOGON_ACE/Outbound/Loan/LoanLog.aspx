<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanLog.aspx.cs" Inherits="iWMS.Web.Outbound.Loan.LoanLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>LoanLog</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 80%" id="div-datagrid">

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            Width="107px">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
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
                    <telerik:GridBoundColumn HeaderText="ID" DataField="Id" AllowFiltering="true"
                        ColumnGroupName="id" SortExpression="id" UniqueName="Id" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="LoanID" DataField="LoanId" AllowFiltering="true"
                        ColumnGroupName="LoanId" SortExpression="LoanId" UniqueName="LoanId" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="type" DataField="type" AllowFiltering="true"
                        ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="remarks" DataField="remarks" AllowFiltering="true"
                        ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="Adddate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="AddUser" Reorderable="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </div>
    </div>
    </form>
</body>
</html>
