<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundDeliveryHead.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundDelivery.OutboundDeliveryHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>OutboundDeliveryListHead</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
</head>
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
</script>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div id="div1">
                    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                        </tr>
                    </table>
                </div>
                <br />
                <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <asp:Label Style="z-index: 0" ID="isstatusLbl" runat="server" Visible="False"></asp:Label>
                <asp:Button ID="RefreshBtn" CssClass="LongLabelWhite" runat="server" OnClick="RefreshBtn_Click" Text="Refresh"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="CancelBtn" runat="server" CssClass="LongLabelWhite" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <asp:Button ID="ShippedBtn" CssClass="LongLabelWhite" runat="server" OnClick="ShippedBtn_Click" Text="Shipped"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="SendConfirmationBtn" CssClass="LongLabelWhite" runat="server" OnClick="SendConfirmationBtn_Click" Text="Send Confirmation"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="PrintPTBtn" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Print&nbsp;&nbsp;&nbsp;&nbsp; Pick Ticket" OnClick="PrintPTBtn_Click"
                    OnClientClick="disableBtn(this.id,false)"
                    UseSubmitBehavior="false" CssClass="LongLabelBlue" ToolTip="Charge Sheet" />
                <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" style ="float:right"/>
                <br />
                <br />
                <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" Visible="false" ID="OutboundDeliveryEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Outbound Delivery"
                                        OnClick="OutboundDeliveryEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:Label ID="ShippedEDIDoneLbl" runat="server" />
                                    <asp:Label ID="ShippedEDIErrorLbl" runat="server" />
                                    <asp:Label ID="ShippedEDISentLbl" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                                AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Account Name" Display="false"
                                AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Issue No" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="Order No" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                                AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SKUCode" SortExpression="SKUCode" HeaderText="SKU Code" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SKUDescr" SortExpression="SKUDescr" HeaderText="SKU Description" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Priority" SortExpression="Priority" HeaderText="Priority" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="RequiredQty" SortExpression="RequiredQty" HeaderText="Required Qty" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="RequiredQtyUOM" SortExpression="RequiredQtyUOM" HeaderText="UOM" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="BatchNo" SortExpression="BatchNo" HeaderText="Batch No" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="acid" SortExpression="acid" HeaderText="acid" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ShippedEDIDone" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ShippedEDIError" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ShippedEDISent" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
