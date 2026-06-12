<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7Queue.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7Queue" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningV6Queue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="JavaScript" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
            masterTable.rebind();
        }
        </script>
    </telerik:RadCodeBlock>
     
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

        .column {
            float: left;
            width: 63.33%;
        }

        .columns {
            float: left;
            width: 85%;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            float: right;
        }

        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <div class="row">
            <div class="column">
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
                            <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="120"
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
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LicenseNameLbl" runat="server" Visible="false"></asp:Label>
                        </td>
                        <td>
                            <asp:Panel runat="server" ID="PersistingComboPanel">
                                <%--We need RadPersistenceManager for Controlling the Persisting Combobox--%>
                                <telerik:RadPersistenceManager runat="server" ID="PersistenceManager">
                                    <PersistenceSettings>
                                        <telerik:PersistenceSetting ControlID="VehicleCombobox" />
                                    </PersistenceSettings>
                                </telerik:RadPersistenceManager>
                                <%--Persisting Combobox--%>
                                <telerik:RadComboBox ID="VehicleCombobox" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Width="160px" Skin="WebBlue" DataValueField="VehNo" DataTextField="Descr"
                                    OnLoad="VehicleCombobox_Load" DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Filter="Contains" AllowCustomText="false">
                                </telerik:RadComboBox>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Button ID="RefereshBtn" CssClass="white" runat="server" OnClick="RefereshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="excelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                                UseSubmitBehavior="false" />
                        </td>
                         <td>
                              <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click"
                        Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                         <td>
                              <asp:Button ID="DriverSummaryBtn" CssClass="longlabelwhite" runat="server" OnClick="DriverSummaryBtn_Click"
                        Text="DriverSummary" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="columns">
                <asp:UpdatePanel ID="GridUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                            ItemStyle-Wrap="true" OnGridExporting="ResultDG_GridExporting" GridLines="Both" Width="200%" Height="100%">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="true"></HeaderStyle>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                <Selecting AllowRowSelect="true" />
                                <Scrolling AllowScroll="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="100%" TableLayout="Fixed">
                                <Columns>
                                    <telerik:GridBoundColumn UniqueName="Hidden" Display="false" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
