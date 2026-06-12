<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReleaseOrderHead.aspx.cs"
    Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrderHead" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReleaseOrderHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>

    <style type="text/css">
        body
        {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="DraftTab" Text="Draft" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SubmittedTab" Text="Submitted" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AcceptedTab" Text="Accepted" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CompletedTab" Text="Completed" Value="300" runat="server">
                </telerik:RadTab> 
                 <telerik:RadTab Id="RejectedTab" Text="Rejected" Value="400" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Id="CancelledTab" Text="Cancelled" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="600" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
    <asp:Button ID="SubmitBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id)"
        Text="Submit" OnClick="SubmitBtn_Click" UseSubmitBehavior="false" Enabled="false" />
    <br /><br />

    <div id="div-datagrid" style="height: 98%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" 
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Scrolling UseStaticHeaders="true" AllowScroll="true" ScrollHeight="550px" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                     <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ReleaseOrderEditbtn" ImageUrl="../../image/pencil.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Release Order"
                                            OnClick="ReleaseOrderEditbtn_Click" CausesValidation="False"></asp:ImageButton>

                            <asp:ImageButton runat="server" Visible="True" ID="ReleaseOrderDeletebtn" ImageUrl="../../image/deletealllines2.png"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="DeleteAllSKU"
                                            OnClick="ReleaseOrderDeletebtn_Click"
                                             OnClientClick="return confirm('Delete all SKU Line(s) that are 10-Open?');"
                                 CausesValidation="False"></asp:ImageButton>

                             <asp:ImageButton runat="server" Visible="True" ID="ReleaseOrderCancelbtn" ImageUrl="../../image/canceldoc.png"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Cancel Release Order"
                                            OnClick="ReleaseOrderCancelbtn_Click" 
                                  OnClientClick="return confirm('Confirm Cancel Order?');"
                                 CausesValidation="False"></asp:ImageButton>                            
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReleaseOrderNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustRef" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected"
                        DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="Name" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr"
                        HeaderText="Priority" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustRefDate" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Consignee" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr2" SortExpression="shaddr2" HeaderText="Addr2" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr3" SortExpression="shaddr3" HeaderText="Addr3" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr4" SortExpression="shaddr4" HeaderText="Addr4" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shcitycode" SortExpression="shcitycode" HeaderText="City" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shcountrycode" SortExpression="shcountrycode"
                        HeaderText="Country">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="700px" ID="SubmittedRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AcceptedRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="CompletedRadPageView">
            </telerik:RadPageView>  
             <telerik:RadPageView runat="server" Height="700px" ID="RejectedRadPageView">
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="700px" ID="CancelledRadPageView">
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="700px" ID="DashboardRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
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

        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
