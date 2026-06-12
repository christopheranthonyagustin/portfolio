<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAnalysisManagement.aspx.cs" Inherits="iWMS.Web.Graphlet.DashboardAnalysis.DashboardAnalysisManagement" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Management</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style2 {
            width: 125px;
        }

        .paddingBottom {
            margin-bottom: 1.2em;
        }

        .togglefullscreenbtn {
            margin-left: 1.2em;
        }

        #infotable {
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse; 
            border: 1px solid #d0d7e5;
        }
        #infotable td {
            border: 1px solid #d0d7e5;
            padding: 8px;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
        function ToggleFullscreenBtn_OnClick() {
            // Hide/Unhide the tabs
            var radTabStrip = window.frameElement.parentElement.parentElement.parentElement.querySelector('#RadTabStrip1');
            if (radTabStrip.style.display === 'none') {
                radTabStrip.setAttribute('style', 'display: block');

                // Unhide the text "Dashboard Analysis"
                if (window.parent.parent.document.body.tagName.toLowerCase() === 'frameset')
                    window.parent.parent.document.body.setAttribute('rows', '25,*')
            } else {
                radTabStrip.setAttribute('style', 'display: none');

                // Hide the text "Dashboard Analysis"
                // Ref: https://stackoverflow.com/questions/42843642/how-to-get-the-parent-iframes-parent-iframe-using-javascript
                if (window.parent.parent.document.body.tagName.toLowerCase() === 'frameset')
                    window.parent.parent.document.body.setAttribute('rows', '0,*')
            }
        }

        document.onkeydown = function (event) {
            if (event.keyCode == 121 && document.getElementById('<%= ToggleFullscreenBtn.ClientID%>')) {
                // user press F10
                // Toggle Fullscreen mode
                document.getElementById('<%= ToggleFullscreenBtn.ClientID%>').click();
            }
        }
    </script>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" CssClass="paddingBottom" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <div style="margin-left: 8px; margin-right: 8px; margin-bottom: 8px">
                                    <table border="0" cellpadding="0" cellspacing="2" id="table1" runat="server" visible="true" height="100%">
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Button ID="PrevBtn" CssClass="white" runat="server" OnClick="PrevBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="formatLbl" runat="server" Text="Format" /><br />
                                                <telerik:RadComboBox ID="FormatList" runat="server" Width="155px" AutoPostBack="true"
                                                    RenderMode="Lightweight" Filter="Contains" CausesValidation="false" Skin="WebBlue"
                                                    AllowCustomText="false" DropDownWidth="155px" OnSelectedIndexChanged="Format_OnComboBoxSelectedIndexChanged">
                                                </telerik:RadComboBox>
                                            </td>
                                            <td>
                                                <br />
                                                &nbsp;
                                                <asp:Button ID="NextBtn" CssClass="white" runat="server" OnClick="NextBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            </td>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="refreshLbl" runat="server" Text="RefreshEvery" /><br />
                                                <telerik:RadDropDownList ID="refreshDdl" runat="server" DropDownHeight="100px" Width="150px"
                                                    Skin="WebBlue" DropDownWidth="150px" AutoPostBack="true" OnSelectedIndexChanged="refreshDdl_SelectedIndexChanged">
                                                    <%-- <Items>
                                                        <telerik:DropDownListItem Text="" Value="" Selected="true" />
                                                        <telerik:DropDownListItem Text="15 seconds" Value="15" />
                                                        <telerik:DropDownListItem Text="30 seconds" Value="30" />
                                                        <telerik:DropDownListItem Text="1 minute" Value="60" />
                                                        <telerik:DropDownListItem Text="2 minute" Value="120" />
                                                    </Items> --%>
                                                </telerik:RadDropDownList>
                                                <asp:Timer ID="Refreshtmr" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
                                            </td>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;                  
                                            </td>
                                            <td>
                                                <asp:Label ID="AutoRefreshLbl" runat="server" Text="AutoRefresh" /><br />
                                                <input type="checkbox" runat="server" id="RefreshCbx" checked="checked" />
                                            </td>
                                        </tr>
                                    </table>

                                    <asp:Panel runat="server" ID="WMSManagement13Panel" Visible="false">
                                        <table>
                                            <tr>
                                                <td>
                                                    <iWMS:iForm ID="formCtl_format13" runat="server" Visible="false"></iWMS:iForm>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;<asp:Button ID="RunBtn" class="white" runat="server" OnClick="compile_ClickBtn" Text="Run Now"
                                                    UseSubmitBehavior="true" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </div>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
        <br />

        <table id="resultTable" runat="server" cellspacing="0" cellpadding="0" width="100%" height="100%"
                border="0" visible="false">
                <tr>
                    <td colspan="3" class="style2">
                        <asp:Label ID="GridLbl1" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
                        <asp:Button ID="ToggleFullscreenBtn" runat="server" CssClass="LongLabelWhite togglefullscreenbtn" OnClientClick="ToggleFullscreenBtn_OnClick()" OnClick="ToggleFullscreen_Click" Text="Fullscreen (F10)" UseSubmitBehavior="false" />

                        <asp:Panel runat="server" ID="WMSManagement13ResultPnl">
                            <br />
                            <% if (ViewState["InfoData"] != null && ((System.Data.DataTable)ViewState["InfoData"]).Rows.Count > 0)
                                { %>
                            <table style="font-size: 16px" id="infotable">
                                <tr>
                                    <td><b>Total Jobs</b></td>
                                    <td><%= ((System.Data.DataTable)ViewState["InfoData"]).Rows[0]["totalJobs"] %></td>
                                    <% foreach (System.Data.DataRow item in ((System.Data.DataTable)ViewState["InfoData"]).Rows)
                                        { %>
                                    <td><b><%= item["status"] %></b></td>
                                    <td><%= item["totalStatus"] %></td>
                                    <% } %>
                                </tr>
                            </table>
                            <% } %>
                            <br />
                        </asp:Panel>

                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" AllowSorting="True" OnColumnCreated="ResultDG_ColumnCreated"
                            BorderStyle="Solid" Skin="Office2007" onsorting="GridView1_Sorting" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound"
                            OnPageIndexChanged="ResultDG_PageIndexChanged" OnNeedDataSource="ResultDG_NeedDataSource">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true">
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true" Font-Size="16px"></AlternatingItemStyle>
                            <ItemStyle Wrap="true" Font-Size="16px"></ItemStyle>
                            <HeaderStyle Wrap="false" Font-Bold="true" Width="120px" Font-Size="16px"></HeaderStyle>
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <MasterTableView AllowMultiColumnSorting="false" PageSize="20"></MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td>&nbsp;
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        <br />
    </form>
</body>
</html>