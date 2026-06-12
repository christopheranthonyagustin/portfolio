<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionFabricationOrderHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabricationOrder.DistributionFabricationOrderHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Fabrication Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                    OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                    OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;                
                <asp:Button ID="ConfirmButton" runat="server" CssClass="white" Text="Confirm"
                    OnClick="ConfirmButton_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;          
                 <asp:Button ID="PrintFOBtn" runat="server" CssClass="LongLabelBlue" Text="Fabrication Order"
                     OnClick="PrintFOBtnBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="ExcelBtn" runat="server" CssClass="LongLabelGreen" Text="Fabrication Order Excel"
                    OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="FabricationOrderId">
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
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="Edit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationOrderNo" UniqueName="FabricationOrderNo" SortExpression="FabricationOrderNo"
                                HeaderText="FabricationOrderNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SalesOrderNo" UniqueName="SalesOrderNo" SortExpression="SalesOrderNo"
                                HeaderText="SalesOrderNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FabricationOrderDate" UniqueName="FabricationOrderDate" SortExpression="FabricationOrderDate"
                                HeaderText="FabricationOrderDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomerCode" UniqueName="CustomerCode" SortExpression="CustomerCode"
                                HeaderText="CustomerCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName"
                                HeaderText="CustomerName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationOrderStatusDescr" UniqueName="FabricationOrderStatusDescr" SortExpression="FabricationOrderStatusDescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationOrderStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationOrderId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationOrderNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
