<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveriesPlanningNotBilled.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanning.DailyDeliveriesPlanningNotBilled" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyDeliveriesPlanningNotBilled</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    <style type="text/css">
        body {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle" colspan="4">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView">
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip" MultiPageID="RadMultiPage2" AutoPostBack="true" OnTabClick="RadTabStrip_TabClick"
                    CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight">
                    <Tabs>
                        <telerik:RadTab Id="SummaryTab" Text="Summary" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="JobsTab" Text="Jobs" Value="50" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" ID="RidesNotBilledRadPageView" Height="700px">
                        <br />
                        <telerik:RadGrid ID="ResultDGRNB" runat="server"
                            AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True" Skin="Office2007" OnNeedDataSource="ResultDGRNB_NeedDataSource"
                            ExportSettings-UseItemStyles="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <ExportSettings UseItemStyles="True">
                            </ExportSettings>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="RidesNotBilledGrid">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="AcCode" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BookingMonth" UniqueName="BookingMonth" SortExpression="BookingMonth" HeaderText="BookingMonth" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Jobs" UniqueName="Jobs" SortExpression="Jobs" HeaderText="Jobs" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="700px" ID="CargoRadPageView">
                        <br />
                        <telerik:RadGrid ID="ResultDGRNB2" runat="server"
                            AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True" Skin="Office2007" OnNeedDataSource="ResultDGRNB_NeedDataSource"
                            ExportSettings-UseItemStyles="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <ExportSettings UseItemStyles="True">
                            </ExportSettings>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

