<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TunoHead.aspx.cs" Inherits="iWMS.Web.Master.TUNO.TunoHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>TunoHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/CastleBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>   
    
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
<form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <p>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </p>     
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn = "true"
            AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007"
            OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
        <GroupingSettings CaseSensitive="false" /> 
         <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>            
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" >
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>  
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>                           
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn> 
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>                  
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="Tuno1"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>    
                    <telerik:GridBoundColumn DataField="reasoncode" SortExpression="reasoncode" HeaderText="Reasoncode"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="length" SortExpression="length" HeaderText="Length"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="width" SortExpression="width" HeaderText="Width"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn DataField="height" SortExpression="height" HeaderText="Height"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>    
                    <telerik:GridBoundColumn DataField="wt" SortExpression="wt" HeaderText="WT"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn DataField="netwt" SortExpression="netwt" HeaderText="NetWT"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>    
                    <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>    
    </form>
</body>
</html>
