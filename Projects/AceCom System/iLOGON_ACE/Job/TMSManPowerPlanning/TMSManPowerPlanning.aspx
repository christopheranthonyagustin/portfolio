<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSManPowerPlanning.aspx.cs" Inherits="iWMS.Web.Job.TMSManPowerPlanning.TMSManPowerPlanning" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMSManpower Planning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        html, body, form {
            height: 100%;
        }

        .AdditionalDG .rgDataDiv {
            height: auto !important;
        }
        /*.ResultDG .rgDataDiv {
            height: 100% !important;
        }*/
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap {
            white-space: normal;
            width: 100px;
            height: auto;
            text-align: center;
        }

        .RadPanelBar div.rpSlide,
        .RadPanelBar ul.rpGroup,
        .RadPanelBar li.rpItem {
            overflow: visible;
        }

        html .RadMenu {
            text-decoration: none;
            text-align: left;
            line-height: 16px;
        }

        html .rmGroup .rmItem a.rmLink {
            background-color: #99c2ff !important;
            text-decoration: none;
            line-height: 20px;
        }

        html .RadMenu .rmGroup .rmItem a.rmLink:hover {
            background-color: #ebebe0 !important;
            font-weight: bold;
        }

        .rmItem:hover {
            background-color: white !important;
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

        function RadWindowOnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Schedule" Value="1" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <br />
                <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="110%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0 12px;">
                                            <tr>
                                                <td>
                                                    <div style="display: inline-block">
                                                        <asp:Label ID="DateLbl" runat="server" Text="Date" /><br />
                                                        <telerik:RadDatePicker ID="FromDateDP" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="FRO'M' dd/MMM/yyyy 00:00:00" Skin="Office2007" OnSelectedDateChanged="FromDateDP_SelectedDateChanged">
                                                            <DateInput ID="DateInput1" EmptyMessage="  From" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                        <br />
                                                        <telerik:RadDatePicker ID="ToDateDP" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="TO dd/MMM/yyyy 23:59:59" Skin="Office2007" OnSelectedDateChanged="ToDateDP_SelectedDateChanged">
                                                            <DateInput ID="DateInput2" EmptyMessage="  To" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </div>
                                                    &nbsp;&nbsp;
                                            <div style="display: inline-block; text-align: left">
                                                <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="RunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="OpenBtn" runat="server" Text="Open" CausesValidation="false" ToolTip="Open" CssClass="white" OnClick="OpenBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="AssignBtn" runat="server" Text="Assign" CausesValidation="false" ToolTip="Assign" CssClass="blue" OnClick="AssignBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="CompleteBtn" runat="server" Text="Complete" CausesValidation="false" ToolTip="Complete" CssClass="green" OnClick="CompleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CausesValidation="false" ToolTip="Delete" CssClass="white" OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CausesValidation="false" ToolTip="Cancel" CssClass="white" OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="ExcelBtn" runat="server" Text="Excel" CausesValidation="false" ToolTip="Excel" CssClass="green" OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowFilteringByColumn="false"
                    AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" Visible="True" ID="EditButton" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="EditButton_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Category" SortExpression="Category" HeaderText="Category"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="peratvtcode" SortExpression="Code" HeaderText="Code"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn> 

                            <telerik:GridBoundColumn DataField="peratvtcodedescr" SortExpression="Description" HeaderText="Description"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Quantity"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="frexpdate" SortExpression="frexpdate" HeaderText="Start Date"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="toexpdate" SortExpression="toexpdate" HeaderText="End Date"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="Location"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="atvtremarks" SortExpression="remarks" HeaderText="Remarks"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ContactPerson" SortExpression="PIC" HeaderText="PIC"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="TMS Status"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jbid" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1300px" Height="700px" Top="30px" Left="30px"
                    Modal="true" VisibleStatusbar="false" OnClientClose="RadWindowOnClientClose" CenterIfModal="false" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="680px" ID="ScheduleRadPageView" />
        </telerik:RadMultiPage>
       <%-- <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }
            </script>
        </telerik:RadCodeBlock>--%>
    </form>
</body>
</html>
