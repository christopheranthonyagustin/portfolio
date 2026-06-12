<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderHead.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderHead" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingOrderHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />

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
        .style1 {
            width: 85px;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="ResultsGridTab" Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotBilledTab" Text="NotBilled" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BillableItemsTab" Text="BillableItems" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <table>
                    <tr>

                        <td class="style1">
                            <asp:Button ID="JobsheetBtn" CssClass="Blue" runat="server" OnClick="JobsheetBtn_Click"
                                Text="Job Sheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>

                        <td class="style1">
                            <asp:Button ID="ChargeSheetBtn" CssClass="LongLabelBlue" runat="server" OnClick="ChargesSheetBtn_Click"
                                Text="Charge Sheet" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="JobInstructionBtn" CssClass="LongLabelBlue" runat="server" OnClick="JobInstructionBtn_Click"
                                Text="Job Instruction" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="OutsourceBtn" CssClass="LongLabelBlue" runat="server" OnClick="OutsourceBtn_Click"
                                Text="Outsource Email" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="CopyBtn" CssClass="Blue" runat="server" OnClick="CopyBtn_Click"
                                Text="Copy" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="CancelBtn" CssClass="blue" runat="server" OnClick="CancelBtn_Click"
                                Text="Cancel" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="BookWhsButton" CssClass="LongLabelWhite" runat="server" OnClick="BookWhsBtn_Click"
                                Text="Book Warehouse" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td>
                            <asp:Button ID="CloseBtn" CssClass="white" runat="server" OnClick="Closebtn_Click" Text="Close" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td>
                            <telerik:RadMenu ID="RadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                                OnItemClick="RadMenu_ItemClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Bill" PostBack="false"
                                        Value="Print">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SINGLE" Text="Single"
                                                Visible="false" />
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CONSOLIDATED" Text="Consolidated"
                                                Visible="false" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            &nbsp;
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBId" Name="MainGrid" AllowFilteringByColumn="true">
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
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ID="AttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                        BorderWidth="0" BackColor="Transparent" OnClick="AttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="number" SortExpression="JobNo" HeaderText="JobNo" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderNo" UniqueName="exref1" SortExpression="PONO" HeaderText="OrderNo" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ProjectName" UniqueName="ProjectName" SortExpression="ProjectName" HeaderText="EndCustomer/ProjectName" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QUNO" UniqueName="QUNO" SortExpression="QUNO" HeaderText="QuotationNo" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipmentTypeDescr" UniqueName="ShipmentTypeDescr" SortExpression="ShipmentTypeDescr" HeaderText="ShipmentType" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jobtype" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="XMLTptType" UniqueName="XMLTptType" SortExpression="XMLTptType" HeaderText="TransportType" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="XMLBillSizeType" UniqueName="XMLBillSizeType" SortExpression="XMLBillSizeType" HeaderText="BillSizeType" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ET" UniqueName="ET" SortExpression="ET" HeaderText="C-T" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vessel" UniqueName="Vessel" SortExpression="Vessel" HeaderText="Vessel" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="voyage" UniqueName="Voyage" SortExpression="Voyage" HeaderText="Voyage" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" UniqueName="expdate" SortExpression="expdate" HeaderText="RequiredDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="INETA" UniqueName="INETA" SortExpression="INETA" HeaderText="ETA"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDescr" UniqueName="JobDescr" SortExpression="JobDescr" HeaderText="JobDescription" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="AddUser" HeaderText="AddUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="EditUser" HeaderText="EditUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Id" UniqueName="Id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="NotBilledRadPageView">
                <table cellspacing="2" cellpadding="2" width="30%">
                    <br />
                    <tr>
                        <td>
                            <telerik:RadMenu ID="RadMenuNB" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                                OnItemClick="RadMenuNB_ItemClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Bill" PostBack="false"
                                        Value="Print">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SINGLE" Text="Single"
                                                Visible="false" />
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CONSOLIDATED" Text="Consolidated"
                                                Visible="false" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                        </td>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <asp:Button ID="SearchBtn" CausesValidation="false" runat="server" Text="Search" CssClass="white"
                                OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="true"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBId" Name="NotBilledGrid">
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
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="JobCreationDate" SortExpression="JobCreationDate" HeaderText="JobCreationDate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderNo" UniqueName="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderBy" UniqueName="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderDate" UniqueName="OrderDate" SortExpression="OrderDate" HeaderText="OrderDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vehno" UniqueName="Vehno" SortExpression="Vehno" HeaderText="VehNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QUNO" UniqueName="QUNO" SortExpression="QUNO" HeaderText="QuotationNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDescr" UniqueName="JobDescr" SortExpression="JobDescr" HeaderText="JobDesription" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobSpecialInstruction" UniqueName="JobSpecialInstruction" SortExpression="JobSpecialInstruction" HeaderText="SpecialInstruction" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <%--<telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>--%>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ACId" UniqueName="ACId" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="BillableItemsRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
