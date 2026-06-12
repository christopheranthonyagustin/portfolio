<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerMonitorEXPSummary.aspx.cs" Inherits="iWMS.Web.Job.ContainerMonitor.ContainerMonitorEXPSummary" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Monitor EXPSummary</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function IMPOnClientClose(sender, args) {
                var IMPmasterTable = $find("<%= IMPResultDG.ClientID %>").get_masterTableView();
                IMPmasterTable.rebind();   
            }

            function EXPOnClientClose(sender, args) {
                var EXPmasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                EXPmasterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap {
            white-space: normal;
            width: 100px;
            height: auto;
            text-align: center;
        }

        .RadPanelBar div.rpSlide,
        .RadPanelBar ul.rpGroup,
        .RadPanelBar li.rpItem  {
            overflow: visible;            
        }

        html .RadMenu {
            text-decoration: none;
            text-align:left;
            line-height:16px;
        }

        html .rmGroup .rmItem a.rmLink {
            background-color: #99c2ff !important;
            text-decoration: none;
            line-height:20px;
        }

        html .RadMenu .rmGroup .rmItem a.rmLink:hover {
            background-color: #ebebe0 !important;
            font-weight: bold;
        }

        .rmItem:hover {
            background-color: white !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Label ID="lblProcessID" runat="server" Visible="False" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false"
            AutoPostBack="true" OnTabClick="RadTabStrip1_Click">
            <Tabs>
                <telerik:RadTab ID="EXPSummary" Text="EXPSummary" readonly="readonly" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="EXPContainer" Text="EXPContainer" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="IMPSummary" Text="IMPSummary" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="IMPContainer" Text="IMPContainer" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="30%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <br />
                                                    <asp:Button ID="ViewContainersBtn" CssClass="LongLabelWhite" runat="server" OnClick="EXPViewContainersBtn_Click"
                                                        Text="View Containers" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>                                               
 						                        <td></br>
                                                    <asp:Button ID="EditBtn" runat="server" Text="Edit" CausesValidation="false" ToolTip="Edit" CssClass="white" OnClick="EditBtn_Click" />
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                    <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="RunBtn_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr style="height: 10px">
                                            </tr>
                                            <tr>                                               
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="shipmentTypeLbl" runat="server" Text="ShipmentType" /><br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="shipmentTypeCombo" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                                    <telerik:RadComboBox ID="account" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                
                                                <td>
                                                    <asp:Label ID="alarm1Lbl" runat="server" Text="Alarm1" /><br />
                                                    <telerik:RadDropDownList ID="alarm1Ddl" runat="server" Enabled="True" DataTextField="Descr"
                                                        DataValueField="item" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="alarm2Lbl" runat="server" Text="Alarm2" /><br />
                                                    <telerik:RadDropDownList ID="alarm2Ddl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="refreshIntervalLbl" runat="server" Text="RefreshInterval" /><br />
                                                    <telerik:RadDropDownList ID="refreshIntervalDdl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                    <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadTextBox>
                                                </td>                                                
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None"
                    OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated" AllowFilteringByColumn="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <ClientSettings Selecting-AllowRowSelect="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:Label ID="ESNLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="IMPSummaryRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar2" Width="100%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                         <table border="0" cellpadding="0" cellspacing="0" width="35%">
                                             <tr>
                                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                     </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <br />
                                                    <asp:Button ID="ViewContainersBtn" class="LongLabelWhite" runat="server" OnClick="IMPViewContainersBtn_Click"
                                                        Text="View Containers" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                                <td style="padding-left: 4px"><br />
                                                     <asp:Button ID="EditBtn" runat="server" Text="Edit" CausesValidation="false" ToolTip="Run" 
                                                         CssClass="white" OnClick="IMPEditBtn_Click" />
                                                </td>
                                                <td style="padding-left: 4px">
                                                    <asp:Label ID="Refresh" runat="server"  style="padding-left: 22px" Text="Refresh" /><br />
                                                    <asp:Button ID="IMPRunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="IMPRunBtn_Click" />
                                                </td>  
                                                <td style="padding-left: 7px">
                                                    <br />
                                                        <asp:Button ID="ExcelBtn" runat="server" Text="Excel" CausesValidation="false" ToolTip="Excel" 
                                                            CssClass="green" OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>  
                                                <td style="padding-left: 8px">
                                                    <br />
                                                    <telerik:RadMenu ID="RadMenuMorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" BorderWidth="1" BackColor="#f5f5f0"
                                                        OnItemClick="RadMenuMorePrintouts_ItemClick" OnClientItemClicked="RadMenuClientOnClick" >
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" Text="More<br/>Printouts" PostBack="false" Value="MorePrintouts" Font-Bold="true" ForeColor="Black">
                                                            </telerik:RadMenuItem>
                                                        </Items>
                                                    </telerik:RadMenu>
                                                </td>                                         
                                            </tr>  
                                          </table>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">                                                                                                                               
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="shipmentTypeLbl" runat="server" Text="ShipmentType" /><br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="shipmentTypeCombo" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                                    <telerik:RadComboBox ID="account" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                </td>                                                
                                                <td>
                                                    <asp:Label ID="alarm1Lbl" runat="server" Text="Alarm1" /><br />
                                                    <telerik:RadDropDownList ID="alarm1Ddl" runat="server" Enabled="True" DataTextField="Descr"
                                                        DataValueField="item" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="alarm2Lbl" runat="server" Text="Alarm2" /><br />
                                                    <telerik:RadDropDownList ID="alarm2Ddl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="refreshIntervalLbl" runat="server" Text="RefreshInterval" /><br />
                                                    <telerik:RadDropDownList ID="refreshIntervalDdl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                    <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadTextBox>
                                                </td>                                                
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
                <telerik:RadGrid ID="IMPResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True"
                    Skin="Metro" OnNeedDataSource="IMPResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None"
                    OnItemDataBound="IMPResultDG_ItemDataBound" OnColumnCreated="IMPResultDG_ColumnCreated" AllowFilteringByColumn="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <ClientSettings Selecting-AllowRowSelect="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="IMPchkObjective" runat="server" />
                                    <asp:Label ID="Dischargelbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="IMPContainerRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
