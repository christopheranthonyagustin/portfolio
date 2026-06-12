<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLAccountAssets.aspx.cs" Inherits="iWMS.Web.Accounting.GLAccount.GLAccountAssets" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GLAccountAssets</title>
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="AssetsRadPageView">
                <br />
                <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click"
                    Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
                            <telerik:GridBoundColumn DataField="entcode" ItemStyle-Wrap="false" SortExpression="entity"
                                HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="code" ItemStyle-Wrap="false" SortExpression="code"
                                HeaderText="Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="descr" ItemStyle-Wrap="false" SortExpression="descr"
                                HeaderText="Descr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="typedescr" ItemStyle-Wrap="false" SortExpression="typedescr"
                                HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="subtypedescr" ItemStyle-Wrap="false" SortExpression="subtypedescr"
                                HeaderText="SubType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="categorydescr" ItemStyle-Wrap="false" SortExpression="categorydescr"
                                HeaderText="Category">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DRCRDescr" ItemStyle-Wrap="false" SortExpression="DRCRDescr"
                                HeaderText="DR/CR">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="currcode" ItemStyle-Wrap="false" SortExpression="currcode"
                                HeaderText="ActualCurrency">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks1" ItemStyle-Wrap="false" SortExpression="remarks1"
                                HeaderText="Remarks1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks2" ItemStyle-Wrap="false" SortExpression="remarks2"
                                HeaderText="Remarks2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" ItemStyle-Wrap="false" SortExpression="statusdescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>