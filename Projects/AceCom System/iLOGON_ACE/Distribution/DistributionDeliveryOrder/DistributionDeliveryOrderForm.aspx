<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionDeliveryOrderForm.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionDeliveryOrder.DistributionDeliveryOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Edit @ Delivery Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attachment" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Office2007"  OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="ItemTab" Text="Item" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="SubItemTab" Text="SubItem" Value="100" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="ItemRadPageView">
                        <br />
                        <asp:Panel ID="NewBtnPanel" runat="server">
                            <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                                OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                                OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete"
                                OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            <br />
                        </asp:Panel>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="true" AllowSorting="true"
                            AllowFilteringByColumn="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="DeliveryOrderItemId">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="EditImgBtn"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                                OnClick="EditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            &nbsp;
                                            <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="DeleteImgBtn" OnClientClick="return confirm('Confirm delete?')"
                                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                                OnClick="DeleteImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="SalesOrderNo" DataField="SalesOrderNo" SortExpression="SalesOrderNo" UniqueName="SalesOrderNo" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="SalesOrderItemLineNo" DataField="SalesOrderItemLineNo" SortExpression="SalesOrderItemLineNo" UniqueName="SalesOrderItemLineNo" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemCode" DataField="ItemCode" SortExpression="ItemCode" UniqueName="ItemCode" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemDescription" DataField="ItemDescription" SortExpression="ItemDescription" UniqueName="ItemDescription" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemType" DataField="ItemType" SortExpression="ItemType" UniqueName="ItemType" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemQty" DataField="expecteduomqty" SortExpression="ItemQty" UniqueName="ItemQty" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemUOM" DataField="ItemUOM" SortExpression="ItemUOM" UniqueName="ItemUOM" AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemUnitPrice" DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" UniqueName="ItemUnitPrice" AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes" AllowFiltering="false" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="DeliveryOrderItemStatus" DataField="DeliveryOrderItemStatusDescr" SortExpression="DeliveryOrderItemStatus" UniqueName="DeliveryOrderItemStatus">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SOItemId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="IsSystemGenerated" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DeliveryOrderItemId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SalesOrderItemId" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="SubItemRadPageView">
                        <table style="width: 100%; height: 10px">
                            <tr>
                                <td>
                                    <br />
                                    <asp:Button ID="PackingListBtn" runat="server" class="green" Text="Packing List"
                                        OnClick="PackingListBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Packing List" />
                                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                                    <br /> <br />
                                </td>
                            </tr>
                        </table>
                        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                            EnableLinqExpressions="false" AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG1_NeedDataSource">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemDescription" DataField="ItemDescription" SortExpression="ItemDescription" UniqueName="ItemDescription"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemQty" DataField="ItemQty" SortExpression="ItemQty" UniqueName="ItemQty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemUOM" DataField="ItemUOM" SortExpression="ItemUOM" UniqueName="ItemUOM"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" SortExpression="Remarks" UniqueName="Remarks"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemLength" DataField="ItemLength" SortExpression="ItemLength" UniqueName="ItemLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemWidth" DataField="ItemWidth" SortExpression="ItemWidth" UniqueName="ItemWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemHeight" DataField="ItemHeight" SortExpression="ItemHeight" UniqueName="ItemHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemVol" DataField="ItemVol" SortExpression="ItemVol" UniqueName="ItemVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemWt" DataField="ItemWt" SortExpression="ItemWt" UniqueName="ItemWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemNetWt" DataField="ItemNetWt" SortExpression="ItemNetWt" UniqueName="ItemNetWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="InternalLength" DataField="InternalLength" SortExpression="InternalLength" UniqueName="InternalLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalWidth" DataField="InternalWidth" SortExpression="InternalWidth" UniqueName="InternalWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalHeight" DataField="InternalHeight" SortExpression="InternalHeight" UniqueName="InternalHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalVol" DataField="InternalVol" SortExpression="InternalVol" UniqueName="InternalVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalWt" DataField="InternalWt" SortExpression="InternalWt" UniqueName="InternalWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalNetWt" DataField="InternalNetWt" SortExpression="InternalNetWt" UniqueName="InternalNetWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExternalLength" DataField="ExternalLength" SortExpression="ExternalLength" UniqueName="ExternalLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalWidth" DataField="ExternalWidth" SortExpression="ExternalWidth" UniqueName="ExternalWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalHeight" DataField="ExternalHeight" SortExpression="ExternalHeight" UniqueName="ExternalHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalVol" DataField="ExternalVol" SortExpression="ExternalVol" UniqueName="ExternalVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalWt" DataField="ExternalWt" SortExpression="ExternalWt" UniqueName="ExternalWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalNetWt" DataField="ExternalNetWt" SortExpression="ExternalNetWt" UniqueName="ExternalNetWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="AddDate" SortExpression="AddDate" UniqueName="AddDate"
                                        DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="AddUser" SortExpression="AddUser" UniqueName="AddUser"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="EditDate" SortExpression="EditDate" UniqueName="EditDate"
                                        DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="EditUser" SortExpression="EditUser" UniqueName="EditUser"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SalesOrderSubItemId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SalesOrderItemId" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
