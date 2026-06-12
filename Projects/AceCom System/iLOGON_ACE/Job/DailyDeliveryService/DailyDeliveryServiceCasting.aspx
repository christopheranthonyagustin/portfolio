<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveryServiceCasting.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveryService.DailyDeliveryServiceCasting" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyDeliveryServiceCasting</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
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
    <style type="text/css">
        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <%--Changed the <asp:ScriptManager> to <telerik:RadScriptManager> because Cancel Changes button in Batch Grid is not working well--%>
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadWindowManager ID="RadWindowManager" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Silk" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500">
        </telerik:RadAjaxLoadingPanel>
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                    </asp:Label>
                    <br />
                    <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </asp:Panel>
                </td>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <br />
                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtlAlgo" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <br />
                    <asp:Button ID="RunCastBtn" runat="server" CssClass="LongLabelWhite" Text="Run Casting" OnClick="RunCastBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                        <asp:Button ID="ConfigureAlgoBtn" runat="server" CssClass="LongLabelWhite" Text="Configure Algorithm" OnClick="ConfigureAlgoBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>&nbsp;
                        <asp:Button ID="TransferVehicle" runat="server" CssClass="LongLabelWhite" Text="Transfer Vehicle" OnClick="TransferVehicle_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="UnassignBtn" runat="server" CssClass="LongLabelWhite" Text="Unassign" OnClick="UnassignBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="BypassTakeoverBtn" runat="server" CssClass="LongLabelWhite" Text="Bypass Takeover" OnClick="BypassTakeoverBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ConfirmBypassTakeoverBtn" Text="" Style="display: none;" OnClick="ConfirmBypassTakeoverBtn_Click" runat="server" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="BypassDriverBtn" runat="server" CssClass="LongLabelWhite" Text="Bypass Driver" OnClick="BypassDriverBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ConfirmBypassDriverBtn" Text="" Style="display: none;" OnClick="ConfirmBypassDriverBtn_Click" runat="server" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="PrintJobListBtn" runat="server" CssClass="LongLabelWhite" Text="Print Job List" OnClick="PrintJobListBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>

        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    AllowSorting="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="CastingGrid" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c" HeaderStyle-Font-Bold="true">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
