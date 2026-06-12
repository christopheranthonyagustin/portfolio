<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderFabricationOutstanding.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrderFabrication.DistributionSalesOrderFabricationOutstanding" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DistributionSalesOrderFabricationOutstandingSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
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
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                    OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" >
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>                    
                            <telerik:GridBoundColumn DataField="LineNo" UniqueName="LineNo" SortExpression="LineNo" AllowFiltering="false"
                                HeaderText="LineNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderFabricationNo" UniqueName="SalesOrderFabricationNo" SortExpression="SalesOrderFabricationNo" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="SalesOrderFabricationNo">
                            </telerik:GridBoundColumn>         
                             <telerik:GridBoundColumn DataField="Fabricationcode" UniqueName="Fabricationcode" SortExpression="Fabricationcode" AllowFiltering="false"
                                HeaderText="Fabricationcode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="FabricationDescription" UniqueName="FabricationDescription" SortExpression="FabricationDescription" AllowFiltering="false"
                                HeaderText="FabricationDescription" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ItemCode" UniqueName="ItemCode" SortExpression="ItemCode" AllowFiltering="false"
                                HeaderText="ItemCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="ItemDescription" UniqueName="ItemDescription" SortExpression="ItemDescription" AllowFiltering="false"
                                HeaderText="ItemDescription" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationStageCode" UniqueName="FabricationStageCode" SortExpression="FabricationStageCode" AllowFiltering="false"
                                HeaderText="FabricationStageCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationStageDescr" UniqueName="FabricationStageDescr" SortExpression="FabricationStageDescr" AllowFiltering="false"
                                HeaderText="FabricationStageDescr" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="seqno" UniqueName="seqno" SortExpression="seqno" AllowFiltering="false"
                                HeaderText="SeqNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StartDate" UniqueName="StartDate" SortExpression="StartDate" AllowFiltering="false"
                                HeaderText="StartDate" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StartRemarks" UniqueName="StartRemarks" SortExpression="StartRemarks" AllowFiltering="false"
                                HeaderText="StartRemarks" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndDate" UniqueName="EndDate" SortExpression="EndDate" AllowFiltering="false"
                                HeaderText="EndDate" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndRemarks" UniqueName="EndRemarks" SortExpression="EndRemarks" AllowFiltering="false"
                                HeaderText="EndRemarks" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" AllowFiltering="false"
                                HeaderText="ModifiedOn" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
