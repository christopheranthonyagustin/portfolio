<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehMessagingWorkbench.aspx.cs" Inherits="iWMS.Web.Job.VehicleMessagingWorkbench.VehMessagingWorkbench" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<html>
<head id="Head1" runat="server">
    <title>Vehicle Messaging Workbench</title>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
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
    </style>
</head>
<body style="border-spacing: 0px;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" runat="server">
            <tr>
                <td>
                    <table id="LeftTB" width="400px" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="VehOpsLbl" runat="server" Font-Bold="true">VehOpsUnit</asp:Label>
                                <br />
                                <telerik:RadListBox runat="server" ID="VehOpsUnitList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehOpsUnitList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="VehOpsUnitList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedVehOpsUnitList" Height="120px" Width="150px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false" BackColor="Yellow">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <asp:Button ID="ShowBtn" runat="server" CssClass="white" OnClick="ShowBtn_Click"
                                    Text="Show" />&nbsp;                    
                                <asp:Button ID="RefreshBtn" runat="server" CssClass="white" OnClick="RefreshBtn_Click"
                                    Text="Refresh" />&nbsp;
                                <br />
                                <br />
                                &nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" Visible="false"
                                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true"
                                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" GroupPanelPosition="Top"
                                    AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="true" UseAccessibleHeader="True"
                                    ItemStyle-Wrap="False">
                                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                                    <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                                    <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="vehno" PageSize="50">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <label id="completelbl">
                                                    </label>
                                                    &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" AllowFiltering="true"
                                                ReadOnly="True" ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno"
                                                Reorderable="true">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 40px;"></td>
                <td valign="top" align="left">
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG2" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                        OnNeedDataSource="ResultDG2_NeedDataSource" AllowMultiRowSelection="true" Height="480px"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" UseAccessibleHeader="True"
                        ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                    </telerik:RadGrid>&nbsp;&nbsp;&nbsp;
                </td>
                <td style="width: 15px;"></td>
                <td valign="top" align="left">
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG3" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                        OnNeedDataSource="ResultDG3_NeedDataSource" AllowMultiRowSelection="true" Height="480px"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" UseAccessibleHeader="True"
                        ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                    </telerik:RadGrid>&nbsp;&nbsp;&nbsp;
                </td>
                <td style="width: 15px;"></td>
                <td valign="top" align="left">
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG4" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                        OnNeedDataSource="ResultDG4_NeedDataSource" AllowMultiRowSelection="true" Height="480px"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" UseAccessibleHeader="True"
                        ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                    </telerik:RadGrid>&nbsp;&nbsp;&nbsp;
                </td>
                <td style="width: 15px;"></td>
                <td valign="top" align="left">
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG5" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                        OnNeedDataSource="ResultDG5_NeedDataSource" AllowMultiRowSelection="true" Height="480px"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" UseAccessibleHeader="True"
                        ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                    </telerik:RadGrid>&nbsp;&nbsp;&nbsp;
                </td>
                <td style="width: 20px;"></td>
                <td valign="top" align="left">
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG6" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                        OnNeedDataSource="ResultDG6_NeedDataSource" AllowMultiRowSelection="true" Height="480px"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" UseAccessibleHeader="True"
                        ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                    </telerik:RadGrid>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <%--Show Message popup area Start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" CssClass="white" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Show Message popup area End--%>
    </form>
</body>
</html>
