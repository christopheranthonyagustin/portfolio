<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceBillingWorkbenchStorageBillingPeriod.aspx.cs" Inherits="iWMS.Web.Job.ServiceBillingWorkbench.ServiceBillingWorkbenchStorageBillingPeriod" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Service Billing Workbench Storage Billing Period</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock runat="server">
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

            function OnClientClose(sender, args) {
                var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                MasterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table cellspacing="2" cellpadding="2" width="30%">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <asp:Button ID="SearchBtn" CausesValidation="false" runat="server" Text="Search" CssClass="white"
                        OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="excelBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                </td>
                <td>
                    <asp:Button ID="BillBtn" runat="server" Text="Bill" OnClick="BillBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="true"
            AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" Visible="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="StorageBillingPeriodGrid">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="350px" ItemStyle-Width="350px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PIC" UniqueName="PIC" SortExpression="PIC" HeaderText="PIC" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="180px" ItemStyle-Width="180px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BillDescription" UniqueName="BillDescription" SortExpression="BillDescription" HeaderText="BillDescription" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="180px" ItemStyle-Width="180px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastBilledFromDate" UniqueName="LastBilledFromDate" SortExpression="LastBilledFromDate" HeaderText="LastBilledFromDate" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="140px" ItemStyle-Width="140px" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastBilledToDate" UniqueName="LastBilledToDate" SortExpression="LastBilledToDate" HeaderText="LastBilledToDate" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="140px" ItemStyle-Width="140px" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastBilledAmount" UniqueName="LastBilledAmount" SortExpression="LastBilledAmount" HeaderText="LastBilledAmount" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="120" ItemStyle-Width="120">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TMSJobNo" UniqueName="TMSJobNo" SortExpression="TMSJobNo" HeaderText="TMSJobNo" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="140px" ItemStyle-Width="140px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InDate" UniqueName="InDate" SortExpression="InDate" HeaderText="InDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"
                        HeaderStyle-Width="140px" ItemStyle-Width="140px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BillingMethod" UniqueName="BillingMethod" SortExpression="BillingMethod" HeaderText="BillingMethod" AutoPostBackOnFilter="true"
                        HeaderStyle-Width="180px" ItemStyle-Width="180px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AcId" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
