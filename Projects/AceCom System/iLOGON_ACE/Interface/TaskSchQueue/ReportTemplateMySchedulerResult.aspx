<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportTemplateMySchedulerResult.aspx.cs" Inherits="iWMS.Web.Interface.TaskSchQueue.ReportTemplateMySchedulerResult" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReportTemplateMySchedulerResult</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="ActiveBtn" CssClass="white" runat="server" OnClick="ActiveBtn_Click" Visible="True"
                        Text="Set Active" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="InactiveBtn" CssClass="white" runat="server" OnClick="InactiveBtn_Click" Visible="True"
                        Text="Set Inactive" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <%--<Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />--%>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
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
                    <telerik:GridBoundColumn DataField="TemplateName" SortExpression="TemplateName" HeaderText="TemplateName"
                        Display="true" UniqueName="TemplateName" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastRunDate" SortExpression="LastRunDate" HeaderText="LastRunDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status"
                        Display="true" UniqueName="StatusDescr" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RecipientEmail" SortExpression="RecipientEmail" HeaderText="RecipientEmail"
                        Display="true" UniqueName="RecipientEmail" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RecipientName" SortExpression="RecipientName" HeaderText="RecipientName"
                        Display="true" UniqueName="RecipientName" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AcCode" SortExpression="Account" HeaderText="Account"
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
                    <telerik:GridBoundColumn DataField="SenderName" SortExpression="SenderName" HeaderText="SenderName"
                        Display="true" UniqueName="SenderName" ItemStyle-Wrap="false">
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
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1100px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
