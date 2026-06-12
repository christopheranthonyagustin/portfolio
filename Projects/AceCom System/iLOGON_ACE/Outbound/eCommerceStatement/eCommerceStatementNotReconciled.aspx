<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eCommerceStatementNotReconciled.aspx.cs" Inherits="iWMS.Web.Outbound.eCommerceStatement.eCommerceStatementNotReconciled" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>eCommerceStatementNotReconciled</title>
     <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
                <table style="width: 100%; height: 30px">
            <tr>
                <td>
                     <asp:Button ID="ReconcileNowBtn" runat="server" Text="Reconcile Now" OnClick="ReconcileNowBtn_Click" CausesValidation="false"
                    CssClass="LongLabelWhite" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                </td>
            </tr>
        </table>
        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true"
            AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />

                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                      <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="Account" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="OnlinePlatform" SortExpression="OnlinePlatform" HeaderText="OnlinePlatform" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="StoreName" SortExpression="StoreName" HeaderText="StoreName" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="PeriodFrDate" SortExpression="PeriodFrDate" HeaderText="PeriodFrDate" AllowFiltering="false" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="PeriodToDate" SortExpression="PeriodToDate" HeaderText="PeriodToDate" AllowFiltering="false" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="BundleSKUCode" SortExpression="BundleSKUCode" HeaderText="BundleSKUCode" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="SingleSKUCode" SortExpression="SingleSKUCode" HeaderText="SingleSKUCode" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="SKUCode" SortExpression="SKUCode" HeaderText="SKUCode" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUDescr" SortExpression="SKUDescr" HeaderText="SKUDescr" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Qty" SortExpression="Qty" HeaderText="Qty" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="UnitPrice" SortExpression="UnitPrice" HeaderText="UnitPrice" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="Amount" SortExpression="Amount" HeaderText="Amount" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="ReconciliationStatus" SortExpression="ReconciliationStatus" HeaderText="ReconciliationStatus" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="ERPPOllStatus" SortExpression="ERPPOllStatus" HeaderText="ERPPOllStatus" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status" AllowFiltering="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" AllowFiltering="false"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" AllowFiltering="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                                ColumnGroupName="editdate" SortExpression="editdate" UniqueName="Editdate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                                ColumnGroupName="edituser" SortExpression="edituser" UniqueName="Edituser" Reorderable="true">
                            </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="Acid" SortExpression="Acid" HeaderText="Acid" AllowFiltering="false" Display="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="Account" AllowFiltering="false" Display="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="IsId" SortExpression="IsId" HeaderText="IsId" AllowFiltering="false" Display="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="SKUId" SortExpression="SKUId" HeaderText="SKUId" AllowFiltering="false" Display="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="IsDtId" SortExpression="IsDtId" HeaderText="IsDtId" AllowFiltering="false" Display="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

