<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionJobOrderItem.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionJobOrder.DistributionJobOrderItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Purchase Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="ItemTab" Text="Item" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DetailTab" Text="Detail" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                    OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp; 
                <asp:Button ID="GenQuotationBtn" runat="server" CssClass="longlabelwhite" Text="Gen Quotation"
                    OnClick="GenQuotationBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="GenJobBtn" runat="server" CssClass="white" Text="Gen Job"
                    OnClick="GenJobBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="GenDoBtn" runat="server" CssClass="white" Text="Gen DO"
                    OnClick="GenDoBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobOrderItemId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Edit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="SeqNo" UniqueName="SNo" HeaderText="SNo" HeaderStyle-Width="50px" ItemStyle-Width="50px" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChargeCode" UniqueName="ChargeCode" SortExpression="ChargeCode" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Code">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ChargeDescription" UniqueName="ChargeDescription" SortExpression="ChargeDescription" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Description">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Qty" UniqueName="Qty" SortExpression="Qty" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Qty">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="UOM" UniqueName="UOM" SortExpression="UOM" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="UOM">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="UnitRate" UniqueName="UnitRate" SortExpression="UnitRate" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="UnitRate">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Amount" DataField="Amount" SortExpression="Amount" UniqueName="Amount"
                                AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.0000}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="ExchRate" DataField="ExchRate" SortExpression="ExchRate" UniqueName="ExchRate"
                                AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.0000}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="BaseAmount" DataField="BaseAmount" SortExpression="BaseAmount" UniqueName="BaseAmount"
                                AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.0000}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SourceNumber" UniqueName="SourceNumber" SortExpression="SourceNumber" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="SourceNumber">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn HeaderText="ExpDate" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ExpectedDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="PurchaseOrderStatusDescr" UniqueName="PurchaseOrderStatusDescr" SortExpression="PurchaseOrderStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderItemStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderItemId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="DetailRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>

</body>
</html>
