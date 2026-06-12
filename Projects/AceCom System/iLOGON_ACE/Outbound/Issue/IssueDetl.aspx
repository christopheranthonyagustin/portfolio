<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="IssueDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.IssueDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
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
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="LineTab" Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Pick Task" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PickerInfo" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Inventory" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="UploadLot" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SerialNo" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table cellspacing="10" cellpadding="0" border="0" width="100%">
                    <tr>
                        <td valign="middle">&nbsp;
                            &nbsp;
                            <div style="float: left">
                                <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">
                                    <ContentTemplate>
                                        <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="GenerateIsDetlNoofPLTbtn" runat="server" UseSubmitBehavior="false"
                                            ButtonText="Generate No of PLT" Visible="false" Text="Generate No of PLT" OnClick="GenerateIsDetlNoofPLTbtn_Click" />&nbsp;
                                        <asp:Label ID="IssueIdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>&nbsp;
                                        <asp:Button ID="MassUnAllocateBtn" class="white" runat="server" OnClick="MassUnAllocateBtn_Click" Text="Unallocate"
                                            OnClientClick="return confirm('Confirm to Mass Unallocate the selected SKU Lines?')" UseSubmitBehavior="true" />&nbsp;
                                        <asp:Button ID="MassAllocateBtn" CssClass="white" runat="server" OnClick="MassAllocateBtn_Click" Text="Allocate"
                                            OnClientClick="return confirm('Confirm to Mass Allocate the selected SKU Lines?')" UseSubmitBehavior="true" />&nbsp;
                                        <asp:Button ID="MassPickedBtn" CssClass="white" runat="server" OnClick="MassPickedBtn_Click" Text="Picked"
                                            OnClientClick="return confirm('Confirm to Mass Picked the selected SKU Lines?')" UseSubmitBehavior="true" />&nbsp;
                                        <asp:Button ID="MassPackedBtn" class="white" runat="server" OnClick="MassPackedBtn_Click" Text="PackIn1"
                                            OnClientClick="return confirm('Confirm to Mass Packed the selected SKU Lines?')" UseSubmitBehavior="true" />&nbsp;
                                        <asp:Button ID="MassDeleteBtn" CSSClass="white" runat="server" OnClick="MassDeleteBtn_Click" Text="Delete"
                                            OnClientClick="return confirm('Confirm to Mass Delete the selected SKU Lines?')" UseSubmitBehavior="true" />&nbsp;
                                        <asp:Button ID="CopyBtn" class="white" runat="server" OnClick="CopySKULine_Click" Text="Copy"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="ButtonExcel" class="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel" ToolTip="Export To Excel" />&nbsp;
                                        <asp:Button ID="CompleteOrderBtn" CssClass="LongLabelWhite" runat="server" OnClick="CompleteOrderBtn_Click" Text="Complete Order"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="GenerateSerialNoExcelBtn" class="LongLabelGreen" runat="server" OnClick="GenerateSerialNoExcelBtn_Click" Text="Generate SerialNo Excel" ToolTip="Generate SerialNo Excel"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="ExplodeBOMBtn" class="LongLabelWhite" runat="server" OnClick="ExplodeBOMBtn_Click" Text="Explode BOM" ToolTip="Explode BOM"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /><br /><br />
                                        <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                                        <asp:Button ID="SkuLabelBtn" CssClass="blue" runat="server" OnClick="SkuLabelBtn_Click" Text="SKU Label" Visible="true"
                                        OnClientClick="return confirm('Confirm to print Label for the selected SKU Lines?.')" UseSubmitBehavior="true" />
                                        <asp:Button ID="SplitBtn" class="white" runat="server" OnClick="SplitBtn_Click" Text="Split"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
                                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                        <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="GenerateSerialNoExcelBtn" />
                                        <asp:PostBackTrigger ControlID="CompleteOrderBtn" />
                                        <asp:PostBackTrigger ControlID="MassAllocateBtn" />
                                        <asp:PostBackTrigger ControlID="MassUnAllocateBtn" />
                                        <asp:PostBackTrigger ControlID="MassPickedBtn" />
                                        <asp:PostBackTrigger ControlID="MassPackedBtn" />
                                        <asp:PostBackTrigger ControlID="CopyBtn" />
                                        <asp:PostBackTrigger ControlID="ButtonExcel" />
                                        <asp:PostBackTrigger ControlID="MassDeleteBtn" />
                                        <asp:PostBackTrigger ControlID="GenerateIsDetlNoofPLTbtn" />
                                        <asp:PostBackTrigger ControlID="MsgPopup" />
                                        <asp:PostBackTrigger ControlID="NewBtn" />
                                        <asp:PostBackTrigger ControlID="RefreshBtn" />
                                        <asp:PostBackTrigger ControlID="EditBtn" />
                                        <asp:PostBackTrigger ControlID="SplitBtn" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                        </div>
                        <div id="LoaderPopup">
                            <a id="loader"></a>
                            <a id="text">We are processing your request ...</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="58%"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting"
                    Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="ResultDG_GridExporting">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling ScrollHeight="350px" AllowScroll="true" UseStaticHeaders="true" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="MassUnallocateChkbx" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <a id="lnkBOM" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="BOM_Explode"
                                        onclick="return confirm('Confirm Explode BOM?')" runat="server">
                                        <img id="BOMImg" src="../../image/BOM.png" width="15" height="15" border="0" alt="Explode BOM"
                                            title="Explode BOM" runat="server" /></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm delete Issue Detail?')" onserverclick="IsDetail_Delete"
                                                runat="server"></a>
                                    <asp:ImageButton runat="server" Visible="false" ID="ExplodeBtn" ImageUrl="../../image/bomb.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Explode"
                                        OnClick="ExplodeBtn_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="number" AllowFiltering="false">
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="ExLine" DataField="exline" AllowFiltering="false"
                                SortExpression="exline" UniqueName="exline" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Description" DataField="skudescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SKUGroup" DataField="SKUGRPDescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="SKUGRPDescr" UniqueName="SKUGRPDescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Expected" DataField="expecteduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Allocated" DataField="allocateduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="allocateduomqty" UniqueName="allocateduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Picked" DataField="pickeduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="pickeduomqty" UniqueName="pickeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Packed" DataField="packeduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="packeduomqty" UniqueName="packeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Shipped" DataField="shippeduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="shippeduomqty" UniqueName="shippeduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Reason Code" DataField="ReasonCode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="ReasonCode" UniqueName="ReasonCode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Rcv Date" DataField="rcdate" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Part No" DataField="lot9" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Length" DataField="Length" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Length" UniqueName="Length" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Width" DataField="Width" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Width" UniqueName="Width" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Height" DataField="Height" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Height" UniqueName="Height" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Volume (M3)" DataField="ExpectedVol" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="ExpectedVol" UniqueName="ExpectedVol" Reorderable="true" DataFormatString="{0:N6}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Weight" DataField="ExpectedWT" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="ExpectedWT" UniqueName="ExpectedWT" Reorderable="true" DataFormatString="{0:N6}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 4" DataField="lot4" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot4" UniqueName="lot4" Reorderable="true" DataFormatString="&nbsp;{0}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 1" DataField="lot1" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 5" DataField="lot5" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot5" UniqueName="lot5" Reorderable="true" DataFormatString="&nbsp;{0}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 6" DataField="lot6" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="lot6" UniqueName="lot6" Reorderable="true" DataFormatString="&nbsp;{0}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 7" DataField="lot7" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 2" DataField="lot2" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 3" DataField="lot3" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 8" DataField="lot8" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TuNo1" DataField="tuno1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TuNo2" DataField="tuno2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="tuno2" UniqueName="tuno2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OutboundPermitNo" DataField="OutboundPermitNo" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="OutboundPermitNo" UniqueName="OutboundPermitNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VAS" DataField="vasdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="vasdescr" UniqueName="vasdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remark1" DataField="rem1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="rem1" UniqueName="rem1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remark2" DataField="rem2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="rem2" UniqueName="rem2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Shelf Life" DataField="shelflife" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="shelflife" UniqueName="shelflife" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtInvNo" DataField="extinvno" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="extinvno" UniqueName="extinvno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtPoNo" DataField="extpono" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="extpono" UniqueName="extpono" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtRef" DataField="extrefno" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="extrefno" UniqueName="extrefno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToLot6" DataField="ToLot6" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="ToLot6" UniqueName="ToLot6" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtSKU" DataField="extskucode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="extskucode" UniqueName="extskucode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtStatus" DataField="extstatus" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="extstatus" UniqueName="extstatus" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="skuid" DataField="skuid" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="skuid" UniqueName="skuid" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="status" UniqueName="status" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="shdate" SortExpression="shdate" />
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                            <telerik:GridBoundColumn Display="False" DataField="bom_sku" SortExpression="bom_sku" />
                            <telerik:GridBoundColumn Display="False" DataField="IsType" SortExpression="IsType" />
                            <telerik:GridBoundColumn Display="False" DataField="ApproveAllocateStatus" SortExpression="ApproveAllocateStatus" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="PickTaskRadPageView" Height="500px" />
            <telerik:RadPageView runat="server" ID="PickerInfoRadPageView" Height="600px" />
            <telerik:RadPageView runat="server" ID="InventoryRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadLotRadPageView" Height="500px" />
            <telerik:RadPageView runat="server" ID="SerialNoRadPageView" Height="500px" />
        </telerik:RadMultiPage>
        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
