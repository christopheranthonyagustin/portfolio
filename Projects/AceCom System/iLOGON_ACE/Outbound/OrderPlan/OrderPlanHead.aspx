<%@ Page Language="c#" CodeBehind="OrderPlanHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.OrderPlan.OrderPlanHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
    <script language="javascript" type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <%--Create New AjaxLoading Panel--%>
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Metro" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500"></telerik:RadAjaxLoadingPanel>
        <%--We want to show the Loading Panel onto the Result Grid When we click the Button--%>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableAJAX="true">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="AllocateBtn">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ResultDG" LoadingPanelID="LoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table cellpadding="7" cellspacing="2">
                    <tr>
                        <td>
                            <asp:Button ID="AllocateBtn" class="white" runat="server" OnClick="AllocateBtn_Click"
                                Text="Allocate" UseSubmitBehavior="false" />
                            &nbsp;
                    <asp:Button ID="PickTixBtn" class="blue" runat="server" OnClick="PickTixBtn_Click"
                        Text="Pick Ticket" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                    <asp:Button ID="BookTransportBtn" CssClass="LongLabelGreen" runat="server" OnClick="BookTransportBtn_Click" Enabled="false"
                        Text="&nbsp;&nbsp;&nbsp;Book&nbsp;&nbsp;&nbsp; Transport" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label Style="z-index: 0" ID="MessageLb2" runat="server" CssClass="errorLabel"
                                Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:Label Style="z-index: 0" ID="Label2" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                    EnableLinqExpressions="false" AllowPaging="true"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50"
                        DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="GoodsIssueEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton ID="AddCandidates" runat="server" Visible="False" ImageUrl="../../image/add.png" ToolTip="Add candidates"
                                        Width="15" Height="15" AlternateText="Add candidates" BackColor="Transparent" OnClick="AddIcon_Click"
                                        BorderWidth="0"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton ID="Delete" runat="server" Visible="False" ImageUrl="../../image/deleted.png" ToolTip="Delete"
                                        Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteIcon_Click"
                                        BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="acid" Display="false"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="BookTransportDone" AllowFiltering="false" HeaderText="&nbsp;&nbsp; Book &nbsp; <br/>Transport" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Order PlanNo"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="sitecode" Display="False"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="refno" SortExpression="refno" HeaderText="RefNo"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="OPHStageAtLocCode" SortExpression="OPHStageAtLocCode" HeaderText="StageAtLocCode"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="NoOfOrders" SortExpression="NoOfOrders" HeaderText="NoOfOrders"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statuscolor" Display="False"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="status" Display="False"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehicleNo"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="picktoclear" SortExpression="picktoclear" HeaderText="Pick-To-Clear"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
