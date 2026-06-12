<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV2SKULine.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV2.GIV2SKULine" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Goods Issue V2 SKULine</title>
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
                <telerik:RadTab Text="Line" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Inventory" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="UploadLot" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SerialNo" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="BreakBulk" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table cellspacing="10" cellpadding="0" border="0" width="100%">
                    <tr>
                        <td valign="middle">
                            <div style="float: left">
                                <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">
                                    <ContentTemplate>
                                        <asp:Label ID="IssueIdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
                                        <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="GenerateIsDetlNoofPLTbtn" CssClass="LongLabelWhite" runat="server" UseSubmitBehavior="false"
                                            ButtonText="Generate No of PLT" Enabled="false" Text="Generate No of PLT"
                                            OnClick="GenerateIsDetlNoofPLTbtn_Click" />
                                        <asp:Button ID="MassUnAllocateBtn" CssClass="white" runat="server" OnClick="MassUnAllocateBtn_Click" 
                                            Text="Unallocate" OnClientClick="return confirm('Confirm to Mass Unallocate the selected SKU Lines?')" 
                                            UseSubmitBehavior="true" />
                                        <asp:Button ID="MassAllocateBtn" CssClass="white" runat="server" OnClick="MassAllocateBtn_Click"  Visible="false"
                                            Text="Allocate" OnClientClick="return confirm('Confirm to Mass Allocate the selected SKU Lines?')" 
                                            UseSubmitBehavior="true" />
                                        <asp:Button ID="MassPickedBtn" CssClass="white" runat="server" OnClick="MassPickedBtn_Click" 
                                            Text="Picked" OnClientClick="return confirm('Confirm to Mass Picked the selected SKU Lines?')" 
                                            UseSubmitBehavior="true" Enabled="false" />
                                        <asp:Button ID="MassPackedBtn" CssClass="white" runat="server" OnClick="MassPackedBtn_Click" 
                                            Text="PackIn1" OnClientClick="return confirm('Confirm to Mass Packed the selected SKU Lines?')" 
                                            UseSubmitBehavior="true" />
                                        <asp:Button ID="MassDeleteBtn" CssClass="white" runat="server" OnClick="MassDeleteBtn_Click" 
                                            Text="Delete" OnClientClick="return confirm('Confirm to Mass Delete the selected SKU Lines?')" 
                                            UseSubmitBehavior="true" />
                                        <asp:Button ID="CopyBtn" CssClass="white" runat="server" OnClick="CopySKULine_Click" Text="Copy"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ButtonExcel_Click" 
                                            Text="Excel" ToolTip="Export To Excel" />
                                        <asp:Button ID="CompleteOrderBtn" CssClass="LongLabelWhite" runat="server" OnClick="CompleteOrderBtn_Click" 
                                            Text="Complete Order" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="CompleteOrderBtn" />
                                        <asp:PostBackTrigger ControlID="MassAllocateBtn" />
                                        <asp:PostBackTrigger ControlID="MassPickedBtn" />
                                        <asp:PostBackTrigger ControlID="MassPackedBtn" />
                                        <asp:PostBackTrigger ControlID="CopyBtn" />
                                        <asp:PostBackTrigger ControlID="ButtonExcel" />
                                        <asp:PostBackTrigger ControlID="MassDeleteBtn" />
                                        <asp:PostBackTrigger ControlID="GenerateIsDetlNoofPLTbtn" />
                                        <asp:PostBackTrigger ControlID="MsgPopup" />
                                        <asp:PostBackTrigger ControlID="NewBtn" />
                                        <asp:PostBackTrigger ControlID="EditBtn" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" 
                                OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
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
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true"
                    Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="ResultDG_GridExporting">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling ScrollHeight="350px" AllowScroll="true"  UseStaticHeaders="true"/>
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
                                    <asp:Label ID="ExplodeLbl" runat="server" />
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
                            <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true"
                                SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Description" DataField="skudescr" AllowFiltering="true"
                                SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                                SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="false"
                                SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Expected" DataField="expecteduomqty" AllowFiltering="false"
                                SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Allocated" DataField="allocateduomqty" AllowFiltering="false"
                                SortExpression="allocateduomqty" UniqueName="allocateduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Picked" DataField="pickeduomqty" AllowFiltering="false"
                                SortExpression="pickeduomqty" UniqueName="pickeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Packed" DataField="packeduomqty" AllowFiltering="false"
                                SortExpression="packeduomqty" UniqueName="packeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Shipped" DataField="shippeduomqty" AllowFiltering="false"
                                SortExpression="shippeduomqty" UniqueName="shippeduomqty" Reorderable="true"
                                DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Rcv Date" DataField="rcdate" AllowFiltering="true"
                                SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 4" DataField="lot4" AllowFiltering="true"
                                SortExpression="lot4" UniqueName="lot4" Reorderable="true" DataFormatString="&nbsp;{0}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 1" DataField="lot1" AllowFiltering="true"
                                SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 5" DataField="lot5" AllowFiltering="true"
                                SortExpression="lot5" UniqueName="lot5" Reorderable="true" DataFormatString="&nbsp;{0}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 6" DataField="lot6" AllowFiltering="true"
                                SortExpression="lot6" UniqueName="lot6" Reorderable="true" DataFormatString="&nbsp;{0}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 7" DataField="lot7" AllowFiltering="true"
                                SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 2" DataField="lot2" AllowFiltering="true"
                                SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 3" DataField="lot3" AllowFiltering="true"
                                SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot 8" DataField="lot8" AllowFiltering="true"
                                SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true"
                                SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TuNo1" DataField="tuno1" AllowFiltering="true"
                                SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TuNo2" DataField="tuno2" AllowFiltering="true"
                                SortExpression="tuno2" UniqueName="tuno2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VAS" DataField="vasdescr" AllowFiltering="true"
                                SortExpression="vasdescr" UniqueName="vasdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem1" AllowFiltering="true"
                                SortExpression="rem1" UniqueName="rem1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Shelf Life" DataField="shelflife" AllowFiltering="true"
                                SortExpression="shelflife" UniqueName="shelflife" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtInvNo" DataField="extinvno" AllowFiltering="true"
                                SortExpression="extinvno" UniqueName="extinvno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtPoNo" DataField="extpono" AllowFiltering="true"
                                SortExpression="extpono" UniqueName="extpono" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtRef" DataField="extrefno" AllowFiltering="true"
                                SortExpression="extrefno" UniqueName="extrefno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToLot6" DataField="ToLot6" AllowFiltering="true"
                                SortExpression="ToLot6" UniqueName="ToLot6" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtSKU" DataField="extskucode" AllowFiltering="true"
                                SortExpression="extskucode" UniqueName="extskucode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExtStatus" DataField="extstatus" AllowFiltering="true"
                                SortExpression="extstatus" UniqueName="extstatus" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                                SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                                SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                                SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="skuid" DataField="skuid" AllowFiltering="true"
                                SortExpression="skuid" UniqueName="skuid" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                                SortExpression="status" UniqueName="status" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                                SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="shdate" SortExpression="shdate" />
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                            <telerik:GridBoundColumn Display="False" DataField="bom_sku" SortExpression="bom_sku" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="InventoryRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadLotRadPageView" Height="500px" />
            <telerik:RadPageView runat="server" ID="SerialNoRadPageView" Height="500px" />
            <telerik:RadPageView runat="server" ID="BreakBulkRadPageView" Height="700px" />
        </telerik:RadMultiPage>
        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

