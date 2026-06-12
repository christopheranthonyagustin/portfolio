<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionJobOrderHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionJobOrder.DistributionJobOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Job Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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

    <script type="text/javascript">
        function OnClientItemBlurMenu(sender, args) {
            setTimeout(function () {
                sender.close(true);
            }, 200);
        }

        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
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
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobOrderId">
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
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderNo" UniqueName="JobOrderNo" SortExpression="JobOrderNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="JobOrderNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ProjectNumber" UniqueName="ProjectNumber" SortExpression="ProjectNumber" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ProjectNumber">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CustomerReference" UniqueName="CustomerReference" SortExpression="CustomerReference" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="CustomerReference">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SalesMan" UniqueName="SalesMan" SortExpression="SalesMan" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="SalesMan">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="OrderDate" UniqueName="OrderDate" SortExpression="OrderDate"
                                HeaderText="OrderDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="OrderByName" UniqueName="OrderByName" SortExpression="OrderByName" AllowFiltering="true"
                                HeaderText="OrderByName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ContactNumber" UniqueName="ContactNumber" SortExpression="ContactNumber" AllowFiltering="true"
                                HeaderText="ContactNumber" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ContactEmail" UniqueName="ContactEmail" SortExpression="ContactEmail" AllowFiltering="true"
                                HeaderText="ContactEmail" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SiteAddress" UniqueName="SiteAddress" SortExpression="SiteAddress" AllowFiltering="true"
                                HeaderText="SiteAddress" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FromExpectedDate" UniqueName="FromExpectedDate" SortExpression="FromExpectedDate"
                                HeaderText="FromExpectedDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ToExpectedDate" UniqueName="ToExpectedDate" SortExpression="ToExpectedDate"
                                HeaderText="ToExpectedDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FromActualDate" UniqueName="FromActualDate" SortExpression="FromActualDate"
                                HeaderText="FromActualDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ToActualDate" UniqueName="ToActualDate" SortExpression="ToActualDate"
                                HeaderText="ToActualDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Remarks1" UniqueName="Remarks1" SortExpression="Remarks1" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Remarks1">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Remarks2" UniqueName="Remarks2" SortExpression="Remarks2" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Remarks2">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderStatusDescr" UniqueName="JobOrderStatusDescr" SortExpression="JobOrderStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderNo" Display="false">
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
