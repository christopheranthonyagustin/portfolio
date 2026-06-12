<%@ Page Language="c#" CodeBehind="PackCtn.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.PackCtn" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Pack Packing Unit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<script type="text/javascript">
    function OnClientClose(sender, args) {
        document.location.href = document.location.href;
    }

    function selectAll(id) {
        var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
        var row = masterTable.get_dataItems();
        if (id.checked == true) {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("Inchk").checked = true;
            }
        }
        else {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("Inchk").checked = false;
            }
        }
    }
</script>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            AutoPostBack="True" SelectedIndex="0" CausesValidation="False"
            Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Packing unit summary" Value="0" readonly="readonly" runat="server"
                    Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Items inside packing unit" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0"
            CssClass="pagetitle">
            <telerik:RadPageView runat="server" Height="400px" ID="HeaderRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" style="height: 1px">
                    <tr>
                        <td align="left">
                            <br />
                            <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Class="white" />
                            <asp:Button ID="CartonBtn" runat="server" CssClass="white"
                                Text="New" OnClick="CartonBtn_Click"></asp:Button>&nbsp;
                            <asp:Button ID="EditBtn" runat="server" Visible="True" CssClass="white"
                                Text="Edit" OnClick="EditBtn_Click"></asp:Button>&nbsp;
                            <asp:Button ID="PackListBtn88" runat="server" CssClass="blue"
                                Text="PackList" OnClick="PackListBtn_Click"></asp:Button>&nbsp;
                            <asp:Button ID="Dobtn" runat="server" CssClass="blue"
                                Text="DO" OnClick="Dobtn_Click"></asp:Button>&nbsp;
                            <asp:Button ID="PULabelbtn" runat="server" CssClass="blue"  OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                Text="PULabel" OnClick="PULabelbtn_Click"></asp:Button>&nbsp;
                            <asp:Button ID="ExcelBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="green" ToolTip="Manifest Excel" />

                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
                    CssClass="errorLabel"></asp:Label>
                <div id="div-datagrid" style="height: 83%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" AllowMultiRowSelection="true"
                        AllowFilteringByColumn="false" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" AllowFilteringByColumn="false">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <%--<telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                                </telerik:GridClientSelectColumn>--%>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Wrap="false" HeaderStyle-Width="40px" ItemStyle-Wrap="false" ItemStyle-Width="30px">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Inchk" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>

                                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Packing Unit?')"
                                            onserverclick="PackCtn_Delete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Packing Unit"
                                                runat="server"></a>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn AllowFiltering="false">
                                    <HeaderTemplate>
                                        No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="PackingUnitID"
                                    ItemStyle-Wrap="false" AllowFiltering="true" AllowSorting="false" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ref" SortExpression="ref" HeaderText="PackUnitNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="type" Display="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="length" SortExpression="length" HeaderText="Length" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="width" SortExpression="width" HeaderText="Width" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="height" SortExpression="height" HeaderText="Height" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="wt" SortExpression="wt" HeaderText="Weight" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="netwt" SortExpression="netwt" HeaderText="NetWeight" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks" CurrentFilterFunction="Contains" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pergradedescr" SortExpression="pergradedescr" HeaderText="PerGrade" CurrentFilterFunction="Contains" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" CurrentFilterFunction="EqualTo" AllowFiltering="false"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" CurrentFilterFunction="Contains" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" CurrentFilterFunction="EqualTo" AllowFiltering="false"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AllowFiltering="false"
                                    HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ItemsinsidepackingunitRadPageView" />
        </telerik:RadMultiPage>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip2_TabClick"
            AutoPostBack="True" SelectedIndex="0" CausesValidation="False"
            Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Item not packed" Value="0" readonly="readonly" runat="server"
                    Selected="True">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0"
            CssClass="pagetitle">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView2">
                <telerik:RadGrid ID="PTDetlResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    AllowMultiRowSelection="true" OnNeedDataSource="PTDetlResultDG_NeedDataSource" AllowFilteringByColumn="false"
                    AllowPaging="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" AllowAutomaticInserts="True">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" AllowFilteringByColumn="false" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Wrap="false" HeaderStyle-Width="40px" ItemStyle-Wrap="false" ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="No" AllowFiltering="false"
                                HeaderText="No" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
