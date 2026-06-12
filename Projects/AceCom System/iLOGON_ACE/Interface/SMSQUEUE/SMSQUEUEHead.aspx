<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SMSQUEUEHead.aspx.cs" Inherits="iWMS.Web.Interface.SMSQUEUE.SMSQUEUEHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SMSQUEUEHead</title>
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
                <telerik:RadTab Text="Result" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab Text="Log" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
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
                        <telerik:GridBoundColumn DataField="RecipientMobileNo" SortExpression="RecipientMobileNo" HeaderText="RecipientMobileNo"
                            Display="true" UniqueName="RecipientMobileNo" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RecipientName" SortExpression="RecipientName" HeaderText="RecipientName"
                            Display="true" UniqueName="RecipientName" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SenderId" SortExpression="SenderId" HeaderText="SenderId"
                            Display="true" UniqueName="SenderId" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account"
                            Display="true" UniqueName="Account" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfTries" SortExpression="NoOfTries" HeaderText="NoOfTries"
                            Display="true" UniqueName="NoOfTries" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="StatusDescr"
                            Display="true" UniqueName="StatusDescr" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>                       
                        <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="true">
                        </telerik:GridBoundColumn>                    
                        <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                            Display="true" UniqueName="AddUser" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Message" SortExpression="Message" HeaderText="Message"
                            Display="true" UniqueName="Message" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ScheduledSendDate" SortExpression="ScheduledSendDate" HeaderText="ScheduledSendDate"
                            Display="true" UniqueName="ScheduledSendDate" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DeliveryReturnMessage" SortExpression="DeliveryReturnMessage" HeaderText="DeliveryReturnMessage"
                            Display="true" UniqueName="DeliveryReturnMessage" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DeliveryStatus" SortExpression="DeliveryStatus" HeaderText="DeliveryStatus"
                            Display="true" UniqueName="DeliveryStatus" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DeliveryDate" SortExpression="DeliveryDate" HeaderText="DeliveryDate"
                            Display="true" UniqueName="DeliveryDate" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser"
                            Display="true" UniqueName="EditUser" ItemStyle-Wrap="false" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Id" SortExpression="Id" HeaderText="Id"
                            Display="false" UniqueName="Id" ItemStyle-Wrap="false" >
                        </telerik:GridBoundColumn> 
                        <telerik:GridBoundColumn DataField="StatusColourCode" SortExpression="StatusColourCode" HeaderText="StatusColourCode"
                           Display="false" UniqueName="StatusColourCode" ItemStyle-Wrap="false" >
                        </telerik:GridBoundColumn> 
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        </div>
    </form>
</body>
</html>
