<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderContainer.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderContainer" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Distribution Sales Order Container</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView">
                <asp:Panel ID="NewBtnPanel" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                                    Text="Add" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="EditBtn" runat="server" CssClass="white" OnClick="EditBtn_Click"
                                    Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="DeleteBtn" class="white" runat="server" OnClick="DeleteBtn_Click"
                                    Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel ID="NewCtnrPanel" runat="server">
                    <asp:Button ID="AddNewCtnrBtn" runat="server" CssClass="white" Text="Add"
                        OnClick="AddNewCtnrBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelNewCtnrBtn" runat="server" CssClass="white" Text="Cancel"
                        OnClick="CancelNewCtnrBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                </asp:Panel>                

                <asp:Panel ID="NewCtnrUpdatePanel" runat="server">
                    <asp:Button ID="UpdateCtnrBtn" runat="server" CssClass="white" Text="Update"
                        OnClick="UpdateCtnrBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelCtnrBtn" runat="server" CssClass="white" Text="Cancel"
                        OnClick="CancelCtnrBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                </asp:Panel>

                <asp:Panel ID="FormCtlPanel" runat="server">
                    <asp:UpdatePanel ID="FormCtnrUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server" Visible="true"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <br />
                <asp:UpdatePanel ID="OuterGridPanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true" Resizing-AllowResizeToFit="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" Width="100%">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="true" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="S/N" ItemStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true" AllowFiltering="false"
                                        HeaderText="S/N" SortExpression="S/N" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="ContainerNo" SortExpression="ContainerNo" UniqueName="ContainerNo"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ContainerSealNo" DataField="ContainerSealNo" SortExpression="ContainerSealNo" UniqueName="ContainerSealNo"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ContainerType" DataField="ContainerType" SortExpression="ContainerType" UniqueName="ContainerType"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ContainerSize" DataField="ContainerSize" SortExpression="ContainerSize" UniqueName="ContainerSize"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ContainerWt" DataField="ContainerWt" SortExpression="ContainerWt" UniqueName="ContainerWt"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ContainerVol" DataField="ContainerVol" SortExpression="ContainerVol" UniqueName="ContainerVol"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="BookingReferenceNo" DataField="BookingReferenceNo" SortExpression="BookingReferenceNo" UniqueName="BookingReferenceNo"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ExpGateInDate" UniqueName="ExpGateInDate" SortExpression="ExpGateInDate"
                                        HeaderText="ExpGateInDate" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActGateInDate" UniqueName="ActGateInDate" SortExpression="ActGateInDate"
                                        HeaderText="ActGateInDate" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ExpGateOutDate" UniqueName="ExpGateOutDate" SortExpression="ExpGateOutDate"
                                        HeaderText="ExpGateOutDate" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActGateOutDate" UniqueName="ActGateOutDate" SortExpression="ActGateOutDate"
                                        HeaderText="ActGateOutDate" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DetentionExpiryDate" UniqueName="DetentionExpiryDate" SortExpression="DetentionExpiryDate"
                                        HeaderText="DetentionExpiryDate" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="SalesOrderCtnrStatus" DataField="SalesOrderCtnrStatus" SortExpression="SalesOrderCtnrStatus" UniqueName="SalesOrderCtnrStatus"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ChokingWeight" DataField="ChokingWeight" SortExpression="ChokingWeight" UniqueName="ChokingWeight"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TareWeight" DataField="TareWeight" SortExpression="TareWeight" UniqueName="TareWeight"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="VerifiedGrossMass" DataField="VerifiedGrossMass" SortExpression="VerifiedGrossMass" UniqueName="VerifiedGrossMass"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="DockCode" DataField="DockCode" SortExpression="DockCode" UniqueName="DockCode"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="CheckTallyBy" DataField="CheckTallyBy" SortExpression="CheckTallyBy" UniqueName="CheckTallyBy"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" SortExpression="Remarks" UniqueName="Remarks"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ModifiedOn" DataField="ModifiedOn" SortExpression="ModifiedOn" UniqueName="ModifiedOn"
                                        Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn Display="false" DataField="SalesOrderCtnrId">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="false" DataField="SalesOrderId">
                                    </telerik:GridBoundColumn>

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
