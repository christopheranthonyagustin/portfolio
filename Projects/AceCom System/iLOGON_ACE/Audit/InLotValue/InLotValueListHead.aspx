<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<%@ Page Language="c#" CodeBehind="InLotValueListHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InLotValue.InLotValueListHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InLotValueListHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
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
        <div id="div-datagrid" style="height: 100%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="16" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="250px">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="ReceiveEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="InLotValueID" SortExpression="InLotValueID" HeaderText="ID"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="inlotno" SortExpression="inlotno" HeaderText="InLotNo"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit No"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outeruom" SortExpression="outeruom" HeaderText="Outer Uom"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outerqty" SortExpression="outerqty" HeaderText="Outer Qty"
                            DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outerciffobamt" SortExpression="outerciffobamt" HeaderText="OuterCiffobAmt"
                            DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dutiableqty" SortExpression="dutiableqty" HeaderText="DutiAbleQty"
                            DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dutiableuom" SortExpression="dutiableuom" HeaderText="DutiAbleUom"
                            DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="abv" SortExpression="abv" HeaderText="Abv"
                            DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="abvuom" SortExpression="abvuom" HeaderText="Abv Uom"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy HH:MM:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy HH:MM:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
