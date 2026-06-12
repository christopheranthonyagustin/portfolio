<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EMAILQUEUEHead.aspx.cs" Inherits="iWMS.Web.Interface.EMAILQUEUE.EMAILQUEUEHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>EMAILQUEUEHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_Click"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="ResultTab" Text="Result" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="MessageTab" Text="Message" Value="25" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                    <asp:Button ID="SendNowBtn" runat="server" CssClass="white" Text="Send Now"
                        OnClick="SendNowBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="true" Skin="Metro"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                        AllowAutomaticInserts="True">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" Name="ParentGrid" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                            EditMode="InPlace" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
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
                                <telerik:GridBoundColumn DataField="RecipientEmail" SortExpression="RecipientEmail" HeaderText="RecipientEmail"
                                    Display="true" UniqueName="RecipientEmail" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CC" SortExpression="CC" HeaderText="CC"
                                    Display="true" UniqueName="CC" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RecipientName" SortExpression="RecipientName" HeaderText="RecipientName"
                                    Display="true" UniqueName="RecipientName" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SenderEmail" SortExpression="SenderEmail" HeaderText="SenderEmail"
                                    Display="true" UniqueName="SenderEmail" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SenderName" SortExpression="SenderName" HeaderText="SenderName"
                                    Display="true" UniqueName="SenderName" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Subject" SortExpression="Subject" HeaderText="Subject"
                                    Display="true" UniqueName="Subject" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account"
                                    Display="true" UniqueName="Account" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="MessageFormat" SortExpression="MessageFormat" HeaderText="MessageFormat"
                                    Display="true" UniqueName="MessageFormat" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="ScheduledSendDate" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "scheduledsenddate", "{0:dd/MMM/yyyy}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadDatePicker ID="ReadyDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                        </telerik:RadDatePicker>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="NoOfTries" SortExpression="NoOfTries" HeaderText="NoOfTries"
                                    Display="true" UniqueName="NoOfTries" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="StatusDescr"
                                    Display="true" UniqueName="StatusDescr" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RecordId" SortExpression="RecordId" HeaderText="RecordId"
                                    Display="true" UniqueName="RecordId" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                                    Display="true" UniqueName="AddUser" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser"
                                    Display="true" UniqueName="EditUser" ItemStyle-Wrap="false" Visible="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Id" SortExpression="Id" HeaderText="Id"
                                    Display="false" UniqueName="Id" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusColourCode" SortExpression="StatusColourCode" HeaderText="StatusColourCode"
                                    Display="false" UniqueName="StatusColourCode" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>

                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="700px" ID="MessageRadPageView" />
                <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
            </telerik:RadMultiPage>
        </div>
    </form>
</body>
</html>
