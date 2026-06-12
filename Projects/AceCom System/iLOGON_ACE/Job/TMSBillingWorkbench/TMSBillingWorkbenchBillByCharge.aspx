<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBillingWorkbenchBillByCharge.aspx.cs" Inherits="iWMS.Web.Job.TMSBillingWorkbench.TMSBillingWorkbenchBillByCharge" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Bill By Charge @ TMSBillingWorkbench</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="FormCtlUpdatePanel">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="BillBtn" CssClass="white" runat="server" OnClick="BillBtn_Click"
                        Text="Bill" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="BillConsolidateBillBtn" CausesValidation="false" runat="server" Text="Bill Consolidate" CssClass="LongLabelWhite"
                        OnClick="BillConsolidateBillBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="470" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
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
                    <telerik:GridTemplateColumn HeaderText="S/N" HeaderStyle-Width="50px" ItemStyle-Width="50px" AllowFiltering="false">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="Account" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="JobNo" SortExpression="JobNo" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn HeaderText="Container Number" DataField="ContainerNo" SortExpression="ContainerNo" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" SortExpression="StatusDescr" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Import Date" DataField="ImportDate" SortExpression="ImportDate" HeaderStyle-Width="160px" ItemStyle-Width="160px"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Return Date" DataField="ReturnDate" SortExpression="ReturnDate" HeaderStyle-Width="160px" ItemStyle-Width="160px"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Collection Date" DataField="CollectionDate" SortExpression="CollectionDate" HeaderStyle-Width="160px" ItemStyle-Width="160px"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Export Date" DataField="ExportDate" SortExpression="ExportDate" HeaderStyle-Width="160px" ItemStyle-Width="160px"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PlugInStartDate" DataField="PlugInStartDate" SortExpression="PlugInStartDate" HeaderStyle-Width="160px" ItemStyle-Width="160px"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PlugInEndDate" DataField="PlugInEndDate" SortExpression="PlugInEndDate" HeaderStyle-Width="160px" ItemStyle-Width="160px"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="JBCId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="JBId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AcId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColorCode" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
    <telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
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
                $find("<%= ResultDG.ClientID %>").get_masterTableView().rebind();
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
