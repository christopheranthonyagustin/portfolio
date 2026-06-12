<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3ListOfSKUGRSearch.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3ListOfSKUGRSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>ListOfGRSearchSKU @ Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
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
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" OnClick="AddBtn_Click" UseSubmitBehavior="false"
            OnClientClick="disableBtn(this.id,true)" />
        <br />
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnNeedDataSource="ResultDG_NeedDataSource"
                    AllowPaging="false" Skin="Metro" EnableViewState="false" UseAccessibleHeader="True" OnPreRender="ResultDG_PreRender">
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
                            <telerik:GridBoundColumn DataField="SKUCode" UniqueName="SKUCode" HeaderText="SKUCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUDescr" UniqueName="SKUDescr" HeaderText="SKUDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUPacking" UniqueName="SKUPacking" HeaderText="SKUPacking">
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
                            <telerik:GridBoundColumn DataField="BillingGroup" UniqueName="BillingGroup" HeaderText="Storage Condition">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SiteCode" UniqueName="SiteCode" HeaderText="Site">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Lot1" UniqueName="Lot1" HeaderText="ExpiryDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReceiveDate" UniqueName="ReceiveDate" HeaderText="ReceiveDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Lot6" UniqueName="Lot6" HeaderText="SB WSO NO">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Lot4" UniqueName="Lot4" HeaderText="Condition">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Location" UniqueName="Location" HeaderText="Location">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LotRemarks" UniqueName="LotRemarks" HeaderText="LotRemarks">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Lot5" UniqueName="Lot5" HeaderText="LotNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TUNo1" UniqueName="TUNo1" HeaderText="PalletNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TUNo2" UniqueName="TUNo2" Display="false" />
                            <telerik:GridBoundColumn DataField="Lot2" UniqueName="Lot2" Display="false" DataFormatString="{0:dd/MMM/yyyy}" />
                            <telerik:GridBoundColumn DataField="Lot3" UniqueName="Lot3" Display="false" DataFormatString="{0:dd/MMM/yyyy}" />
                            <telerik:GridBoundColumn DataField="Lot7" UniqueName="Lot7" Display="false" />
                            <telerik:GridBoundColumn DataField="Lot8" UniqueName="Lot8" Display="false" />
                            <telerik:GridBoundColumn DataField="Lot9" UniqueName="Lot9" Display="false" />
                            <telerik:GridBoundColumn DataField="Lot11" UniqueName="Lot11" Display="false" />
                            <telerik:GridBoundColumn DataField="Lot12" UniqueName="Lot12" Display="false" />
                            <telerik:GridBoundColumn DataField="Lot10" UniqueName="Lot10" Display="false" />
                            <telerik:GridBoundColumn DataField="SKUId" UniqueName="SKUId" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
