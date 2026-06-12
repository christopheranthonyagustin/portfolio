<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutgoingShipmentContainerHead.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.OutgoingShipmentContainerHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>ContainerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/checkbox.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/checkbox.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ContainerSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="false" OnItemDataBound="ResultDG1_ItemDataBound" OnNeedDataSource="ResultDG1_NeedDataSource">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="GoodsIssueEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                    OnClick="GoodsIssueEdit_Click" CausesValidation="False"></asp:ImageButton>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="id" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrno" HeaderText="ContainerNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrtype" HeaderText="Type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CtnrSize" HeaderText="Size">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CargoPackingType" HeaderText="CargoPackingType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CargoPackingTypeDescr" HeaderText="CargoPackingTypeDescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrwt" HeaderText="ctnrwt">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrsealno" HeaderText="ctnrsealno">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="src" HeaderText="src">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sisid" HeaderText="sisid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" HeaderText="status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" HeaderText="adduser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" HeaderText="adddate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" HeaderText="edituser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" HeaderText="editdate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isstatusdescr" HeaderText="isstatusdescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrvol" HeaderText="ctnrvol">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="frservicept" HeaderText="frservicept">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="toservicept" HeaderText="toservicept">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tptorderno" HeaderText="tptorderno">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="goodswt" HeaderText="goodswt">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="goodsvol" HeaderText="goodsvol">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="remarks" HeaderText="remarks">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrstatus" HeaderText="ctnrstatus" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CtnrStatusDescr" HeaderText="CtnrStatusDescr" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DockCode" HeaderText="DockCode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateInDate" HeaderText="ExpGateInDate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActGateInDate" HeaderText="ActGateInDate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateOutDate" HeaderText="ExpGateOutDate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActGateOutDate" HeaderText="ActGateOutDate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPkCtn" HeaderText="NoOfPkCtn">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CtnrTypeSize" HeaderText="CtnrTypeSize">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrsitecode" HeaderText="ctnrsitecode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrsitename" HeaderText="ctnrsitename">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrsiteaddr" HeaderText="ctnrsiteaddr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="number" HeaderText="number">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="istype" HeaderText="istype">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isstatus" HeaderText="isstatus">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expecteddate" HeaderText="expecteddate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shname" HeaderText="shname">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="istypedescr" HeaderText="istypedescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPallet" HeaderText="NoOfPallet">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
