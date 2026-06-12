<%@ Page Language="c#" CodeBehind="PFTRDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.PostFillingTransferReceipt.PFTRDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ListDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="pagetitle" style="height: 16px">
                Transfer&nbsp;Detail :
                <asp:Label ID="TfIdLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="ResultDG" runat="server" OnItemCommand="TFDetail_Item" PageSize="8"
                    CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="False"
                    DataKeyField="id">
                    <AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
                    <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                    <HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
                    <Columns>
                        <asp:TemplateColumn Visible="False">
                            <ItemStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            <ItemTemplate>
                                <a id="lnkFinalize" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Finalize Transfer?')"
                                    onserverclick="FinalizeTFDetl" runat="server">
                                    <img id="finalizeImg" src="..\..\image\finalize.gif" width="15" height="15" border="0"
                                        alt="Finalize Transfer" runat="server"></a>
                                <asp:ImageButton runat="server" Visible="True" ID="TFEdit" ImageUrl="..\..\image\pencil.gif"
                                    Width="15" Height="15" AlternateText="Edit Transfer Detail" CommandName="EditDetail"
                                    CausesValidation="False"></asp:ImageButton>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete transfer detail?')"
                                    onserverclick="TFDetail_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Transfer Detail"
                                        runat="server"></a>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line#">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="">
                            <ItemTemplate>
                                From :<br>
                                To :<br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Account">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromaccode") %>'
                                    ID="FromAcCodeLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toaccode") %>'
                                    ID="ToAcCodeLbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="SKU">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromskucode") %>'
                                    ID="FromSkuCodeLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toskucode") %>'
                                    ID="ToSkuCodeLbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="transferedqty" SortExpression="transferedqty" HeaderText="Qty"
                            DataFormatString="{0:#,###}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Site">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromsitedescr") %>'
                                    ID="FrSiteLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tositedescr") %>'
                                    ID="ToSiteLbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Location">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromLoccode")%>'
                                    ID="FrLocLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toloccode") %>'
                                    ID="ToLocLbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="TU#1">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromtuno1") %>'
                                    ID="FrTu1Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totuno1") %>'
                                    ID="ToTu1Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="TU#2">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromtuno2") %>'
                                    ID="FrTu2Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totuno2") %>'
                                    ID="ToTu2Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Receive Date">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromrcdate","{0:dd/MMM/yyyy}") %>'
                                    ID="FrRcDateLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "torcdate","{0:dd/MMM/yyyy}") %>'
                                    ID="ToRcDateLbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 1">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot1","{0:dd/MMM/yyyy}") %>'
                                    ID="FrLot1Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot1","{0:dd/MMM/yyyy}") %>'
                                    ID="ToLot1Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 2">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot2","{0:dd/MMM/yyyy}") %>'
                                    ID="FrLot2Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot2","{0:dd/MMM/yyyy}") %>'
                                    ID="ToLot2Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 3">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot3","{0:dd/MMM/yyyy}") %>'
                                    ID="FrLot3Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot3","{0:dd/MMM/yyyy}") %>'
                                    ID="ToLot3Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 4">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot4") %>'
                                    ID="FrLot4Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot4") %>'
                                    ID="ToLot4Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 5">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot5") %>'
                                    ID="FrLot5Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot5") %>'
                                    ID="ToLot5Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 6">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot6") %>'
                                    ID="FrLot6Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot6") %>'
                                    ID="ToLot6Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 7">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot7") %>'
                                    ID="FrLot7Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot7") %>'
                                    ID="ToLot7Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 8">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot8") %>'
                                    ID="FrLot8Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot8") %>'
                                    ID="ToLot8Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 9">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot9") %>'
                                    ID="FrLot9Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot9") %>'
                                    ID="ToLot9Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 10">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot10") %>'
                                    ID="FrLot10Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot10") %>'
                                    ID="ToLot10Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 11">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot11") %>'
                                    ID="FrLot11Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot11") %>'
                                    ID="ToLot11Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 12">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot12") %>'
                                    ID="FrLot12Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot12") %>'
                                    ID="ToLot12Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 13">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot13") %>'
                                    ID="FrLot13Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot13") %>'
                                    ID="ToLot13Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 14">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot14") %>'
                                    ID="FrLot14Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot14") %>'
                                    ID="ToLot14Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 15">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot15") %>'
                                    ID="FrLot15Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot15") %>'
                                    ID="ToLot15Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 16">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot16") %>'
                                    ID="FrLot16Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot16") %>'
                                    ID="ToLot16Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 17">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot17") %>'
                                    ID="FrLot17Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot17") %>'
                                    ID="ToLot17Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 18">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot18") %>'
                                    ID="FrLot18Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot18") %>'
                                    ID="ToLot18Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 19">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot19") %>'
                                    ID="FrLot19Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot19") %>'
                                    ID="ToLot19Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 20">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot20") %>'
                                    ID="FrLot20Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot20") %>'
                                    ID="ToLot20Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 21">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot21") %>'
                                    ID="FrLot21Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot21") %>'
                                    ID="ToLot21Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 22">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot22") %>'
                                    ID="FrLot22Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot22") %>'
                                    ID="ToLot22Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 23">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot23") %>'
                                    ID="FrLot23Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot23") %>'
                                    ID="ToLot23Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 24">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot24") %>'
                                    ID="FrLot24Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot24") %>'
                                    ID="ToLot24Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 25">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot25") %>'
                                    ID="FrLot25Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot25") %>'
                                    ID="ToLot25Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 26">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot26") %>'
                                    ID="FrLot26Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot26") %>'
                                    ID="ToLot26Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 27">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot27") %>'
                                    ID="FrLot27Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot27") %>'
                                    ID="ToLot27Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 28">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot28") %>'
                                    ID="FrLot28Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot28") %>'
                                    ID="ToLot28Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 29">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot29") %>'
                                    ID="FrLot29Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot29") %>'
                                    ID="ToLot29Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 30">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot30") %>'
                                    ID="FrLot30Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot30") %>'
                                    ID="ToLot30Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 31">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot31") %>'
                                    ID="FrLot31Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot31") %>'
                                    ID="ToLot31Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 32">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot32") %>'
                                    ID="FrLot32Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot32") %>'
                                    ID="ToLot32Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 33">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot33") %>'
                                    ID="FrLot33Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot33") %>'
                                    ID="ToLot33Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 34">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot34") %>'
                                    ID="FrLot34Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot34") %>'
                                    ID="ToLot34Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 35">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot35") %>'
                                    ID="FrLot35Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot35") %>'
                                    ID="ToLot35Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 36">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot36") %>'
                                    ID="FrLot36Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot36") %>'
                                    ID="ToLot36Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 37">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot37") %>'
                                    ID="FrLot37Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot37") %>'
                                    ID="ToLot37Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 38">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot38") %>'
                                    ID="FrLot38Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot38") %>'
                                    ID="ToLot38Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 39">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot39") %>'
                                    ID="FrLot39Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot39") %>'
                                    ID="ToLot39Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 40">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot40") %>'
                                    ID="FrLot40Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot40") %>'
                                    ID="ToLot40Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 41">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot41") %>'
                                    ID="FrLot41Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot41") %>'
                                    ID="ToLot41Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 42">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot42") %>'
                                    ID="FrLot42Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot42") %>'
                                    ID="ToLot42Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 43">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot43") %>'
                                    ID="FrLot43Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot43") %>'
                                    ID="ToLot43Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 44">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot44") %>'
                                    ID="FrLot44Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot44") %>'
                                    ID="ToLot44Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 45">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot45") %>'
                                    ID="FrLot45Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot45") %>'
                                    ID="ToLot45Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 46">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot46") %>'
                                    ID="FrLot46Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot46") %>'
                                    ID="ToLot46Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 47">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot47") %>'
                                    ID="FrLot47Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot47") %>'
                                    ID="ToLot47Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 48">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot48") %>'
                                    ID="FrLot48Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot48") %>'
                                    ID="ToLot48Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 49">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot49") %>'
                                    ID="FrLot49Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot49") %>'
                                    ID="ToLot49Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 50">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot50") %>'
                                    ID="FrLot50Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot50") %>'
                                    ID="ToLot50Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 51">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot51") %>'
                                    ID="FrLot51Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot51") %>'
                                    ID="ToLot51Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 52">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot52") %>'
                                    ID="FrLot52Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot52") %>'
                                    ID="ToLot52Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 53">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot53") %>'
                                    ID="FrLot53Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot53") %>'
                                    ID="ToLot53Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 54">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot54") %>'
                                    ID="FrLot54Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot54") %>'
                                    ID="ToLot54Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 55">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot55") %>'
                                    ID="FrLot55Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot55") %>'
                                    ID="ToLot55Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 56">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot56") %>'
                                    ID="FrLot56Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot56") %>'
                                    ID="ToLot56Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 57">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot57") %>'
                                    ID="FrLot57Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot57") %>'
                                    ID="ToLot57Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 58">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot58") %>'
                                    ID="FrLot58Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot58") %>'
                                    ID="ToLot58Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 59">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot59") %>'
                                    ID="FrLot59Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot59") %>'
                                    ID="ToLot59Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 60">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot60") %>'
                                    ID="FrLot60Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot60") %>'
                                    ID="ToLot60Lbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot UOM">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlotuom") %>'
                                    ID="FrLotUOMLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolotuom") %>'
                                    ID="ToLotUOMLbl" /><br>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    <asp:Button ID="AddDetailBtn" runat="server" CssClass="formbtn" Visible="False" Text="Add Detail"
        OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;<asp:Button ID="DeleteAllBtn" CssClass="formbtn"
            Visible="False" Text="Delete All" runat="server" OnClick="DeleteAllBtn_Click">
    </asp:Button><asp:Panel ID="AddPanel" runat="server" Visible="False" BackColor="#eeeeee">
        <a name="#AddDetailBtn"></a>
        <table id="Table1" cellspacing="1" cellpadding="1" border="0">
            <tr>
                <td colspan="8">
                    <b>Edit Panel</b>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Account<br>
                    To Account
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrAcCodeTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:DropDownList ID="ToAccountList" runat="server">
                    </asp:DropDownList>
                </td>
                <td nowrap>
                    From SKU<br>
                    To SKU
                    <asp:RequiredFieldValidator ID="ToSkuReq" runat="server" ErrorMessage="*" ControlToValidate="ToSkuTxt"></asp:RequiredFieldValidator>
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrSkuTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToSkuTxt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    Transfer&nbsp;Qty
                    <asp:RequiredFieldValidator ID="QtyReq" runat="server" ErrorMessage="*" ControlToValidate="QtyTxt"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="QtyCompVal" runat="server" ErrorMessage="#" ControlToValidate="QtyTxt"
                        Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="QtyTxt" runat="server"></asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Site<br>
                    To Site
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrSiteTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:DropDownList ID="ToSiteList" runat="server">
                    </asp:DropDownList>
                </td>
                <td nowrap>
                    From Location<br>
                    To Location
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLocTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLocTxt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From TU#1<br>
                    To TU#1
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrTu1Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToTu1Txt" runat="server"></asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From TU#2<br>
                    To TU#2
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrTu2Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToTu2Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Rcv Date<br>
                    To Rcv Date
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrRcvDateTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToRcvDateTxt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 1<br>
                    To Lot 1
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot1Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot1Txt" runat="server"></asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 2<br>
                    To Lot 2
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot2Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot2Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 3<br>
                    To Lot 3
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot3Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot3Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 4<br>
                    To Lot 4
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot4Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot4Txt" runat="server"></asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 5<br>
                    To Lot 5
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot5Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot5Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 6<br>
                    To Lot 6
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot6Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot6Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 7<br>
                    To Lot 7
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot7Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot7Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 8<br>
                    To Lot 8
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot8Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot8Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 9<br>
                    To Lot 9
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot9Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot9Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 10<br>
                    To Lot 10
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot10Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot10Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 11<br>
                    To Lot 11
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot11Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot11Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 12<br>
                    To Lot 12
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot12Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot12Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 13<br>
                    To Lot 13
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot13Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot13Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 14<br>
                    To Lot 14
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot14Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot14Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 15<br>
                    To Lot 15
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot15Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot15Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 16<br>
                    To Lot 16
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot16Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot16Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 17<br>
                    To Lot 17
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot17Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot17Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 18<br>
                    To Lot 18
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot18Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot18Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 19<br>
                    To Lot 19
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot19Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot19Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 20<br>
                    To Lot 20
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot20Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot20Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 21<br>
                    To Lot 21
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot21Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot21Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 22<br>
                    To Lot 22
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot22Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot22Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 23<br>
                    To Lot 23
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot23Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot23Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 24<br>
                    To Lot 24
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot24Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot24Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 25<br>
                    To Lot 25
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot25Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot25Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 26<br>
                    To Lot 26
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot26Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot26Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 27<br>
                    To Lot 27
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot27Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot27Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 28<br>
                    To Lot 28
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot28Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot28Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 29<br>
                    To Lot 29
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot29Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot29Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 30<br>
                    To Lot 30
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot30Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot30Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 31<br>
                    To Lot 31
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot31Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot31Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 32<br>
                    To Lot 32
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot32Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot32Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 33<br>
                    To Lot 33
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot33Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot33Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 34<br>
                    To Lot 34
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot34Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot34Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 35<br>
                    To Lot 35
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot35Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot35Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 36<br>
                    To Lot 36
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot36Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot36Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 37<br>
                    To Lot 37
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot37Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot37Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 38<br>
                    To Lot 38
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot38Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot38Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 39<br>
                    To Lot 39
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot39Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot39Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 40<br>
                    To Lot 40
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot40Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot40Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 41<br>
                    To Lot 41
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot41Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot41Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 42<br>
                    To Lot 42
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot42Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot42Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 43<br>
                    To Lot 43
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot43Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot43Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 44<br>
                    To Lot 44
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot44Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot44Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 45<br>
                    To Lot 45
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot45Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot45Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 46<br>
                    To Lot 46
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot46Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot46Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 47<br>
                    To Lot 47
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot47Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot47Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 48<br>
                    To Lot 48
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot48Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot48Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 49<br>
                    To Lot 49
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot49Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot49Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 50<br>
                    To Lot 50
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot50Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot50Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 51<br>
                    To Lot 51
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot51Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot51Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 52<br>
                    To Lot 52
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot52Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot52Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 53<br>
                    To Lot 53
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot53Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot53Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 54<br>
                    To Lot 54
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot54Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot54Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 55<br>
                    To Lot 55
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot55Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot55Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 56<br>
                    To Lot 56
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot56Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot56Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 57<br>
                    To Lot 57
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot57Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot57Txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    From Lot 58<br>
                    To Lot 58
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot58Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot58Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 59<br>
                    To Lot 59
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot59Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot59Txt" runat="server"></asp:TextBox>
                </td>
                <td nowrap>
                    From Lot 60<br>
                    To Lot 60
                </td>
                <td nowrap>
                    :
                    <asp:TextBox ID="FrLot60Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                    :
                    <asp:TextBox ID="ToLot60Txt" runat="server"></asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td nowrap colspan="8">
                    &nbsp;
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="formbtn" OnClick="SaveBtn_Click">
                    </asp:Button>&nbsp;
                    <asp:Button ID="ClosePanelBtn" runat="server" Text="Close Panel" CssClass="formbtn"
                        CausesValidation="False" OnClick="ClosePanelBtn_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
