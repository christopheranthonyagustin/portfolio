<%@ Page Language="c#" CodeBehind="SkuListHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku.SkuListHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>SkuListHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

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
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Inventory" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="ResultsRadPageView">
                <div id="div1">
                    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit" OnClick="EditBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="DelImgBtn" runat="server" class="white" Text="Delete" OnClick="DeleteAllBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="false" ToolTip="Delete Selected SKU(s)" />
                            &nbsp;
                             <asp:Button ID="MassUpdateBtn" runat="server" Text="Update" Visible="false" OnClick="MassUpdateBtn_Click"
                                 OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" ToolTip="Update Selected SKU(s)" />
                            &nbsp;                            
                            <asp:Button ID="MSDSBtn" runat="server" Text="MSDS" OnClick="MSDSBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="blue" ToolTip="Print Selected SKU(s)" />
                            &nbsp;
                             <asp:Button ID="SKUMasterLabelBtn" CssClass="LongLabelBlue" runat="server" OnClick="SKUMasterLabelBtn_Click" Text="SKU Master Label" Visible="true"
                                 OnClientClick="return confirm('Confirm to print Label for the selected SKU Lines?.')" UseSubmitBehavior="true" />&nbsp;
                        </td>
                        <td align="right">
                            <br />
                            &nbsp;
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
                <br />

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true"
                    AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <GroupingSettings CaseSensitive="false" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <label id="completelbl">
                                    </label>
                                    &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>

                                     <asp:ImageButton runat="server" Visible="False" ID="AttcBtn" ImageUrl="../../image/attached.jpg"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        CausesValidation="False"></asp:ImageButton>

                                    <asp:ImageButton runat="server" Visible="True" ID="CopyBtn" ImageUrl="../../image/copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="CopyBtn_Click" CausesValidation="False"></asp:ImageButton>

                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="SkuDelete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete SKU"
                                            title="Delete SKU" runat="server" /></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                                ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" HeaderText="acid" />
                            <telerik:GridBoundColumn HeaderText="SKU code" DataField="code" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                ColumnGroupName="code" SortExpression="Code" UniqueName="Code" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Description" DataField="descr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                ColumnGroupName="descr" SortExpression="descr" UniqueName="Description" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="UPCEAN" DataField="UPCEAN" AllowFiltering="true"
                                SortExpression="UPCEAN" UniqueName="UPCEAN" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Pack Descr" DataField="packing" AllowFiltering="true"
                                ColumnGroupName="packing" SortExpression="packing" UniqueName="Packing" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Code2" DataField="Code2" AllowFiltering="true"
                                ColumnGroupName="Code2" SortExpression="Code2" UniqueName="Code2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                                ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="Type" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Class" DataField="classdescr" AllowFiltering="true"
                                ColumnGroupName="classdescr" SortExpression="classdescr" UniqueName="Class" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Group" DataField="grpdescr" AllowFiltering="true"
                                ColumnGroupName="grpdescr" SortExpression="grpdescr" UniqueName="Group" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Family" DataField="familydescr" AllowFiltering="true"
                                ColumnGroupName="familydescr" SortExpression="familydescr" UniqueName="Family"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Billing Grp" DataField="billinggrp" AllowFiltering="true"
                                ColumnGroupName="billinggrp" SortExpression="billinggrp" UniqueName="Billinggrp"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="Status"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Grade" DataField="grade" AllowFiltering="true"
                                ColumnGroupName="grade" SortExpression="grade" UniqueName="Grade" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Bag Size" DataField="bagsize" AllowFiltering="true"
                                ColumnGroupName="bagsize" SortExpression="bagsize" UniqueName="Bagsize" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Putaway" DataField="putcodedescr" AllowFiltering="true"
                                ColumnGroupName="putcodedescr" SortExpression="putcodedescr" UniqueName="Putaway"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Allocation" DataField="allcodedescr" AllowFiltering="true"
                                ColumnGroupName="allcodedescr" SortExpression="allcodedescr" UniqueName="Allocation"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ABC Classification" DataField="abcdescr" AllowFiltering="true"
                                ColumnGroupName="abcdescr" SortExpression="abcdescr" UniqueName="ABC" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Shelf Life" DataField="shelflife" AllowFiltering="true"
                                ColumnGroupName="shelflife" SortExpression="shelflife" UniqueName="Shelflife"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Re-Order Level" DataField="reorderlevel" AllowFiltering="true"
                                ColumnGroupName="reorderlevel" SortExpression="reorderlevel" UniqueName="Reorderlevel"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Re-Order Qty" DataField="reorderqty" AllowFiltering="true"
                                ColumnGroupName="reorderqty" SortExpression="reorderqty" UniqueName="Reorderqty"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="HS Code" DataField="hscode" AllowFiltering="true"
                                ColumnGroupName="hscode" SortExpression="hscode" UniqueName="Hscode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="COO" DataField="COODescr" AllowFiltering="true"
                                ColumnGroupName="COODescr" SortExpression="COODescr" UniqueName="COODescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="IMDG" DataField="IMDG" AllowFiltering="true"
                                ColumnGroupName="IMDG" SortExpression="IMDG" UniqueName="IMDG" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="MarinePollutant" DataField="MarinePollutant" AllowFiltering="true"
                                ColumnGroupName="MarinePollutant" SortExpression="MarinePollutant" UniqueName="MarinePollutant"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PackingGroup" DataField="PackingGroup" AllowFiltering="true"
                                ColumnGroupName="PackingGroup" SortExpression="PackingGroup" UniqueName="PackingGroup"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GHS" DataField="GHS" AllowFiltering="true"
                                ColumnGroupName="GHS" SortExpression="GHS" UniqueName="GHS"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FlashPoint" DataField="FlashPoint" AllowFiltering="true"
                                ColumnGroupName="hscode" SortExpression="FlashPoint" UniqueName="FlashPoint" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="UNNo" DataField="UNNo" AllowFiltering="true"
                                ColumnGroupName="UNNo" SortExpression="UNNo" UniqueName="UNNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SpecialHandlingCode" DataField="SpecialHandlingCodedescr" AllowFiltering="true"
                                ColumnGroupName="SpecialHandlingCodedescr" SortExpression="SpecialHandlingCodedescr" UniqueName="SpecialHandlingCodedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="NotificationCode" DataField="NotificationCodedescr" AllowFiltering="true"
                                ColumnGroupName="NotificationCodedescr" SortExpression="NotificationCodedescr" UniqueName="NotificationCodedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VASCode" DataField="VASCodedescr" AllowFiltering="true"
                                ColumnGroupName="VASCodedescr" SortExpression="VASCodedescr" UniqueName="VASCodedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BarcodeType" DataField="BarcodeTypedescr" AllowFiltering="true"
                                ColumnGroupName="BarcodeTypedescr" SortExpression="BarcodeTypedescr" UniqueName="BarcodeTypedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="NoOfMSDS" DataField="NoOfMSDS" AllowFiltering="true"
                                ColumnGroupName="NoOfMSDS" SortExpression="NoOfMSDS" UniqueName="NoOfMSDS" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Remark2" DataField="Rem2" AllowFiltering="true"
                                ColumnGroupName="Rem2" SortExpression="Rem2" UniqueName="Rem2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                                ColumnGroupName="adddate" SortExpression="adddate" UniqueName="Adddate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                                ColumnGroupName="adduser" SortExpression="adduser" UniqueName="Adduser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                                ColumnGroupName="editdate" SortExpression="editdate" UniqueName="Editdate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                                ColumnGroupName="edituser" SortExpression="edituser" UniqueName="Edituser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />

                            <telerik:GridBoundColumn Display="False" DataField="NoOfAttc" SortExpression="NoOfAttc" HeaderText="NoOfAttc" />
                           
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SkuInventoryRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
