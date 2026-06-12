<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderFabricationHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrderFabrication.DistributionSalesOrderFabricationHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DistributionSalesOrderFabricationHead</title>
     <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                    OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                  <table>
                        <tr>
                            <td>
                                <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                            </td>
                        </tr>
                    </table>                               
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SalesOrderFabricationId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Edit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>                           
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>                         
                            <telerik:GridBoundColumn DataField="SalesOrderFabricationNo" UniqueName="SalesOrderFabricationNo" SortExpression="SalesOrderFabricationNo" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="SalesOrderFabricationNo">
                            </telerik:GridBoundColumn>    
                            
                             <telerik:GridBoundColumn DataField="SalesOrderNo" UniqueName="SalesOrderNo" SortExpression="SalesOrderNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="SalesOrderNo">
                            </telerik:GridBoundColumn>    
                                                    
                            <telerik:GridBoundColumn DataField="SalesOrderFabricationDate" UniqueName="SalesOrderFabricationDate" SortExpression="SalesOrderFabricationDate"
                                HeaderText="SalesOrderFabricationDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>        
                             <telerik:GridBoundColumn DataField="CustomerCode" UniqueName="CustomerCode" SortExpression="CustomerCode" AllowFiltering="false"
                                HeaderText="CustomerCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" AllowFiltering="false"
                                HeaderText="CustomerName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="SalesOrderFabricationStatusDescr" UniqueName="SalesOrderFabricationStatusDescr" SortExpression="SalesOrderFabricationStatusDescr" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>                                                                                   
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="SalesOrderFabricationStatus" Display="false">
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="SalesOrderFabricationId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderFabricationNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn> 
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
     <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        // Instantiate our BusyBox object        
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBox.html");
    </script>
</body>
</html>
