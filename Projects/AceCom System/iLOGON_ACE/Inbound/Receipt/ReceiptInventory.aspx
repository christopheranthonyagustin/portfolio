<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptInventory.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.ReceiptInventory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true"
            Skin="Metro">
                  <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="number" AllowFiltering="false">
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Site" DataField="sitecode"
                        SortExpression="sitecode" UniqueName="sitecode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode"
                        SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TU1" DataField="tuno1"
                        SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TU2" DataField="tuno2"
                        SortExpression="tuno2" UniqueName="tuno1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OnHand" DataField="OnhandQty"
                        SortExpression="OnhandQty" UniqueName="OnhandQty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Available" DataField="availableqty"
                        SortExpression="availableqty" UniqueName="availableqty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Unavailable" DataField="unavailableqty" Reorderable="true"
                         SortExpression="unavailableqty" UniqueName="unavailableqty">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true"
                        SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true"
                        SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true"
                        SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true"
                        SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true"
                        SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true"
                        SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true"
                        SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true"
                        SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true"
                        SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true"
                        SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true"
                        SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true"
                        SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" AllowFiltering="true"
                        SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" AllowFiltering="true"
                        SortExpression="lot14" UniqueName="lot14" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" AllowFiltering="true"
                        SortExpression="lot15" UniqueName="lot15" Reorderable="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
