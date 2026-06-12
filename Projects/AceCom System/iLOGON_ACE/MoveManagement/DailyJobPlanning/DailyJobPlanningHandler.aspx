<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyJobPlanningHandler.aspx.cs" Inherits="iWMS.Web.MoveManagement.DailyJobPlanning.DailyJobPlanningHandler" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <script type="text/javascript">
    function selectAll(invoker) {
        var inputElements = document.getElementsByTagName('input');
        for (var i = 0; i < inputElements.length; i++) {
            var myElement = inputElements[i];
            if (myElement.type === "checkbox") {
                myElement.checked = invoker.checked;
            }
            else {
                myElement.checked = invoker.UnChecked

            }
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div id="div-datagrid" style="height: 100%">
            <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <asp:Label ID="AtvtDescrLbl" runat="server" Text="Available Handlers" CssClass="pagetitle"/>
                        <br />
                        <br />
                    </td> 
                </tr> 
            </table>
            <table id="Table1" border="0" cellspacing="2" cellpadding="2" runat="server">             
                <tr>
                    <td>
                        <asp:Button ID="RemovBtn" class="white" runat="server" OnClick="RemovBtn_Click"
                            Text="Remove" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                    
                    <td>
                        <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click"
                            Text="Save" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
                </table>
            <table id="Table2" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">  
                <tr>
                    <td style="padding-bottom: 5px; width: 700px">
                        <asp:Label ID="Label1" runat="server" Text="Assigned Handlers" CssClass="pagetitle"/>
                    </td>
                    <td style="padding-bottom: 5px; padding-left: 15px;">

                        <asp:Label ID="Label2" runat="server" Text="Available Handlers" CssClass="pagetitle"/>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="width: 680px">

                        <telerik:RadGrid ID="ResultDGAssigned" runat="server" AutoGenerateColumns="false" GridLines="None"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" 
                            AllowFilteringByColumn="false" OnNeedDataSource="ResultDGAssigned_NeedDataSource"  AllowMultipleRowSelection="true" OnItemDataBound="ResultDGAssigned_ItemDataBound" AllowMultiRowSelection="True">
                            <ClientSettings AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true" >
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                                 <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="JPDId" ItemStyle-Height="38px" AlternatingItemStyle-Height="38px">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn  Reorderable="false" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                        UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="checkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Handler" HeaderText="Handler" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <telerik:RadComboBox ID="HandlerList" runat="server" DataTextField="name" DataValueField="id"
                                                DataSource='<%# HandlerDS%>' Skin="WebBlue" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(HandlerDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'
                                                AutoPostBack="true">
                                            </telerik:RadComboBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="StartTiime" HeaderText="StartTiime"
                                        HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="FrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%#TimeDS%>' Skin="WebBlue" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TimeDS,DataBinder.Eval(Container.DataItem, "frexptime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                     <telerik:GridTemplateColumn UniqueName="EndTime" HeaderText="EndTime" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="ToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%#TimeDS%>' Skin="WebBlue" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TimeDS,DataBinder.Eval(Container.DataItem, "toexptime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>                                
                                    <telerik:GridBoundColumn Display="false" DataField="vstatuscolor">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td valign="top" style="padding-left: 15px;width: 400px">
                        <telerik:RadGrid ID="ResultDGUnAssigned" runat="server" AutoGenerateColumns="false" GridLines="None"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" OnRowDrop="ResultDGAssigned_RowDrop"
                          UseAccessibleHeader="true"  AllowFilteringByColumn="false" OnNeedDataSource="ResultDGUnAssigned_NeedDataSource"  AllowMultiRowSelection="true" >
                               <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true" >
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" >
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                   <telerik:GridBoundColumn Display="false" DataField="Id">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Name" SortExpression="Name" HeaderText="Handler"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="alias" SortExpression="alias" HeaderText="Alias"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        </div>
    </form>
</body>
</html>

