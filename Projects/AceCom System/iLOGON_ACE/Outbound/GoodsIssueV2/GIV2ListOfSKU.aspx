<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV2ListOfSKU.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV2.GIV2ListOfSKU" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>ListOfSKU @ Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

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
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Button ID="SelectBtn" runat="server" CssClass="white" Text="Select" UseSubmitBehavior="false" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnItemCommand="ResultDG_ItemCommand"
            AllowPaging="false" Skin="Metro" EnableViewState="false" UseAccessibleHeader="True" OnPreRender="ResultDG_PreRender"
            OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SKUCode" ClientDataKeyNames="SKUCode" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <%--<telerik:GridButtonColumn Text="Select" CommandName="Select"></telerik:GridButtonColumn>--%>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSKU" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="SKUCode" UniqueName="SKUCode" HeaderText="SKUCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUDescr" UniqueName="SKUDescr" HeaderText="SKUDescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUPackingDescr" UniqueName="SKUPackingDescr" HeaderText="SKUPackingDescr">
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn DataField="SKUCode2" UniqueName="SKUCode2" HeaderText="SKUCode2">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="BalanceQty" UniqueName="BalanceQty" HeaderText="BalanceQty" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UOM" UniqueName="UOM" HeaderText="UOM">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BillingGrp" UniqueName="BillingGrp" HeaderText="Storage Condition">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sitecode" UniqueName="sitecode" HeaderText="Site">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot1" UniqueName="Lot1" HeaderText="ExpiryDate" DataFormatString="{0:dd/MM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReceiveDate" UniqueName="ReceiveDate" HeaderText="ReceiveDate" DataFormatString="{0:dd/MM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot6" UniqueName="lot6" HeaderText="SB WSO NO">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot4" UniqueName="Lot4" HeaderText="Condition">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Location" UniqueName="Location" HeaderText="Location">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LotRemarks" UniqueName="LotRemarks" HeaderText="LotRemarks">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot5" UniqueName="Lot5" HeaderText="LotNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TUNO1" UniqueName="TUNO1" HeaderText="PalletNo">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="Wt" UniqueName="Wt" HeaderText="Weight">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" UniqueName="tuno2" Display="false" />
                    <telerik:GridBoundColumn DataField="lot2" UniqueName="lot2" Display="false" DataFormatString="{0:dd/MM/yyyy}" />
                    <telerik:GridBoundColumn DataField="lot3" UniqueName="lot3" Display="false" DataFormatString="{0:dd/MM/yyyy}" />
                    <telerik:GridBoundColumn DataField="lot7" UniqueName="lot7" Display="false" />
                    <telerik:GridBoundColumn DataField="lot8" UniqueName="lot8" Display="false" />
                    <telerik:GridBoundColumn DataField="lot9" UniqueName="lot9" Display="false" />
                    <telerik:GridBoundColumn DataField="lot11" UniqueName="lot11" Display="false" />
                    <telerik:GridBoundColumn DataField="lot12" UniqueName="lot12" Display="false" />
                    <%-- <telerik:GridBoundColumn DataField="Lot4" UniqueName="Lot4" HeaderText="Lot4" Display="false" />
                    <telerik:GridBoundColumn DataField="Lot5" UniqueName="Lot5" HeaderText="Lot5" Display="false" />
                    <telerik:GridBoundColumn DataField="Lot6" UniqueName="Lot6" HeaderText="Lot6" Display="false" /> --%>
                    <telerik:GridBoundColumn DataField="Lot10" UniqueName="Lot10" HeaderText="Lot10" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>