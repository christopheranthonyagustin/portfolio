<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskSchQueueHead.aspx.cs" Inherits="iWMS.Web.Interface.TaskSchQueue.TaskSchQueueHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TASKSCHQUEUEHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

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
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click"
                        Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ActiveBtn" CssClass="LongLabelWhite" runat="server" OnClick="ActiveBtn_Click" Visible="True"
                        Text="Set as Active" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="InactiveBtn" CssClass="LongLabelWhite" runat="server" OnClick="InactiveBtn_Click" Visible="True"
                        Text="Set as Inactive" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="500" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="TaskSchQEdit" ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit Task Scheduler Queue"
                                            BorderWidth="0" BackColor="Transparent" OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="ldAdd" ImageUrl="..\..\image\add.png" Width="15"
                                            Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Add" Visible="true"
                                            OnClick="ldAdd_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Id" SortExpression="Id" HeaderText="ID"
                                    Display="true" UniqueName="Id" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TaskCode" SortExpression="TaskCode" HeaderText="TaskCode"
                                    Display="true" UniqueName="TaskCode" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TaskDescr" SortExpression="TaskDescr" HeaderText="Description"
                                    Display="true" UniqueName="TaskDescr" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LogicController" SortExpression="LogicController" HeaderText="LogicController"
                                    Display="true" UniqueName="LogicController" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LastRunDate" SortExpression="LastRunDate" HeaderText="LastRunDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NextRunDate" SortExpression="NextRunDate" HeaderText="NextRunDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RepeatOption" SortExpression="RepeatOption" HeaderText="Repeat Option"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status"
                                    UniqueName="StatusDescr" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RecipientEmail" SortExpression="RecipientEmail" HeaderText="RecipientEmail"
                                    Display="true" UniqueName="RecipientEmail" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account"
                                    Display="true" UniqueName="Account" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StartingDate" SortExpression="StartingDate" HeaderText="StartingDate"
                                    Display="true" UniqueName="StartingDate" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EndingDate" SortExpression="EndingDate" HeaderText="EndingDate"
                                    Display="true" UniqueName="EndingDate" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OneTimeOnlyAt" SortExpression="OneTimeOnlyAt" HeaderText="OneTimeOnlyAt"
                                    Display="true" UniqueName="OneTimeOnlyAt" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Mon" SortExpression="Mon" HeaderText="Mon"
                                    Display="true" UniqueName="Mon" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Tue" SortExpression="Tue" HeaderText="Tue"
                                    Display="true" UniqueName="Tue" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Wed" SortExpression="Wed" HeaderText="Wed"
                                    Display="true" UniqueName="Wed" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Thu" SortExpression="Thu" HeaderText="Thu"
                                    Display="true" UniqueName="Thu" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Fri" SortExpression="Fri" HeaderText="Fri"
                                    Display="true" UniqueName="Fri" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Sat" SortExpression="Sat" HeaderText="Sat"
                                    Display="true" UniqueName="Sat" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Sun" SortExpression="Sun" HeaderText="Sun"
                                    Display="true" UniqueName="Sun" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DailyFlag" SortExpression="DailyFlag" HeaderText="RunDaily"
                                    Display="true" UniqueName="DailyFlag" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DailyAt" SortExpression="DailyAt" HeaderText="DailyAt"
                                    Display="true" UniqueName="DailyAt" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Notes" SortExpression="Notes" HeaderText="Notes"
                                    Display="true" UniqueName="Notes" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SenderEmail" SortExpression="SenderEmail" HeaderText="SenderEmail"
                                    Display="true" UniqueName="SenderEmail" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                                    Display="true" UniqueName="AddUser" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser"
                                    Display="true" UniqueName="EditUser" ItemStyle-Wrap="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusColourCode" SortExpression="StatusColourCode" HeaderText="StatusColourCode"
                                    Display="false" UniqueName="StatusColourCode" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </div>
    </form>
</body>
</html>

