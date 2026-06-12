<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrSOIncomingCtnr.aspx.cs"
    Inherits="iWMS.Web.Inbound.CtnrSO.CtnrSOIncomingCtnr" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head runat="server" id="Head1">
    <title>StoringOrderIncomingCtnr</title>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("lineChkbx").checked = true; // for checking the checkboxes
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("lineChkbx").checked = false; // for unchecking the checkboxes
                    }
                }  
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body style="border-spacing: 0px;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td> 
                    <asp:Button runat="server" ID="SearchBtn" Text="Search" OnClick="SearchBtn_Click"
                        UseSubmitBehavior="false" CssClass="white" OnClientClick="disableBtn(this.id)"/>
                    &nbsp; 
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ButtonExcel_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td style="width: 100px" align="left">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td style="width: 850px" align="left">
                    <asp:Label ID="Refreshlb" runat="server">Refresh</asp:Label>
                    <telerik:RadDropDownList ID="RefreshList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr" DataValueField="Item"
                        OnSelectedIndexChanged="RefreshList_SelectedIndexChanged" AutoPostBack="true">
                    </telerik:RadDropDownList>
                </td>
            </tr>
        </table>
        &nbsp;<asp:Label ID="lblProcessID" runat="server" Visible="False" />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab ID="MainTab" Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="PendingCtnrTab" Text="Pending Containers" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="MainRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
                    EnableLinqExpressions="False" AllowPaging="True" Skin="Office2007" OnColumnCreated="ResultDG_ColumnCreated"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false" Height="20px"></AlternatingItemStyle>
                    <ItemStyle Wrap="false" Height="20px"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Center" Width="10px"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Center" Width="10px" />
                                <HeaderTemplate>
                                    &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="lineChkbx" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="PendingCtnrRadPageView">
                <br />
                <asp:Label ID="JobLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
                <telerik:RadGrid ID="ResultDG_PendingCtnr" runat="server" AutoGenerateColumns="false"
                    EnableLinqExpressions="False" AllowPaging="True" Skin="Office2007"
                    OnNeedDataSource="ResultDG_PendingCtnr_NeedDataSource" Width="50%">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false" Height="20px"></AlternatingItemStyle>
                    <ItemStyle Wrap="false" Height="20px"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="ctnrno" 
                                SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SizeType" DataField="billsizetypedescr"
                                SortExpression="billsizetypedescr" UniqueName="billsizetypedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
