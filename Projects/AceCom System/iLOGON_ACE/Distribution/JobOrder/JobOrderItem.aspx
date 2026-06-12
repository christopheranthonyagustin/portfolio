<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderItem.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ JobOrderItem</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            var startingIndex = 0, gridViewID = '<%= ResultDG.MasterTableView.ClientID %>';
            function selectCheckbox(e, selectedIndex) {
                if (e.shiftKey) {
                    if (startingIndex < selectedIndex) {
                        $(':checkbox', '#' + gridViewID).slice(startingIndex, selectedIndex).prop("checked", true);
                    }
                    else
                        $(':checkbox', '#' + gridViewID).slice(selectedIndex, startingIndex).prop("checked", true);
                }
                startingIndex = selectedIndex;
            }
        </script>
    </telerik:RadCodeBlock>
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

        .RadMenu {
            z-index: 600 !important; /*For Bootstrap Modal Popup crashed with Radmenu Position*/
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
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>

                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>
                                        <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                            OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" /></td>
                                    <td>
                                        <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                                            OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />

                                    </td>

                                    <td>
                                        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                                    </td>

                                    <td>
                                        <telerik:RadMenu ID="RadMenu_Quotation_MoreFunction" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" Skin="Default"
                                            OnItemClick="RadMenu_Quotation_MoreFunctionClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" CssClass="RadMenu_CUSTOM_Blue">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" Text="Quotation<br/>Functions" PostBack="false" Value="MoreFunctions" UseSubmitBehavior="false">
                                                    <Items>
                                                        <telerik:RadMenuItem runat="server" Value="GenerateQuotation" Text="Generate" />
                                                        <telerik:RadMenuItem runat="server" Value="CancelQuotation" Text="Cancel" />
                                                        <telerik:RadMenuItem runat="server" Value="ReviseQuotation" Text="Revise" />
                                                        <telerik:RadMenuItem runat="server" Value="ApproveQuotation" Text="Approve" />
                                                        <telerik:RadMenuItem runat="server" Value="RejectQuotation" Text="Reject" />
                                                    </Items>
                                                </telerik:RadMenuItem>
                                            </Items>
                                        </telerik:RadMenu>
                                    </td>

                                    <td>
                                        <asp:Button ID="QuotationBtn" runat="server" CssClass="LongLabelBlue" Text="Print Quotation"
                                            OnClick="QuotationBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                    </td>

                                    <td>
                                        <asp:Button ID="PopulateToJobBtn" runat="server" CssClass="longlabelwhite" Text="PopulateToJob"
                                            OnClick="PopulateToJobBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>
                                        <asp:Button ID="CompleteBtn" runat="server" CssClass="White" Text="Complete"
                                            OnClick="CompleteBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>
                                        <asp:Button ID="ConfirmBtn" runat="server" CssClass="White" Text="Confirm"
                                            OnClick="ConfirmBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>
                                        <asp:Button ID="MassUpdateBtn" runat="server" CssClass="longlabelwhite" Text="Mass Update"
                                            OnClick="MassUpdateBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>
                                        <telerik:RadMenu ID="RadMenu_DO_MoreFunction" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" Skin="Default"
                                            OnItemClick="RadMenu_DO_MoreFunctionClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" CssClass="RadMenu_CUSTOM_Blue">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" Text="DO" PostBack="false" Value="MoreFunctions" UseSubmitBehavior="false">
                                                    <Items>
                                                        <telerik:RadMenuItem runat="server" Value="Generate" Text="Generate" />
                                                        <telerik:RadMenuItem runat="server" Value="Post" Text="Post" />
                                                    </Items>
                                                </telerik:RadMenuItem>
                                            </Items>
                                        </telerik:RadMenu>
                                    </td>
                                    <td>
                                        <asp:Button ID="PrintDOBtn" runat="server" CssClass="LongLabelBlue" Text="Print DO"
                                            OnClick="PrintDOBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                        <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="excelImgBtn_Click" Text="Excel"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                        </td>

                        <td align="right">
                            <asp:Button ID="CircleBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>

                    </tr>
                </table>
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
                                    <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JOIEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    &nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JOItemDeleteImg"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="JOItemDelete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="AttcImgBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0" OnClick="AttcImgBtn_Click"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" Visible="false"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="SourceImgAttcBtn" ImageUrl="../../image/attachment.png" BorderWidth="0" OnClick="SourceImgAttcBtn_Click"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="SourceImageAttc" Visible="false"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="CopyBtn" ImageUrl="../../image/copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy JobOrderItem"
                                        OnClick="CopyBtn_Click"
                                        CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="SeqNo" UniqueName="SNo" HeaderText="SNo" HeaderStyle-Width="50px" ItemStyle-Width="50px" ShowFilterIcon="true" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChargeCode" UniqueName="ChargeCode" SortExpression="ChargeCode" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Code">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ChargeDescription" UniqueName="ChargeDescription" SortExpression="ChargeDescription" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Description">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SKUCode" UniqueName="SKUCode" SortExpression="SKUCode" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="SKUCode">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SKUDescr" UniqueName="SKUDescr" SortExpression="SKUDescr" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="SKUDescription">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="GroupNo" UniqueName="GroupNo" SortExpression="GroupNo" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Group No">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsBillRequired" UniqueName="IsBillRequired" SortExpression="IsBillRequired" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                ShowFilterIcon="true" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Billable">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Scope" UniqueName="Scope" SortExpression="Scope" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Scope">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Category" UniqueName="Category" SortExpression="Category" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Category">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Source" UniqueName="Source" SortExpression="Source" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Source">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CollectionAddress" UniqueName="CollectionAddress" SortExpression="CollectionAddress" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="CollectionAddress">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DeliveryAddress" UniqueName="DeliveryAddress" SortExpression="DeliveryAddress" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="DeliveryAddress">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CrateType" UniqueName="CrateType" SortExpression="CrateType" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="CrateType">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderItemStatusDescr" UniqueName="JobOrderItemStatusDescr" SortExpression="JobOrderItemStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="QuotationNo" UniqueName="QuotationNo" SortExpression="QuotationNo" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Quotation No">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="QuotationSeqNo" UniqueName="QuotationSeqNo" SortExpression="QuotationSeqNo" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="QuotationSeqNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SourceNumber" UniqueName="SourceNumber" SortExpression="SourceNumber" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="SourceNumber">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SourceItemStatusdescr" UniqueName="SourceItemStatusdescr" SortExpression="SourceItemStatusdescr" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Source Status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DONumber" UniqueName="DONumber" SortExpression="DONumber" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="DO Number">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DOStatusDescr" UniqueName="DOStatusDescr" SortExpression="DOStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="DO Status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exref2" UniqueName="exref2" SortExpression="exref2" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Exref2">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Qty" UniqueName="Qty" SortExpression="Qty" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Qty" DataType="System.Decimal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ActualQty" UniqueName="ActualQty" SortExpression="ActualQty" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Actual Qty" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="UOM" UniqueName="UOM" SortExpression="UOM" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="UOM">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="UnitRate" UniqueName="UnitRate" SortExpression="UnitRate" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="UnitRate">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Amount" DataField="Amount" SortExpression="Amount" UniqueName="Amount"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="ExchRate" DataField="ExchRate" SortExpression="ExchRate" UniqueName="ExchRate"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="BaseAmount" DataField="BaseAmount" SortExpression="BaseAmount" UniqueName="BaseAmount"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn HeaderText="ExpDate" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ExpectedDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="remarks1" UniqueName="remarks1" SortExpression="remarks1" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Remarks1">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="remarks2" UniqueName="remarks2" SortExpression="remarks2" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Remarks2">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderItemStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderItemId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SourceItemId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ImageAttch" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SourceImageAttch" Display="false">
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
