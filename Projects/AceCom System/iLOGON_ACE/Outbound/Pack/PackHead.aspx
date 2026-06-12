<%@ Page Language="c#" CodeBehind="PackHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.PackHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PackHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/checkbox.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>

<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table style="width: 100%; height: 30px">
            <tr>
                <td>
                   <asp:Button ID="PackedBtn" runat="server" Text="Packed" OnClick="PackedBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Packing Completed" UseSubmitBehavior="false" CssClass="WHITE" />
                    &nbsp;
                    <asp:Button ID="DOBtn" runat="server" Text="DO" OnClick="DOBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Print DO" UseSubmitBehavior="false" CssClass="blue" Enabled="false" />
                    &nbsp;
                    <asp:Button ID="PackingListBtn" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Packing&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List" OnClick="PackingListBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Packing List" UseSubmitBehavior="false" CssClass="LONGLABELBLUE" Enabled="false" />
                    &nbsp;
                     <asp:Button ID="CalculatedVolBtn" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Calculate&nbsp;&nbsp;&nbsp;&nbsp; Vol & Wt" OnClick="CalculatedVolBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Calculated Vol & Wt" UseSubmitBehavior="false" CssClass="LONGLABELWHITE" />
                    &nbsp;
                     <asp:Button ID="ReopenBtn" runat="server" Text="Reopen" OnClick="ReopenBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Reopen" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                    <asp:Button ID="GatePassBtn" runat="server" Text="Gate Pass" OnClick="GatePassBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="blue" />
                     &nbsp;
                    <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Class="white" />
                    <br />
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="false" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
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
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icons" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <asp:Label ID="Pack1Sku1CtnLbl" runat="server"></asp:Label>
                                <asp:Label ID="PackIn1Lbl" runat="server"></asp:Label>
                                <asp:Label ID="FinalizeLbl" runat="server"></asp:Label>
                                <asp:Label ID="DeleteLbl" runat="server"></asp:Label>
                            <ItemStyle Wrap="False"></ItemStyle>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="acid" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="PackNo" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isid" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="IssueNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cusref" SortExpression="cusref" HeaderText="Customer Reference" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shipmentno" SortExpression="shipmentno" HeaderText="Shipmentno" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dono" SortExpression="dono" HeaderText="DONo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPackage" SortExpression="NoOfPackage" HeaderText="NoOfPackage" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false" DataFormatString="{0:#.####}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPallet" SortExpression="NoOfPallet" HeaderText="NoOfPallet" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false" DataFormatString="{0:#.####}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TotalPackagePallet" SortExpression="TotalPackagePallet" HeaderText="Package+Pallet" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false" DataFormatString="{0:#.####}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isstatus" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
