<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningSpilt.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningSpilt" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>Split Booking @ Daily Transport Planning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="40%">
            <tr>
                <td>
                    <asp:Button ID="SplitBtn" CssClass="white" runat="server" OnClick="SplitBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Text="Split" />
                    <asp:Button ID="CloseWindowBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseWindowBtn_Click" Text="Close Window" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                                AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                                ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <HeaderStyle Wrap="false" />
                                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" PageSize="50" HeaderStyle-HorizontalAlign="Center"
                                    EditMode="InPlace" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
                                    <Columns>
                                        <telerik:GridTemplateColumn UniqueName="VehNo" HeaderText="VehNo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <telerik:RadComboBox ID="VehnoCombo" runat="server" DataTextField="descr" DataValueField="item"
                                                    DataSource='<%# VehnoDS%>' Skin="WebBlue" Width="140px"
                                                    DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VehnoDS,DataBinder.Eval(Container.DataItem, "vehno").ToString())%>' OnSelectedIndexChanged="VehnoCombo_SelectedIndexChanged">
                                                </telerik:RadComboBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Driver" HeaderText="Driver" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <telerik:RadComboBox ID="DriverCombo" runat="server" DataTextField="descr" DataValueField="item"
                                                    DataSource='<%# DriverDS%>' Skin="WebBlue" Width="140px"
                                                    DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(DriverDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'>
                                                </telerik:RadComboBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="BookingDate" UniqueName="BookingDate" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                            <ItemTemplate>
                                                <telerik:RadDatePicker ID="BookingDate" Width="140px" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "FrExpDate")  %>'
                                                    DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                                <asp:RequiredFieldValidator ID="BookingDateReqVal" runat="server" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                    ControlToValidate="BookingDate" ErrorMessage="*" ForeColor="Red" Font-Size="Larger" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Pallet" HeaderText="Pallet">
                                            <ItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="PalletTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ActPLT") %>'
                                                    Enabled="true" Width="100px">
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Volume" HeaderText="Volume">
                                            <ItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="VolumeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ActVol") %>'
                                                    Enabled="true" Width="100px">
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight">
                                            <ItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="WeightTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ActWT") %>'
                                                    Enabled="true" Width="100px">
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Package" HeaderText="Package">
                                            <ItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="PackageTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ActPKG") %>'
                                                    Enabled="true" Width="100px">
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                            ItemStyle-Width="10px">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ID="Add" ImageUrl="../../image/add.png" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                    Width="15" Height="15" AlternateText="Add" BackColor="Transparent" OnClick="AddIcon_Click"
                                                    BorderWidth="0"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                            ItemStyle-Width="10px">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ID="Delete" ImageUrl="../../image/deleted.png"
                                                    Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteIcon_Click"
                                                    BorderWidth="0"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
