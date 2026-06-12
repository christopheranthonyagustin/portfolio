<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3ListOfSKU.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3ListOfSKU" %>

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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function GetRadWindow() {
                var oWindow = null; if (window.radWindow)
                    oWindow = window.radWindow; else if (window.frameElement.radWindow)
                        oWindow = window.frameElement.radWindow; return oWindow;
            }

            function close() {
                GetRadWindow().close();
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnablePageMethods="true" />
        <asp:Button ID="SelectBtn" runat="server" CssClass="white" Text="Select" OnClick="SelectBtn_Click" UseSubmitBehavior="false"
            OnClientClick="disableBtn(this.id,true)" />
        <br />
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate>
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
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SKUCode" ClientDataKeyNames="SKUCode">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="SKUCode" UniqueName="SKUCode" HeaderText="SKUCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUDescr" UniqueName="SKUDescr" HeaderText="SKUDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUPackingDescr" UniqueName="SKUPackingDescr" HeaderText="SKUPackingDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BalanceQty" UniqueName="BalanceQty" HeaderText="BalanceQty" ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="PickQty" UniqueName="PickQty" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="PickQtyTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                    <asp:CompareValidator ID="PickQtyTxtCompVal" runat="server" ControlToValidate="PickQtyTxt"
                                        EnableClientScript="True" ForeColor="Red" Font-Bold="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
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
                            <telerik:GridBoundColumn DataField="tuno2" UniqueName="tuno2" Display="false" />
                            <telerik:GridBoundColumn DataField="lot2" UniqueName="lot2" Display="false" DataFormatString="{0:dd/MM/yyyy}" />
                            <telerik:GridBoundColumn DataField="lot3" UniqueName="lot3" Display="false" DataFormatString="{0:dd/MM/yyyy}" />
                            <telerik:GridBoundColumn DataField="lot7" UniqueName="lot7" Display="false" />
                            <telerik:GridBoundColumn DataField="lot8" UniqueName="lot8" Display="false" />
                            <telerik:GridBoundColumn DataField="lot9" UniqueName="lot9" Display="false" />
                            <telerik:GridBoundColumn DataField="lot11" UniqueName="lot11" Display="false" />
                            <telerik:GridBoundColumn DataField="lot12" UniqueName="lot12" Display="false" />
                            <telerik:GridBoundColumn DataField="Lot10" UniqueName="Lot10" HeaderText="Lot10" Display="false" />
                            <telerik:GridBoundColumn DataField="SKUId" UniqueName="SKUId" HeaderText="SKUId" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
