<%@ Page MaintainScrollPositionOnPostback="true" Language="c#" CodeBehind="ReceiptDetl3.aspx.cs"
    AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ReceiptDetl3" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>ReceiptDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked
                }
            }
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab ID="LineTab" Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Inventory" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="LotMovement" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="UploadLot" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="TUNO1" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="TUNO2" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SerialNo" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload TUNO1" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload TUNO2" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Excess" Value="500" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <br />
                            <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">
                                <ContentTemplate>
                                    <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click" Visible="true"
                                        Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="ReOpenLineBtn" CssClass="white" runat="server" OnClick="ReOpenLineBtn_Click" Text="Reopen" Visible="false"
                                        OnClientClick="return confirm('Confirm to Re-Open the selected SKU Lines?')" UseSubmitBehavior="true" />&nbsp;
                                    <asp:Button ID="DeleteLineBtn" CssClass="white" runat="server" OnClick="DeleteLineBtn_Click" Text="Delete" Visible="true"
                                        OnClientClick="return confirm('Confirm to Delete the selected SKU Lines? Only lines with status 10-Open will be deleted.')" UseSubmitBehavior="true" />&nbsp;
                                    <asp:Button ID="SkuLabelBtn" CssClass="blue" runat="server" OnClick="SkuLabelBtn_Click" Text="SKU Label" Visible="true"
                                        OnClientClick="return confirm('Confirm to print Label for the selected SKU Lines?.')" UseSubmitBehavior="true" />&nbsp;
                                    <asp:Button ID="SuggestlocBtn" CssClass="LongLabelWhite" runat="server" OnClick="SuggestlocBtn_Click" Text="Suggest Location" Visible="true"
                                        UseSubmitBehavior="true" />&nbsp;
                                    <asp:Button ID="UnSuggestlocBtn" CssClass="LongLabelWhite" runat="server" OnClick="UnSuggestlocBtn_Click" Text="Remove Suggested" Visible="true"
                                        UseSubmitBehavior="true" />&nbsp;
                                    <asp:Button ID="SavePutawayBtn" CssClass="LongLabelWhite" runat="server" OnClick="SavePutawayBtn_Click" Text="Save &nbsp; Putaway" Visible="true"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="SendPutawayListBtn" CssClass="LongLabelGreen" runat="server" OnClick="SendPutawayListBtn_Click" Text="Transmit &nbsp; Putaway" Visible="true"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="ConfirmPutawayBtn" CssClass="LongLabelWhite" runat="server" OnClick="ConfirmPutawayBtn_Click" Text="Confirm &nbsp; Putaway" Visible="true"
                                        OnClientClick="return confirm('Confirm Putaway?')" UseSubmitBehavior="true" />&nbsp;
                                    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
                                    <br />
                                    <br />
                                    &nbsp;
                                    <asp:Button ID="ExportExcelLnk" class="green" runat="server" OnClick="ExportExcel" Text="Excel" />&nbsp;
                                     <asp:Button ID="GenTuno1Btn" CssClass="LongLabelWhite" runat="server" OnClick="GenTuno1_Click" Text="Generate TUNO1"
                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="GenerateSerialNoBtn" CssClass="LongLabelWhite" runat="server" OnClick="GenerateSerialNoBtn_Click" Text="Generate Serial No"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="SerialNoExcelBtn" class="LongLabelGreen" runat="server" OnClick="SerialNoExcelBtn_Click" Text="Serial No Excel" />&nbsp;
                                     <asp:Button ID="SplitLineBtn" CssClass="LongLabelWhite" runat="server" OnClick="SplitLineBtn_Click" Text="Split Line"
                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                     <asp:Button ID="PopulateHoldReleaseBtn" CssClass="LongLabelWhite" runat="server" OnClick="PopulateHoldReleaseBtn_Click" Text="Put on Hold"
                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                     <asp:Button ID="PopulateIntransitQtyBtn" CssClass="LongLabelWhite" runat="server" OnClick="PopulateIntransitQtyBtn_Click" Text="Populate Intransit Qty" Visible="true"
                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="FinalizeLineBtn" CssClass="LongLabelWhite" runat="server" OnClick="FinalizeLineBtn_Click" Text="Finalize Line" Visible="true"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="PopulateVehicleBtn" CssClass="LongLabelWhite" runat="server" OnClick="PopulateVehicleBtn_Click" Text="Populate Vehicle Master" Visible="true"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                      <asp:Button ID="btnUploadLot" CssClass="green" runat="server" OnClick="btnUploadLot_Click" Text="UploadLot"
                                          OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />&nbsp;
                              <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="RefreshBtn" />
                                    <asp:PostBackTrigger ControlID="ReOpenLineBtn" />
                                    <asp:PostBackTrigger ControlID="DeleteLineBtn" />
                                    <asp:PostBackTrigger ControlID="SkuLabelBtn" />
                                    <asp:PostBackTrigger ControlID="UnSuggestlocBtn" />
                                    <asp:PostBackTrigger ControlID="SavePutawayBtn" />
                                    <asp:PostBackTrigger ControlID="SendPutawayListBtn" />
                                    <asp:PostBackTrigger ControlID="ExportExcelLnk" />
                                    <asp:PostBackTrigger ControlID="SerialNoExcelBtn" />
                                    <asp:PostBackTrigger ControlID="ConfirmPutawayBtn" />
                                    <asp:PostBackTrigger ControlID="GenTuno1Btn" />
                                    <asp:PostBackTrigger ControlID="MsgPopup" />
                                    <asp:PostBackTrigger ControlID="btnUploadLot" />
                                    <asp:PostBackTrigger ControlID="SuggestlocBtn" />
                                    <asp:PostBackTrigger ControlID="GenerateSerialNoBtn" />
                                    <asp:PostBackTrigger ControlID="NewBtn" />
                                    <asp:PostBackTrigger ControlID="EditBtn" />
                                    <asp:PostBackTrigger ControlID="SplitLineBtn" />
                                    <asp:PostBackTrigger ControlID="PopulateHoldReleaseBtn" />
                                    <asp:PostBackTrigger ControlID="PopulateIntransitQtyBtn" />
                                    <asp:PostBackTrigger ControlID="FinalizeLineBtn" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <br />
                            <br />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdButton">
                    <ProgressTemplate>
                        <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                        </div>
                        <div id="LoaderPopup">
                            <a id="loader"></a>
                            <a id="text">We are processing your request ...</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro"
                    AllowSorting="true" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="true" PageSize="50">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling ScrollHeight="550px" UseStaticHeaders="True" AllowScroll="true" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="rcdtid">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="lineChkbx" runat="server" />
                                    <a id="lnkFinalize" href='<%#DataBinder.Eval(Container,"DataItem.rcdtid")%>' runat="server"
                                        onserverclick="RCDetail_Finalize">
                                        <img id="finalizeImg" border="0" alt="Finalize Receipt Detail" src="../../image/finalize.gif"
                                            width="15" height="15" runat="server"></a>
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    <a id="lnkDelete" onclick="return confirm('Confirm delete?')" href='<%#DataBinder.Eval(Container,"DataItem.rcdtid")%>'
                                        runat="server" onserverclick="RCDetail_Delete">
                                        <img id="delImg" border="0" alt="Delete Receipt Detail" src="../../image/bin.gif"
                                            width="15" height="15" runat="server"></a>
                                    <asp:ImageButton runat="server" ID="ExplodeUOM" ImageUrl="../../image/bomb.png" BorderWidth="0" Visible="false"
                                        BackColor="Transparent" Width="15" Height="15" OnClick="ExplodeUOM_Click"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton runat="server" ID="ExplodeBOM" ImageUrl="../../image/explodeBOM.png" BorderWidth="0" Visible="false"
                                        BackColor="Transparent" Width="15" Height="15" OnClick="ExplodeBOM_Click" AlternateText="Explode Into BOM"></asp:ImageButton>&nbsp;
                                    <asp:Label ID="SNoTrackLbl" runat="server" />
                                    <asp:ImageButton runat="server" ID="AttcBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attachment" OnClick="AttcBtn_Click"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="GRLineConfirmDoneLbl" runat="server" />
                                    <asp:Label ID="GRLineConfirmErrorLbl" runat="server" />
                                    <asp:Label ID="GRLineConfirmSentLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Line" DataField="line" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="line" UniqueName="line" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Line Rem" DataField="lotremarks" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lotremarks" UniqueName="lotremarks" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SKUDescr" DataField="rcsskudescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="rcsskudescr" UniqueName="rcsskudescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Packing" DataField="packing" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="packing" UniqueName="packing" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillGroup" DataField="BillingGrpDescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="BillingGrpDescr" UniqueName="BillingGrpDescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="false"
                                SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Expected" DataField="expecteduomqty" AllowFiltering="false"
                                SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InTransit" DataField="intransituomqty" AllowFiltering="false"
                                SortExpression="intransituomqty" UniqueName="intransituomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Received" DataField="receiveduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="receiveduomqty" UniqueName="receiveduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalSerialNo" DataField="CntSNo" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="CntSNo" UniqueName="CntSNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToLoc" DataField="loccode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="PaLoc" HeaderText="PutawayLocation" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:TextBox ID="palocTxt" runat="server" Visible="false" Text='<%# Eval("paloccode") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="Ploc" Text='<%#DataBinder.Eval(Container.DataItem, "paloccode")%>' runat="server" Visible="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="checkdigit" HeaderText="Checkdigits">
                                <ItemTemplate>
                                    <asp:TextBox ID="checkdigitText" runat="server" Text='<%# Eval("loccheckdigit") %>'></asp:TextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="RCSStatus" DataField="statusdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="statusdescr" UniqueName="RcsStatus" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="UPC" DataField="UPC" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="UPC" UniqueName="UPC" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="TUNo1" DataField="tuno1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="LotId" DataField="LotId" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="LotId" UniqueName="LotId" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="RcvDate" DataField="rcdate" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot14" UniqueName="lot14" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ReasonCode" DataField="ReasonCode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="ReasonCode" UniqueName="ReasonCode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot16" UniqueName="lot16" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot17" UniqueName="lot17" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot18" UniqueName="lot18" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot19" UniqueName="lot19" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot20" UniqueName="lot20" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot21" UniqueName="lot21" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot22" UniqueName="lot22" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot23" UniqueName="lot23" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot24" UniqueName="lot24" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot25" UniqueName="lot25" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot26" UniqueName="lot26" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot27" UniqueName="lot27" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot28" UniqueName="lot28" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot29" UniqueName="lot29" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot30" UniqueName="lot30" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot31" UniqueName="lot31" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot32" UniqueName="lot32" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot33" UniqueName="lot33" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot34" UniqueName="lot34" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot35" UniqueName="lot35" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot36" UniqueName="lot36" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot37" UniqueName="lot37" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot38" UniqueName="lot38" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot39" UniqueName="lot39" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot40" UniqueName="lot40" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot41" UniqueName="lot41" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot42" UniqueName="lot42" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot43" UniqueName="lot43" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot44" UniqueName="lot44" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot45" UniqueName="lot45" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot46" UniqueName="lot46" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot47" UniqueName="lot47" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot48" UniqueName="lot48" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot49" UniqueName="lot49" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot50" UniqueName="lot50" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot51" UniqueName="lot51" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot52" UniqueName="lot52" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot53" UniqueName="lot53" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot54" UniqueName="lot54" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot55" UniqueName="lot55" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot56" UniqueName="lot56" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot57" UniqueName="lot57" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot58" UniqueName="lot58" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot59" UniqueName="lot59" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot60" UniqueName="lot60" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotExpNetWt" DataField="totexpnetwt" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="totexpnetwt" UniqueName="totexpnetwt" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TUNo2" DataField="tuno2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="tuno2" UniqueName="tuno2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExRef" DataField="RDExRef" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="RDExRef" UniqueName="RDExRef" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExLine" DataField="ExLine" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="ExLine" UniqueName="ExLine" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Length" DataField="Length" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="Length" UniqueName="Length" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Width" DataField="Width" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="Width" UniqueName="Width" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Height" DataField="Height" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="Height" UniqueName="Height" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="WT" DataField="WT" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="wt" UniqueName="wt" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Vol" DataField="vol" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="vol" UniqueName="vol" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Container No" DataField="VehicleEquipmentNo" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="VehicleEquipmentNo" UniqueName="VehicleEquipmentNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Area(L)" DataField="arealength" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="arealength" UniqueName="arealength" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Area(W)" DataField="areawidth" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="areawidth" UniqueName="areawidth" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Area" DataField="area" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="area" UniqueName="area" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />
                            <telerik:GridBoundColumn Display="False" DataField="skuid" />
                            <telerik:GridBoundColumn Display="False" DataField="rcdstatus" />
                            <telerik:GridBoundColumn Display="False" DataField="rcid" />
                            <telerik:GridBoundColumn Display="False" DataField="rcdstatuscolor" />
                            <telerik:GridBoundColumn DataField="GRLineConfirmDone" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GRLineConfirmError" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GRLineConfirmSent" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="expectedqty" />
                            <telerik:GridBoundColumn Display="False" DataField="intransitqty" />
                            <telerik:GridBoundColumn Display="False" DataField="receivedqty" />
                            <telerik:GridBoundColumn Display="False" DataField="slltid" />
                            <telerik:GridBoundColumn DataField="BillingGrp"
                                SortExpression="BillingGrp" UniqueName="BillingGrp" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="status" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="InventoryRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="LotMovementRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadLot" Height="500px" />
            <telerik:RadPageView runat="server" ID="TUNO1RadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="TUNO2RadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="SerialNoRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadTUNO1RadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadTUNO2RadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="ExcessRadPageView" Height="700px" />
        </telerik:RadMultiPage>
        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <%--Message popup area end--%>

        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmUnSuggestloc" Text="" Style="display: none;" OnClick="ConfirmUnSuggestloc_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmUnSuggestlocCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmUnSuggestloc.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
