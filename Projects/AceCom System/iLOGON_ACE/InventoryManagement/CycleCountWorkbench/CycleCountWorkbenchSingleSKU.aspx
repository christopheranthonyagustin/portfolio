<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CycleCountWorkbenchSingleSKU.aspx.cs" Inherits="iWMS.Web.InventoryManagement.CycleCountWorkbench.CycleCountWorkbenchSingleSKU" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>CycleCountWorkbenchSingleSKU</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <style>
        #RequestScheduledCountBtn {
            font-size: 9.5px;
        }
    </style>
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
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                </table>
                <br />
                <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="RequestScheduledCountBtn" CssClass="LongLabelWhite" runat="server" OnClick="RequestScheduledCountBtn_Click"
                    Text="&nbsp;Request Scheduled&nbsp;Count" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                <br />
                <br />

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true" 
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" OnItemDataBound="ResultDG_ItemDataBound">
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="300" HeaderStyle-CssClass="RGridHeader_CUSTOM"
                        HeaderStyle-ForeColor="White" DataKeyNames="Location">
                        <BatchEditingSettings EditType="Row" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true" Display="true"
                                HeaderStyle-Wrap="true" ItemStyle-Wrap="true" HeaderStyle-Width="50px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                                    <asp:ImageButton runat="server" Visible="True" ImageUrl="../../image/detail.gif" Width="15" ToolTip="LotId Array"
                                        OnClick="DocIcon_Click"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
