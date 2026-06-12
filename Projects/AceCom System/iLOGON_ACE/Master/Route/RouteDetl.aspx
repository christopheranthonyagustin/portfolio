<%@ Page Language="c#" CodeBehind="RouteDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Route.RouteDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RouteDetl</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .MostInnerHeaderStyle
        {
            background: lightblue !important;
            font-size: 12px !important;
            color: white !important; /*add more style definitions here*/
        }
        .MostInnerItemStyle
        {
            background: lightgrey  !important;
            color: black !important; /*add more style definitions here*/
        }
        .MostInnerAlernatingItemStyle
        {
            background: white !important;
            color: black !important; /*add more style definitions here*/
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="60%" border="0">
        <tr>
            <td align="left">
                <br />
                &nbsp;<asp:Button ID="AddBtn" runat="server" Text="NewLine" CssClass="detailButton"
                    OnClick="AddBtn_Click"></asp:Button><br />
                <br />
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        OnDetailTableDataBind="ResultDG_DetailTableDataBind" OnPreRender="ResultDG_PreRender" Height="92%">
        <ClientSettings AllowExpandCollapse="true"> 
            <Scrolling AllowScroll="true" ScrollHeight="440px" SaveScrollPosition="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50" Name="RouteDetail"
                HierarchyLoadMode="Client">
                <PagerStyle Mode="NextPrevAndNumeric" />
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="RouteCharge" Width="100%" SkinID="Telerik">
                        <HeaderStyle CssClass="MostInnerHeaderStyle" ForeColor="black" />
                        <ItemStyle CssClass="MostInnerItemStyle" />
                        <AlternatingItemStyle CssClass="MostInnerAlernatingItemStyle" />
                        <Columns>
                        <telerik:GridTemplateColumn HeaderStyle-Width="70px">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                    ToolTip="Edit Charge" DescriptionUrl='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                    Width="15" Height="15" AlternateText="Edit" OnClick="ResultDG_EditCharge" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="RouteCharge_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Charge"
                                        title="Delete Charge" runat="server" /></a>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Charge">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="billingmethod" SortExpression="billingmethod"
                            HeaderText="BillingMethod">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="unitrate" SortExpression="unitrate" HeaderText="UnitRate"
                            DataFormatString="{0:#,0.00}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridTemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                            ToolTip="Edit" DescriptionUrl='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                            Width="15" Height="15" AlternateText="Edit" OnClick="ResultDG_Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" ID="AddCharge" ImageUrl="..\..\image\add.png" ToolTip="Add Charge"
                            DescriptionUrl='<%#DataBinder.Eval(Container,"DataItem.id")%>' Width="15" Height="15"
                            AlternateText="Add Charge" OnClick="ResultDG_AddCharge" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="Route_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Route"
                                title="Delete Route" runat="server" /></a>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="seqno" SortExpression="seqno" HeaderText="SeqNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
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
                <telerik:GridBoundColumn DataField="tptmode" SortExpression="tptmode" HeaderText="TptMode">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="duration" SortExpression="duration" HeaderText="Duration">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="durationuom" SortExpression="durationuom" HeaderText="DurationUOM">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                    AllowFiltering="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                    AllowFiltering="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                    AllowFiltering="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
