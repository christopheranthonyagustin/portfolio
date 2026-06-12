<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderSubItem.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderSubItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>Distribution Sales Order Sub Item</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                        OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                        OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>&nbsp;
                     <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete"
                         OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                    <asp:Button ID="PackingListBtn" runat="server" class="green"  Text="Packing List"
                         OnClick="PackingListBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Packing List"/>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
            EnableLinqExpressions="false" AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="SalesOrderSubItemId">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ParentItemCode" DataField="ParentItemCode" SortExpression="ParentItemCode" UniqueName="ParentItemCode"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ParentItemDescription" DataField="SalesOrderItemDescription" SortExpression="SalesOrderItemDescription" UniqueName="SalesOrderItemDescription"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemCode" DataField="ItemCode" SortExpression="ItemCode" UniqueName="ItemCode"
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
    </form>
</body>
</html>
