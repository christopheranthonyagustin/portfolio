<%@ Page Language="c#" CodeBehind="IssueDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.OrderPlan.IssueDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
   
    <body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="IdLbl" runat="server"></asp:Label></div>
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging ="true"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" 
                OnItemDataBound="ResultDG_ItemDataBound" >
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50"  
                DataKeyNames="id" >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn Display = "false"  >
                       <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                     </telerik:GridTemplateColumn>
                      <telerik:GridBoundColumn DataField="isid" SortExpression="isid" HeaderText="Issue#"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="exline" SortExpression="exline" HeaderText="Line#" AllowFiltering ="false" 
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="skuid" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="status" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="expecteduomqty" SortExpression="expecteduomqty" HeaderText="Expected"
                    DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="allocateduomqty" SortExpression="allocateduomqty" HeaderText="Allocated"
                    DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="pickeduomqty" SortExpression="pickeduomqty" HeaderText="Picked"
                    DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="packeduomqty" SortExpression="packeduomqty" HeaderText="Packed"
                    DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="shippeduomqty" SortExpression="shippeduomqty" HeaderText="Shipped"
                    DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                           <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot 1" DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot 2" DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot 3" DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot 4"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot 5"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot 6"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot 7"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot 8"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="shelflife" SortExpression="shelflife" HeaderText="Shelf Life"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn> 
                         <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                         <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        
                         <telerik:GridBoundColumn  DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        
                         <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
    </form>
</body>
</html>
