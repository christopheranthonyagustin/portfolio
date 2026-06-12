<%@ Page Language="c#" CodeBehind="CashBookHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CashBookPV2.CashBookHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBookPV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="400px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <telerik:RadWindow ID="PostConsolidatedRadWindow" runat="server" VisibleOnPageLoad="true" Width="400px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="UnpostedTab" Text="Unposted" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <%--<div style="height: 100%" id="div-datagrid">--%>
                <table cellpadding="2" cellspacing="2" style="width: 100%; height: 30px">
                    <tr>
                        <td>
                            <asp:Button ID="PrintPVBtn" runat="server" Text="PV" OnClick="PrintPVBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="blue" />
                            &nbsp;
                    <asp:Button ID="PrintPOBtn" runat="server" Text="PO" OnClick="PrintPOBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="blue" />
                            &nbsp;
                    <asp:Button ID="ConvertPIBtn" runat="server" Text="PI" OnClick="ConvertPIBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelAllBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="CopyBtn" runat="server" Text="Copy" OnClick="CopyBtn_Click"
                        OnClientClick="return confirm('Confirm Copy?')" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="CheckBtn" runat="server" Text="Check" OnClick="CheckBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="ApproveBtn" runat="server" Text="Approve" OnClick="ApproveBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="ReOpenBtn" runat="server" Text="Reopen" OnClick="ReOpenBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="PaidImgBtn" runat="server" Text="Paid" OnClick="PaidBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="PendingRefundBtn" runat="server" Text="Pending Refund" OnClick="PendingRefundBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                            &nbsp;
                    <asp:Button ID="RefundBtn" runat="server" Text="Refunded" OnClick="RefundBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                    <asp:Button ID="PVCfmImgBtn" runat="server" Text="Post" OnClick="PVCfmImgBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" />
                            &nbsp;
                            <br />
                            <br />
                            <%--<asp:Button ID="PostConsolidatedBtn" runat="server" Text="Post Consolidated" OnClick="PostConsolidatedBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelGreen" />
                            &nbsp;--%>
                            <telerik:RadMenu ID="RadMenu1" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                                OnItemClick="RadMenu1_ItemClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Post Consolidated" PostBack="false"
                                        Value="PostConsolidated">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Consolidated(AP)" Text="Consolidated (AP)"
                                                Visible="true" />
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Consolidated(CB)" Text="Consolidated (CB)"
                                                Visible="true" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            &nbsp;
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Button ID="CircleBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="86%"
                        AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true" Resizing-AllowColumnResize="true">
                            <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                    <HeaderTemplate>
                                        <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="PaymentRegisterEdit" ImageUrl="../../image/pencil.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Payment Register"
                                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="AttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                            BorderWidth="0" BackColor="Transparent" OnClick="AttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:Label ID="CbCfmLbl" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="EntCode" SortExpression="EntCode" HeaderText="Entity" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="PaymentNo" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="trandate" SortExpression="trandate" HeaderText="PaymentDate" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Account" HeaderStyle-Width="350px" ItemStyle-Width="250px">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="CustomerReference" SortExpression="CustomerReference" HeaderText="CustomerReference" HeaderStyle-Width="350px" ItemStyle-Width="250px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vdname" SortExpression="vdname" HeaderText="VendorName" HeaderStyle-Width="350px" ItemStyle-Width="250px">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="VendorDocDate" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="VendorDocNo" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ChargeDescr" SortExpression="ChargeDescr" HeaderText="ChargeDescr" HeaderStyle-Width="350px" ItemStyle-Width="350px"
                                    ItemStyle-Wrap="False" Resizable="true" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="srcno" SortExpression="srcno" HeaderText="JobNo" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="CtnrNo" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bankdescr" SortExpression="bankdescr" HeaderText="Bank" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Cny" HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fcinvamt" SortExpression="fcinvamt" HeaderText="TotalAmt" HeaderStyle-Width="70px" ItemStyle-Width="70px"
                                    DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fcamt" SortExpression="fcamt" HeaderText="Subtotal" HeaderStyle-Width="70px" ItemStyle-Width="70px"
                                    DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fctaxamt" SortExpression="fctaxamt" HeaderText="TaxAmt" HeaderStyle-Width="70px" ItemStyle-Width="70px"
                                    DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="chequeno" SortExpression="chequeno" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    HeaderText="ChequeNo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="paytermsdescr" SortExpression="paytermsdescr" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    HeaderText="PaymentTerms">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="taxprofiledescr" SortExpression="taxprofiledescr" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    AllowFiltering="false" HeaderText="TaxProfileCode">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pino" SortExpression="pino" AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    HeaderText="PINo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="piinvno" SortExpression="piinvno" AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    HeaderText="PIInvNo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="period" SortExpression="period" HeaderText="Period" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="apprvby" SortExpression="apprvby" HeaderText="ApprvBy" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="apprvrem1" SortExpression="apprvrem1" HeaderText="ApprvRem1" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="apprvstatusdescr" SortExpression="apprvstatusdescr" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    HeaderText="ApprvStatus">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="entid" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="piid" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ConvertedToPI" SortExpression="ConvertedToPI" HeaderText="ConvertedToPI" Display="False">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <br />
                <%--<div style="height: 100%" id="div-datagrid">--%>
                <table cellpadding="2" cellspacing="2" style="width: 100%; height: 30px">
                    <tr>
                        <td>
                            <asp:Button ID="Unposted_PVCfmImgBtn" runat="server" Text="Post" OnClick="Unposted_PVCfmImgBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" />
                            &nbsp;
                    <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
                    <telerik:RadGrid ID="ResultDG_Unposted" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="86%"
                        AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007"
                        OnNeedDataSource="ResultDG_Unposted_NeedDataSource" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_Unposted_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="PaymentRegisterEdit" ImageUrl="../../image/pencil.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Payment Register"
                                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                        <%--<iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>--%>
                                        <%--<iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>--%>
                                        <asp:Label ID="CbCfmLbl" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="EntCode" SortExpression="EntCode" HeaderText="Entity" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="PaymentNo" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="trandate" SortExpression="trandate" HeaderText="PaymentDate"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Account">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CustomerReference" SortExpression="CustomerReference" HeaderText="CustomerReference">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vdname" SortExpression="vdname" HeaderText="VendorName">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="VendorDocNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ChargeDescr" SortExpression="ChargeDescr" HeaderText="ChargeDescr"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="srcno" SortExpression="srcno" HeaderText="JobNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="CtnrNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bankdescr" SortExpression="bankdescr" HeaderText="Bank"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Cny"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fcinvamt" SortExpression="fcinvamt" HeaderText="TotalAmt"
                                    DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fcamt" SortExpression="fcamt" HeaderText="Subtotal"
                                    DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fctaxamt" SortExpression="fctaxamt" HeaderText="TaxAmt"
                                    DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="chequeno" SortExpression="chequeno"
                                    HeaderText="ChequeNo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="paytermsdescr" SortExpression="paytermsdescr"
                                    HeaderText="PaymentTerms">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="taxprofiledescr" SortExpression="taxprofiledescr"
                                    AllowFiltering="false" HeaderText="TaxProfileCode">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pino" SortExpression="pino" AllowFiltering="false"
                                    HeaderText="PINo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="piinvno" SortExpression="piinvno" AllowFiltering="false"
                                    HeaderText="PIInvNo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="period" SortExpression="period" HeaderText="Period">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="apprvby" SortExpression="apprvby" HeaderText="ApprvBy">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="apprvrem1" SortExpression="apprvrem1" HeaderText="ApprvRem1">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="apprvstatusdescr" SortExpression="apprvstatusdescr"
                                    HeaderText="ApprvStatus">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="entid" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="piid" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ConvertedToPI" SortExpression="ConvertedToPI" HeaderText="ConvertedToPI" Display="False">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        </div>
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
