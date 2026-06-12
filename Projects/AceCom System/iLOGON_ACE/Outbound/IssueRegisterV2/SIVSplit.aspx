<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SIVSplit.aspx.cs" Inherits="iWMS.Web.Outbound.IssueRegisterV2.SIVSplit" %>


<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Split</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self" />
    
</head>

<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                <asp:Label ID="DetailLbl" runat="server"></asp:Label>&nbsp;<br />
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="center">
                            &nbsp;<asp:ImageButton ID="AlertImgBtn" runat="server" ImageUrl="../../Image/alert.gif"
                                Visible="False" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle">
                            </asp:ImageButton>
                            <asp:Label ID="DescrLbl" runat="server" Font-Bold="True"></asp:Label>
                            <br />
                            <input id="HIDDEN_SkuId" type="hidden" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <telerik:RadButton ID="SearchBtn" runat="server" Skin="WebBlue" Text="Search"
                                OnClick="SearchBtn_Click"></telerik:RadButton>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellspacing="2" cellpadding="2">
                                <tr>
                                    <td>
                                        <asp:Label ID="SkuUpcLbl" runat="server">SKU/UPC</asp:Label>:
                                        <asp:RequiredFieldValidator ID="SkuReq" runat="server" ControlToValidate="TEXT_SkuCode"
                                            ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <br>
                                            <telerik:RadTextBox ID="TEXT_SkuCode" runat="server" AutoPostBack="True" BackColor="Yellow"
                                                Width="155" ReadOnly="True">
                                            </telerik:RadTextBox>
                                            <br></br>
                                        </br>
                                    </td>
                                    <td>
                                        <asp:Label ID="QtyLbl" runat="server">Qty</asp:Label>:
                                        <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="INTEGER_Qty"
                                            ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="INTEGER_Qty"
                                            ErrorMessage="#" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><asp:CompareValidator
                                                ID="QtyValueVal" runat="server" ControlToValidate="INTEGER_Qty" ErrorMessage="#"
                                                Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator><br>
                                        <telerik:RadTextBox ID="INTEGER_Qty" runat="server" BackColor="Yellow" Width="155"
                                            ReadOnly="True">
                                        </telerik:RadTextBox>
                                    </td>                                  
                                    <td>
                                        <asp:Label ID="UomLbl" runat="server">UOM</asp:Label>:<input id="HIDDEN_Uom" type="hidden"
                                            runat="server" /><br>
                                        <telerik:RadDropDownList ID="TEXT_Uom" runat="server" Width="155" Enabled="false">
                                        </telerik:RadDropDownList>
                                        <asp:TextBox ID="UomTxt" runat="server" Width="155" ReadOnly="True">Each</asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Panel ID="CartonPanel" runat="server">
                                            <asp:Label ID="Ctn_Cnt_Lbl" runat="server">CartonCount</asp:Label>:<input id="HIDDEN_Cartoncnt"
                                                type="hidden" runat="server" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CompareValidator
                                                ID="CartoncntVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_cartoncnt"
                                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            <br>
                                                <telerik:RadTextBox ID="INTEGER_cartoncnt" runat="server" Width="155">
                                                </telerik:RadTextBox>
                                            </br>
                                        </asp:Panel>
                                    </td>
                                    <td>
                                        <asp:Panel ID="ShelfLifePanel" runat="server">
                                            <asp:Label ID="ShelfLifeLbl" runat="server">Shelf Life</asp:Label>:
                                            <asp:CompareValidator ID="ShelfLifeVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_ShelfLife"
                                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            <br>
                                                <telerik:RadTextBox ID="INTEGER_ShelfLife" runat="server" Width="155">
                                                </telerik:RadTextBox>
                                            </br>
                                        </asp:Panel>
                                    </td>
                                    <asp:Panel ID="BomPanel" runat="server">
                                        <td>
                                            <asp:Label ID="BomQtyLbl" runat="server">BOM Qty</asp:Label>:
                                            <asp:CompareValidator ID="BomQtyVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_Qty"
                                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            <br>
                                                <telerik:RadTextBox ID="DOUBLE_BomQty" runat="server" Width="155">
                                                </telerik:RadTextBox>
                                            </br>
                                        </td>
                                        <td>
                                            <asp:Label ID="BomUomLbl" runat="server">BOM UOM</asp:Label>:<br>
                                            <telerik:RadDropDownList ID="TEXT_BomUom" runat="server">
                                            </telerik:RadDropDownList>
                                        </td>
                                    </asp:Panel>
                                    <td>
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="right">
                                        <asp:Panel ID="AvailQtyPanel" Visible="False" runat="server">
                                            <table cellspacing="1" cellpadding="1">
                                                <tr align="center">
                                                    <td colspan="2">
                                                        <asp:Label Style="z-index: 0" ID="SoftAllocationLbl" runat="server" CssClass="linkLabelBig">Soft Allocation Info</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr align="right">
                                                    <td>
                                                        <asp:Label ID="AvailQtyLbl" runat="server">Available Qty :</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAvailQty" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr align="right">
                                                    <td>
                                                        <asp:Label ID="AvailLHULbl" runat="server">LHU :</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAvailLHU" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr align="right">
                                                    <td>
                                                        <asp:Label ID="NoOfLocLbl" runat="server">Location :</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblNoOfLoc" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td colspan="2">
                                                        <asp:Label ID="lblAllocationStatus" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr align="right">
                                                    <td>
                                                        <asp:Label ID="AvailUOMLbl" runat="server">Available UOM :</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAvailUOM" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <asp:Panel ID="Loc_Vas_Rem1_Panel" runat="server">
                        <tr>
                            <td>
                                <table cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="RcDataLbl" runat="server">ReceivedDate</asp:Label><br>
                                            <telerik:RadDatePicker ID="DATE_rcvdate" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="WebBlue" Width="155">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:Label ID="LocLbl2" runat="server">Location</asp:Label>:
                                            <br>
                                            <telerik:RadTextBox ID="Issue_TEXT_LocCode" runat="server" Width="155">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="TU1_Lbl" runat="server">Tu1</asp:Label>:
                                            <br>
                                            <telerik:RadTextBox ID="TEXT_tuno1" runat="server" Width="155">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="TU2_Lbl" runat="server">Tu2</asp:Label>:
                                            <br>
                                            <telerik:RadTextBox ID="TEXT_tuno2" runat="server" Width="155">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td>
                            <table cellspacing="2" cellpadding="2">
                                <tr>
                                    <td colspan="3" class="style1">
                                        <asp:CheckBox Style="z-index: 0" ID="IssueAllCB" runat="server" Text="IssueAll" Checked="True"
                                            Visible="false"></asp:CheckBox>
                                    </td>
                                </tr>
                                <tr runat="server" id="ChildSKU_Pnl" visible="false">
                                    <td colspan="7" class="style1">
                                        <asp:CheckBox Style="z-index: 0" ID="IncChildSkuCB" runat="server" Text="Include Child SKU by " />
                                        <telerik:RadDropDownList ID="TEXT_ChildSkuLot" runat="server" Width="200" />
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="FrLot4Lbl" Visible="false" runat="server">FromLot4</asp:Label>
                                        <br />
                                        <telerik:RadTextBox ID="TEXT_fromlot4" runat="server" Visible="false" Width="155">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td class="style1">
                                        <asp:Label ID="ToLot4Lbl" Visible="false" runat="server">ToLot4</asp:Label>
                                        <br />
                                        <telerik:RadTextBox ID="TEXT_tolot4" runat="server" Visible="false" Width="155">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td class="style1">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td class="style1">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <asp:Panel ID="LTTLPanel" runat="server">
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <table cellspacing="1" cellpadding="1">
                                            </table>
                                        </td>
                                        <td>
                                            <asp:Label ID="LocLbl" runat="server">Location</asp:Label>:
                                            <asp:RequiredFieldValidator ID="LocReq" runat="server" ErrorMessage="*" ControlToValidate="TEXT_LocCode"></asp:RequiredFieldValidator>
                                            <br />
                                            <telerik:RadTextBox ID="TEXT_LocCode" BackColor="Yellow" runat="server">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Tu1Lbl" runat="server">TU#</asp:Label>1<br>
                                            <telerik:RadTextBox ID="TEXT_Tu1" runat="server">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Tu2Lbl" runat="server">TU#</asp:Label>2<br>
                                            <telerik:RadTextBox ID="TEXT_Tu2" runat="server">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="LotIdPanel" runat="server">
                                    <table cellspacing="1" cellpadding="1">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LotLbl" runat="server">Lot#</asp:Label>:
                                                <asp:RequiredFieldValidator ID="LotReq" runat="server" ErrorMessage="*" ControlToValidate="INTEGER_LotId"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="LotIdVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_LotId"
                                                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                                <br>
                                                    <telerik:RadTextBox ID="INTEGER_LotId" runat="server" BackColor="Yellow">
                                                    </telerik:RadTextBox>
                                                </br>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="2" cellspacing="2">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="ChooseLotLbl" runat="server" Visible="false" />
                                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" Skin="Office2007"
                                            OnItemCommand="ResultDG_ItemCommand" OnNeedDataSource="ResultDG_NeedDataSource">
                                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                            <ItemStyle Wrap="false"></ItemStyle>
                                            <HeaderStyle Wrap="false"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" EditMode="InPlace">
                                                <CommandItemSettings ShowRefreshButton="false" />
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="wholeqty" SortExpression="wholeqty" HeaderText="Whole Qty">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="wholeuom" SortExpression="wholeuom" HeaderText="Whole UOM">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="looseqty" SortExpression="looseqty" HeaderText="Loose Qty">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="looseuom" SortExpression="looseuom" HeaderText="Loose UOM">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="spavailableqty" SortExpression="spavailableqty"
                                                        HeaderText="Qty" Display="false">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="TransQty" AllowFiltering="false"
                                                        HeaderText="Qty" ItemStyle-Width="20%">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox ID="SplitedQtyTxt" runat="server" Skin="WebBlue" Text="0" Width="80px"
                                                                EnabledStyle-HorizontalAlign="Center">
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="spuom" SortExpression="spuom" HeaderText="UOM">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="availableqty"  UniqueName="availableqty" SortExpression="availableqty" 
                                                    HeaderText="LHU Qty" DataFormatString="{0:#,0.####}" ItemStyle-HorizontalAlign="Right">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>                                                   
                                                    <telerik:GridBoundColumn DataField="lhuuom" SortExpression="lhuuom" HeaderText="LHU UOM">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Receipt Date"
                                                        DataFormatString="{0:dd/MMM/yyyy}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 4">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                                                                ID="FrLot4Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 1">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1","{0:dd/MMM/yyyy HH:mm}") %>'
                                                                ID="FrLot1Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 5">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                                                                ID="FrLot5Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 6">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                                                                ID="FrLot6Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 7">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                                                                ID="FrLot7Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 2">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2","{0:dd/MMM/yyyy HH:mm}") %>'
                                                                ID="FrLot2Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 3">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3","{0:dd/MMM/yyyy HH:mm}") %>'
                                                                ID="FrLot3Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 8">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                                                                ID="FrLot8Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="skudescr2" SortExpression="skudescr2" HeaderText="SKU Descr">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotId" Display="false">                                                       
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="length" SortExpression="length" HeaderText="L"
                                                        DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="width" SortExpression="width" HeaderText="W"
                                                        DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="height" SortExpression="height" HeaderText="H"
                                                        DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="wt" SortExpression="wt" HeaderText="Wt" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="netwt" SortExpression="netwt" HeaderText="NWt"
                                                        DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot9">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'
                                                                ID="FrLot9Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot10">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'
                                                                ID="FrLot10Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot11">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'
                                                                ID="FrLot11Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot12">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'
                                                                ID="FrLot12Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot13">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'
                                                                ID="FrLot13Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot14">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'
                                                                ID="FrLot14Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot15">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'
                                                                ID="FrLot15Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot16">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'
                                                                ID="FrLot16Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot17">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'
                                                                ID="FrLot17Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot18">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'
                                                                ID="FrLot18Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot19">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'
                                                                ID="FrLot19Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot20">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'
                                                                ID="FrLot20Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot21">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'
                                                                ID="FrLot21Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot22">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'
                                                                ID="FrLot22Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot23">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'
                                                                ID="FrLot23Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot24">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'
                                                                ID="FrLot24Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot25">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'
                                                                ID="FrLot25Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot26">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'
                                                                ID="FrLot26Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot27">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'
                                                                ID="FrLot27Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot28">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'
                                                                ID="FrLot28Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot29">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'
                                                                ID="FrLot29Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot30">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'
                                                                ID="FrLot30Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot31">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'
                                                                ID="FrLot31Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot32">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'
                                                                ID="FrLot32Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot33">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'
                                                                ID="FrLot33Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot34">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'
                                                                ID="FrLot34Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot35">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'
                                                                ID="FrLot35Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot36">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'
                                                                ID="FrLot36Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot37">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'
                                                                ID="FrLot37Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot38">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'
                                                                ID="FrLot38Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot39">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'
                                                                ID="FrLot39Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot40">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'
                                                                ID="FrLot40Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot41">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'
                                                                ID="FrLot41Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot42">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'
                                                                ID="FrLot42Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot43">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'
                                                                ID="FrLot43Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot44">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'
                                                                ID="FrLot44Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot45">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'
                                                                ID="FrLot45Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot46">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'
                                                                ID="FrLot46Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot47">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'
                                                                ID="FrLot47Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot48">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'
                                                                ID="FrLot48Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot49">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'
                                                                ID="FrLot49Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot50">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'
                                                                ID="FrLot50Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot51">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'
                                                                ID="FrLot51Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot52">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'
                                                                ID="FrLot52Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot53">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'
                                                                ID="FrLot53Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot54">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'
                                                                ID="FrLot54Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot55">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'
                                                                ID="FrLot55Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot56">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'
                                                                ID="FrLot56Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot57">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'
                                                                ID="FrLot57Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot58">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'
                                                                ID="FrLot58Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot59">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'
                                                                ID="FrLot59Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot60">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'
                                                                ID="FrLot60Lbl" /><br>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="Center">
                            <telerik:RadButton ID="SplitBtn" runat="server" Skin="WebBlue" Text="Split"
                                OnClick="SplitBtn_Click" Visible="false"></telerik:RadButton>&nbsp;
                            <telerik:RadButton ID="CloseBtn" runat="server"  Skin="WebBlue" Text="Close" OnClick="CloseBtn_Click">
                            </telerik:RadButton>
                            <br />
                            <telerik:RadTextBox ID="slltidTxt" runat="server" AutoPostBack="true" OnTextChanged="slltidTxt_TextChanged"
                                Height="1px" Width="1px" Visible="false">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>