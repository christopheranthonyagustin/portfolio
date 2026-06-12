<%@ Page Language="c#" CodeBehind="InvHoldHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.InvHold.InvHoldHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>TransferHead</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    <script type="text/javascript">
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

        .StatusBackground {
            background-color: black;
            opacity: 0.001;
        }
    </style>
    <style type="text/css">
        .style1 {
            width: 95%;
        }
    </style>
    
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
    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td colspan="3">
                <asp:Label ID="AjIdLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table cellspacing="2" cellspacing="2">
        <tr>
            <td>&nbsp;<asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel"
                UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" OnPageIndexChanged="ResultDG_PageIndexChanged"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
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
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <ItemTemplate>
                         <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                           ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                           OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0" ToolTip="Edit"></asp:ImageButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="print" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <ItemTemplate>

                        <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="Reconcile"
                           ImageUrl="../../image/reconcile.png" Width="15" Height="15" AlternateText="Reconcile"
                           OnClick="ReconcileBtn_Click" OnClientClick="return confirm('Confirm Reconcile?')" BackColor="Transparent" BorderWidth="0" ToolTip="Reconcile"></asp:ImageButton>

                        <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="ConfirmHoldRelease"
                           ImageUrl="../../image/lightning.png" Width="15" Height="15" AlternateText="Hold/Release Confirmation" ToolTip="ConfirmHoldRelease"
                           OnClick="ConfirmHoldReleaseBtn_Click" BackColor="Transparent" BorderWidth="0" ></asp:ImageButton>

                        <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="CloseBtn"
                           ImageUrl="../../image/finalize.gif" Width="15" Height="15" AlternateText="Close" ToolTip="Close"
                           OnClick="CloseBtn_Click" OnClientClick="return confirm('Confirm Close?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>

                         <asp:ImageButton runat="server" Visible="false" ID="DeleteSKU" ImageUrl="../../image/bin.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete"
                                OnClick="DeleteBtn_Click" OnClientClick="return confirm('Confirm Delete?')" CausesValidation="False" ToolTip="Delete">
                         </asp:ImageButton>
                    
                        <asp:ImageButton runat="server" Visible="false" ID="Print" ImageUrl="../../image/print.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete SKU"
                                OnClick="PrintBtn_Click" OnClientClick="return confirm('Confirm Print?')" CausesValidation="False" ToolTip="Print">
                        </asp:ImageButton>

                        <asp:Label ID="holdLbl" runat="server" />
                        <asp:Label ID="releaseLbl" runat="server" />
                        <asp:Label ID="IHCfmLbl" runat="server"></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridBoundColumn Display="false" DataField="acid">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="ihId">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Inv.Hold#">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sitecode" SortExpression="sitecode" HeaderText="Site">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ihreasondescr" SortExpression="ihreasondescr"
                    HeaderText="ReleaseReason">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="holduntildate" SortExpression="holduntildate" HeaderText="HoldUntil"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="releaseapproveqty" SortExpression="releaseapproveqty" HeaderText="ReleaseApproveqty"
                    DataFormatString="{0:0.##}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="inspectionlotno" SortExpression="inspectionlotno" HeaderText="InspectionLotNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="qcrefno" SortExpression="qcrefno" HeaderText="QCRefNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="receiptno" SortExpression="receiptno" HeaderText="ReceiptNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="qcby" SortExpression="qcby" HeaderText="QCBy">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="qcdate" SortExpression="qcdate" HeaderText="QCDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="acapproveby" SortExpression="acapproveby" HeaderText="QCApprovedBy">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="acapprovedate" SortExpression="acapprovedate" HeaderText="QCApprovedDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                </telerik:GridBoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
