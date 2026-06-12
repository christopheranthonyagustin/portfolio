<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionFabricationHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabrication.DistributionFabricationHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Fabrication List</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="80%" ID="HeaderRadPageView">
                <br />
                <table style="width: 100%; height: 30px">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="350px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="FabricationId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="TradeMasterEdit"
                                        ImageUrl="../../image/pencil.gif" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="FabricationCode" UniqueName="FabricationCode" SortExpression="FabricationCode" HeaderText="Code" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationDescription" UniqueName="FabricationDescription" SortExpression="FabricationDescription" HeaderText="Description" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationStatusDescr" UniqueName="FabricationStatusDescr" SortExpression="FabricationStatusDescr" HeaderText="Status" HeaderStyle-Width="130px" ItemStyle-Width="30px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationStatusColorCode" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
