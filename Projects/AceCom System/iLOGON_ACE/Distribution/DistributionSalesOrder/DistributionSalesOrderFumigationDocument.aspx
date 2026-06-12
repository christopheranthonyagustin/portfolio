<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderFumigationDocument.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderFumigationDocument" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DistributionSalesOrderFumigationDocument</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
            OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
        <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete"
            OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
        <asp:Button ID="PrintCertBtn" runat="server" CssClass="Blue" Text="Print Cert"
            OnClick="PrintCertBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
        <asp:Button ID="ExcelBtn" runat="server" CssClass="Green" Text="Excel"
            OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
        <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm"
            OnClick="ConfirmBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="FumigationDocumentId">
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
                    <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FumigationDocumentNo" UniqueName="FumigationDocumentNo" SortExpression="FumigationDocumentNo" ShowFilterIcon="true" AllowFiltering="true"
                        HeaderText="FumigationDocumentNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FumigationDocumentDate" UniqueName="FumigationDocumentDate" SortExpression="FumigationDocumentDate"
                        HeaderText="FumigationDocumentDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipToCode" UniqueName="ShipToCode" SortExpression="ShipToCode" AllowFiltering="true"
                        HeaderText="ShipToCode" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipToName" UniqueName="ShipToName" SortExpression="ShipToName" AllowFiltering="true"
                        HeaderText="ShipToName" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipToAddress" UniqueName="ShipToAddress" SortExpression="ShipToAddress" AllowFiltering="true"
                        HeaderText="ShipToAddress" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipToPh" UniqueName="ShipToPh" SortExpression="ShipToPh" AllowFiltering="true"
                        HeaderText="ShipToPh" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipToFax" UniqueName="ShipToFax" SortExpression="ShipToFax" AllowFiltering="true"
                        HeaderText="ShipToFax" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipToUEN" UniqueName="ShipToUEN" SortExpression="ShipToUEN" AllowFiltering="true"
                        HeaderText="ShipToUEN" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerCode" UniqueName="CustomerCode" SortExpression="CustomerCode" AllowFiltering="true"
                        HeaderText="CustomerCode" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" AllowFiltering="true"
                        HeaderText="CustomerName" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerAddress" UniqueName="CustomerAddress" SortExpression="CustomerAddress" AllowFiltering="true"
                        HeaderText="CustomerAddress" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerPh" UniqueName="CustomerPh" SortExpression="CustomerPh" AllowFiltering="true"
                        HeaderText="CustomerPh" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerFax" UniqueName="CustomerFax" SortExpression="CustomerFax" AllowFiltering="true"
                        HeaderText="CustomerFax" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerUEN" UniqueName="CustomerUEN" SortExpression="CustomerUEN" AllowFiltering="true"
                        HeaderText="CustomerUEN" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FumigationDocumentStatusDescr" UniqueName="FumigationDocumentStatusDescr" SortExpression="FumigationDocumentStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                        HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                        HeaderText="ModifiedOn">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EntityId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FumigationDocumentStatus" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FumigationDocumentId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
