<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailInput.aspx.cs" Inherits="iWMS.Web.Outbound.IssueRegisterV2.DetailInput" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self" />
    <%--<META content="no-cache" http-equiv="Pragma">--%>
    <style type="text/css">
        .modalBackground
        {
            background-color: #E6EAFF;
            filter: alpha(opacity=80);
            -moz-opacity: 0.5;
            -khtml-opacity: 0.5;
            opacity: 0.5;
        }
        .ModalPopup
        {
            background-color: Gray;
            background: url(              'media/popup-bg.gif' ) no-repeat;
            background-position: center;
            padding: 0;
            border: none;
            z-index: 6001;
            width: 450px;
            height: 300px;
            overflow: auto;
        }
        .style1
        {
            width: 198px;
        }
        .style2
        {
            width: 119px;
        }
    </style>
</head>

<script language="javascript" type="text/javascript">
    var launch = false;
    function launchModal() {
        launch = true;
    }
    function hideModal() {
        launch = false;
    }

    function pageLoad() {
        if (launch) {
            $find("mpe1").show();
        }
        else {
            $find("mpe1").hide();
        }
    }  
</script>

<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                <asp:Label ID="DetailLbl" runat="server"></asp:Label>&nbsp;
                <asp:Label ID="InterfaceLbl" runat="server" ></asp:Label>&nbsp;                
            <asp:Label ID="MsgLbl" runat="server" CssClass="linkLabelBig" ForeColor="Red" ></asp:Label>&nbsp;                 
            </td>              
        </tr>
        <tr>
            <td>
                <table cellspacing="4" cellpadding="2">
                    <tr>
                        <td width="350" colspan="2">
                            <telerik:RadButton ID="ChooseTU1Btn" runat="server" Text="Choose TU1" OnClick="ChooseTU1Btn_Click"
                                CausesValidation="false" Skin="WebBlue" Visible="False" Enabled="false">
                            </telerik:RadButton>
                            &nbsp;
                            <telerik:RadButton ID="ChooseLotBtn" runat="server" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                                CausesValidation="false" Skin="WebBlue" Visible="False" Enabled="false">
                            </telerik:RadButton>
                            <telerik:RadButton ID="SaveBtn" runat="server" Text="    Add    " Skin="WebBlue" Enabled="False"
                                OnClick="SaveBtn_Click" SingleClick="true" SingleClickText="Processing...">
                            </telerik:RadButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="AlertImgBtn" runat="server" ImageUrl="../../Image/alert.gif"
                                Visible="False" CausesValidation="false" BackColor="Transparent" BorderWidth="0"
                                ImageAlign="AbsMiddle"></asp:ImageButton>
                        </td>
                        <td colspan="2" class="style2">
                            <asp:Label ID="DescrLbl" runat="server" CssClass="linkLabelBig"></asp:Label>
                            </td>
                        <td align="right" colspan="2" class="style2">
                            <asp:Label ID="PackingLbl" runat="server">Packing 
                            :</asp:Label>
                            <input id="HIDDEN_SkuId" type="hidden" runat="server" />
                            <br />
                            <telerik:RadTextBox ID="slltidTxt" runat="server" AutoPostBack="true" OnTextChanged="slltidTxt_TextChanged"
                                Height="1px" Width="1px" Visible="false">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="pagetitle">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblHeader" Text="Header" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Panel ID="AvailQtyPanel" runat="server" Visible="False">
                                    <table cellpadding="1" cellspacing="1">
                                        <tr align="center">
                                            <td colspan="2">
                                                <asp:Label ID="SoftAllocationLbl" runat="server" CssClass="linkLabelBig" Style="z-index: 0">Soft Allocation Info</asp:Label>
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
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="pagetitle">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblSKU" Text="SKU" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="4" cellpadding="2">
                    <tr>
                        <td>
                            <asp:Label ID="SkuUpcLbl" runat="server">SKU/UPC</asp:Label>
                            :
                            <asp:RequiredFieldValidator ID="SkuReq" runat="server" ControlToValidate="TEXT_SkuCode"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <telerik:RadTextBox ID="TEXT_SkuCode" runat="server" AutoPostBack="True" Skin="Sunset"
                                BackColor="#ded7c6" OnTextChanged="TEXT_SkuCode_TextChanged" Width="155">
                            </telerik:RadTextBox>
                        <td>
                            <asp:Label ID="QtyLbl" runat="server">Qty</asp:Label>:
                            <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="INTEGER_Qty"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="INTEGER_Qty"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><asp:CompareValidator
                                    ID="QtyValueVal" runat="server" ControlToValidate="INTEGER_Qty" ErrorMessage="#"
                                    Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator><br>
                            <telerik:RadTextBox ID="INTEGER_Qty" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                Width="155" OnTextChanged="INTEGER_Qty_TextChanged">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="UomLbl" runat="server">UOM</asp:Label>:<input id="HIDDEN_Uom" type="hidden"
                                runat="server" /><br>
                            <telerik:RadDropDownList ID="TEXT_Uom" runat="server" Skin="WebBlue" Width="155"
                                OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged">
                            </telerik:RadDropDownList>
                            <asp:TextBox ID="UomTxt" runat="server" Width="155" ReadOnly="True">Each</asp:TextBox>
                        </td>
                        <%--<td>
                                        <asp:Label ID="ShelfLifeLbl" runat="server">Shelf Life</asp:Label>:
                                        <asp:CompareValidator ID="ShelfLifeVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_ShelfLife"
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <br>
                                        <telerik:RadTextBox ID="INTEGER_ShelfLife" runat="server" Width="155">
                                        </telerik:RadTextBox>
                                    </td>--%>
                        <td>
                            <asp:Panel ID="CartonPanel" runat="server">
                                :<input id="HIDDEN_Cartoncnt" type="hidden" runat="server" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CompareValidator
                                    ID="CartoncntVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_cartoncnt"
                                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                <br>
                                    <telerik:RadTextBox ID="INTEGER_cartoncnt" runat="server" Width="155">
                                    </telerik:RadTextBox>
                                    <br></br>
                                </br>
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
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </asp:Panel>
    </table>
    </td> </tr>
    <asp:Panel ID="UDPanel" Visible="False" runat="server">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Label ID="UD01Lbl" runat="server">User Define 01</asp:Label>:<br>
                            <telerik:RadTextBox ID="TEXT_usrdef01" runat="server">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="UD02Lbl" runat="server">User Define 02</asp:Label>:<br>
                            <telerik:RadTextBox ID="TEXT_usrdef02" runat="server">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </asp:Panel>
    </table>
    <br />
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <input id="Test_input2" runat="server" type="hidden" />
                <asp:Panel ID="ModalPanel2" runat="server" Width="100%" CssClass="ModalPopup">
                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                            <td>
                                <table border="0" cellpadding="4" cellspacing="2" style="font-family: Arial; font-size: 8pt;
                                    border-style: solid; border-color: Yellow; background-color: White;">
                                    <tr>
                                        <td valign="top" width="px">
                                            <asp:Label ID="Label20" runat="server" Style="font-size: medium;"><b>Select Lot:</b></asp:Label>
                                            <asp:Label ID="Label5" runat="server" Text="Only up to 200 Lot will be displayed."></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="ChooseLotLbl" runat="server" Visible="false" />
                                            <asp:DataGrid ID="ResultDG" runat="server" OnItemCommand="ResultDG_ItemCommand" PageSize="5"
                                                GridLines="Vertical" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                                                BackColor="White" CellPadding="3" AllowPaging="False" AutoGenerateColumns="False"
                                                DataKeyField="id" UseAccessibleHeader="True">
                                                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                                <ItemStyle CssClass="DGItem"></ItemStyle>
                                                <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
                                                <Columns>
                                                    <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                                                    <asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="wholeqty" SortExpression="wholeqty" HeaderText="Whole Qty">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="wholeuom" SortExpression="wholeuom" HeaderText="Whole UOM">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="looseqty" SortExpression="looseqty" HeaderText="Loose Qty">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="looseuom" SortExpression="looseuom" HeaderText="Loose UOM">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="spavailableqty" SortExpression="spavailableqty" HeaderText="Qty">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="spuom" SortExpression="spuom" HeaderText="UOM">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="LHU Qty" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "availableqty", "{0:#,0.##}")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="lhuuom" SortExpression="lhuuom" HeaderText="LHU UOM">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Receipt Date"
                                                        DataFormatString="{0:dd/MMM/yyyy}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 4">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                                                                ID="FrLot4Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 1">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1") %>'
                                                                ID="FrLot1Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 5">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                                                                ID="FrLot5Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 6">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                                                                ID="FrLot6Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 7">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                                                                ID="FrLot7Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 2">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2") %>'
                                                                ID="FrLot2Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 3">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3") %>'
                                                                ID="FrLot3Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 8">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                                                                ID="FrLot8Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="skudescr2" SortExpression="skudescr2" HeaderText="SKU Descr">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="length" SortExpression="length" HeaderText="L" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="width" SortExpression="width" HeaderText="W" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="height" SortExpression="height" HeaderText="H" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="wt" SortExpression="wt" HeaderText="Wt" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="netwt" SortExpression="netwt" HeaderText="NWt" DataFormatString="{0:#,0.####}">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot9">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'
                                                                ID="FrLot9Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot10">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'
                                                                ID="FrLot10Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot11">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'
                                                                ID="FrLot11Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot12">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'
                                                                ID="FrLot12Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot13">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'
                                                                ID="FrLot13Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot14">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'
                                                                ID="FrLot14Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot15">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'
                                                                ID="FrLot15Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot16">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'
                                                                ID="FrLot16Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot17">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'
                                                                ID="FrLot17Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot18">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'
                                                                ID="FrLot18Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot19">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'
                                                                ID="FrLot19Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot20">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'
                                                                ID="FrLot20Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot21">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'
                                                                ID="FrLot21Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot22">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'
                                                                ID="FrLot22Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot23">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'
                                                                ID="FrLot23Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot24">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'
                                                                ID="FrLot24Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot25">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'
                                                                ID="FrLot25Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot26">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'
                                                                ID="FrLot26Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot27">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'
                                                                ID="FrLot27Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot28">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'
                                                                ID="FrLot28Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot29">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'
                                                                ID="FrLot29Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot30">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'
                                                                ID="FrLot30Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot31">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'
                                                                ID="FrLot31Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot32">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'
                                                                ID="FrLot32Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot33">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'
                                                                ID="FrLot33Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot34">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'
                                                                ID="FrLot34Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot35">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'
                                                                ID="FrLot35Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot36">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'
                                                                ID="FrLot36Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot37">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'
                                                                ID="FrLot37Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot38">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'
                                                                ID="FrLot38Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot39">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'
                                                                ID="FrLot39Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot40">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'
                                                                ID="FrLot40Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot41">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'
                                                                ID="FrLot41Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot42">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'
                                                                ID="FrLot42Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot43">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'
                                                                ID="FrLot43Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot44">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'
                                                                ID="FrLot44Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot45">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'
                                                                ID="FrLot45Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot46">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'
                                                                ID="FrLot46Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot47">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'
                                                                ID="FrLot47Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot48">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'
                                                                ID="FrLot48Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot49">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'
                                                                ID="FrLot49Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot50">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'
                                                                ID="FrLot50Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot51">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'
                                                                ID="FrLot51Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot52">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'
                                                                ID="FrLot52Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot53">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'
                                                                ID="FrLot53Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot54">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'
                                                                ID="FrLot54Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot55">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'
                                                                ID="FrLot55Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot56">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'
                                                                ID="FrLot56Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot57">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'
                                                                ID="FrLot57Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot58">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'
                                                                ID="FrLot58Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot59">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'
                                                                ID="FrLot59Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot60">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'
                                                                ID="FrLot60Lbl" /><br>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                                            </asp:DataGrid>
                                            <asp:DataGrid ID="Datagrid1" runat="server" AutoGenerateColumns="True" BorderStyle="None"
                                                GridLines="Both" CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
                                                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                                                <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="TU1SelectLbl" runat="server" Visible="false" />
                                            <asp:DataGrid ID="TU1DG" runat="server" OnItemCommand="TU1DG_ItemCommand" GridLines="Vertical"
                                                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" BackColor="White"
                                                CellPadding="3" AllowPaging="False" AutoGenerateColumns="False" DataKeyField="tuno1"
                                                UseAccessibleHeader="True">
                                                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                                <ItemStyle CssClass="DGItem"></ItemStyle>
                                                <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
                                                <Columns>
                                                    <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                                                    <asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="TotalQty" SortExpression="TotalQty" HeaderText="Qty">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="spuom" SortExpression="spuom" HeaderText="UOM">
                                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="skudescr2" SortExpression="skudescr2" HeaderText="SKU Descr">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Button ID="Close_btn" runat="server" OnClick="ModalPopupEventHandler" Font-Names="Arial"
                                                Text="Close" CssClass="detailButton" CausesValidation="false" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="Test_input2" PopupControlID="ModalPanel2"
                    BackgroundCssClass="modalBackground" />
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:Label ID="LotNomLbl" Text="Lot Nomination: " runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="false" AllowSorting="true" Skin="Office2007" OnItemDataBound="RadGrid1_ItemDataBound"
        OnNeedDataSource="RadGrid1_NeedDataSource" OnPreRender="RadGrid1_PreRender" AllowAutomaticInserts="True"
        Width="100%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
            EditMode="InPlace">
            <CommandItemSettings ShowRefreshButton="false" />
            <CommandItemTemplate>
                <div style="padding: 5px 5px;">
                    &nbsp;&nbsp;
                    <asp:ImageButton runat="server" Visible="True" ID="MODetlAdd" ImageUrl="..\..\image\add.png"
                        BorderWidth="1" BackColor="Transparent" Width="11" Height="11" AlternateText="Add New PickTicket"
                        ToolTip="Add PickDetail" OnClick="PTDetlAdd_Click" CausesValidation="False">
                    </asp:ImageButton>&nbsp;
                    <asp:Label ID="Lbl1" runat="server" Text="Add new record" Font-Names="Verdana" ForeColor="DarkBlue" />
                </div>
            </CommandItemTemplate>
            <Columns>
                <telerik:GridTemplateColumn UniqueName="icon">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="False"></ItemStyle>
                    <ItemTemplate>
                   <%-- <a id="PtdetlEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                            runat="server" onserverclick="PtdetlEdit_Click">
                            <img id="Img1" src="..\..\image\pencil.gif" width="15" height="15" border="0" alt="Edit"
                                title="Edit" runat="server" /></a>--%>
                                
                                <asp:LinkButton ID="lnkEdit" Runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="lnkEdit_Click" Visible="false">
										<img id="EditImg" src="..\..\image\pencil.gif" Width="15" Height="15" border="0" alt="Delete"	runat="server"></asp:LinkButton>
                   <asp:LinkButton ID="lnkDelete" Runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="ldDetailDelete_Click">
										<img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete"	runat="server"></asp:LinkButton>
										<%--</td>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            runat="server" onserverclick="ldDetailDelete_Click">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                title="Delete" runat="server" /></a>--%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    Display="false">
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="SIV No" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="acid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="isdtid" SortExpression="isdtid" HeaderText="isdtid"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="isid" SortExpression="isid" HeaderText="isid"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo"
                    AllowFiltering="false" ItemStyle-Wrap="false" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="exline" SortExpression="exline" HeaderText="ExLine"
                    AllowFiltering="false" ItemStyle-Wrap="false" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                    ItemStyle-Wrap="false" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="zonecode" Display="false" SortExpression="zonecode"
                    HeaderText="Zone" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode"
                    HeaderText="Loc" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="loccheckdigit" Display="false" UniqueName="loccheckdigit"
                    HeaderText="Checkdigits">
                    <ItemTemplate>
                        <asp:TextBox ID="checkdigitText" runat="server" Visible="true" Text='<%# Eval("loccheckdigit") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="skupackqty" SortExpression="skupackqty" HeaderText="Qty"
                    DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" DataFormatString="{0:#,0.##}"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM"
                    ItemStyle-Wrap="false" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="paloccode" UniqueName="paloccode" HeaderText="PALoc"
                    ItemStyle-Wrap="false" Display="false">
                    <ItemTemplate>
                        <asp:TextBox ID="palocText" runat="server" Visible="true" Text='<%# Eval("paloccode") %>'>                          
                        </asp:TextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="paloccheckdigit" Display="false" UniqueName="paloccheckdigit"
                    HeaderText="PaLocCheckDigits" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:TextBox ID="pacheckdigitText" runat="server" Visible="true" Text='<%# Eval("paloccheckdigit") %>'>                          
                        </asp:TextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="paqty" UniqueName="paqty" Display="false" HeaderText="PaQty"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pauom" UniqueName="pauom" Display="false" HeaderText="Pa Uom"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <%--<telerik:GridBoundColumn DataField="pastatus" UniqueName="pastatus" HeaderText="PaStatus"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>--%>
                <telerik:GridBoundColumn DataField="skupackpackedqty" Display="false" SortExpression="skupackpackedqty"
                    HeaderText="PackedQty" DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <%--22--%>
                <telerik:GridBoundColumn HeaderText="" DataField="lot4" AllowFiltering="true" SortExpression="lot4"
                    UniqueName="lot4" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot1" AllowFiltering="true" SortExpression="lot1"
                    UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <%--23--%>
                <telerik:GridBoundColumn HeaderText="" DataField="lot5" AllowFiltering="true" SortExpression="lot5"
                    UniqueName="lot5" Reorderable="true">
                </telerik:GridBoundColumn>
                <%--24--%>
                <telerik:GridBoundColumn HeaderText="" DataField="lot6" AllowFiltering="true" SortExpression="lot6"
                    UniqueName="lot6" Reorderable="true">
                </telerik:GridBoundColumn>
                <%--25--%>
                <telerik:GridBoundColumn HeaderText="" DataField="lot7" AllowFiltering="true" SortExpression="lot7"
                    UniqueName="lot7" Reorderable="true">
                </telerik:GridBoundColumn>
                <%--26--%>
                <telerik:GridBoundColumn HeaderText="" DataField="lot2" AllowFiltering="true" SortExpression="lot2"
                    UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <%--27--%>
                <telerik:GridBoundColumn HeaderText="" DataField="lot3" AllowFiltering="true" SortExpression="lot3"
                    UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot8" AllowFiltering="true" SortExpression="lot8"
                    UniqueName="lot8" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot9" AllowFiltering="true" SortExpression="lot9"
                    UniqueName="lot9" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot10" AllowFiltering="true" SortExpression="lot10"
                    UniqueName="lot10" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot11" AllowFiltering="true" SortExpression="lot11"
                    UniqueName="lot11" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot12" AllowFiltering="true" SortExpression="lot12"
                    UniqueName="lot12" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot13" AllowFiltering="true" SortExpression="lot13"
                    UniqueName="lot13" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot14" AllowFiltering="true" SortExpression="lot14"
                    UniqueName="lot14" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="lot15" AllowFiltering="true" SortExpression="lot15"
                    UniqueName="lot15" Reorderable="true">
                </telerik:GridBoundColumn>
                <%-- <telerik:GridBoundColumn HeaderText="TotalNetWt" DataField="totnetwt" AllowFiltering="true"
                    SortExpression="totnetwt" UniqueName="totnetwt" Reorderable="true" DataFormatString="{0:#,0.##}">
                </telerik:GridBoundColumn>--%>
                <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcvDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                    HeaderText="EditUser">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
