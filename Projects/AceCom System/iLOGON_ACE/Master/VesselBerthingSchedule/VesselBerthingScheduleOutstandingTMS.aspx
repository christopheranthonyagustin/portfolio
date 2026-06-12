<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VesselBerthingScheduleOutstandingTMS.aspx.cs" Inherits="iWMS.Web.Master.VesselBerthingSchedule.VesselBerthingScheduleOutstandingTMS" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VesselBerthingScheduleOutstandingTMS</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
                $(".show_hide_Detail").slideToggle();
            });
        });

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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <br />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <asp:Label Style="z-index: 0" ID="Label2" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
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
                                                    <td class="style1">&nbsp;<asp:Label ID="JobNoLbl" runat="server">Vessel</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="vessel" runat="server" Width="150px">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="AtvtCodeLbl" runat="server">Voyage</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="voyage" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="ManpowerTypeLbl" runat="server">ETA</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="eta" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="150px">
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="PerLbl" runat="server">ETD</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="etd" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
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
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <telerik:RadButton Style="z-index: 0" ID="refreshBtn" runat="server" Text="Refresh"
                                                OnClick="refreshBtn_Click" Skin="WebBlue">
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
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand" OnEditCommand="ResultDG_Edit"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnUpdateCommand="ResultDG_Update"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ParentGrid" EditMode="InPlace" HierarchyLoadMode="Client">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PerHeadEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="vessel" SortExpression="vessel" HeaderText="Vessel"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="vslLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vessel")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="false" runat="server" ID="vesselTxt" Text='<%# DataBinder.Eval(Container.DataItem, "vessel") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="voyage" SortExpression="voyage" HeaderText="Voyage"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="voyageLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "voyage")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="voyageTxt" Text='<%# DataBinder.Eval(Container.DataItem, "voyage") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="ineta" SortExpression="ineta" HeaderText="ETA"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="inetaLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ineta", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="InEtaTimePicker" Width="165px" runat="server"
                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                AutoPostBackControl="both">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                                <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="outetd" SortExpression="outetd" HeaderText="ETD" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="etdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "outetd", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="OutEtaTimePicker" Width="165px" runat="server"
                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                AutoPostBackControl="both">
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="noofjob" SortExpression="noofjob" HeaderText="NoOfJobs"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "noofjob")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Enabled="false" Width="110px" runat="server" ID="noofjobTxt" Text='<%# DataBinder.Eval(Container.DataItem, "noofjob") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="nooftrip" SortExpression="nooftrip" HeaderText="NoOfTrips"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "nooftrip")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Enabled="false" Width="110px" runat="server" ID="nooftripTxt" Text='<%# DataBinder.Eval(Container.DataItem, "nooftrip") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lastupdate" SortExpression="lastupdate" HeaderText="LastUpdate"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "lastupdate")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Enabled="false" Width="110px" runat="server" ID="lastupdateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "lastupdate") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="MinAddDate" SortExpression="MinAddDate" HeaderText="MinAddDate"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="minadddtLbl" runat="server" Text='<%# String.Format("{0:dd/MMM/yyyy HH:mm}", DataBinder.Eval(Container.DataItem, "MinAddDate")) %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="false" runat="server" ID="minadddateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "MinAddDate") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="MaxAddDate" SortExpression="MaxAddDate" HeaderText="MaxAddDate"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="maxadddtLbl" runat="server" Text='<%# String.Format("{0:dd/MMM/yyyy HH:mm}", DataBinder.Eval(Container.DataItem, "MaxAddDate")) %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Enabled="false" Width="110px" runat="server" ID="maxadddateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "MaxAddDate") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="vbscolourcode" UniqueName="vbscolourcode" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
