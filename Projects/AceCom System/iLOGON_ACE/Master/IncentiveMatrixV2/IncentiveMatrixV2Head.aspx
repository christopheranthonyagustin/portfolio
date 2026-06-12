<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncentiveMatrixV2Head.aspx.cs" Inherits="iWMS.Web.Master.IncentiveMatrixV2.IncentiveMatrixV2Head" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>IncentiveMatrixCTSHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">

    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" type="text/javascript">
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ClientDataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="INCTHeadEdit" ImageUrl="..\..\image\pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit INCTHead"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="ldAdd" ImageUrl="..\..\image\add.png" Width="15"
                                        Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Add"
                                        OnClick="ldAdd_Click" CausesValidation="False"></asp:ImageButton>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="INCTHEAD_Delete" runat="server">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                            runat="server"></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="pergradedescr" SortExpression="pergradedescr" HeaderText="PersonnelGrade">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="shipmenttype" SortExpression="shipmenttype" HeaderText="ShipmentType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jobtype" SortExpression="jobtype" HeaderText="JobType"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="transporttype" SortExpression="transporttype" HeaderText="TransportType"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="billsizetype" SortExpression="billsizetype" HeaderText="BillSizeType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Containersizedescr" SortExpression="Containersizedescr" HeaderText="ContainerSize">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillOption1" SortExpression="BillOption1" HeaderText="BillOption1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="incentivemethod" SortExpression="incentivemethod" HeaderText="IncentiveMethod">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="effectivedate" SortExpression="effectivedate" HeaderText="EffectiveDate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tieroption" SortExpression="tieroption" HeaderText="TierOption">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" SortExpression="StatusColourCode" HeaderText="StatusColourCode" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
