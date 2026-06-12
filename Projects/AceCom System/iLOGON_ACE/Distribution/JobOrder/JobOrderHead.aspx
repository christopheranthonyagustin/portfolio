<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderHead.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Job Order</title>
     <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="SearchResultTab" Text="SearchResult" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ProposeDateTab" Text="Propose Date" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="JobActivityTab" Text="Job Activity" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="GenQuotationBtn" runat="server" CssClass="longlabelwhite" Text="Gen Quotation"
                                OnClick="GenQuotationBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            <asp:Button ID="CancelQuotationBtn" runat="server" CssClass="longlabelwhite" Text="Cancel Quotation"
                                OnClick="CancelQuotationBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            <asp:Button ID="QuotationBtn" runat="server" CssClass="LongLabelBlue" Text="Print Quotation"
                                OnClick="QuotationBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            <asp:Button ID="ExcelQuotationBtn" runat="server" CssClass="LongLabelGreen" Text="Excel Quotation"
                                OnClick="ExcelQuotationBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            <asp:Button ID="Cancelbtn" runat="server" CssClass="longlabelwhite" Text="Cancel"
                                OnClick="Cancelbtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            <asp:Button ID="VoidBtn" runat="server" class="White" Text="Void"
                                OnClick="VoidBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" /> 
                            <asp:Button ID="JobOrderCompleteBtn" runat="server" class="longlabelwhite" Text="JobOrder Complete"
                                OnClick="JobOrderCompleteBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" /> 
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                         </td>
                        <td align="center">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" 
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobOrderId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="CopyBtn" ImageUrl="../../image/copy.png"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy Goods Issue"
                                            OnClick="CopyBtn_Click"

                                        CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="Account" SortExpression="Account" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Account">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="AccountName" UniqueName="AccountName" SortExpression="AccountName" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="AccountName">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Number" SortExpression="JobNo" HeaderText="JobNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderNo" UniqueName="JobOrderNo" SortExpression="JobOrderNo" ShowFilterIcon="true" AllowFiltering="true"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="OrderNumber">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CustomerReference" UniqueName="CustomerReference" SortExpression="CustomerReference" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="CustomerReference">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ProjectNo" UniqueName="ProjectNumber" SortExpression="ProjectNumber" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="ProjectNumber">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SiteCode" UniqueName="Site" SortExpression="Site" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Site">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="QuotationNo" UniqueName="QuotationNo" SortExpression="QuotationNo" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="QuotationNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SurveryorName" UniqueName="SurveryorName" SortExpression="SurveryorName" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="SurveryorName">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FromExpectedDate" UniqueName="FromExpectedDate" SortExpression="FromExpectedDate"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="FromExpectedDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ToExpectedDate" UniqueName="ToExpectedDate" SortExpression="ToExpectedDate"
                              CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"  HeaderText="ToExpectedDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsEquipmentRequired" UniqueName="Equipment" SortExpression="Equipment" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Equipment">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsPersonnelListRequired" UniqueName="PersonnelList" SortExpression="PersonnelList" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="PersonnelList">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="OrderDate" UniqueName="OrderDate" SortExpression="OrderDate"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="OrderDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Remarks1" UniqueName="Remarks1" SortExpression="Remarks1" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Remarks1">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Remarks2" UniqueName="Remarks2" SortExpression="Remarks2" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Remarks2">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderStatusDescr" UniqueName="JobOrderStatusDescr" SortExpression="JobOrderStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="Status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsSafetyDocumentRequired" UniqueName="SafetyDocument" SortExpression="SafetyDocument" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="SafetyDocument">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                               CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QuId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>                
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ProposeDateRadPageView">
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="90%" ID="JobActivityRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmCancelBtn" Text="" Style="display: none;" OnClick="ConfirmCancelBtn_Click" runat="server" />
                </td>
            </tr>

        </table>
    </form>
</body>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function ConfirmCancelBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmCancelBtn.UniqueID %>", "");
                }
            }

        </script>
    </telerik:RadCodeBlock>
</html>
