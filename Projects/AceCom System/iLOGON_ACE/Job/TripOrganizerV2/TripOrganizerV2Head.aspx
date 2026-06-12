<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripOrganizerV2Head.aspx.cs" Inherits="iWMS.Web.Job.TripOrganizerV2.TripOrganizerV2Head" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripOrganizerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <style type="text/css">
        .style1 {
            width: 95%;
        }

        .burlyWoodBtn {
            background: #deb887;
        }
    </style>
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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <style type="text/css">
        .PrevNext {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .PrevNext:hover {
                background: #6885ca;
            }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }

            <%--function AcceptedOnClientClose(sender, args) {
                var masterTable = $find("<%= AcceptedResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }--%>
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }

            <%--function CompletedOnClientClose(sender, args) {
                var masterTable = $find("<%= CompletedResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }--%>
        </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab ID="OfferTab" Text="Offer" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="AcceptedTab" Text="Accepted" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="CompletedTab" Text="Completed" Value="100" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="AttcTab" Text="Attc" Value="150" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab ID="DriverLocTab" Text="Driver Loc" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:Label ID="JobLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="TripRadPageView">
                <br />
                <table style="width: 100%; height: 30px">
                    <tr>
                        <td class="style1">
                            <asp:Button ID="AcceptBtn" class="white" runat="server" OnClick="AcceptBtn_Click" Text="Accept" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                            &nbsp;
                            <asp:Button ID="RejectBtn" class="white" runat="server" OnClick="RejectBtn_Click" Text="Reject" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                            &nbsp;
                  
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JbTripId" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
                            <telerik:GridBoundColumn Display="false" DataField="JbTripId" HeaderText="JbTripId">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="jbid" HeaderText="jbid">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="jbctnrid" HeaderText="jbctnrid">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn UniqueName="StatusOfferStatus" HeaderText="Status <br/> OfferStatus" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("statusdescr"), Eval("offerstatusdescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="CustRefOfferBy" HeaderText="CustRef <br/> JobType" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("CustReference"), Eval("JobType")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="AccountJobNo" HeaderText="Account <br/> JobNo" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("accode"), Eval("JobNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ExpectedDate" HeaderText="ExpectedDate" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm}", Eval("FrExpDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <%--<telerik:GridTemplateColumn UniqueName="fromtimetotime" HeaderText="FromTime <br/> ToTime" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("TripFrTime"), Eval("TripToTime")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>--%>

                            <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("vehno"), Eval("name")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="FromrouteToroute" HeaderText="FromRoute <br/> ToRoute" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("frroute"), Eval("toroute ")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0}", Eval("FrServicePtDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0}", Eval("toServicePtDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                HeaderText="EditUser" />

                            <telerik:GridBoundColumn Display="False" DataField="status" HeaderText="status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="usrdef02" HeaderText="usrdef02">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="accode" HeaderText="accode">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="JobNo" HeaderText="JobNo" UniqueName="JobNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="OfferStatus" SortExpression="OfferStatus">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="StatusColourCode" HeaderText="StatusColourCode">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="AcceptedRadPageView" Height="700px"></telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="CompletedPageView" Height="700px">
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <%-- <asp:Button ID="BackDateBtn" class="white" runat="server" OnClick="BackDateBtn_Click" Text="BackDate" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                            &nbsp;--%>
                        <%--<asp:Button ID="PODCollectedBtn" class="longlabelwhite burlyWoodBtn" runat="server" OnClick="PODCollectedBtn_Click" Text="POD Collected" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                            &nbsp;--%>
                        <td>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FromDateLbl" runat="server" Text="FromDate"> </asp:Label>
                            <br />
                            <asp:Button ID="FromDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="FromDatePrevBtn_Click" UseSubmitBehavior="false" />
                            <telerik:RadDatePicker ID="FromDatePicker" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDatePicker_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:Button ID="FromDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="FromDateNextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="ToDateLbl" runat="server" Text="ToDate"> </asp:Label>
                            <br />
                            <asp:Button ID="ToDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="ToDatePrevBtn_Click" UseSubmitBehavior="false" />
                            <telerik:RadDatePicker ID="ToDatePicker" runat="server" Width="155" Height="25"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="ToDatePicker_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:Button ID="ToDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="ToDateNextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <br />
                            <br />
                            &nbsp;
                    <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search" OnClick="SearchBtn_Click" CausesValidation="false"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="CompletedResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="CompletedResultDG_NeedDataSource" AllowPaging="true" OnItemCommand="CompletedResultDG_ItemCommand"
                    OnItemDataBound="CompletedResultDG_ItemDataBound">
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JbTripId" Name="CompletedParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="AcceptedcbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CompletedchkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="CompletedAttcBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" CommandArgument="CompletedAttcDetail"
                                        CommandName="CompletedAttcDetail"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="false" DataField="JbTripId" HeaderText="JbTripId">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="jbid" HeaderText="jbid">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="jbctnrid" HeaderText="jbctnrid">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn UniqueName="StatusOfferStatus" HeaderText="Status <br/> OfferStatus" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("statusdescr"), Eval("offerstatusdescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="CustRefOfferBy" HeaderText="CustRef <br/> JobType" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("CustReference"), Eval("JobType")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="AccountJobNo" HeaderText="Account <br/> JobNo" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("accode"), Eval("JobNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ExpectedDate" HeaderText="ExpectedDate <br/> CompletedDate" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm} <br> {1:dd/MMM/yyyy HH:mm}", Eval("FrExpDate"), Eval("ToActDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <%--<telerik:GridTemplateColumn UniqueName="fromtimetotime" HeaderText="FromTime <br/> ToTime" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("TripFrTime"), Eval("TripToTime")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>--%>

                            <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("vehno"), Eval("Name")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="FromrouteToroute" HeaderText="FromRoute <br/> ToRoute" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("frroute"), Eval("toroute ")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0}", Eval("FrServicePtDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0}", Eval("ToServicePtDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                HeaderText="EditUser" />

                            <telerik:GridBoundColumn Display="False" DataField="status" HeaderText="status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="usrdef02" HeaderText="usrdef02">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="accode" HeaderText="accode">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="JobNo" HeaderText="JobNo" UniqueName="JobNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="OfferStatus" SortExpression="OfferStatus">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="StatusColourCode" SortExpression="OfferStatus">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="StatusColourCode" HeaderText="StatusColourCode">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="DriverLocRadPageView" Height="700px" />
        </telerik:RadMultiPage>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                                <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow1" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>

