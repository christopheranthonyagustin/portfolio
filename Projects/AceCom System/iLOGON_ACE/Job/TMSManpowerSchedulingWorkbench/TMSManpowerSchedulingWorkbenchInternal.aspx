<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSManpowerSchedulingWorkbenchInternal.aspx.cs" Inherits="iWMS.Web.Job.TMSManpowerSchedulingWorkbench.TMSManpowerSchedulingWorkbenchInternal" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Internal @TMS Manpower Scheduling Workbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <style type="text/css">
        html, body, form {
            height: 100%;
        }

        .AdditionalDG .rgDataDiv {
            height: auto !important;
        }
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
                                                        <telerik:RadDatePicker runat="server" ID="DateDP" Width="150px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy">
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque"></telerik:RadCalendarDay>
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </div>
                                                    &nbsp;&nbsp;
                                            <div style="display: inline-block; text-align: left">
                                                <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
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
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True" Height="100%" CssClass="ResultDG"
                    Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="Both" OnColumnCreated="ResultDG_ColumnCreated"
                    AllowSorting="false" OnItemDataBound="ResultDG_ItemDataBound" AllowFilteringByColumn="true" Width="110%">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="700px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" AutoGenerateColumns="true" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="55px" ItemStyle-Width="55px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Edit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1300px" Height="700px" Top="0"
                    Modal="true" VisibleStatusbar="false" OnClientClose="RadWindowOnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>