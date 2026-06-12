<%@ Page Language="c#" CodeBehind="PTHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.PickTicket.PTHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PickHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/checkbox.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script type="text/javascript">
        function OnClientItemBlurMenu(sender, args) {
            sender.close(true);
        }
        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
    </script>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <style type="text/css">
        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>

<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_Click">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PickOutstanding" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PickInProgress" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="600px" ID="MainInfoRadPageView">
                <br />
                <table cellspacing="2">
                    <tr>
                        <td>
                            <asp:Button ID="CheckInBtn" runat="server" Text="Check-In" OnClick="CheckInBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="white" ToolTip="Check-In?" />&nbsp;
                      
                        </td>
                        <td>
                            <asp:Button ID="CheckOutBtn" runat="server" Text="Check-Out" OnClick="CheckOutBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="white" ToolTip="Check-Out?" />&nbsp;
                    
                        </td>
                        <td>
                            <asp:Button ID="PickTicketBtn" runat="server" Text="Pick Ticket" OnClick="PickTicketBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="Blue" ToolTip="PickTicket?" />&nbsp;
                    
                        </td>
                    </tr>
                </table>
                <br />
                <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:ImageButton runat="server" Visible="True" ID="DetailBtn" ImageUrl="../../image/detail.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Pick Ticket Detail"
                                            OnClick="DetailBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="True" ID="PrintBtn" ImageUrl="../../image/print.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Pick Ticket Print"
                                            OnClientClick="return confirm('Confirm print?')" OnClick="PrintBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="false" ID="CarouselBtn" ImageUrl="../../image/lightning.png"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="SendToCarousel" OnClientClick="return confirm('Confirm Send to Carousel?')"
                                            OnClick="CarouselBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="false" ID="DeleteBtn" ImageUrl="../../image/bin.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete Pick Ticket"
                                            OnClick="DeleteBtn_Click" OnClientClick="return confirm('Confirm delete?')" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="PTNo" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="IssueNo" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="zonedescr" SortExpression="zonedescr" HeaderText="Zone" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="NoOfOrders" SortExpression="NoOfOrders" HeaderText="NoOfOrders" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ishstatusdescr" SortExpression="statusdescr" HeaderText="IssueStatus" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="copy" SortExpression="copy" HeaderText="Copy" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pickercode" SortExpression="pickercode" HeaderText="Picker" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="startdate" SortExpression="startdate" HeaderText="Start Date" AllowFiltering="false"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="enddate" SortExpression="enddate" HeaderText="End Date" AllowFiltering="false"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" AllowFiltering="false"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" AllowFiltering="false"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false" AllowFiltering="false"
                                    HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="acid" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="PickOutstandingRadView" Height="400px" ContentUrl="PickOutstanding.aspx" />
            <telerik:RadPageView runat="server" ID="PickInProgressRadView" Height="400px" ContentUrl="PickInProgress.aspx" />
            <telerik:RadPageView runat="server" ID="LogRadPageView" Height="400px"/>
        </telerik:RadMultiPage>

        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="350px" Height="350px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
