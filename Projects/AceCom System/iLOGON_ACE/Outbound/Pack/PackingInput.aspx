<%@ Register TagPrefix="iWMS" TagName="iInput" Src="../../Control/iInputCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PackingInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.PackingInput" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Packing Input</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self" />
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">&nbsp;
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>&nbsp;
                <asp:Label ID="PackDetailLbl" runat="server">Pack Detail</asp:Label>&nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iInput ID="iInput" runat="server"></iWMS:iInput>
                    <br>
                </td>
            </tr>
                   <%-- <table border="0" cellpadding="0" cellspacing="0" width="100%">--%>
            <tr>
                <td>
                    <input id="Test_input2" runat="server" type="hidden" />
                    <asp:Panel ID="ModalPanel2" runat="server" Width="100%" CssClass="ModalPopup">
                        <table width="100%" border="0" cellpadding="2" cellspacing="2">
                            <tr>
                                <td>
                                    <table width="95%" border="0" align="center" cellpadding="4" cellspacing="2" style="font-family: Arial; font-size: 8pt; border-style: solid; border-color: Yellow; background-color: White;">
                                        <tr>
                                            <td valign="top" width="px">
                                                <asp:Label ID="Label20" runat="server" Style="font-size: medium;"><b>Select SKU Lot:</b></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:Label ID="ChooseLotLbl" runat="server" Visible="false" />
                                                <asp:DataGrid ID="ResultDG" runat="server"  PageSize="5" OnItemCommand="ResultDG_ItemCommand"
                                                    GridLines="Vertical" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                                                    BackColor="White" CellPadding="1" AllowPaging="False" AutoGenerateColumns="False"
                                                    DataKeyField="Lot9" UseAccessibleHeader="True">
                                                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                                    <ItemStyle CssClass="DGItem"></ItemStyle>
                                                    <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="SKUDescr" SortExpression="SKUDescr" HeaderText="SKU Descr">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Location" SortExpression="Location" HeaderText="Location">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem, "Qty", "{0:#,0.##}")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="UOM" SortExpression="UOM" HeaderText="UOM">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                         <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot1">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1", "{0:dd/MMM/yyyy}") %>'
                                                                    ID="FrLot1Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>                                                       
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot2">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2", "{0:dd/MMM/yyyy}") %>'
                                                                    ID="FrLot2Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot3">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3") %>'
                                                                    ID="FrLot3Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot4">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                                                                    ID="FrLot4Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                         <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot5">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                                                                    ID="FrLot5Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot6">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                                                                    ID="FrLot6Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot7">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                                                                    ID="FrLot7Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot8">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                                                                    ID="FrLot8Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>                                                     
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
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
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
            <%--</table>--%>
            <tr>
                <td valign="top" align="center">
                    <asp:Button ID="ChooseLotBtn" runat="server" CssClass="white" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" CausesValidation="false" />
                    &nbsp;
                    <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save+Next"
                        OnClick="SaveNextBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;
                    <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save+Close" OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;
                <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close" OnClick="CloseBtn_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
