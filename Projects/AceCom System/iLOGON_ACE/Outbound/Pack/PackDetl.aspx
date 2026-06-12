<%@ Page Language="c#" CodeBehind="PackDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.PackDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PackDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
   <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>    
    <body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />  
          <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="left"><br />
                    <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Class="white" />
                </td>
                 <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>  
        <br />
    <div id="div-datagrid" style="height: 60%">
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
        AllowFilteringByColumn="true"  OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
         <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" AllowSorting ="false">
                 <HeaderTemplate >
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="pkid" SortExpression="pkid" HeaderText="Pack#" AllowFiltering="true" AllowSorting ="false"  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="ref" SortExpression="ref" HeaderText="Ref#"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="packeduomqty" SortExpression="packeduomqty" HeaderText="Qty"  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter ="true"
                    DataFormatString="{0:0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Part No"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="serialno" SortExpression="serialno" HeaderText="Serial Number"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="pergradedescr" SortExpression="pergradedescr" HeaderText="PerGrade"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                         ItemStyle-Wrap="false">
                         </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"  CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                         </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>   
    </form>
</body>
</html>
