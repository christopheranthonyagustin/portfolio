<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FSSAdd.aspx.cs" Inherits="iWMS.Web.Job.FieldServiceSupport.FSSAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add @ FSS</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="AddBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <table>
            <tr>
                <td>&nbsp;
                    <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl_JBHead" runat="server" />
                            <iWMS:iForm ID="formCtl_JBHead_JobDescr" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>

        <asp:Panel ID="TripPanel" runat="server">
            <br />
            <asp:Label runat="server" Text="Trip" Font-Bold="true" Font-Size="Large"></asp:Label>
            <br />
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <telerik:RadGrid ID="TripResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" EnableLinqExpressions="false" RenderMode="Lightweight" AllowFilteringByColumn="false"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="TripResultDG_NeedDataSource">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="FromDate" HeaderText="Date" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadDatePicker ID="FromDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "Date") %>'>
                                            <Calendar runat="server">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                </SpecialDays>
                                            </Calendar>
                                        </telerik:RadDatePicker>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="FromTime" HeaderText="FromTime" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadDropDownList ID="FromTimeDDL" runat="server" Skin="WebBlue" DataTextField="Descr" DataValueField="Item" Width="140px" DropDownWidth="140px"
                                            DataSource='<%# TimeDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TimeDS,DataBinder.Eval(Container.DataItem, "FromTime").ToString())%>'>
                                        </telerik:RadDropDownList>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="ToTime" HeaderText="ToTime" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadDropDownList ID="ToTimeDDL" runat="server" Skin="WebBlue" DataTextField="Descr" DataValueField="Item" Width="140px" DropDownWidth="140px"
                                            DataSource='<%# TimeDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TimeDS,DataBinder.Eval(Container.DataItem, "ToTime").ToString())%>'>
                                        </telerik:RadDropDownList>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="VehicleCombo" runat="server" DataTextField="Descr" DataValueField="Item" AutoPostBack="true" CausesValidation="false"
                                            RenderMode="Lightweight" Skin="WebBlue" Width="140px" DataSource='<%# VehicleDS%>' OnSelectedIndexChanged="VehicleCombo_SelectedIndexChanged"
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VehicleDS,DataBinder.Eval(Container.DataItem, "Vehicle").ToString())%>'
                                            HighlightTemplatedItems="true" Filter="Contains" DropDownAutoWidth="Enabled" EnableLoadOnDemand="true">
                                        </telerik:RadComboBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Driver" HeaderText="Driver" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="DriverCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                            RenderMode="Lightweight" Skin="WebBlue" Width="140px" DataSource='<%# DriverDS%>'
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(DriverDS,DataBinder.Eval(Container.DataItem, "Driver").ToString())%>'
                                            HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                        </telerik:RadComboBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="FromAddress" HeaderText="FromAddress" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="FrServicePtCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                            Skin="WebBlue" Width="140px" OnClientSelectedIndexChanged="FrServicePt_SelectedIndexChanged" DropDownAutoWidth="Enabled"
                                            RenderMode="Lightweight" CausesValidation="false" Filter="Contains" DataSource='<%# ServicePtDS%>'
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                            EnableLoadOnDemand="true">
                                        </telerik:RadComboBox>
                                        <br />
                                        <telerik:RadTextBox runat="server" ID="FrAddrTxt" TextMode="MultiLine" Rows="3" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "FrAddr") %>'>
                                        </telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="ToAddress" HeaderText="ToAddress" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="ToServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientSelectedIndexChanged="ToServicePt_SelectedIndexChanged"
                                            RenderMode="Lightweight" Skin="WebBlue" Width="140px" CausesValidation="false" DataSource='<%# ServicePtDS%>'
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                            HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                        </telerik:RadComboBox>
                                        <br />
                                        <telerik:RadTextBox runat="server" ID="ToAddrTxt" TextMode="MultiLine" Width="140px" Rows="3" Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr") %>'>
                                        </telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="TripNewRow" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="TripNewRowImgBtn" CausesValidation="false"
                                            ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Add"
                                            OnClick="TripNewRowImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="TripDeleteRow" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="TripDeleteRowImgBtn" ImageUrl="../../image/deleted.png" CausesValidation="false"
                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="TripDeleteRowImgBtn_Click"
                                            BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="ManpowerPanel" runat="server">
            <br />
            <asp:Label runat="server" Text="Manpower" Font-Bold="true" Font-Size="Large"></asp:Label>
            <br />
            <asp:UpdatePanel ID="ManpowerUpdatePanel" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <telerik:RadGrid ID="MPResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" EnableLinqExpressions="false" RenderMode="Lightweight" AllowFilteringByColumn="false"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="MPResultDG_NeedDataSource">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="FromDate" HeaderText="FromDate" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadDatePicker ID="FromDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "FromDate") %>'>
                                            <Calendar runat="server">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                </SpecialDays>
                                            </Calendar>
                                        </telerik:RadDatePicker>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="ToDate" HeaderText="ToDate" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadDatePicker ID="ToDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ToDate") %>'>
                                            <Calendar runat="server">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                </SpecialDays>
                                            </Calendar>
                                        </telerik:RadDatePicker>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Activity" HeaderText="Activity" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="ActivityCombo" runat="server" Width="140px" Skin="WebBlue" DataValueField="Item" DataTextField="Descr"
                                            DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Filter="Contains"
                                            DataSource='<%# ManPowerActivityDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ManPowerActivityDS,DataBinder.Eval(Container.DataItem, "Activity").ToString())%>'>
                                        </telerik:RadComboBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="ActivityDescription" HeaderText="ActivityDescription" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="ActivityDescriptionTxt" TextMode="MultiLine" Width="220px" Rows="3" Text='<%# DataBinder.Eval(Container.DataItem, "ActivityDescription") %>'>
                                        </telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="RemarksTxt" TextMode="MultiLine" Width="220px" Rows="3" Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>'>
                                        </telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="MPNewRow" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="MPNewRowImgBtn" CausesValidation="false"
                                            ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Add"
                                            OnClick="MPNewRowImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="MPDeleteRow" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="MPDeleteRowImgBtn" ImageUrl="../../image/deleted.png" CausesValidation="false"
                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="MPDeleteRowImgBtn_Click"
                                            BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                <%--Start Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
                function FrServicePt_SelectedIndexChanged(sender, args) {
                    var FrServicePtCombo = args.get_item();
                    var FrAddrTxt = $get(sender.get_id().replace("FrServicePtCombo", "FrAddrTxt"));
                    FrAddrTxt.value = FrServicePtCombo.get_value().split("|")[1];
                }

                function ToServicePt_SelectedIndexChanged(sender, args) {
                    var ToServicePtCombo = args.get_item();
                    var ToAddrTxt = $get(sender.get_id().replace("ToServicePtCombo", "ToAddrTxt"));
                    ToAddrTxt.value = ToServicePtCombo.get_value().split("|")[1];
                }
                <%--End Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
