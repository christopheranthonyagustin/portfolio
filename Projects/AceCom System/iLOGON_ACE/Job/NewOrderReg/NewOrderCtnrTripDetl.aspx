<%@ Page Language="c#" CodeBehind="NewOrderCtnrTripDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.NewOrderReg.NewOrderCtnrTripDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>NewOrderCtnrTripDetl</title>
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
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" OnPreRender="ResultDG_PreRender"
                    Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                    Height="100%">
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50" Name="RouteDetail" HierarchyLoadMode="Client">
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <DetailTables>
                            <telerik:GridTableView DataKeyNames="id" Name="jbctnrtrip" Width="100%" SkinID="Telerik" >
                                <HeaderStyle CssClass="MostInnerHeaderStyle" ForeColor="black" />
                                <ItemStyle CssClass="MostInnerItemStyle" />
                                <AlternatingItemStyle CssClass="MostInnerAlernatingItemStyle" />
                                <BatchEditingSettings EditType="Cell" />
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <HeaderTemplate>
                                            <label id="completelbl">
                                            </label>
                                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="FrExpDate" DataField="frexpdate" AllowFiltering="true"
                                        ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ToExpDate" DataField="toexpdate" AllowFiltering="true"
                                        ColumnGroupName="toexpdate" SortExpression="toexpdate" UniqueName="toexpdate"
                                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="FrActDate" DataField="fractdate" AllowFiltering="true"
                                        ColumnGroupName="fractdate" SortExpression="fractdate" UniqueName="fractdate"
                                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ToActDate" DataField="toactdate" AllowFiltering="true"
                                        ColumnGroupName="toactdate" SortExpression="toactdate" UniqueName="toactdate"
                                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status"
                                        HeaderText="Status" />
                                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                                        ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true">
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
                                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="true"
                                        ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="False" DataField="jbceqptype" SortExpression="jbceqptype" />
                                    <telerik:GridBoundColumn Display="False" DataField="jbid" SortExpression="jbid" />
                                    <telerik:GridBoundColumn Display="False" DataField="jbctnrid" SortExpression="jbctnrid" />
                                    <telerik:GridBoundColumn Display="False" DataField="reasoncode" SortExpression="reasoncode" />
                                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor" />
                                </Columns>
                            </telerik:GridTableView>
                        </DetailTables>
                        <Columns>
                            <telerik:GridTemplateColumn>
                                <ItemTemplate>
                                    <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="CtnrTripDetail_Edit" runat="server">
                                        <img id="Img4" src="..\..\image\pencil.gif" width="15" height="15" border="0" alt="Edit" title="Edit" runat="server" />
                                    </a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="Route">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="frservicept" SortExpression="frservicept" HeaderText="FrSvcPt">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FrAddr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="frcountrydescr" SortExpression="frcountrydescr"
                                HeaderText="FrCountry">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="frportdescr" SortExpression="frportdescr" HeaderText="FrPort">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="frfreedays" SortExpression="frfreedays" HeaderText="FrFreeDays"
                                AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="toservicept" SortExpression="toservicept" HeaderText="ToSvcPt">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tocountrydescr" SortExpression="tocountrydescr"
                                HeaderText="ToCountry">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="toportdescr" SortExpression="toportdescr" HeaderText="ToPort">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tofreedays" SortExpression="tofreedays" HeaderText="ToFreeDays"
                                AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="triptype" SortExpression="triptype" HeaderText="TripType">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
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
