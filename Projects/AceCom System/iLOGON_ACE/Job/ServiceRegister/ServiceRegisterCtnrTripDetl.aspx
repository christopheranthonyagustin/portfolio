<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterCtnrTripDetl.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterCtnrTripDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
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
    </script>
     <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
    }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle" align="left">
                &nbsp;
                <asp:Button ID="MassChangeResource" runat="server" CssClass="white" OnClick="ChangeResourceBtn_Click" ToolTip="Change Resource"
                   Text="Resource"  OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
           <%--     <telerik:RadButton ID="MassChangeResource" runat="server" OnClick="ChangeResourceBtn_Click"
                    Text="ChangeResource" Skin="WebBlue">
                </telerik:RadButton>--%>
                &nbsp;
                <asp:Button ID="MassChangeBtn" runat="server" CssClass="white" OnClick="MassChangeBtn_Click"
                     Text="Schedule"  OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Change Schedule"/>
               <%-- <telerik:RadButton ID="MassChangeBtn" runat="server" OnClick="MassChangeBtn_Click" 
                    Text="ChangeSchedule" Skin="WebBlue">
                </telerik:RadButton>--%>
                &nbsp;
                <asp:Button ID="GenerateTripBtn" runat="server" CssClass="white" OnClick="GenerateTripBtn_Click"
                 Text="GenTrip"  />
             <%--   <telerik:RadButton ID="GenerateTripBtn" runat="server" OnClick="GenerateTripBtn_Click"
                    Text="GenTrip" Skin="WebBlue">
                </telerik:RadButton>--%>
                &nbsp;
                   <asp:Button ID="CompleteBtn" runat="server" CssClass="white" OnClientClick="return confirm('Confirm Complete?')"
                  OnClick="CompleteBtn_Click" Text="Complete" />
                &nbsp;
               <%-- <telerik:RadButton ID="CompleteBtn" runat="server" OnClientClick="return confirm('Confirm Complete?')"
                    OnClick="CompleteBtn_Click" Text="Complete" Skin="WebBlue">
                </telerik:RadButton>--%>
                <asp:Button ID="VoidAllBtn" runat="server" CssClass="white" OnClientClick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm VoidAll?')"
                     OnClick="VoidAllBtn_Click" Text="Void"  />
                &nbsp;
           <%--     <telerik:RadButton ID="VoidAllBtn" runat="server" OnClientClick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm VoidAll?')"
                    OnClick="VoidAllBtn_Click" Text="Void" Skin="WebBlue">
                </telerik:RadButton>--%>
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Item" Visible="False" CssClass="white"
                       OnClick="AddDetailBtn_Click"  OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
          <%--      <telerik:RadButton ID="AddDetailBtn" runat="server" Text="+ Item" Visible="False"
                    Skin="WebBlue" OnClick="AddDetailBtn_Click">
                </telerik:RadButton>--%>
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
                                    <%--<asp:ImageButton runat="server" Visible="true" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>--%>
                                    <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="CtnrTripDetail_Edit"
                                        runat="server">
                                        <img id="Img4" src="..\..\image\pencil.gif" width="15" height="15" border="0" alt="Edit"
                                            title="Edit" runat="server" /></a> <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm copy?')" onserverclick="CtnrTripDetail_Copy"
                                                runat="server">
                                                <img id="Img1" src="..\..\image\copy.png" width="15" height="15" border="0" alt="Copy exact"
                                                    title="Copy exact" runat="server" /></a> <a id="A1" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                        onclick="return confirm('Confirm copy with reverse address?')" onserverclick="CtnrTripDetail_CopyRA"
                                                        runat="server">
                                                        <img id="Img2" src="..\..\image\copy.png" width="15" height="15" border="0" alt="Copy reverse address"
                                                            title="Copy reverse address" runat="server" /></a> <a id="A2" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                onserverclick="CtnrTripDetail_Detour" runat="server">
                                                                <img id="Img3" src="..\..\image\detour.png" width="15" height="15" border="0" alt="Detour"
                                                                    title="Detour" runat="server" /></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                        onclick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm Void?')"
                                                                        onserverclick="CtnrTripDetail_Delete" runat="server">
                                                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
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
        <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">                                
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>

