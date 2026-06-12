<%@ Page Language="c#" CodeBehind="InvoiceHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.TransportOrder.InvoiceHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvoiceHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .PrintInv2 {
            padding-left: 4px;
            padding-right: 4px;
        }

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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        html .RadMenu .rmGroup .rmItem a.rmLink {
            background-color: #99c2ff !important;
            text-decoration: none;
        }

            html .RadMenu .rmGroup .rmItem a.rmLink:hover {
                background-color: #ebebe0 !important;
                font-weight: bold;
            }

        .rmItem:hover {
            background-color: white !important;
        }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
    <script type="text/javascript">
        function OnClientItemBlurMenu(sender, args) {
            setTimeout(function () {
                sender.close(true);
            }, 200);
        }

        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
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
        function confirmation(msg) {
            var answer = confirm(msg)
            if (answer) {
                return true;
            } else {
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Invoice Results" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <br />
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <%--<td>
                    <asp:Button ID="ApproveBtn" runat="server" Text="Approve" OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                        CssClass="white" ToolTip="Approve" />
                </td>
                <td>
                    <asp:Button ID="PrintInvImgBtn" runat="server" Text="Invoice" OnClick="PrintInvImgBtn_Click"
                        CssClass="blue" ToolTip="MassInvoicePrint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>--%>
                <td>
                    <asp:Button ID="PrintInv2Btn" runat="server" Text="Invoice Format 2" OnClick="PrintInv2Btn_Click"
                        CssClass="LongLabelBlue PrintInv2" ToolTip="MassInvoice2Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <%--<td>
                    <asp:Button ID="PrintInvCSLImgBtn" runat="server" Text="Consol" OnClick="PrintInvCSLImgBtn_Click"
                        CssClass="blue" ToolTip="MassCSLPrint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="DrCfmImgBtn" runat="server" Text="Post " OnClick="DrCfmImgBtn_Click"
                        OnClientClick="return confirmation('Confirm Mass Post Invoice?');" UseSubmitBehavior="true" CssClass="green" ToolTip="PostInvoice" />
                </td>
                <td>
                    <asp:Button ID="DReBillImgBtn" runat="server" Text="eBilling" OnClick="DReBillImgBtnImgBtn_Click"
                        CssClass="green" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="CSLMainBtn" runat="server" Text="CSLMain" OnClick="CSLMainBtn_Click"
                        CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="CSLDetlBtn" runat="server" Text="CSLDetail" OnClick="CSLDetlBtn_Click"
                        CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="SystemBtn" runat="server" Text="System" OnClick="SystemBtn_Click"
                        CssClass="blue" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="StorageBtn" runat="server" Text="Storage" OnClick="StorageBtn_Click"
                        CssClass="blue" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="EmailBtn" runat="server" Text="Email" OnClick="EmailBtn_Click"
                        CssClass="green" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ReuseBtn" runat="server" Text="Reuse" OnClick="ReuseBtn_Click"
                        CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="UndoPrintBtn" runat="server" Text="UndoPrint" OnClick="UndoPrintBtn_Click"
                        CssClass="blue" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="UnApproveBtn" runat="server" Text="UnApprove" OnClick="UnApproveBtn_Click"
                        CssClass="blue" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>--%>
                <td>
                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click"
                        CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" />
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                </td>
                <td style="width: 100%">
                    <div style="float: right">
                        <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    </div>

                </td>
            </tr>
        </table>
        <%--<table>
            <tr>
                <td>
                    <telerik:RadMenu ID="RadMenu_MorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" BorderWidth="1" BackColor="#f5f5f0"
                        OnItemClick="RadMenu_MorePrintouts_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="More<br/>Printouts" PostBack="false" Value="MorePrintouts" Font-Bold="true" ForeColor="Black">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ExportInvoice" Text="Export Invoice" ForeColor="Black" Enabled="true"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ExportInvoiceCSL" Text="Export Invoice CSL" ForeColor="Black" Enabled="true"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="InvExportToExcel" Text="Inv Export To Excel" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CSLExportToExcel" Text="CSL Export To Excel" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                              <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ExportToExcel" Text="Export To Excel" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="InvoiceWorkOrder" Text="Work Order" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
            </tr>
        </table>--%>
        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <%--<telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="InvoiceEdit" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Invoice Register"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ImgCancel" ImageUrl="../../image/bin.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Invoice Register"
                                OnClick="ImgCancel_Click" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                            <asp:ImageButton runat="server" Visible="False" ID="EmailLbl" ImageUrl="../../image/email.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="EmailDone"
                                CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="False" ID="DrCfmLbl" ImageUrl="../../image/interfacedrcfm.png"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="DrCfmDone"
                                CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>
                    <telerik:GridBoundColumn HeaderText="Account" DataField="acid" AllowFiltering="true"
                        SortExpression="acid" UniqueName="acid" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ID" DataField="id" AllowFiltering="true" SortExpression="id"
                        UniqueName="id" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        SortExpression="accode" UniqueName="accode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Billing Name" DataField="billname" AllowFiltering="true"
                        SortExpression="billname" UniqueName="billname" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="InvDate" DataField="invdate" AllowFiltering="true"
                        SortExpression="invdate" UniqueName="invdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="totinvamt" AllowFiltering="true"
                        SortExpression="totinvamt" UniqueName="totinvamt" Reorderable="true" DataFormatString="{0:#,0.00}"
                        ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Currency" DataField="currcode" AllowFiltering="false"
                        SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExRate" DataField="exchrate" AllowFiltering="false"
                        SortExpression="exchrate" UniqueName="exchrate" Reorderable="true" DataFormatString="{0:#,0.000000}"
                        ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingContact" DataField="billcontact" AllowFiltering="false"
                        ColumnGroupName="billcontact" SortExpression="billcontact" UniqueName="billcontact" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="qucode" AllowFiltering="false"
                        ColumnGroupName="qucode" SortExpression="qucode" UniqueName="qucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="QuotationType" DataField="qutypedescr" AllowFiltering="false"
                        ColumnGroupName="qutypedescr" SortExpression="qutypedescr" UniqueName="qutypedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SMan" DataField="smancodedescr" AllowFiltering="false"
                        SortExpression="smancodedescr" UniqueName="smancodedescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PayTerms" DataField="paytermsdescr" AllowFiltering="false"
                        SortExpression="paytermsdescr" UniqueName="paytermsdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="InvDelvMethod" DataField="invoicedeliverymethod" AllowFiltering="true"
                        SortExpression="invoicedeliverymethod" UniqueName="invoicedeliverymethod" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="InvDelvDate" DataField="invoicedeliverydate" AllowFiltering="true"
                        SortExpression="invoicedeliverydate" UniqueName="invoicedeliverydate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="invtypedescr" AllowFiltering="false"
                        SortExpression="invtypedescr" UniqueName="invtypedescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="srcno" AllowFiltering="false"
                        SortExpression="srcno" UniqueName="srcno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SvcChitNo" DataField="tripsvcchitno" AllowFiltering="false"
                        SortExpression="tripsvcchitno" UniqueName="tripsvcchitno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Source" DataField="srcdescr" AllowFiltering="true"
                        SortExpression="srcdescr" UniqueName="srcdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CtnrNo" DataField="ctnrno" AllowFiltering="true"
                        SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem" AllowFiltering="true"
                        SortExpression="rem" UniqueName="rem" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                        SortExpression="status" UniqueName="status" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                        SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FromDate" DataField="frdate" AllowFiltering="true"
                        SortExpression="frdate" UniqueName="frdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="To Date" DataField="todate" AllowFiltering="true"
                        SortExpression="todate" UniqueName="todate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Period" DataField="period" AllowFiltering="true"
                        SortExpression="period" UniqueName="period" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Entity" DataField="entity" AllowFiltering="true"
                        SortExpression="entity" UniqueName="entity" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Reference" DataField="exref1" AllowFiltering="true"
                        SortExpression="exref1" UniqueName="exref1" Reorderable="true">
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
                    <telerik:GridBoundColumn HeaderText="entid" DataField="entid" AllowFiltering="true"
                        SortExpression="entid" UniqueName="entid" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="emailstatus" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jbhexref1" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="srcid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                        SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
