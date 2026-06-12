<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMPutawayTaskPool.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMPutaway.VLMPutawayTaskPool" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="TitleName"></title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <form id="form2" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <table style="padding-left: 25px" id="t1" runat="server">
            <tr>
                <td>
                    <asp:Label Text="Access Point" runat="server"></asp:Label>
                    <br />
                    <telerik:RadTextBox ID="AccessPointTxt" runat="server" Skin="Sunset" Width="200" Height="50" CausesValidation="false" BackColor="#ded7c6" Font-Size="Large" UseSubmitBehavior="false" OnTextChanged="AccessPointTxt_TextChanged" AutoPostBack="true"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <br />
        <table style="padding-left: 25px">
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" runat="server" Text="Submit" CssClass="white"
                        OnClick="SubmitBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ResetBtn" runat="server" Text="Reset" CssClass="white"
                        OnClick="ResetBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" Style="padding-left: 25px"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="QueueTab" Text="Task Pool" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Id="ActiveTaskTab" Text="Active Task" Value="10" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="TaskInQueueTab" Text="Task in Queue" Value="20" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ManageRobotMissionTab" Text="Manage Robot Mission" Value="30" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="100%" ID="HeaderRadPageView">
                <div>
                    <table style="padding-left: 25px">
                        <tr>
                            <td>
                                <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" ToolTip="Save"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="StartPutawayBtn" runat="server" Text="Start Putaway" CssClass="LongLabelWhite"
                                    OnClick="StartPutawayBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>

                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="ActiveTaskRadPageView" />
            <telerik:RadPageView runat="server" Height="600px" ID="TaskInQueueRadPageView" />
            <telerik:RadPageView runat="server" Height="600px" ID="ManageRobotMissionRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
