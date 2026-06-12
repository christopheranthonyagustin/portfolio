<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV6TripQueue.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV6.TripPlanningV6TripQueue" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripQueue @ TripPlanningV6</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .RadPanelBar div.rpSlide,
        .RadPanelBar ul.rpGroup,
        .RadPanelBar li.rpItem {
            overflow: visible;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
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
                                            <div style="display: inline-block;">
                                                <asp:Label ID="VehNoLbl" runat="server" Text="Vehicle Number" /><br />
                                                <telerik:RadComboBox ID="VehicleCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue" OnItemDataBound="vehnoCB_ItemDataBound"
                                                    RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300" OnClientDropDownOpening="VehNoCombo_DropDownOpening">
                                                </telerik:RadComboBox>
                                            </div>
                                            &nbsp;&nbsp;
                                            <div style="display: inline-block; text-align: center">
                                                <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="RunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="Both"
            AllowSorting="false" OnItemDataBound="ResultDG_ItemDataBound" Visible="false">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderText="1" UniqueName="1">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="Edit1" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("1") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo1" OnClick="VehicelInfo_Click"><%# Eval("1") %></asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderText="2" UniqueName="2">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="Edit2" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("2") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo2" OnClick="VehicelInfo_Click"><%# Eval("2") %></asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderText="3" UniqueName="3">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="Edit3" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("3") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo3" OnClick="VehicelInfo_Click"><%# Eval("3") %></asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderText="4" UniqueName="4">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="Edit4" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("4") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo4" OnClick="VehicelInfo_Click"><%# Eval("4") %></asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderText="5" UniqueName="5">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="Edit5" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("5") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo5" OnClick="VehicelInfo_Click"><%# Eval("5") %></asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="1-VehNo" DataField="1-VehNo" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="2-VehNo" DataField="2-VehNo" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="3-VehNo" DataField="3-VehNo" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="4-VehNo" DataField="4-VehNo" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="5-VehNo" DataField="5-VehNo" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="1-TripId" DataField="1-TripId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="2-TripId" DataField="2-TripId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="3-TripId" DataField="3-TripId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="4-TripId" DataField="4-TripId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="5-TripId" DataField="5-TripId" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="1-StatusColor" DataField="1-StatusColor" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="2-StatusColor" DataField="2-StatusColor" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="3-StatusColor" DataField="3-StatusColor" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="4-StatusColor" DataField="4-StatusColor" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="5-StatusColor" DataField="5-StatusColor" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }

                function VehNoCombo_DropDownOpening(sender, args) {
                    var VehicleCombo = $find('<%= VehicleCombo.ClientID%>');

                    var VehnoCBItems = VehicleCombo.get_items();
                    for (var i = 0; i < VehnoCBItems.get_count() ; i++) {
                        var item = VehnoCBItems.getItem(i);
                        var vehParkCodeAttribute = item.get_attributes().getAttribute('OpsunitCode');

                        if (!vehParkCodeAttribute) {
                            item.hide()
                        }
                        else {
                            item.show();
                        }
                    }
                    VehicleCombo.commitChanges();
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
