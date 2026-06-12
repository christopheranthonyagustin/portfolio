<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportCtnrTripDetl.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportCtnrTripDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportCtnrTripDetl</title>
    <link href="../../css/iWMStelerik.css" type="textfr/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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

        function callbackFn(arg) //the value indicates how the dialog was closed
        {
            GetRadWindow().close();
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle" align="left">&nbsp;
                    <asp:Button ID="MassChangeResource" runat="server" CssClass="white" OnClick="ChangeResourceBtn_Click" ToolTip="Change Resource"
                        Text="Resource" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="MassChangeBtn" runat="server" CssClass="white" OnClick="MassChangeBtn_Click"
                        Text="Schedule" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Change Schedule" />
                    &nbsp;
                    <asp:Button ID="GenerateTripBtn" runat="server" CssClass="white" OnClick="GenerateTripBtn_Click"
                        Text="GenTrip" />
                    &nbsp;
                 <asp:Button ID="CompleteBtn" runat="server" CssClass="white" OnClientClick="return confirm('Confirm Complete?')"
                     OnClick="CompleteBtn_Click" Text="Complete" />
                    &nbsp;
                    <asp:Button ID="VoidAllBtn" runat="server" CssClass="white" OnClientClick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm VoidAll?')"
                        OnClick="VoidAllBtn_Click" Text="Void" />
                    &nbsp;
                    <asp:Button ID="MassDetourBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="MassDetourBtn_Click" Text="MassDetour" />
                    &nbsp;
                    <asp:Button ID="GenPVBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="GenPVBtn_Click" Text="GenPV" Visible="false" />
                    &nbsp;
                    <asp:Button ID="AddDetailBtn" runat="server" Text="+ Item" Visible="False" CssClass="white"
                        OnClick="AddDetailBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="PrintChargeLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                        Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" AllowFilteringByColumn="true">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                                        <%--<asp:ImageButton runat="server" Visible="true" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>--%>
                                        <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="CtnrTripDetail_Edit"
                                            runat="server">
                                            <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                                title="Edit" runat="server" /></a> <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                    onclick="return confirm('Confirm copy?')" onserverclick="CtnrTripDetail_Copy"
                                                    runat="server">
                                                    <img id="Img1" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy exact"
                                                        title="Copy exact" runat="server" /></a> <a id="A1" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                            onclick="return confirm('Confirm copy with reverse address?')" onserverclick="CtnrTripDetail_CopyRA"
                                                            runat="server">
                                                            <img id="Img2" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy reverse address"
                                                                title="Copy reverse address" runat="server" /></a> <a id="A2" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                    onserverclick="CtnrTripDetail_Detour" runat="server">
                                                                    <img id="Img3" src="../../image/detour.png" width="15" height="15" border="0" alt="Detour"
                                                                        title="Detour" runat="server" /></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                            onclick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm Void?')"
                                                                            onserverclick="CtnrTripDetail_Delete" runat="server">
                                                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                                                title="Delete" runat="server" /></a>
                                        <asp:Label ID="RedFlagLbl" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        S/N
                                    </HeaderTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="FromDateTime" DataField="frexpdate" AllowFiltering="true"
                                    ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToDateTime" DataField="toactdate" AllowFiltering="true"
                                    ColumnGroupName="toactdate" SortExpression="toactdate" UniqueName="toactdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ShipmentType" DataField="eqptypedescr" AllowFiltering="false"
                                    ColumnGroupName="eqptypedescr" SortExpression="eqptypedescr" UniqueName="eqptypedescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="JobType" DataField="jbcjobtypedescr" AllowFiltering="false"
                                    ColumnGroupName="jbcjobtypedescr" SortExpression="jbcjobtypedescr" UniqueName="jbcjobtypedescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TptType" DataField="jbctpttypedescr" AllowFiltering="false"
                                    ColumnGroupName="jbctpttypedescr" SortExpression="jbctpttypedescr" UniqueName="jbctpttypedescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="BillSizeType" AllowFiltering="false"
                                    ColumnGroupName="BillSizeType" SortExpression="BillSizeType" UniqueName="ctnrtype" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TripType" DataField="type" AllowFiltering="false"
                                    Display="false" ColumnGroupName="type" SortExpression="type" UniqueName="type"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="TripType" HeaderStyle-HorizontalAlign="Left"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="TypeList" runat="server" Enabled="True" DataTextField="Descr"
                                            DataValueField="item" OnSelectedIndexChanged="TypeList_SelectedIndexChanged"
                                            Width="150px" AutoPostBack="True" />
                                        <asp:HiddenField ID="TypeTxt" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="TripOption" DataField="sectordescr" AllowFiltering="false"
                                    ColumnGroupName="sectordescr" SortExpression="sectordescr" UniqueName="sectordescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="NoOfTrip" DataField="tripcount" AllowFiltering="false"
                                    ColumnGroupName="tripcount" SortExpression="tripcount" UniqueName="tripcount"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="EqpRef" DataField="ctnrno" AllowFiltering="true"
                                    ColumnGroupName="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="SealNo" DataField="sealno" AllowFiltering="true"
                                    ColumnGroupName="sealno" SortExpression="sealno" UniqueName="sealno" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="false"
                                    ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="false"
                                    ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" AllowFiltering="true"
                                    ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Driver" DataField="perdrivername" AllowFiltering="true"
                                    ColumnGroupName="perdrivername" SortExpression="perdrivername" UniqueName="perdrivername"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailerno" AllowFiltering="true"
                                    ColumnGroupName="trailerno" SortExpression="trailerno" UniqueName="trailerno"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="SvcChit" DataField="svcchitno" AllowFiltering="true"
                                    ColumnGroupName="svcchitno" SortExpression="svcchitno" UniqueName="svcchitno"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TripRemarks" DataField="remarks2" AllowFiltering="false"
                                    ColumnGroupName="remarks2" SortExpression="remarks2" UniqueName="remarks2" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TripRemark(DriverOnly)" DataField="remarks"
                                    AllowFiltering="false" ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status"
                                    HeaderText="Status" />
                                <telerik:GridBoundColumn HeaderText="PVNumber" DataField="PVNumber" AllowFiltering="true"
                                    ColumnGroupName="PVNumber" SortExpression="PVNumber" UniqueName="PVNumber"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="false"
                                    ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="false"
                                    ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="false"
                                    ColumnGroupName="editdate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="false"
                                    ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="BookingRef" DataField="bookingref" AllowFiltering="false"
                                    ColumnGroupName="bookingref" SortExpression="bookingref" UniqueName="bookingref"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="BookingRefOriginal" DataField="bookingreforiginal"
                                    AllowFiltering="false" ColumnGroupName="bookingreforiginal" SortExpression="bookingreforiginal"
                                    UniqueName="bookingreforiginal" Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Trip" DataField="tripcount" AllowFiltering="false"
                                    ColumnGroupName="tripcount" SortExpression="tripcount" UniqueName="tripcount"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrSvcPt" DataField="frservicept" AllowFiltering="false"
                                    ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToSvcPt" DataField="toservicept" AllowFiltering="false"
                                    ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="perid" SortExpression="perid"
                                    HeaderText="PerId" />
                                <telerik:GridBoundColumn HeaderText="AssignDriver" DataField="pername" AllowFiltering="true"
                                    ColumnGroupName="pername" SortExpression="pername" UniqueName="pername" Reorderable="true"
                                    Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="SchTime" DataField="frexptime" AllowFiltering="false"
                                    ColumnGroupName="frexptime" SortExpression="frexptime" UniqueName="frexptime"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToActTime" DataField="toacttime" AllowFiltering="false"
                                    ColumnGroupName="toacttime" SortExpression="toacttime" UniqueName="toacttime"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TrailerLoc" DataField="traileraddr" AllowFiltering="false"
                                    ColumnGroupName="traileraddr" SortExpression="traileraddr" UniqueName="traileraddr"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="GeoLat" DataField="trailergeolat" AllowFiltering="false"
                                    ColumnGroupName="trailergeolat" SortExpression="trailergeolat" UniqueName="trailergeolat"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="GeoLng" DataField="trailergeolng" AllowFiltering="false"
                                    ColumnGroupName="trailergeolng" SortExpression="trailergeolng" UniqueName="trailergeolng"
                                    Reorderable="true" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="PickDropDate" DataField="trailerdate" AllowFiltering="false"
                                    ColumnGroupName="trailerdate" SortExpression="trailerdate" UniqueName="trailerdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Time" DataField="fracttime" AllowFiltering="false"
                                    ColumnGroupName="fracttime" SortExpression="fracttime" UniqueName="fracttime"
                                    Display="False" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="jbceqptype" SortExpression="jbceqptype" />
                                <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                                <telerik:GridBoundColumn Display="False" DataField="jbctnrid" SortExpression="jbctnrid" />
                                <telerik:GridBoundColumn Display="False" DataField="reasoncode" SortExpression="reasoncode" />
                                <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor" />
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
