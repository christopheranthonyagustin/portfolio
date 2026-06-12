<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrRepairHistoryList.aspx.cs"
    Inherits="iWMS.Web.Master.Container.CtnrRepairHistoryList" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html >
<head runat="server">
    <title>Repair History</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <div id="div-radgrid">
        <telerik:radgrid id="ResultDG" runat="server" autogeneratecolumns="false" gridlines="None"
            onneeddatasource="ResultDG_NeedDataSource" allowsorting="true" allowfilteringbycolumn="true"
            skin="Office2007" onitemdatabound="ResultDG_ItemDataBound">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
              <MasterTableView AllowMultiColumnSorting="true" >
                <Columns>                       
                    <telerik:GridBoundColumn HeaderText="Date" DataField="exdate1" SortExpression="exdate1" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EOR No." DataField="exref2" AllowFiltering="true"
                        ColumnGroupName="exref2" SortExpression="exref2" UniqueName="exref2">
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn HeaderText="Currency" DataField="currency" SortExpression="currency"  AllowFiltering="true" UniqueName="currency">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fcamt" SortExpression="fcamt" HeaderText="Amount"
                    AllowFiltering="true" UniqueName="fcamt" DataFormatString="{0:N}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Depot" DataField="vdname" SortExpression="vdname"  AllowFiltering="true" UniqueName="vdname">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remark" DataField="cbhrem1" SortExpression="cbhrem1"  AllowFiltering="true" UniqueName="cbhrem1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Date Of Approval" DataField="apprvdate" SortExpression="apprvdate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>  
                </Columns>
            </MasterTableView>
        </telerik:radgrid>
    </div>
    </form>
</body>
</html>
