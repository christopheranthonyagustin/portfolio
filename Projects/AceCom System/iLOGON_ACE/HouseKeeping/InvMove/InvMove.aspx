<%@ Page Language="c#" CodeBehind="InvMove.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.InvMove.InvMove" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvMove</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="MovBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <table border="0" cellspacing="5" cellpadding="5" width="100%">
            <tr>
                <td class="pagetitle">
                    <asp:Label ID="Lbl" runat="server" Text="" ForeColor="Black" Font-Bold="true" Visible="true"></asp:Label>
                </td>
                <td align="right">
                    <asp:Button ID="MovBtn" CssClass="white" runat="server" OnClick="MoveBtn_Click" Visible="true" ValidationGroup="valgrp"
                        Text="Move" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div style="height: 50%" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound">
                <%--<ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" >
                    </ClientSettings>--%>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="true"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn AllowFiltering="false" AllowSorting="false">
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="acid" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" ItemStyle-Wrap="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skuid" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skucode" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skudescr2" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loccode" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno1" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno2" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="false" ItemStyle-Width="175px" HeaderText="SKU/Description"
                            SortExpression="skucode">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skucode") %>'
                                    ID="SkuCodeLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skudescr2") %>'
                                    ID="DescrLbl" />
                            </ItemTemplate>
                            <ItemStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                Font-Strikeout="False" Font-Underline="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Location" SortExpression="loccode" AllowFiltering="false" AllowSorting="false">
                            <HeaderTemplate>
                                Location
                            <br />
                                <a id="lnkmassLoccode" onserverclick="Control_Fill" runat="server" class="RGridHeader_CUSTOM">SameLocation</a>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="right">From :&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "loccode") %>'
                                                ID="FromLocCodeLbl" /><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">To :&nbsp;
                                        <asp:RequiredFieldValidator ID="ToLocCodeTxtReqVal" runat="server" ValidationGroup="valgrp" ControlToValidate="ToLocCodeCB" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <%--<asp:TextBox runat="server" Width="180px" ID="ToLocCodeTxt" BackColor="Yellow"></asp:TextBox>--%>
                                            <telerik:RadComboBox runat="server" Width="180px" ID="ToLocCodeCB" BackColor="Yellow"
                                                EnableLoadOnDemand="true" OnItemsRequested="ToLocCodeCB_ItemsRequested">
                                            </telerik:RadComboBox>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="TUNO1" SortExpression="tuno1" AllowFiltering="false" AllowSorting="false">
                            <HeaderTemplate>
                                TUNO1
                            <br />
                                <a id="lnkmassTu1" onserverclick="Control_Fill" runat="server" class="RGridHeader_CUSTOM">SameTUNO1</a>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="right">From :&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>'
                                                ID="FromTu1Lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">To :&nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" Width="80px" ID="ToTu1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>' OnTextChanged="ToTu1Txt_TextChanged" AutoPostBack="true">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="TUNO2" SortExpression="tuno2" AllowFiltering="false" AllowSorting="false">
                            <HeaderTemplate>
                                TUNO2
                            <br />
                                <a id="lnkmassTu2" onserverclick="Control_Fill" runat="server" class="RGridHeader_CUSTOM">SameTUNO2</a>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="right">From :&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tuno2") %>'
                                                ID="FromTu2Lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">To :&nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" Width="80px" ID="ToTu2Txt" Text='<%# DataBinder.Eval(Container.DataItem, "tuno2") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Move Qty" SortExpression="qty" AllowFiltering="false" AllowSorting="false">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" Width="80px" ID="QtyTxt" BackColor="Yellow" Text='<%# DataBinder.Eval(Container.DataItem, "availuomqty2", 
											    "{0:0.###}")%>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HeaderText="MoveUOM"
                            SortExpression="uom" AllowFiltering="false" AllowSorting="false">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom2") %>'
                                                ID="FromUom2Lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList runat="server" ID="UOMList">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="MoveDate" AllowFiltering="false" AllowSorting="false">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDatePicker ID="MoveDateDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Width="150px">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="availuomqty2" SortExpression="availuomqty2" HeaderText="MovableQty"
                            DataFormatString="{0:0.###}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="availuomqty2" SortExpression="availuomqty2" HeaderText="Available"
                            DataFormatString="{0:0.###}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="ReceiveDate"
                            DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot7value" HeaderText="lot7" SortExpression="lot7value">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot8value" HeaderText="lot8" SortExpression="lot8value">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot9" HeaderText="lot9" SortExpression="lot9">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot10" HeaderText="lot10" SortExpression="lot10">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot11" HeaderText="lot11" SortExpression="lot11">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot12" HeaderText="lot12" SortExpression="lot12">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot13" HeaderText="lot13" SortExpression="lot13">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot14" HeaderText="lot14" SortExpression="lot14">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot15" HeaderText="lot15" SortExpression="lot15">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot16" HeaderText="lot16" SortExpression="lot16">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot17" HeaderText="lot17" SortExpression="lot17">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot18" HeaderText="lot18" SortExpression="lot18">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot19" HeaderText="lot19" SortExpression="lot19">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot20" HeaderText="lot20" SortExpression="lot20">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="allocateduomqty2" SortExpression="allocateduomqty2" HeaderText="Allocated"
                            DataFormatString="{0:0.###}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pickeduomqty2" SortExpression="pickeduomqty2" HeaderText="Picked"
                            DataFormatString="{0:0.###}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="helduomqty2" SortExpression="helduomqty2" HeaderText="Held"
                            DataFormatString="{0:0.###}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="onhanduomqty2" SortExpression="onhanduomqty2" HeaderText="OnHand"
                            DataFormatString="{0:0.###}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="uom2" SortExpression="uom2" HeaderText="UOM">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Remarks" AllowFiltering="false" AllowSorting="false">
                            <HeaderTemplate>
                                Remarks
                            <br />
                                <a id="lnkmassRemarks" onserverclick="Control_Fill" runat="server" class="RGridHeader_CUSTOM">SameRemarks</a>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" Width="80px" ID="RemarksTxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="site" SortExpression="site" Display="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zonedescr" SortExpression="zonedescr" HeaderText="Zone">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="availwalluomqty2" Display="false" DataFormatString="{0:0.###}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="allowmoveallocated" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loccat" Display="false"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>

        <table border="0" cellspacing="5" cellpadding="5" width="100%">
                <tr>
                    <td align="right">
                        <asp:Button ID="ExcelBtn" runat="server" Text="Export Excel" OnClick="ExcelBtn_Click" UseSubmitBehavior="false" CssClass="green" ToolTip="Manifest Excel" />
                    </td>
                </tr>
            </table>
        <div style="height: 30%" id="div-datagrid">
            <telerik:RadGrid ID="MessageDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnExcelExportCellFormatting="MessageDG_ExcelExportCellFormatting">
                <%--<ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>--%>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <%--<ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>--%>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="No">
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="remark" HeaderText="Remark">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="account" HeaderText="Account">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sku" HeaderText="SKU/Description">
                            <HeaderStyle Wrap="true"></HeaderStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot" HeaderText="LotID">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loc" HeaderText="Location">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="qty" HeaderText="MoveQty" DataFormatString="{0:0.##}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="uom" HeaderText="MoveUOM">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="movedate" HeaderText="MoveDate">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="site" HeaderText="Site">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zone" HeaderText="Zone">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="moveremarks" HeaderText="MoveRemarks">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tu1" HeaderText="TUNO1">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tu2" HeaderText="TUNO2">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot7value" HeaderText="lot7" SortExpression="lot7value">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot8value" HeaderText="lot8" SortExpression="lot8value">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot9" HeaderText="lot9" SortExpression="lot9">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot10" HeaderText="lot10" SortExpression="lot10">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot11" HeaderText="lot11" SortExpression="lot11">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot12" HeaderText="lot12" SortExpression="lot12">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot13" HeaderText="lot13" SortExpression="lot13">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot14" HeaderText="lot14" SortExpression="lot14">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot15" HeaderText="lot15" SortExpression="lot15">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot16" HeaderText="lot16" SortExpression="lot16">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot17" HeaderText="lot17" SortExpression="lot17">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot18" HeaderText="lot18" SortExpression="lot18">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot19" HeaderText="lot19" SortExpression="lot19">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot20" HeaderText="lot20" SortExpression="lot20">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>

        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground" X="300" Y="100">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>
