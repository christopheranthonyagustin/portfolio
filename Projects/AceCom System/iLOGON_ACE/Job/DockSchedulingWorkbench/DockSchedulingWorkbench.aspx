<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DockSchedulingWorkbench.aspx.cs" Inherits="iWMS.Web.Job.DockSchedulingWorkbench.DockSchedulingWorkbench" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<html>
<head id="Head1" runat="server">
    <title>DockSchedulingWorkbench</title>
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
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = false;
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
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td valign="top">
                    <asp:Label ID="DockLbl" runat="server" CssClass="pagetitle" Text="Docks"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <br />
                                &nbsp;
                                <asp:Button ID="ActiveBtn" runat="server" CssClass="white" OnClick="ActiveBtn_Click"
                                    Text="Active" />&nbsp;                    
                                <asp:Button ID="UnassignBtn" runat="server" CssClass="white" OnClick="UnassignBtn_Click"
                                    Text="Unassign" />&nbsp;                    
                                <asp:Button ID="PauseBtn" runat="server" CssClass="white" OnClick="PauseBtn_Click"
                                    Text="Pause" />&nbsp;
                                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                    Text="Completed" />&nbsp;<br />
                            </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" />
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" Width="820px"
                        ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <ClientSettings AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="code" Name="ParentGrid" PageSize="50" HierarchyDefaultExpanded="true">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn Display="false" DataField="code" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="code" SortExpression="code" UniqueName="code"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="DockCode" DataField="descr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="descr" SortExpression="descr" UniqueName="descr"
                                    Reorderable="true">
                                    <HeaderStyle Width="150px" />
                                    <ItemStyle Width="150px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="MaxCtnr" DataField="MaxCtnr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="MaxCtnr" SortExpression="MaxCtnr" UniqueName="MaxCtnr"
                                    Reorderable="true">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                    Reorderable="true">
                                    <HeaderStyle Width="150px" />
                                    <ItemStyle Width="150px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="Remarks" SortExpression="Remarks" UniqueName="Remarks"
                                    Reorderable="true">
                                    <HeaderStyle Width="700px" />
                                    <ItemStyle Width="700px" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <DetailTables>
                                <telerik:GridTableView DataKeyNames="dockcode" Name="ChildGrid" SkinID="Telerik" HierarchyDefaultExpanded="true"  InsertItemDisplay="Bottom">
                                    <HeaderStyle Wrap="false" />
                                    <ItemStyle Wrap="true" />
                                    <AlternatingItemStyle Wrap="false" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="fakeicon" AllowFiltering="false">
                                            <HeaderTemplate>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="CheckFakeId" runat="server" Visible="false" Width="150px"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="CheckFakeId2" runat="server" Visible="false" Width="150px"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="DetailcbSelectAll" runat="server" AutoPostBack="true" CausesValidation="false" OnCheckedChanged="DetailcbSelectAll_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                &nbsp;<asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="DockCode" DataField="dockcode" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="dockcode" SortExpression="dockcode" UniqueName="dockcode" Visible="false"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="container" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Account" DataField="account" AllowFiltering="false"
                                            ReadOnly="True" ColumnGroupName="account" SortExpression="account" UniqueName="account"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="ShipmentNo" DataField="RCShipmentNo" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="ShipmentNo" SortExpression="ShipmentNo" UniqueName="ShipmentNo"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Source" DataField="source" AllowFiltering="false"
                                            ReadOnly="True" ColumnGroupName="srctype" SortExpression="srctype" UniqueName="srctype"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="SourceNo" DataField="sourceno" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="sourceno" SortExpression="sourceno" UniqueName="sourceno"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="id" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="srcid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="srcctnrid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="suid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="False">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </telerik:GridTableView>
                            </DetailTables>
                        </MasterTableView>
                    </telerik:RadGrid></td>
                <td>&nbsp;&nbsp;&nbsp;
                </td>
                <td valign="top">
                    <asp:Label ID="ContainerLbl" runat="server" CssClass="pagetitle" Text="Containers"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                            <td>
                                <br />
                                <asp:Button ID="RefreshBtn" runat="server" CssClass="white" OnClick="RefreshBtn_Click"
                                    Text="Refresh" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="IntervalLbl" runat="server" Text="Interval" Font-Bold="true"></asp:Label><br />
                                <telerik:RadDropDownList ID="RefreshList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr" OnSelectedIndexChanged="RefreshList_SelectedIndexChanged" AutoPostBack="true"
                                    DataValueField="Item" Width="150px">
                                </telerik:RadDropDownList>
                            </td>
                            <td>
                                <br />
                                <br />
                                &nbsp;&nbsp;<asp:Label ID="LastRefreshLbl" runat="server" Text="Last Refreshed :" Font-Bold="true"></asp:Label>
                                <asp:Label ID="LastTimeLbl" runat="server" Font-Bold="true"></asp:Label><br />
                            </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Label ID="lblProcessID" runat="server" Visible="False" />
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG2" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                        OnNeedDataSource="ResultDG2_NeedDataSource" OnRowDrop="ResultDG_RowDrop" AllowMultiRowSelection="true"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" GroupPanelPosition="Top"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="true" UseAccessibleHeader="True"
                        ItemStyle-Wrap="False">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="id" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="srcid" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="srcctnrid" Display="false" AllowFiltering="false" UniqueName="srcctnrid"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="acid" Display="false" AllowFiltering="false" UniqueName="acid"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="Container" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Type" DataField="Type" AllowFiltering="false"
                                    ReadOnly="True" ColumnGroupName="ctnrtype" SortExpression="ctnrtype" UniqueName="ctnrtype"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="SealNo" DataField="ctnrsealno" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="ctnrsealno" SortExpression="ctnrsealno" UniqueName="ctnrsealno"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Source" DataField="Source" AllowFiltering="false"
                                    ReadOnly="True" ColumnGroupName="srctype" SortExpression="srctype" UniqueName="srctype"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Number" DataField="sourceno" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="number" SortExpression="number" UniqueName="number"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="CtnrStatusDescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="CtnrStatusDescr" SortExpression="CtnrStatusDescr" UniqueName="CtnrStatusDescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ShipmentNo" DataField="ShipmentNo" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="ShipmentNo" SortExpression="ShipmentNo" UniqueName="ShipmentNo"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Haulier" DataField="hauliername" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="hauliername" SortExpression="hauliername" UniqueName="hauliername"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="false"
                                    ReadOnly="True" ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="SiteCode" DataField="sitecode" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="sitecode" SortExpression="sitecode" UniqueName="sitecode" Display="false"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="DockCode" DataField="dockcode" AllowFiltering="false" Display="false"
                                    ReadOnly="True" ColumnGroupName="dockcode" SortExpression="dockcode" UniqueName="dockcode"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
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
        <%--Confirm Message popup area Start--%>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="ConfirmOkayBtn">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ReceiptCancelLbl" Text="CancelReipt" runat="server" Style="size: 15px"></asp:Label>
            </div>
            <div id="Div3" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="Table1" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ConfrimMsgLiteral1" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="ConfrimMsg" runat="server"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancelBtn" runat="server" CssClass="white" Text="Cancel" OnClick="ConfirmCancelBtn_Click" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmOkayBtn" runat="server" CssClass="white" Text="OK" OnClick="ConfirmOkayBtn_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Confirm Message popup area End--%>
    </form>
</body>
</html>

