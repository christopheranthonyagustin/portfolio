<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" AutoEventWireup="true" CodeBehind="RoutePlanningWorkbenchV2_2.aspx.cs" Inherits="iWMS.Web.Job.RoutePlanningWorkbenchV2.RoutePlanningWorkbenchV2_2" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<html>
<head id="Head1" runat="server">
    <title>RoutePlanningWorkbenchV2_2</title>
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
            CausesValidation="false" AutoPostBack="true" SelectedIndex="1" Skin="Office2007">
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
                    <table width="100%">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                            <td>
                                <br />
                                <asp:Button ID="RefreshBtn1" runat="server" CssClass="white" OnClick="RefreshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                                &nbsp;
                                <asp:Button ID="UpdateBtn1" runat="server" CssClass="white" OnClick="UpdateBtn_Click"
                                    Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                                &nbsp;
                                <asp:Button ID="ShowHideBtn" runat="server" CssClass="white" OnClick="ShowHideBtn_Click" 
                                    Text="ShowHide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="NewETABtn" runat="server" CssClass="white" OnClick="NewETABtn_Click" 
                                    Text="NewETA" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="AddPersonnelBtn" runat="server" CssClass="white" OnClick="AddPersonnelBtn_Click" 
                                    Text="AddPersonnel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" width="100px"/>
                                &nbsp;
                                <asp:Button ID="UnassignBtn" runat="server" CssClass="white" OnClick="UnassignBtn_Click"
                                    Text="Unassign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;  
                                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                    Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp; 
                                <asp:Button ID="ManifestBtn" runat="server" CssClass="blue" OnClick="ManifestBtn_Click"
                                    Text="Manifest" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <br />
                                <br />
                                <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                    Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                             
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" />
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnPreRender="ResultDG_PreRender" 
                        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" ReorderColumnsOnClient="true">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                        <ClientSettings Selecting-AllowRowSelect="true">
                        </ClientSettings>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="vehno" Name="ParentGrid" PageSize="50" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="perid" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno" Display="false"
                                    Reorderable="true">
                                    <ItemStyle Width="150px" Font-Bold="true" Font-Size="Medium" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="VehDescr" DataField="VehDescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="VehDescr" SortExpression="VehDescr" UniqueName="VehDescr"
                                    Reorderable="true">
                                    <ItemStyle Width="150px" Font-Bold="true" Font-Size="Medium" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Driver" DataField="percode" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="percode" SortExpression="percode" UniqueName="percode"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Route" DataField="route" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="route" SortExpression="route" UniqueName="route"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="VehVol" DataField="nettvol" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="nettvol" SortExpression="nettvol" UniqueName="nettvol"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="GoodsVol" DataField="goodsvol" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="goodsvol" SortExpression="goodsvol" UniqueName="goodsvol"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Occupancy(%)" DataField="occrate" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="occrate" SortExpression="occrate" UniqueName="occrate"
                                    Reorderable="true" DataFormatString="{0:#,0.00}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="DropPoints" DataField="droppoints" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="droppoints" SortExpression="droppoints" UniqueName="droppoints"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Total Packages" DataField="totalpkg" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="totalpkg" SortExpression="totalpkg" UniqueName="goodsvol"
                                    Reorderable="true" DataFormatString="{0:#.####}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Total Volume" DataField="totalvol" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="totalvol" SortExpression="totalvol" UniqueName="totalvol"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Total WT" DataField="totalwt" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="totalwt" SortExpression="totalwt" UniqueName="totalwt"
                                    Reorderable="true" DataFormatString="{0:#,0.000}">
                                </telerik:GridBoundColumn>
                            </Columns>
                            <DetailTables>
                                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" HierarchyDefaultExpanded="true">
                                    <HeaderStyle Wrap="true" />
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
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                         <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                S/N
                                            </HeaderTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1%>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="Client" DataField="accode" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="accode" SortExpression="accode" UniqueName="accode"
                                            Reorderable="true" ItemStyle-Width="80px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="FrArea" DataField="frRoute" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="frRoute" SortExpression="frRoute" UniqueName="frRoute"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="PickUp" DataField="frAddr" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="frAddr" SortExpression="frAddr" UniqueName="frAddr"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="FrSequence" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="FrSequenceTxt" runat="server" Width="80" Skin="WebBlue"
                                                    Text='<%# DataBinder.Eval(Container.DataItem, "frsequence") %>'></telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="Collection" DataField="frexpdate" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MMM/yyyy HH:mm}"> 
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Pkg" DataField="actpkg" AllowFiltering="true"
                                            ReadOnly="True" SortExpression="actpkg" UniqueName="actpkg"
                                            Reorderable="true" DataFormatString="{0:#.####}" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Weight" DataField="actwt" AllowFiltering="true"
                                            ReadOnly="True" SortExpression="actwt" UniqueName="actwt"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="M3" DataField="actvol" AllowFiltering="true"
                                            ReadOnly="True" SortExpression="actvol" UniqueName="actvol"
                                            Reorderable="true" DataFormatString="{0:#,0.000}" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Delivery" DataField="toAddr" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="toAddr" SortExpression="toAddr" UniqueName="toAddr"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="ToSequence" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="ToSequenceTxt" runat="server" Width="80" Skin="WebBlue"
                                                    Text='<%# DataBinder.Eval(Container.DataItem, "tosequence") %>'></telerik:RadTextBox> 
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="DeliveryDate" DataField="ToExpDate" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="ToExpDate" SortExpression="ToExpDate" UniqueName="ToExpDate"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MMM/yyyy HH:mm}"> 
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="ToArea" DataField="toroute" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="toroute" SortExpression="toroute" UniqueName="toroute"
                                            Reorderable="true" ItemStyle-HorizontalAlign="Center">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Trips" DataField="Sector" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="Sector" SortExpression="Sector" UniqueName="Sector"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="jobno" SortExpression="jobno" UniqueName="jobno"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Bkref<br/>CtnrNo" UniqueName="Test" DataFields="bkref,ctnrno"
                                            Expression='{0} + " <br/> " + {1}'
                                            Reorderable="true">
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                            ReadOnly="True" ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                            Reorderable="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="id" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="jbid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                    </Columns>
                                </telerik:GridTableView>
                            </DetailTables>
                        </MasterTableView>
                    </telerik:RadGrid></td>
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
