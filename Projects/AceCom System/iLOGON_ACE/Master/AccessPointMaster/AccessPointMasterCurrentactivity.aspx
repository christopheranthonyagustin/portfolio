<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessPointMasterCurrentactivity.aspx.cs" Inherits="iWMS.Web.Master.AccessPointMaster.AccessPointMasterCurrentactivity" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>AccessPointMasterCurrentactivity</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
</head>
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="580px" ID="AccessPointMasterDashboardRadPageView">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_Currentactivity" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        EditMode="Batch" CommandItemDisplay="None">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="AccessPoint" UniqueName="AccessPoint" HeaderText="Access Point" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn UniqueName="APState" HeaderText="AP State" DataField="AP State" AllowFiltering="false" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" ItemStyle-Width="200px" HeaderStyle-Width="150px">
                                <ItemTemplate>
                                    <div id="APStateDiv" runat="server" class="StatusBox" itemstyle-width="500px" headerstyle-width="600px">
                                        <%# string.Format("{0:}",Eval("AP State")) %>
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridBoundColumn DataField="AP_StateColourCode" UniqueName="AP_StateColourCode" HeaderText="AP_StateColourCode" ShowFilterIcon="false" AllowFiltering="false" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LastStateUpdate" UniqueName="LastStateUpdate" HeaderText="Last State Update" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TaskType" UniqueName="TaskType" HeaderText="Task Type" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TaskStatus" UniqueName="TaskStatus" HeaderText="Task Status" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LastStatusUpdate" UniqueName="LastStatusUpdate" HeaderText="Last Status Update" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="TaskError" UniqueName="TaskError" HeaderText="Task Error" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
