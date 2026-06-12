<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundDeliveryForm.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundDelivery.OutboundDeliveryForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>OutboundDeliveryForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
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
                <asp:Button ID="AllocateBtn" CssClass="white" runat="server" OnClick="AllocateBtn_Click" ToolTip="Save"
                    Text="Allocate" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />

                <asp:Button ID="UnAllocateBtn" CssClass="white" runat="server" OnClick="UnAllocateBtn_Click" ToolTip="Save"
                    Text="Unallocate" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />

                <asp:Button ID="BlockNowBtn" CssClass="white" runat="server" OnClick="BlockNowBtn_Click" ToolTip="Block"
                    Text="Block now" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                <asp:Button ID="UnblockNowBtn" CssClass="white" runat="server" OnClick="UnblockNowBtn_Click" ToolTip="Unblock"
                    Text="Unblock now" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" CausesValidation="false" MultiPageID="RadMultiPage2"
                    AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab Text="Line Item" Value="0" readonly="readonly" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Text="Pick Task" Value="50" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Text="Available Stocks" Value="100" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <br />
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
                    <telerik:RadPageView runat="server" Height="90%" ID="RadPageView1">
                        <%--<telerik:RadMultiPage runat="server" ID="RadMultiPage3" SelectedIndex="0" CssClass="outerMultiPage">--%>
                        <%--<telerik:RadPageView runat="server" Height="90%" ID="MainInfoRadPageView">--%>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td>
                                    <br />
                                    <%--<asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">--%>
                                    <%--<ContentTemplate>--%>
                                    <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                                    <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;

                                                     <asp:Button ID="Lot15Btn" CssClass="LongLabelWhite" runat="server" OnClick="Lot15Btn_Click" Text="Change Lot15"
                                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;

                                                     <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
                                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                    <%--</ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="NewBtn" />
                                                    <asp:PostBackTrigger ControlID="EditBtn" />
                                                </Triggers>--%>
                                    <%-- </asp:UpdatePanel>--%>
                                    <br />
                                </td>
                                <td align="right">
                                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                                </td>
                            </tr>
                        </table>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="58%"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true"
                            Skin="Metro" OnColumnCreated="ResultDG_ColumnCreated" OnItemDataBound="ResultDG_ItemDataBound">
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
                                                    title="Explode BOM" runat="server" />
                                            </a>
                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm delete Issue Detail?')" onserverclick="IsDetail_Delete"
                                                runat="server"></a>

                                            <asp:ImageButton runat="server" ID="ExplodeBOM" ImageUrl="../../image/explodeBOM.png" BorderWidth="0" Visible="false"
                                                BackColor="Transparent" Width="15" Height="15" OnClick="ExplodeBOM_Click" AlternateText="Explode Into BOM"></asp:ImageButton>

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
                                    <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" AllowFiltering="false" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Description" DataField="skudescr" AllowFiltering="false" SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false" SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="false" SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Expected" DataField="expecteduomqty" AllowFiltering="false" SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                                        DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Allocated" DataField="allocateduomqty" AllowFiltering="false" SortExpression="allocateduomqty" UniqueName="allocateduomqty" Reorderable="true"
                                        DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Picked" DataField="pickeduomqty" AllowFiltering="false" SortExpression="pickeduomqty" UniqueName="pickeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Packed" DataField="packeduomqty" AllowFiltering="false" SortExpression="packeduomqty" UniqueName="packeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Shipped" DataField="shippeduomqty" AllowFiltering="false" SortExpression="shippeduomqty" UniqueName="shippeduomqty" Reorderable="true"
                                        DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Rcv Date" DataField="rcdate" AllowFiltering="false" SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 9" DataField="lot9" AllowFiltering="false" SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 4" DataField="lot4" AllowFiltering="false" SortExpression="lot4" UniqueName="lot4" Reorderable="true" DataFormatString="&nbsp;{0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 1" DataField="lot1" AllowFiltering="false" SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 5" DataField="lot5" AllowFiltering="false" SortExpression="lot5" UniqueName="lot5" Reorderable="true" DataFormatString="&nbsp;{0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 6" DataField="lot6" AllowFiltering="false" SortExpression="lot6" UniqueName="lot6" Reorderable="true" DataFormatString="&nbsp;{0}">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn UniqueName="lot15" HeaderText="lot15" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="lot15txt" runat="server" Visible="true" Text='<%# Eval("lot15") %>'>
                                            </asp:TextBox>
                                            <asp:Label ID="lot15" Text='<%#DataBinder.Eval(Container.DataItem, "lot15")%>' runat="server" Visible="false" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn HeaderText="Lot 7" DataField="lot7" AllowFiltering="false" SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 2" DataField="lot2" AllowFiltering="false" SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 3" DataField="lot3" AllowFiltering="false" SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 8" DataField="lot8" AllowFiltering="false" SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="false" SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TuNo1" DataField="tuno1" AllowFiltering="false" SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TuNo2" DataField="tuno2" AllowFiltering="false" SortExpression="tuno2" UniqueName="tuno2" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="false" SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="false" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="false" SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="false" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="skuid" DataField="skuid" AllowFiltering="false" SortExpression="skuid" UniqueName="skuid" Reorderable="true" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="false" SortExpression="status" UniqueName="status" Reorderable="true" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="false" SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="False" DataField="shdate" SortExpression="shdate" />
                                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                                    <telerik:GridBoundColumn Display="False" DataField="bom_sku" SortExpression="bom_sku" />
                                    <telerik:GridBoundColumn Display="False" DataField="IsType" SortExpression="IsType" />
                                    <telerik:GridBoundColumn Display="False" DataField="ApproveAllocateStatus" SortExpression="ApproveAllocateStatus" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <%--</telerik:RadPageView>--%>
                        <%--</telerik:RadMultiPage>--%>
                        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="OutboundDeliveryPickTaskRadPageView" />
                    <telerik:RadPageView runat="server" Height="90%" ID="OutboundDeliveryAvailableStocksRadPageView" />
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="OutboundDeliveryAttc" />
            <telerik:RadPageView runat="server" Height="90%" ID="OutboundDeliveryLog" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
