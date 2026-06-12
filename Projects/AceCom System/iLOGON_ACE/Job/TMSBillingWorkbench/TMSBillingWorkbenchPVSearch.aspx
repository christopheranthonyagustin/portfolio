<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBillingWorkbenchPVSearch.aspx.cs" Inherits="iWMS.Web.Job.TMSBillingWorkbench.TMSBillingWorkbenchPVSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PVSearch @ TMSBillingWorkbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        html .RadMenu .rmGroup .rmItem a.rmLink {
            background-color: #ffffff !important;
            text-decoration: none;
            color: black;
        }

            html .RadMenu .rmGroup .rmItem a.rmLink:hover {
                background-color: #ebebe0 !important;
                font-weight: bold;
            }

        .rmItem:hover {
            background-color: white !important;
        }
    </style>
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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    $find("<%= ResultDG.ClientID %>").get_masterTableView().rebind();
                }
            </script>
        </telerik:RadCodeBlock>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="BillBtn" CssClass="white" runat="server" OnClick="BillBtn_Click"
                        Text="Bill" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="excelBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                </td>
                <td>
                    <asp:Label runat="server" ID="MessageLbl" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
                </td>
                <td style="width: 100%">
                    <div style="float: right">
                        <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    </div>

                </td>
            </tr>
            <tr>
                <asp:UpdatePanel runat="server" ID="FormCtlUpdatePanel">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
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
                    <telerik:GridBoundColumn DataField="cbid" SortExpression="cbid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="acid" SortExpression="acid" HeaderText="acid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReferenceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BankDescr" SortExpression="BankDescr" HeaderText="Bank">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" SortExpression="chargecode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeDescription" DataField="chargedescr" SortExpression="chargedescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="srcno" SortExpression="JobNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Carrier" DataField="carriername" SortExpression="CarrierName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BL Number" DataField="blno" SortExpression="BLNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vessel" DataField="vessel" SortExpression="Vessel">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Voyage" DataField="voyage" SortExpression="Voyage">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="invno" SortExpression="InvNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="ctnrno" SortExpression="CtnrNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" SortExpression="qty" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnitRate" DataField="unitrate" SortExpression="unitrate"
                        DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Amount" DataField="fcamt" SortExpression="fcamt"
                        DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UOM" DataField="UnitRateUOM" SortExpression="UnitRateUOM">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="LCurrAmount" DataField="LCAmt" SortExpression="LCAmt"
                        DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Tax Type" DataField="taxtypedescr" SortExpression="taxtypedescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TaxAmt" DataField="taxfcamt" SortExpression="taxfcamt"
                        DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="TotalAmt" SortExpression="TotalAmt"
                        DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remark1" DataField="rem1" SortExpression="rem1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remark2" DataField="rem2" SortExpression="rem2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="cbheadstatusdescr" SortExpression="cbheadstatusdescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" SortExpression="adddate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" SortExpression="editdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" SortExpression="adduser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" SortExpression="edituser">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
