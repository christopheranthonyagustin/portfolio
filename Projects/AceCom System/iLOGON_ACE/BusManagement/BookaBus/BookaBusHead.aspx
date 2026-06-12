<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookaBusHead.aspx.cs" Inherits="iWMS.Web.BusManagement.BookaBus.BookaBusHead" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyRidesPlanningPlan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
    </style>
        <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotBilledTab" Text="NotBilled" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="RidesNotBilledTab" Text="RidesNotBilled" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BillableItemsTab" Text="BillableItems" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotCompletedTab" Text="NotCompleted" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <br />
                        <td>
                            <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click"
                                CssClass="white" ToolTip="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="InvoiceBtn" runat="server" Text="Invoice" OnClick="InvoiceBtn_Click"
                                CssClass="blue" ToolTip="Invoice" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="SwitchBtn" runat="server" Text="Switch" OnClick="SwitchBtn_Click"
                                CssClass="white" ToolTip="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                            &nbsp;
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
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBId" Name="MainGrid">
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
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PONO" UniqueName="PONO" SortExpression="PONO" HeaderText="OrderNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderBy" UniqueName="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BookingDate" UniqueName="BookingDate" SortExpression="BookingDate" HeaderText="BookingDate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType"
                                HeaderText="BillSizeType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vehno" UniqueName="Vehno" SortExpression="Vehno" HeaderText="VehNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntityCode" SortExpression="EntityCode" HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QUNO" UniqueName="QUNO" SortExpression="QUNO" HeaderText="QuotationNo">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NoofTrips" UniqueName="NoofTrips" SortExpression="NoofTrips" HeaderText="NoOfTrips" ItemStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Charges" UniqueName="Charges" SortExpression="Charges" HeaderText="Charges" ItemStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoofInvoiceLine" UniqueName="NoofInvoiceLine" SortExpression="NoofInvoiceLine" HeaderText="NoOfInvoiceLine" ItemStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDescr" UniqueName="JobDescr" SortExpression="JobDescr" HeaderText="JobDesription">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobSpecialInstruction" UniqueName="JobSpecialInstruction" SortExpression="JobSpecialInstruction" HeaderText="SpecialInstruction">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Status" UniqueName="status" HeaderText="Status" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="NotBilledRadPageView">
                <table cellspacing="2" cellpadding="2" width="100%">
                    <br />
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
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
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
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PONO" UniqueName="PONO" SortExpression="PONO" HeaderText="OrderNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderBy" UniqueName="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderDate" UniqueName="OrderDate" SortExpression="OrderDate" HeaderText="OrderDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType"
                                HeaderText="BillSizeType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vehno" UniqueName="Vehno" SortExpression="Vehno" HeaderText="VehNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QUNO" UniqueName="QUNO" SortExpression="QUNO" HeaderText="QuotationNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Charges" UniqueName="Charges" SortExpression="Charges" HeaderText="Charges" ItemStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDescr" UniqueName="JobDescr" SortExpression="JobDescr" HeaderText="JobDesription">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobSpecialInstruction" UniqueName="JobSpecialInstruction" SortExpression="JobSpecialInstruction" HeaderText="SpecialInstruction">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                            </telerik:GridBoundColumn>                            
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RidesNotBilledRadPageView" Height="700px">
                <br />
                &nbsp;&nbsp;&nbsp;
                <telerik:RadMenu ID="RadMenuRNB" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                    OnItemClick="RadMenuRNB_ItemClick">
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
                <br />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDGRNB" runat="server" AutoGenerateColumns="true"
                    EnableLinqExpressions="False" AllowPaging="false" GridLines="Both" AllowFilteringByColumn="true"
                    Skin="Metro" OnNeedDataSource="ResultDGRNB_NeedDataSource" OnItemDataBound="ResultDGRNB_ItemDataBound" OnColumnCreated="ResultDGRNB_ColumnCreated"
                    ExportSettings-UseItemStyles="true" AllowSorting="true">
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-Width="100px" ItemStyle-Width="100px" Name="RidesNotBilledGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="BillableItemsRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="NotCompletedRadPageView">
                <telerik:RadGrid ID="ResultDG3" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True" GridLines="Both"
            Skin="Metro" OnNeedDataSource="ResultDG3_NeedDataSource" OnItemDataBound="ResultDG3_ItemDataBound" OnColumnCreated="ResultDG3_ColumnCreated"
            ExportSettings-UseItemStyles="true">
           <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" >
               
                <Columns>
                </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px" ></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                                <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
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
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <%--Message popup 2 area start For Confirm Message Box--%>       
        <%--Status popup area start--%>
        <asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeJobClosePopup" runat="server" PopupControlID="pnlStstusBox"
            TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlStstusBox" BackColor="LAVENDER" Width="225px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 225px;">
                <asp:Label ID="Label2" Text="Close Job" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnStatusCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 240px; width: 225px;">
                <table style="margin-top: 10px; margin-left: 22px;" cellpadding="7px">
                    <tr>
                        <td>JobNo<br />
                            <telerik:RadTextBox ID="JobNotxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Account<br />
                            <telerik:RadTextBox ID="Accounttxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>CloseCompleteDate
                      <telerik:RadDatePicker ID="CloseJobDateTxt" runat="server" Width="155"
                          DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007" ZIndex="15000">
                          <Calendar runat="server">
                              <SpecialDays>
                                  <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                              </SpecialDays>
                          </Calendar>
                      </telerik:RadDatePicker>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <%--Status popup area end--%>
        <%--Cancel popup area start--%>
        <asp:Button runat="server" ID="Button1" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeStatusPopup" runat="server" PopupControlID="pnlCancelBox"
            TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlCancelBox" BackColor="LAVENDER" Width="285px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 285px;">
                <asp:Label ID="lblCoseJobTitle" Text="" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="LinkButton1" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 350px; width: 285px;">
                <table style="margin-top: 10px; margin-left: 7px;" cellpadding="7px">
                    <tr>
                        <td colspan="2">Account<br />
                            <telerik:RadTextBox ID="txtAccount" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">JobNo<br />
                            <telerik:RadTextBox ID="txtJobNo" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Status<br />
                            <telerik:RadTextBox ID="txtStatus" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Reason<asp:Label ID="lbltxtReq" runat="server" Text="*" Visible="false"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="Reasontxt" runat="server" Height="90px" Width="249px"
                                TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click"
                                Text="Submit" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Submit" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
