<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHead.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.ContainerHead" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>ReceiptContainerSearch</title>
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
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="false" 
                 AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                 AllowPaging="true" Skin="Metro"
               OnNeedDataSource="ResultDG1_NeedDataSource">
                <GroupingSettings CaseSensitive="false" />
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
                                <asp:ImageButton runat="server" Visible="True" ID="GoodsReceiptEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                    OnClick="GoodsReceiptEdit_Click" CausesValidation="False"></asp:ImageButton>
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
                        <telerik:GridBoundColumn Display="False" DataField="rcid" HeaderText="rcid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="sitecode" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="rcstatus" >
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn> --%>
                        <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="SealNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>                         
                         <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReceiptNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="Size/Type"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rctypedescr" SortExpression="rctypedescr" HeaderText="Receipt Type"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="ContainerWt"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrvol" SortExpression="ctnrvol" HeaderText="ContainerVol"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="GoodsWt"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="GoodsVol"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expecteddate" SortExpression="expecteddate" HeaderText="ExpectedDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CargoPackingType" SortExpression="CargoPackingType"
                            HeaderText="CargoPackingType" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CtnrStatus" SortExpression="CtrnStatus" HeaderText="CtrnStatus"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CtnrSize" SortExpression="CtrnSize" HeaderText="CtrnSize"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DockCode" SortExpression="DockCode" HeaderText="DockCode"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActGateInDate" SortExpression="ActGateInDate"
                            HeaderText="ActGateInDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActGateOutDate" SortExpression="ActGateOutDate"
                            HeaderText="ActGateOutDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateInDate" SortExpression="ExpGateInDate"
                            HeaderText="ExpGateInDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateOutDate" SortExpression="ExpGateOutDate"
                            HeaderText="ExpGateOutDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
