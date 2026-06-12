<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundFreightReceiveHead.aspx.cs" Inherits="iWMS.Web.Inbound.InboundFreightReceive.InboundFreightReceiveHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InboundFreightReceiveHead</title>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div style="height: 92%" id="div-datagrid">
                    <table cellspacing="2" cellspacing="2">
                        <tr>
                            <td align="left" valign="top" style="padding-top: 8px; padding-bottom: 4px">
                                <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click"
                                    Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td align="right">&nbsp;&nbsp;
                                <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                            </td>
                            <td align="right">
                                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                            </td>
                            <td>
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
                        <GroupingSettings CaseSensitive="false" />
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="RCId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="250px">
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn Display="false" DataField="acid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="isid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="Account"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SiteCode" SortExpression="SiteCode" HeaderText="Site"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ReceiptNo" SortExpression="ReceiptNo" HeaderText="Receipt No"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RCId" SortExpression="RCId" HeaderText="ID" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OrderNo" SortExpression="OrderNo" HeaderText="Order No" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ContainerNo" SortExpression="ContainerNo" HeaderText="Container No" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SealNo" SortExpression="SealNo" HeaderText="Seal No" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Vessel" SortExpression="Vessel" HeaderText="Vessel" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Voyage" SortExpression="Voyage" HeaderText="Voyage" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ETA" SortExpression="ETA" HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy HH:MM}" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="POL" SortExpression="POL" HeaderText="POL" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="HBL" SortExpression="HBL" HeaderText="HBL" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="Status" DataField="Status" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="StatusColourCode" DataField="StatusColourCode" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CreatedOn" SortExpression="CreatedOn" HeaderText="Created On" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
