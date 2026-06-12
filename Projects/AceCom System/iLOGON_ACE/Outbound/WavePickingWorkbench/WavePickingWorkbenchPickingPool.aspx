<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WavePickingWorkbenchPickingPool.aspx.cs" Inherits="iWMS.Web.Outbound.WavePickingWorkbench.WavePickingWorkbenchPickingPool" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Pick Task @ WavePackingWorkbenchPickingPool</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            var startingIndex = 0, gridViewID = '<%= ResultDG.MasterTableView.ClientID %>';
            function selectCheckbox(e, selectedIndex) {
                if (e.shiftKey) {
                    if (startingIndex < selectedIndex) {
                        $(':checkbox', '#' + gridViewID).slice(startingIndex, selectedIndex).prop("checked", true);
                    }
                    else
                        $(':checkbox', '#' + gridViewID).slice(selectedIndex, startingIndex).prop("checked", true);
                }
                startingIndex = selectedIndex;
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="OutstandingPickTask" Text="Outstanding Pick Task" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ManageOutstandingWave" Text="Manage Outstanding Wave" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="PickTaskRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="BuildWaveBtn" runat="server" CssClass="LongLabelWhite" Text="Build Wave Line Level"
                                OnClick="BuildWaveBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="AssignPickerBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Picker"
                                OnClick="AssignPickerBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="ExcelBtn" runat="server" CssClass="Green" Text="Excel" 
                                OnClick="ExcelBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="UnassignPickerBtn" runat="server" CssClass="LongLabelWhite" Text="Unassign Picker"
                                OnClick="UnassignPickerBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                                OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="PickedBtn" runat="server" CssClass="white" Text="Picked"
                                OnClick="PickedBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                        <td align="right">
                            <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M"
                                OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true" OnPreRender="ResultDG_PreRender"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="PTDTId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ManageWaveRadPageView" ContentUrl="~/Outbound/WavePickingWorkbench/WavePickingWorkbenchManageWave.aspx">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
