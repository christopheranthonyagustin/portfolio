<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderChargeReadyForBilling.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderChargeReadyForBilling" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
<html>

<head runat="server">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table width="100%">
                    <tr>
                        <td width="20%">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="LONGLABELWHITE" Text="Refresh"
                                OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="BillBtn" runat="server" CssClass="LONGLABELWHITE" Text="Bill"
                                OnClick="BillBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="false"
                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource"
                    AllowPaging="true" AutoGenerateColumns="true" GridLines="None" OnItemDataBound="ResultDG_ItemDataBound"
                    OnColumnCreated="ResultDG_ColumnCreated">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <div>
            <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
        </div>
    </form>
</body>
</html>
