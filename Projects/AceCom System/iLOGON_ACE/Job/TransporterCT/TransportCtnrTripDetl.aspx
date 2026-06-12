<%@ Page Language="c#" CodeBehind="TransportCtnrTripDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterCT.TransportCtnrTripDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportCtnrTripDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

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

</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle" align="left">
                &nbsp;
                <asp:Button ID="MassChangeResource" runat="server" CssClass="detailButton" OnClick="ChangeResourceBtn_Click"
                    Width="150px" Text="ChangeResource" />
                &nbsp;
                <asp:Button ID="MassChangeBtn" runat="server" CssClass="detailButton" OnClick="MassChangeBtn_Click"
                    Width="150px" Text="ChangeSchedule" />
                &nbsp;
                <asp:Button ID="GenerateTripBtn" runat="server" CssClass="detailButton" OnClick="GenerateTripBtn_Click"
                    Width="150px" Text="GenerateTrip" />
                &nbsp;
                <asp:Button ID="CompleteBtn" runat="server" CssClass="detailButton" OnClientClick="return confirm('Confirm Complete?')"
                    Width="150px" OnClick="CompleteBtn_Click" Text="Complete" />
                &nbsp;
                <asp:Button ID="VoidAllBtn" runat="server" CssClass="detailButton" OnClientClick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm VoidAll?')"
                    Width="150px" OnClick="VoidAllBtn_Click" Text="Void" />
                &nbsp;
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Item" Visible="False" CssClass="detailButton"
                    Width="150px" OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                    Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
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
                            <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" AllowFiltering="true"
                                ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Time" DataField="fracttime" AllowFiltering="true"
                                ColumnGroupName="fracttime" SortExpression="fracttime" UniqueName="fracttime"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status"
                                HeaderText="Status" />
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                                Display="false" ColumnGroupName="type" SortExpression="type" UniqueName="type"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Type" HeaderStyle-HorizontalAlign="Left"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:DropDownList ID="TypeList" runat="server" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" OnSelectedIndexChanged="TypeList_SelectedIndexChanged"
                                        Width="150px" AutoPostBack="True" />
                                    <asp:HiddenField ID="TypeTxt" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="EqpType" DataField="eqptypedescr" AllowFiltering="true"
                                ColumnGroupName="eqptypedescr" SortExpression="eqptypedescr" UniqueName="eqptypedescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EqpRef" DataField="ctnrno" AllowFiltering="true"
                                ColumnGroupName="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SealNo" DataField="sealno" AllowFiltering="true"
                                ColumnGroupName="sealno" SortExpression="sealno" UniqueName="sealno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="ctnrtype" AllowFiltering="true"
                                ColumnGroupName="ctnrtype" SortExpression="ctnrtype" UniqueName="ctnrtype" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BookingRef" DataField="bookingref" AllowFiltering="true"
                                ColumnGroupName="bookingref" SortExpression="bookingref" UniqueName="bookingref"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BookingRefOriginal" DataField="bookingreforiginal"
                                AllowFiltering="true" ColumnGroupName="bookingreforiginal" SortExpression="bookingreforiginal"
                                UniqueName="bookingreforiginal" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Trip" DataField="tripcount" AllowFiltering="true"
                                ColumnGroupName="tripcount" SortExpression="tripcount" UniqueName="tripcount"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FrSvcPt" DataField="frservicept" AllowFiltering="true"
                                ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true"
                                ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToSvcPt" DataField="toservicept" AllowFiltering="true"
                                ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true"
                                ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" AllowFiltering="true"
                                ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="perid" SortExpression="perid"
                                HeaderText="PerId" />
                            <telerik:GridBoundColumn HeaderText="AssignDriver" DataField="pername" AllowFiltering="true"
                                ColumnGroupName="pername" SortExpression="pername" UniqueName="pername" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailerno" AllowFiltering="true"
                                ColumnGroupName="trailerno" SortExpression="trailerno" UniqueName="trailerno"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="true"
                                ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SchTime" DataField="frexptime" AllowFiltering="true"
                                ColumnGroupName="frexptime" SortExpression="frexptime" UniqueName="frexptime"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToActTime" DataField="toacttime" AllowFiltering="true"
                                ColumnGroupName="toacttime" SortExpression="toacttime" UniqueName="toacttime"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Driver" DataField="driver" AllowFiltering="true"
                                ColumnGroupName="driver" SortExpression="driver" UniqueName="driver" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TrailerLoc" DataField="traileraddr" AllowFiltering="true"
                                ColumnGroupName="traileraddr" SortExpression="traileraddr" UniqueName="traileraddr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GeoLat" DataField="trailergeolat" AllowFiltering="true"
                                ColumnGroupName="trailergeolat" SortExpression="trailergeolat" UniqueName="trailergeolat"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GeoLng" DataField="trailergeolng" AllowFiltering="true"
                                ColumnGroupName="trailergeolng" SortExpression="trailergeolng" UniqueName="trailergeolng"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PickDropDate" DataField="trailerdate" AllowFiltering="true"
                                ColumnGroupName="trailerdate" SortExpression="trailerdate" UniqueName="trailerdate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
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
