<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" AutoEventWireup="true" CodeBehind="RoutePlanningWorkbenchV2.aspx.cs" Inherits="iWMS.Web.Job.RoutePlanningWorkbenchV2.RoutePlanningWorkbenchV2" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<html>
<head id="Head1" runat="server">
    <title>RoutePlanningWorkbenchV2</title>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function ShowHideBtn_Click() {
                var Grid = $find("<%= ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length; i++) {
                    var row = MasterTable.get_dataItems()[i];
                    if (row.get_expanded() == false) {
                        row.set_expanded(true);
                    }
                    else
                        row.set_expanded(false);
                }
            }

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

            function ResultDG2_selectAll(id) {
                var masterTable = $find("<%= ResultDG2.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("SelectCB").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("SelectCB").checked = false;
                    }
                }
            }

            function OnRowDragStarted(sender, eventArgs) {
                var tableView = eventArgs.get_tableView();
                if (eventArgs.get_tableView().get_name() != "ChildGrid") {
                    eventArgs.set_cancel(true)
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Workbench" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Workbench2" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Map" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="TripInfo" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Unplanned" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td valign="top">
                    <asp:Label ID="vehrouteplanLbl" runat="server" CssClass="pagetitle" Text="Vehicle Route Plan"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                &nbsp;  
                                <asp:Button ID="RefreshBtn1" runat="server" CssClass="white" OnClick="RefreshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="UnassignBtn" runat="server" CssClass="white" OnClick="UnassignBtn_Click"
                                    Text="Unassign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;  
                                <asp:Button ID="btnReroute" runat="server" CssClass="white" OnClick="btnReroute_Click" Enabled="false"
                                    Text="Reroute" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="ShowHideBtn" runat="server" CssClass="white" Text="ShowHide"
                                    OnClick="ShowHideBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                    Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="WaveBtn" runat="server" CssClass="white" OnClick="WaveBtn_Click"
                                    Text="Wave" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp; 
                                <asp:Button ID="UndoWaveBtn" runat="server" CssClass="white" OnClick="UndoWaveBtn_Click"
                                    Text="UndoWave" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;  
                                <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                    Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp; 
                                 <asp:Button ID="ReassingBtn" runat="server" CssClass="white" OnClick="Reassing_Click"
                                     Text="Reassign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="DOBtn" runat="server" CssClass="blue" OnClick="DOBtn_Click"
                                    Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp; 
                                <asp:Button ID="Button1" runat="server" CssClass="blue" OnClick="ManifestBtn_Click"
                                    Text="Manifest" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                
                            </td>
                            <td>
                                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadMenu ID="PrintRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                                    OnItemClick="PrintRadMenu_ItemClick">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Print" PostBack="false"
                                            Value="Print" GroupSettings-Width="120px">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PL" Text="PackingList"
                                                    ImageUrl="../../Image/print.gif" Visible="false" />
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DL" Text="DeliveryList"
                                                    ImageUrl="../../Image/print.gif" Visible="false" />
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CL" Text="CollectionList"
                                                    ImageUrl="../../Image/print.gif" Visible="false" />
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BL" Text="BoxLabel"
                                                    ImageUrl="../../Image/print.gif" Visible="false" />
                                            </Items>
                                        </telerik:RadMenuItem>
                                    </Items>
                                </telerik:RadMenu>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp; 
                                <asp:Button ID="SMSBtn" runat="server" CssClass="blue" OnClick="SMSBtn_Click" CausesValidation="false"
                                    Text="SMS" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                 &nbsp; 
                                <asp:Button ID="AllTripsBtn" runat="server" CssClass="white" OnClick="AllTripsBtn_Click" CausesValidation="false"
                                    Text="AllTrips" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                 &nbsp; 
                                <asp:Button ID="DeliveryBtn" runat="server" CssClass="white" OnClick="DeliveryBtn_Click" CausesValidation="false"
                                    Text="Delivery" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="ExportExcelLnk" runat="server" Text="Excel" OnClick="ExportExcel"
                                    CssClass="green" ToolTip="Export To Excel" />
                                &nbsp; 
               
                            </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" />
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnRowDrop="ResultDG_DetailTable_RowDrop"
                        OnItemCommand="ResultDG_ItemCommand" OnPreRender="ResultDG_PreRender"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" Width="1150px">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                        <ClientSettings AllowAutoScrollOnDragDrop="false" AllowRowsDragDrop="true">
                            <Selecting AllowRowSelect="true" />
                            <ClientEvents OnRowDragStarted="OnRowDragStarted" />
                        </ClientSettings>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="vehno" Name="ParentGrid" PageSize="50" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
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
                                        <a id="Map" href='<%#DataBinder.Eval(Container,"DataItem.vehno")%>' onserverclick="Parent_TripMap" runat="server">
                                            <img id="Img1" src="../../image/map.png" width="15" height="15" border="0" alt="Map"
                                                title="Map" runat="server" /></a>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="perid" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno"
                                    Reorderable="true">
                                    <HeaderStyle Width="150px" />
                                    <ItemStyle Width="150px" Font-Bold="true" Font-Size="Medium" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                                    Reorderable="true">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Driver" DataField="percode" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="percode" SortExpression="percode" UniqueName="percode"
                                    Reorderable="true">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Attendant Name" DataField="AttendantName" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="AttendantName" SortExpression="AttendantName" UniqueName="AttendantName"
                                    Reorderable="true">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Route" DataField="route" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="route" SortExpression="route" UniqueName="route"
                                    Reorderable="true">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" />
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn HeaderText="VehVol" DataField="nettvol" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="nettvol" SortExpression="nettvol" UniqueName="nettvol"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn HeaderText="GoodsVol" DataField="goodsvol" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="goodsvol" SortExpression="goodsvol" UniqueName="goodsvol"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn HeaderText="Occupancy(%)" DataField="occrate" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="occrate" SortExpression="occrate" UniqueName="occrate"
                                    Reorderable="true" DataFormatString="{0:#,0.00}">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn HeaderText="DropPoints" DataField="droppoints" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="droppoints" SortExpression="droppoints" UniqueName="droppoints"
                                    Reorderable="true">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn HeaderText="Total Packages" DataField="totalpkg" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="totalpkg" SortExpression="totalpkg" UniqueName="goodsvol"
                                    Reorderable="true" DataFormatString="{0:#.####}">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn HeaderText="Total Volume" DataField="totalvol" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="totalvol" SortExpression="totalvol" UniqueName="totalvol"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <%-- <telerik:GridBoundColumn HeaderText="Total WT" DataField="totalwt" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="totalwt" SortExpression="totalwt" UniqueName="totalwt"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn HeaderText="Total Pallets" DataField="totalplt" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="totalplt" SortExpression="totalplt" UniqueName="totalplt"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>--%>
                            </Columns>
                            <DetailTables>
                                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" HierarchyDefaultExpanded="true" InsertItemDisplay="Bottom">
                                    <HeaderStyle Wrap="false" />
                                    <ItemStyle Wrap="true" />
                                    <AlternatingItemStyle Wrap="true" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="fakeicon" AllowFiltering="false">
                                            <HeaderTemplate>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="CheckFakeId" runat="server" Visible="false" Width="150px"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="CheckFakeId2" runat="server" Visible="false" Width="150px"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="150px">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="DetailcbSelectAll" runat="server" AutoPostBack="true" CausesValidation="false" OnCheckedChanged="DetailcbSelectAll_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                &nbsp;<asp:CheckBox ID="chkObjective" runat="server" />
                                                <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="TripInfo_Edit" runat="server">
                                                    <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit Trip"
                                                        title="Edit Trip" runat="server" /></a>
                                                <a id="Map" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="Child_TripMap" runat="server">
                                                    <img id="Img1" src="../../image/map.png" width="15" height="15" border="0" alt="Map"
                                                        title="Map" runat="server" /></a>
                                                <a id="A1" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="Attachment" runat="server">
                                                    <img id="Img2" src="../../image/attachment.png" width="15" height="15" border="0" alt="Attachment"
                                                        title="Attachment" runat="server" /></a>
                                                <asp:ImageButton runat="server" ID="AddBtn" ImageUrl="../../image/add.png" BorderWidth="0"
                                                    BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="AddDetail"
                                                    CommandName="AddDetail"></asp:ImageButton>
                                                <asp:Label ID="DetailLbl" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Mobile Number" UniqueName="orderByPhone" DataFields="orderByPhone"
                                            SortExpression="orderByPhone" Reorderable="true">
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn HeaderText="WaveNo<br/>PickDrop" UniqueName="WaveAndPick" DataFields="WaveNo,trippickdrop"
                                            Expression='{0} + " <br/> " + {1}' SortExpression="WaveNo"
                                            Reorderable="true">
                                        </telerik:GridCalculatedColumn>

                                        <%--<telerik:GridBoundColumn HeaderText="Address" DataField="TripAddr" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="TripAddr" SortExpression="TripAddr" UniqueName="TripAddr"
                                            Reorderable="true" ItemStyle-Wrap="true" ItemStyle-Width="100px">
                                        </telerik:GridBoundColumn>--%>

                                        <telerik:GridBoundColumn HeaderText="FROM: <br/> SeqNo" DataField="frSeq" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="frSeq" SortExpression="frSeq" UniqueName="frSeq"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="DeliveryCollection" DataField="TripCollectDelivery" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="TripCollectDelivery" SortExpression="TripCollectDelivery" UniqueName="TripCollectDelivery"
                                            Reorderable="true" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridCalculatedColumn HeaderText="Address <br/> PostalCode" DataFields="fraddr, From, frexpdate"
                                            Expression='{0} + " <br/>" + {1} + " <br/>" + {2}' SortExpression="fraddr" UniqueName="fraddrpostal"
                                            Reorderable="true">
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn HeaderText="TO: <br/> SeqNo" DataField="toSeq" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="toSeq" SortExpression="toSeq" UniqueName="toSeq"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridCalculatedColumn HeaderText="Address <br/> PostalCode" DataFields="toaddr, to, toexpdate"
                                            Expression='{0} + " <br/>" + {1} + " <br/>" + {2}' SortExpression="toaddr"
                                            Reorderable="true">
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn HeaderText="First Name" DataField="smancode" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="smancode" SortExpression="smancode" UniqueName="smancode"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Last Name" DataField="orderby" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="orderby" SortExpression="orderby" UniqueName="orderby"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>

                                        <%--<telerik:GridCalculatedColumn HeaderText="Route <br/> PostalCode" DataFields="TripRoute, From"
                                            Expression='{0} + " <br/>" + {1}' SortExpression="TripRoute"
                                            Reorderable="true">
                                        </telerik:GridCalculatedColumn>--%>

                                        <%--<telerik:GridBoundColumn HeaderText="SeqNo" DataField="routeplansequence" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="routeplansequence" SortExpression="routeplansequence" UniqueName="routeplansequence"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>--%>

                                        <%-- <telerik:GridBoundColumn HeaderText="Packages" DataField="actpkg" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="actpkg" SortExpression="actpkg" UniqueName="actpkg"
                                            Reorderable="true" DataFormatString="{0:#.####}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                        </telerik:GridBoundColumn>--%>
                                        <%-- <telerik:GridBoundColumn HeaderText="Volume" DataField="actvol" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="actvol" SortExpression="actvol" UniqueName="actvol"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>--%>
                                        <%-- <telerik:GridBoundColumn HeaderText="WT" DataField="actwt" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="actwt" SortExpression="actwt" UniqueName="actwt"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn HeaderText="Box" DataField="noofboxes" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="noofboxes" SortExpression="noofboxes" UniqueName="noofboxes"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:#,0.000}" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Booking Number" DataField="jobno" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="jobno" SortExpression="jobno" UniqueName="jobno"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>
                                        <%--<telerik:GridBoundColumn HeaderText="Pallets" DataField="actplt" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="actplt" SortExpression="actplt" UniqueName="actplt"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>--%>
                                        <%-- <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="billsizetype" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="billsizetype" SortExpression="billsizetype" UniqueName="billsizetype"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>--%>

                                        <%--<telerik:GridBoundColumn HeaderText="BillOption1" DataField="billoption1" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="billoption1" SortExpression="billoption1" UniqueName="billoption1"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                        </telerik:GridBoundColumn>--%>

                                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                            Reorderable="true" ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="id" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="jbid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="jbtourid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="accode" SortExpression="accode" UniqueName="accode"
                                            Reorderable="true" ItemStyle-Width="90px" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="CustRef" DataField="custref" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="custref" SortExpression="custref" UniqueName="custref"
                                            Reorderable="true" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="PostalCode" DataField="TripPostalCode" AllowFiltering="false"
                                            ReadOnly="True" ColumnGroupName="TripPostalCode" SortExpression="TripPostalCode" UniqueName="TripPostalCode"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Route" DataField="TripRoute" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="TripRoute" SortExpression="TripRoute" UniqueName="TripRoute"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="PickDrop" DataField="trippickdrop" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="trippickdrop" SortExpression="trippickdrop" UniqueName="trippickdrop"
                                            Reorderable="true" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="AttendantName" DataField="AttendantName" Display="false" />
                                    </Columns>
                                </telerik:GridTableView>
                            </DetailTables>
                        </MasterTableView>
                    </telerik:RadGrid></td>
                <td>&nbsp;&nbsp;&nbsp;
                </td>
                <td valign="top">
                    <asp:Label ID="tripsunplannedLbl" runat="server" CssClass="pagetitle" Text="Trips Unplanned"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                            </td>
                            <td>
                                <br />
                                <asp:Button ID="RoutePlanBtn" runat="server" CssClass="white" OnClick="RoutePlanBtn_Click"
                                    Text="RoutePlan" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;   
                            </td>
                            <td>
                                <asp:Label ID="PlanStrategyLbl" runat="server" Text="PlanStrategy"></asp:Label><br />
                                <telerik:RadDropDownList ID="PlanStrategyDDL" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr" OnSelectedIndexChanged="RefreshList_SelectedIndexChanged" AutoPostBack="true"
                                    DataValueField="Item" Width="150px">
                                </telerik:RadDropDownList>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            </td>
                            <td>
                                <br />
                                <asp:Button ID="RefreshBtn" runat="server" CssClass="white" OnClick="RefreshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="IntervalLbl" runat="server" Text="Interval"></asp:Label><br />
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
                    <telerik:RadGrid ID="ResultDG2" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                        OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound" OnRowDrop="ResultDG_RowDrop" AllowMultiRowSelection="true"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" GroupPanelPosition="Top"
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="true" UseAccessibleHeader="True" Width="1400px">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem"></ItemStyle>
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50" Name="TripsUnplannedGrid" >
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemStyle Wrap="true" HorizontalAlign="Center"></ItemStyle>
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        &nbsp;<input id="SelectALLCB" name="SelectALLCB" type="checkbox" onclick="ResultDG2_selectAll(this)">
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="50px" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="SelectCB" runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="accode" SortExpression="accode" UniqueName="accode"
                                    Reorderable="true" ItemStyle-Width="150px" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="CustRef" DataField="custref" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="custref" SortExpression="custref" UniqueName="custref"
                                    Reorderable="true" ItemStyle-Width="150px" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ExpectedDate" DataField="frexpdate" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="DeliveryCollection" DataField="TripCollectDelivery" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="TripCollectDelivery" SortExpression="TripCollectDelivery" UniqueName="TripCollectDelivery"
                                    Reorderable="true" ItemStyle-Width="50px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrAddr" DataField="FrAddr" AllowFiltering="true"
                                    ReadOnly="True" SortExpression="FrAddr" UniqueName="FrAddr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrPostalCode" DataField="FrPostalCode" AllowFiltering="true"
                                    ReadOnly="True" SortExpression="FrPostalCode" UniqueName="FrPostalCode"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrRoute" DataField="FrRoute" AllowFiltering="true"
                                    ReadOnly="True" SortExpression="FrRoute" UniqueName="FrRoute"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToAddr" DataField="ToAddr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="ToAddr" SortExpression="ToAddr" UniqueName="TripAddress"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="PostalCode" DataField="ToPostalCode" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="ToPostalCode" SortExpression="ToPostalCode" UniqueName="TrPostalCode"
                                    Reorderable="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToRoute" DataField="ToRoute" AllowFiltering="true"
                                    ReadOnly="True" SortExpression="ToRoute" UniqueName="ToRoute"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Route" DataField="routedescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="routedescr" SortExpression="routedescr" UniqueName="routedescr"
                                    Reorderable="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Booking Number" DataField="jobno" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="jobno" SortExpression="jobno" UniqueName="jobno"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="First Name" DataField="smancode" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="smancode" SortExpression="smancode" UniqueName="smancode"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Last Name" DataField="orderby" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="orderby" SortExpression="orderby" UniqueName="orderby"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn HeaderText="Packages" DataField="actpkg" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="actpkg" SortExpression="actpkg" UniqueName="actpkg" FilterControlWidth="50%"
                                    Reorderable="true" DataFormatString="{0:#.####}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="60px">
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn HeaderText="Volume" DataField="actvol" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="actvol" SortExpression="actvol" UniqueName="actvol"
                                    Reorderable="true" DataFormatString="{0:#,0.000}"
                                    FilterControlWidth="50%" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="60px">
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn HeaderText="WT" DataField="actwt" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="actwt" SortExpression="actwt" UniqueName="actwt"
                                    Reorderable="true" DataFormatString="{0:#,0.000}" FilterControlWidth="50%" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="60px">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn HeaderText="Box" DataField="noofboxes" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="noofboxes" SortExpression="actwt" UniqueName="noofboxes"
                                    Reorderable="true" DataFormatString="{0:#,0.000}" FilterControlWidth="50%" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="60px">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn HeaderText="Pallets" DataField="actplt" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="actplt" SortExpression="actplt" UniqueName="actplt"
                                    Reorderable="true" DataFormatString="{0:#,0.000}" FilterControlWidth="50%" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="60px">
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn HeaderText="BillSizeType" DataField="billsizetypedescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="billsizetypedescr" SortExpression="billsizetypedescr" UniqueName="billsizetypedescr"
                                    Reorderable="true" ItemStyle-Width="150px" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn HeaderText="TimeBuffer" DataField="TripTimeBuffer" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="TripTimeBuffer " SortExpression="TripTimeBuffer" UniqueName="TripTimeBuffer"
                                    Reorderable="true" HeaderStyle-Width="75px" FilterControlWidth="50%" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="Remarks " SortExpression="Remarks" UniqueName="Remarks"
                                    Reorderable="true" HeaderStyle-Width="75px" FilterControlWidth="50%" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="routeplansequence" Display="false"></telerik:GridBoundColumn>
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
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        <%--Confirm Message popup area End--%>
    </form>
</body>
</html>
