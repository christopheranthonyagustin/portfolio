<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSOperationsSchedule.aspx.cs" Inherits="iWMS.Web.Job.TMSOperations.TMSOperationsSchedule" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSManpowerSchedulingWorkbenchSchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }

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
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="0" runat="server">
            <tr>
                <td>
                    <br /><br />
                    <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <div style="display: inline-block">
                        <asp:Label ID="DateLbl" runat="server" Text="Date" />
                        <br />
                        <telerik:RadDatePicker runat="server" ID="DateDP" Width="150px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" OnSelectedDateChanged="DateDP_SelectedDateChanged" AutoPostBack="true">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque"></telerik:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                        <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    
                    </div>
                    <div style="display: inline-block; text-align: left; ">
                        <br />
                        <asp:Label runat="server" ID="TeamLbl" Text="Team"></asp:Label> <br />
                        <telerik:RadDropDownList ID="TeamDDL" runat="server" Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="TeamDDL_Load"></telerik:RadDropDownList>
                        

                        &nbsp;
                        <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CausesValidation="false" ToolTip="Refresh" CssClass="white" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </div>
                    <div>
                        
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro"
                    OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                    AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                    ItemStyle-Wrap="true" Width="100%" Height="90%">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                    </ClientSettings>
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                     <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <Columns>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
