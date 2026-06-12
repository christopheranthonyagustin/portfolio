<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardCockpitMaster.aspx.cs" Inherits="iWMS.Web.Outbound.WavePickingWorkbench.DashboardCockpitMaster" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cockpit Master</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        body {
            overflow: hidden;
        }
    </style>

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="Button1" CssClass="LongLabelWhite" runat="server" OnClick="CancelBtn_Click" Text="Close Window" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table2" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        <asp:Label ID="Countlbl" runat="server" Style="color: red; font-size: medium; font-weight: bold"></asp:Label>
                                        <asp:Label ID="TripNoLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <%--<tr align="right" style="padding-top: 24%">
                <td style="padding-top: 24%"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                    <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                </td>
            </tr>--%>
        </table>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="CockpitMasterTab" Text="Indicator Template" Value="0" readonly="readonly" runat="server" Visible="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="DashboardCockpitRadpageview">
                <table cellspacing="10" cellpadding="0" border="0" width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="CreateNewBtn" runat="server" CssClass="white" Text="New"
                                OnClick="CreateNewBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                    EnableLinqExpressions="false" AllowPaging="true"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        DataKeyNames="id" Name="ParentGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    &nbsp;&nbsp;
                                <asp:ImageButton runat="server" Visible="True" ID="WPWPolicyEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Wave Picking Workbench Wave Policy"
                                    OnClick="WPWPolicyEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="WPWdelete"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="WPWdelete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="IndicatorGivenName" SortExpression="IndicatorGivenName" HeaderText="IndicatorGivenName"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="Account"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" SortExpression="ModifiedOn" HeaderText="ModifiedOn"
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
