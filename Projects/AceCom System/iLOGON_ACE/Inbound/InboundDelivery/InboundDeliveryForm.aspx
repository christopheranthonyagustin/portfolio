<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundDeliveryForm.aspx.cs" Inherits="iWMS.Web.Inbound.InboundDelivery.InboundDeliveryForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>InboundDeliveryForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock runat="server">
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

            function BatchEditClosed(sender, args) {
                var GRDate = "", RcsdtId = "";
                var JsonArr = [];

                var Hidden1 = document.getElementById('<%= Hidden1.ClientID %>');

            RCSDTID = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "id").innerText;
            var GRDateTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "rcdate");
            if (GRDateTxt != null) {
                GRDate = GRDateTxt.innerText;
            }

            JsonArr.push({
                "RcsdtId": RCSDTID,
                "GRDate": GRDate
            });

            Hidden1.value = JSON.stringify(JsonArr);

            var Hidden2 = document.getElementById('<%= Hidden2.ClientID %>');

                if (Hidden2 != null && Hidden2.value != "") {
                    Hidden2.value = Hidden2.value + "^" + Hidden1.value;
                }
                else {
                    Hidden2.value = Hidden1.value;
                }

                console.log(Hidden2.value);
            }
        </script>
    </telerik:RadCodeBlock>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="20" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>

            </tr>
        </table>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">

                <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" ToolTip="Save"
                    Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
                    <telerik:RadPageView runat="server" Height="90%" ID="RadPageView1">

                        <telerik:RadTabStrip runat="server" ID="RadTabStrip3" CausesValidation="false" MultiPageID="RadMultiPage3"
                            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip3_TabClick">
                            <Tabs>
                                <telerik:RadTab Text="Line Item" Value="0" readonly="readonly" runat="server">
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
                            </Tabs>
                        </telerik:RadTabStrip>

                        <telerik:RadMultiPage runat="server" ID="RadMultiPage3" SelectedIndex="0" CssClass="outerMultiPage">
                            <telerik:RadPageView runat="server" Height="90%" ID="MainInfoRadPageView">
                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">
                                                <ContentTemplate>
                                                    <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                                    <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                                    <asp:Button ID="ExplodeBtn" CssClass="white" runat="server" OnClick="ExplodeBtn_Click" Text="Explode"
                                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                                     <asp:Button ID="SuggestLocationBtn" CssClass="LongLabelWhite" runat="server" OnClick="SuggestLocationBtn_Click" Text="Suggest Location"
                                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;

                                                     <asp:Button ID="UndoSuggestedBtn" CssClass="LongLabelWhite" runat="server" OnClick="UndoSuggestedBtn_Click" Text="Undo Suggested"
                                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;

                                                     
                                                     <asp:Button ID="ChangeGRDateBtn" CssClass="LongLabelWhite" runat="server" OnClick="ChangeGRDateBtn_Click" Text="Change GR Date"
                                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;

                                                    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
                                                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="NewBtn" />
                                                    <asp:PostBackTrigger ControlID="EditBtn" />
                                                    <asp:PostBackTrigger ControlID="ExplodeBtn" />
                                                    <asp:PostBackTrigger ControlID="SuggestLocationBtn" />
                                                    <asp:PostBackTrigger ControlID="UndoSuggestedBtn" />
                                                    <asp:PostBackTrigger ControlID="ChangeGRDateBtn" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <br />
                                        </td>
                                        <td align="right">
                                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="Hidden1" runat="server" />
                                <asp:HiddenField ID="Hidden2" runat="server" />
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro"
                                    AllowSorting="true" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="true" PageSize="50">
                                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Scrolling ScrollHeight="250px" UseStaticHeaders="True" AllowScroll="true" />
                                        <Selecting AllowRowSelect="true" />
                                        <ClientEvents OnBatchEditClosed="BatchEditClosed" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="rcdtid" EditMode="Batch" CommandItemDisplay="None">
                                        <BatchEditingSettings EditType="Row" />
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <HeaderTemplate>
                                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemStyle Wrap="false" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="lineChkbx" runat="server" />
                                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                                    <a id="lnkDelete" onclick="return confirm('Confirm delete?')" href='<%#DataBinder.Eval(Container,"DataItem.rcdtid")%>'
                                                        runat="server" onserverclick="lnkDelete_ServerClick">
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
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <HeaderTemplate>
                                                    No
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="Line" DataField="line" AllowFiltering="false" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="line" UniqueName="line" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Line Rem" DataField="rem1" AllowFiltering="false" AutoPostBackOnFilter="true" Display="false"
                                                SortExpression="rem1" UniqueName="rem1" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Putaway Id" DataField="id" AllowFiltering="false" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="PutawayId" UniqueName="PutawayId" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="SKUDescr" DataField="rcsskudescr" AllowFiltering="false" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="rcsskudescr" UniqueName="rcsskudescr" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Packing" DataField="packing" AllowFiltering="true" AutoPostBackOnFilter="true"
                                                SortExpression="packing" UniqueName="packing" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="BillGroup" DataField="BillingGrpDescr" AllowFiltering="true" AutoPostBackOnFilter="true" Display="false"
                                                SortExpression="BillingGrpDescr" UniqueName="BillingGrpDescr" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Expected" DataField="expecteduomqty" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                                                DataFormatString="{0:#,0.##}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="InTransit" DataField="intransituomqty" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="intransituomqty" UniqueName="intransituomqty" Reorderable="true"
                                                DataFormatString="{0:#,0.##}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Received" DataField="receiveduomqty" AllowFiltering="false" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="receiveduomqty" UniqueName="receiveduomqty" Reorderable="true"
                                                DataFormatString="{0:#,0.##}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="TotalSerialNo" DataField="CntSNo" AllowFiltering="true" AutoPostBackOnFilter="true"
                                                SortExpression="CntSNo" UniqueName="CntSNo" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Staging Location" DataField="loccode" AllowFiltering="false" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="PutawayLocation" DataField="paloccode" AllowFiltering="false" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="loccode" UniqueName="PaLoc" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="statusdescr" UniqueName="RcsStatus" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Pallet No" DataField="tuno1" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="LotId" DataField="LotId" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="LotId" UniqueName="LotId" Reorderable="true">
                                            </telerik:GridBoundColumn>
<%--                                            <telerik:GridBoundColumn HeaderText="GR Date" DataField="rcdate" AllowFiltering="true" AutoPostBackOnFilter="true" Visible="false"
                                                SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridBoundColumn>--%>

                                            <telerik:GridTemplateColumn UniqueName="rcdate" HeaderText="GR Date" ItemStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                     <%# string.Format("{0:dd/MMM/yyyy}",Eval("rcdate")) %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDatePicker ID="grdatePicker" runat="server" Skin="Office2007" Width="80px"  DateInput-DateFormat="dd/MMM/yyyy"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                        <Calendar runat="server">
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDatePicker>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot14" UniqueName="lot14" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot15" UniqueName="lot15" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot16" UniqueName="lot16" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot17" UniqueName="lot17" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot18" UniqueName="lot18" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot19" UniqueName="lot19" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot20" UniqueName="lot20" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot21" UniqueName="lot21" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot22" UniqueName="lot22" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot23" UniqueName="lot23" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot24" UniqueName="lot24" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot25" UniqueName="lot25" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot26" UniqueName="lot26" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot27" UniqueName="lot27" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot28" UniqueName="lot28" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot29" UniqueName="lot29" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot30" UniqueName="lot30" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot31" UniqueName="lot31" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot32" UniqueName="lot32" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot33" UniqueName="lot33" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot34" UniqueName="lot34" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot35" UniqueName="lot35" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot36" UniqueName="lot36" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot37" UniqueName="lot37" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot38" UniqueName="lot38" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot39" UniqueName="lot39" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot40" UniqueName="lot40" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot41" UniqueName="lot41" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot42" UniqueName="lot42" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot43" UniqueName="lot43" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot44" UniqueName="lot44" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot45" UniqueName="lot45" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot46" UniqueName="lot46" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot47" UniqueName="lot47" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot48" UniqueName="lot48" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot49" UniqueName="lot49" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot50" UniqueName="lot50" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot51" UniqueName="lot51" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot52" UniqueName="lot52" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot53" UniqueName="lot53" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot54" UniqueName="lot54" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot55" UniqueName="lot55" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot56" UniqueName="lot56" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot57" UniqueName="lot57" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot58" UniqueName="lot58" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot59" UniqueName="lot59" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="lot60" UniqueName="lot60" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <%--<telerik:GridBoundColumn HeaderText="TotExpNetWt" DataField="totexpnetwt" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                                SortExpression="totexpnetwt" UniqueName="totexpnetwt" Reorderable="true">
                                            </telerik:GridBoundColumn>--%>

                                            <telerik:GridBoundColumn HeaderText="Total Length" DataField="length" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="length" UniqueName="length" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Total Width" DataField="width" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="width" UniqueName="width" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Total Height" DataField="height" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="height" UniqueName="height" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Total Volume" DataField="vol" AllowFiltering="false" ReadOnly="true"
                                                SortExpression="vol" UniqueName="vol" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="ExRef" DataField="RDExRef" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true" Display="false"
                                                SortExpression="RDExRef" UniqueName="RDExRef" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="ExLine" DataField="ExLine" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="ExLine" UniqueName="ExLine" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Container No" DataField="VehicleEquipmentNo" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true" Display="false"
                                                SortExpression="VehicleEquipmentNo" UniqueName="VehicleEquipmentNo" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Area(L)" DataField="arealength" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true" Display="false"
                                                SortExpression="arealength" UniqueName="arealength" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Area(W)" DataField="areawidth" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true" Display="false"
                                                SortExpression="areawidth" UniqueName="areawidth" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Area" DataField="area" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true" Display="false"
                                                SortExpression="area" UniqueName="area" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"
                                                SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />
                                            <telerik:GridBoundColumn Display="False" DataField="skuid" />
                                            <telerik:GridBoundColumn Display="False" DataField="acid" />
                                            <telerik:GridBoundColumn Display="False" DataField="sitecode" />
                                            <telerik:GridBoundColumn Display="False" DataField="rcdstatus" />
                                            <telerik:GridBoundColumn Display="False" DataField="rcid" />
                                            <telerik:GridBoundColumn Display="False" DataField="rcdstatuscolor" />
                                            <telerik:GridBoundColumn Display="False" DataField="statuscolor" />
                                            <telerik:GridBoundColumn Display="False" DataField="expectedqty" />
                                            <telerik:GridBoundColumn Display="False" DataField="intransitqty" />
                                            <telerik:GridBoundColumn Display="False" DataField="receivedqty" />
                                            <telerik:GridBoundColumn DataField="BillingGrp"
                                                SortExpression="BillingGrp" UniqueName="BillingGrp" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Display="False" DataField="status" />
                                            <telerik:GridBoundColumn UniqueName="BatchRcsdtId" DataField="RcsdtId" Display="false"></telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="InventoryRadPageView" Height="700px" />
                            <telerik:RadPageView runat="server" ID="LotMovementRadPageView" Height="700px" />
                            <telerik:RadPageView runat="server" ID="UploadLot" Height="500px" />
                            <telerik:RadPageView runat="server" ID="TUNO1RadPageView" Height="700px" />
                            <telerik:RadPageView runat="server" ID="TUNO2RadPageView" Height="700px" />
                        </telerik:RadMultiPage>
                        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>

            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="inboundDeliveryAttc" />
            <telerik:RadPageView runat="server" Height="90%" ID="inboundDeliveryLog" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
