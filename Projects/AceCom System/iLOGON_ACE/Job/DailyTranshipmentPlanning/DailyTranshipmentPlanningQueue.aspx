<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTranshipmentPlanningQueue.aspx.cs" Inherits="iWMS.Web.Job.DailyTranshipmentPlanning.DailyTranshipmentPlanningQueue" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyTranshipmentPlanningQueue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            top: -1px;
            float: right;
            right: 1px;
        }

        html {
            overflow: hidden;
        }
    </style>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }
        /*Main menu*/
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 4px 20px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .WrappingItem {
            white-space: normal;
        }

            .WrappingItem:hover {
                color: black !important;
                background-color: white !important;
                font-weight: bold !important;
            }

        .wrap {
            white-space: normal;
            height: 32px;
            text-align: center;
            vertical-align: middle;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }

            function HideContainerInfo(cb) {
                var table = $find("<%= ResultDG.ClientID %>").get_masterTableView();

                if (cb.checked) {
                    table.hideColumn(0);
                    table.hideColumn(table.getColumnByUniqueName("ContainerInfo").get_element().cellIndex);
                    table.hideColumn(table.getColumnByUniqueName("DischargeInfo").get_element().cellIndex);
                    table.hideColumn(table.getColumnByUniqueName("LoadInfo").get_element().cellIndex);
                }
                else {
                    table.showColumn(0);
                    table.showColumn(table.getColumnByUniqueName("ContainerInfo").get_element().cellIndex);
                    table.showColumn(table.getColumnByUniqueName("DischargeInfo").get_element().cellIndex);
                    table.showColumn(table.getColumnByUniqueName("LoadInfo").get_element().cellIndex);
                }
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
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
                </td>
                <td>
                    <br />
                    <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    <asp:Panel ID="NewTripPanel" runat="server">
                        <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                        <asp:Label ID="WorkShiftlbl" runat="server">WorkShift</asp:Label><br />
                        <telerik:RadDropDownList ID="WorkShiftDDL" runat="server" Skin="Sunset" Enabled="True"
                            DataValueField="item" DataTextField="Descr">
                        </telerik:RadDropDownList>
                        &nbsp;
                        <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;    
                        <asp:Button ID="NowBtn" class="white" runat="server" OnClick="NowBtn_Click"
                            Text="Today" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="AutoBtn" class="LongLabelWhite" runat="server" OnClick="AutoBtn_Click"
                            Text="Auto &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assign&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />   
                         &nbsp;
                        <asp:Button ID="AssignBtn" class="white" runat="server" OnClick="AssignBtn_Click"
                            Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="CompleteBtn" class="white" runat="server" OnClick="CompleteBtn_Click"
                            Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="Cancel_Click"
                            Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="TrackContainerBtn" class="LongLabelWhite" runat="server" OnClick="TrackBoxBtn_Click"
                            Text="Track &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Box&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="DischargeBtn" class="LongLabelBlue" runat="server" OnClick="Discharge_Click"
                            Text="Discharge Form" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="LoadBtn" class="LongLabelBlue" runat="server" OnClick="LoadBtn_Click"
                            Text="Load &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Form&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="UnassignBtn" class="white" runat="server" OnClick="UnassignBtn_Click"
                            Text="Unassign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <label style="font-weight:bold; font-size:12px;">Hide<input type="checkbox" id="HideChk" value="Hide" style="width:30px; height:20px; vertical-align:middle" onclick="HideContainerInfo(this)" /></label>
                        &nbsp;
                        <asp:CheckBox ID="LesserInfoChk" runat="server" CssClass="BigCheckBox" Style="vertical-align: middle" OnCheckedChanged="LesserInfoChk_CheckedChanged" AutoPostBack="true" />
                        <asp:Label ID="LesserInfoChkLbl" runat="server" Font-Bold="true" Text="LessInfo" ForeColor="Black"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
                    EnableLinqExpressions="False" AllowPaging="false" OnColumnCreated="ResultDG_ColumnCreated" EnableViewState="false"
                    Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
                    ExportSettings-UseItemStyles="true" Height="90%" AllowFilteringByColumn="true">

                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <SortingSettings EnableSkinSortStyles="false" />

                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>

                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="QueueGrid">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" CssClass="BigCheckBox" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" CssClass="BigCheckBox" />
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
