<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseInvoiceHead.aspx.cs"
    Inherits="iWMS.Web.Job.PurchaseInvoice.PurchaseInvoiceHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CashBookPV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <div style="height: 103%" id="div-datagrid">
            <table>
                <tr>
                    <td align="left" style="padding-top: 4px">
                        <asp:ImageButton ID="Check_RadButton" runat="server" Visible="false" OnClick="Check_RadButtonClicked"
                            AlternateText="Approve" ToolTip="Check Selected PINo(s)" ImageUrl="../../Image/check.png"
                            BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle" />
                        &nbsp;
                    <asp:ImageButton ID="Reject_RadButton" runat="server" Visible="True" OnClick="Reject_RadButtonClicked"
                        AlternateText="Reject" ToolTip="Reject Selected PINo" ImageUrl="../../Image/Reject.png"
                        BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle" />
                        &nbsp;
                    <asp:ImageButton ID="Approve_RadButton" runat="server" Visible="false" OnClick="Approve_RadButtonClicked"
                        AlternateText="Approve" ToolTip="Approve Selected PINo(s)" ImageUrl="../../Image/Approve.png"
                        BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle" />
                        &nbsp;
                    <asp:ImageButton ID="Post_RadButton" runat="server" Visible="false" OnClick="Post_RadButtonClicked"
                        AlternateText="PostToRx" ToolTip="PostToAccount" ImageUrl="../../Image/post.png"
                        BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle" />
                        &nbsp;
                    <asp:ImageButton ID="reopenBtn" runat="server" OnClick="reopenBtn_Clicked" Visible="true"
                        ToolTip="Re-Open" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                        ImageUrl="../../Image/Reopen.png" />
                        &nbsp;                                    
                    <asp:ImageButton ID="cancelBtn" runat="server" OnClick="Cancel_RadButtonClicked" Visible="true"
                        ToolTip="Cancel" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                        ImageUrl="../../Image/CancelImage.png" />
                        &nbsp;
                    <asp:Button ID="PIRBtn" CssClass="blue" runat="server" OnClick="PIRBtn_Click"
                        Text="PIR" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" EnableLinqExpressions="false" Skin="Metro" Width="100%" Height="87%"
                OnDetailTableDataBind="ResultDG_DetailTableDataBind" OnNeedDataSource="ResultDG_NeedDataSource"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid" AllowPaging="true"
                    HierarchyLoadMode="Client">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <%--<HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>--%>
                            <HeaderTemplate>
                                <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="SelectCB" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="PurchaseInvoiceEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Purchase Invoice Register"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>

                                <%--<iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>--%>
                                <%--<iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>--%>
                                <asp:Label ID="CbCfmLbl" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="PINo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="vdname" SortExpression="vdname" HeaderText="VendorName">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvNo"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FCBeforeTaxAmt" SortExpression="FCBeforeTaxAmt"
                            HeaderText="SubTotal" DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FCTaxAmt" SortExpression="FCTaxAmt" HeaderText="GSTAmt"
                            DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FCTotalAmt" SortExpression="FCTotalAmt" HeaderText="TotalAmt"
                            DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="billableAmt" SortExpression="billableAmt" HeaderText="BillableAmt"
                            DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="billablegstamt" SortExpression="billablegstamt" HeaderText="BillableGSTAmt"
                            DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PnLAmt" SortExpression="PnLAmt" HeaderText="P&LAmt"
                            DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pistatusdescr" SortExpression="status" HeaderText="Status"
                            Display="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                            Display="false">
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
                        <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <DetailTables>
                        <telerik:GridTableView DataKeyNames="pino" Name="ChildGrid" Width="100%" SkinID="Telerik" AllowPaging="false"
                            AllowFilteringByColumn="false" TableLayout="Fixed">
                            <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                            <ItemStyle Wrap="true" />
                            <AlternatingItemStyle Wrap="true" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="chargecode" SortExpression="chargecode" HeaderText="Charge">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Description">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="JobNo" SortExpression="JobNo" HeaderText="JobNo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvNo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="payableamt" SortExpression="payableamt" HeaderText="PayableAmt" DataFormatString="{0:N}"
                                    ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="billableamt" SortExpression="billableamt" HeaderText="BillableAmt" DataFormatString="{0:N}"
                                    ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pnlamt" SortExpression="pnlamt" HeaderText="P&LAmt" DataFormatString="{0:N}"
                                    ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PVNo" SortExpression="PVNo" HeaderText="PVNo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RecoverableType" SortExpression="RecoverableType" HeaderText="RecoverableType"
                                    HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RecoverableRemarks" SortExpression="RecoverableRemarks" HeaderText="RecoverRemarks">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                </MasterTableView>
            </telerik:RadGrid>
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
