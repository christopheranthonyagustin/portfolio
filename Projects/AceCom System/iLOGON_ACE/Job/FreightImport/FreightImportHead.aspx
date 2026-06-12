<%@ Page Language="c#" CodeBehind="FreightImportHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.FreightImport.FreightImportHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightImportHead</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table width="100%">
            <tr>
                <td width="400px">
                    <asp:Button ID="ReopenBtn" class="white" runat="server" OnClick="ReopenBtn_Click" Text="Reopen" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                    <asp:Button ID="NonBillBtn" CssClass="white" runat="server" OnClick="NonBillBtn_Click" Visible="false"
                        Text="NonBill" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="TransportBtn" CssClass="LongLabelGreen" runat="server" OnClick="TransportBtn_Click"
                        Text="Book Transport" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="WarehouseBtn" CssClass="LongLabelGreen" runat="server" OnClick="WarehouseBtn_Click"
                        Text="Book Warehouse" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <telerik:RadMenu ID="RadMenu1" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                        OnItemClick="PrintRadMenu_ItemClick">
                        <Items>
                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Print" PostBack="false"
                                Value="Print" GroupSettings-Width="120px">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Charge" Text="Charge"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AWB" Text="AWB"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AWB(Draft)" Text="AWB(Draft)"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BL" Text="BL"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BL(Draft)" Text="BL(Draft)"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="TI" Text="TI"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CTI" Text="CTI"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="NOA" Text="NOA"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DO" Text="DO"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="JobSheet" Text="JobSheet"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Despatch" Text="Despatch"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SubmitPermitFF" Text="SubmitPermitFF"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SubmitPermitSL" Text="SubmitPermitSL"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="LOA" Text="LOA"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="P&L(Draft)" Text="P&L(Draft)"
                                        ImageUrl="../../image/copy.png" Visible="false" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="P&L" Text="P&L"
                                        ImageUrl="../../image/copy.png" Visible="false" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>

            </tr>
        </table>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="5000px"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="True" />
                <Scrolling AllowScroll="True" ScrollHeight="500px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid" AllowFilteringByColumn="true">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px">
                        <ItemStyle Wrap="False" Width="40px"></ItemStyle>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="90px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="450px"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="FreightImportEdit" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Freight Import Register"
                                OnClick="FIEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="FreightImportCopy" ImageUrl="../../image/copy.png"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy Freight Import Register"
                                OnClick="FICopy_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="FreightImportCancel" ImageUrl="../../image/bin.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Cancel Freight Import Register"
                                OnClick="FICancel_Click" OnClientClick="return confirm('Confirm Cancel?')" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <asp:Label ID="JobPopCfmLbl" runat="server" />
                            <asp:Label ID="WrcPopCfmLbl" runat="server" />
                            <asp:Label ID="BookTransportDoneLbl" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn HeaderText="Acc" DataField="accode" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Job#" DataField="number" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="number" SortExpression="number" UniqueName="number" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Quotation" DataField="qucode" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="qucode" SortExpression="qucode" UniqueName="qucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SType" DataField="shipmenttypedescr" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="shipmenttypedescr" SortExpression="shipmenttypedescr" UniqueName="shipmenttypedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FType" DataField="frttypedescr" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="frttypedescr" SortExpression="frttypedescr" UniqueName="frttypedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FMode" DataField="frtmodedescr" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="frtmodedescr" SortExpression="frtmodedescr" UniqueName="frtmodedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Site" DataField="releaseloc" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="releaseloc" SortExpression="releaseloc" UniqueName="releaseloc"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="HouseOBL/AWB" DataField="inmshipdocno" AllowFiltering="true" HeaderStyle-Width="145px" ItemStyle-Width="145px"
                        ColumnGroupName="inmshipdocno" SortExpression="inmshipdocno" UniqueName="inmshipdocno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="MasterOBL/AWB" DataField="outmshipdocno" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="outmshipdocno" SortExpression="outmshipdocno" UniqueName="outmshipdocno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Permit" DataField="permitno" AllowFiltering="true" HeaderStyle-Width="200px" ItemStyle-Width="200px"
                        ColumnGroupName="permitno" SortExpression="permitno" UniqueName="permitno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CustRef" DataField="EXREF1" AllowFiltering="true" HeaderStyle-Width="200px" ItemStyle-Width="200px"
                        ColumnGroupName="EXREF1" SortExpression="EXREF1" UniqueName="EXREF1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PortNetNo" DataField="exref2" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="exref2" SortExpression="exref2" UniqueName="exref2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Description" DataField="license" AllowFiltering="true" HeaderStyle-Width="700px" ItemStyle-Width="700px"
                        ColumnGroupName="license" SortExpression="license" UniqueName="license" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Invno" DataField="drinvno" AllowFiltering="true" HeaderStyle-Width="200px" ItemStyle-Width="200px"
                        ColumnGroupName="drinvno" SortExpression="drinvno" UniqueName="drinvno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TINo" DataField="delvagentrefno" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="delvagentrefno" SortExpression="delvagentrefno" UniqueName="delvagentrefno"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POL" DataField="inloadingportdescr" AllowFiltering="true" HeaderStyle-Width="240px" ItemStyle-Width="240px"
                        ColumnGroupName="inloadingportdescr" SortExpression="inloadingportdescr" UniqueName="inloadingportdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ETD" DataField="outetd" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="outetd" SortExpression="outetd" UniqueName="outetd" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POD" DataField="outdischargeportdescr" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="outdischargeportdescr" SortExpression="outdischargeportdescr" UniqueName="outdischargeportdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ETA" DataField="ineta" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                        ColumnGroupName="ineta" SortExpression="ineta" UniqueName="ineta" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BookTransportDone" SortExpression="BookTransportDone" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" />
                    <telerik:GridBoundColumn Display="False" DataField="acid" />
                    <telerik:GridBoundColumn Display="False" DataField="status" />
                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
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
                                <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
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
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
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
