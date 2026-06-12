<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTranshipmentSummary.aspx.cs"
    Inherits="iWMS.Web.Job.DailyTranshipmentPlanning.DailyTranshipmentSummary" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TranshipmentSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="false" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td class="style2">
                                            <table border="0" cellpadding="1" cellspacing="0" width="100%">
                                                <tr>
                                                    <td class="style1">
                                                        &nbsp;<asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadComboBox ID="AccountCBB" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                    <td class="style1">
                                                        &nbsp;<asp:Label ID="VesselLbl" runat="server">Vessel</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="vessel" runat="server" Width="150px">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="VoyageLbl" runat="server">Voyage</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="voyage" runat="server" Enabled="True" DataTextField="Descr"
                                                            DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="FromETALbl" runat="server">FromETA</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="fromETA" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="150px">                                                        
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="ToETALbl" runat="server">ToETA</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="toETA" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="150px">
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                </tr>
                                                <tr>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ExclCompletedCB" runat="server" Checked="True" Text="ExclCompleted" />&nbsp;
                                        </td>
                                        <td>
                                            <telerik:RadButton Style="z-index: 0" ID="ExcelBtn" runat="server" Text="Excel"
                                                OnClick="RefreshBtn_Click" Skin="WebBlue" Visible="false">
                                            </telerik:RadButton>&nbsp;&nbsp;
                                            <telerik:RadButton Style="z-index: 0" ID="RefreshBtn" runat="server" Text="Refresh"
                                                OnClick="RefreshBtn_Click" Skin="WebBlue">
                                            </telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                                </td> </tr> </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
            <ExpandAnimation Type="None" />
            <CollapseAnimation Type="None" />
        </telerik:RadPanelBar>

        <telerik:RadGrid RenderMode="Lightweight" ID="ResultDG" runat="server" AutoGenerateColumns="true" OnItemCommand="ResultDG_ItemCommand" Skin="Office2007" OnPreRender="ResultDG_PreRender" Width="100%">
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <Columns>
                     <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Detail"
                                ImageUrl="../../image/snotrack.gif" Width="15" Height="15" AlternateText="Detail"
                                CommandName="Detail" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                         </telerik:GridTemplateColumn>
                </Columns>
                </MasterTableView>
            </telerik:RadGrid>

    </form>
</body>
</html>
