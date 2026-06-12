<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSTripQueue.aspx.cs" Inherits="iWMS.Web.Job.TMSTripQueue.TMSTripQueue" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMS Trip Queue</title>
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
                                                <asp:Label ID="shTypeLbl" runat="server" Text="ShipmentType" /><br />
                                                <telerik:RadComboBox ID="shTypeCB" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                    RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                </telerik:RadComboBox>
                                            </div>
                                            &nbsp;&nbsp;
                                            <div style="display: inline-block;">
                                                <asp:Label ID="vehnoLbl" runat="server" Text="Vehicle Number" /><br />
                                                <telerik:RadComboBox ID="vehnoCB" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue" OnItemDataBound="vehnoCB_ItemDataBound"
                                                    RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300"  OnClientDropDownOpening="vehnoCB_DropdownOpening">
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
                                <br />
                                <telerik:RadGrid ID="AdditionalDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True" OnItemDataBound="AdditionalInfoDG_ItemDataBound"
                                    Skin="Metro" ExportSettings-UseItemStyles="true" GridLines="None" AllowSorting="false" Visible="false" CssClass="AdditionalDG">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="700px" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="NotAssigned" UniqueName="1">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="edit1" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("1") %></asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="NotAssigned" UniqueName="2">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="edit2" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("2") %></asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="NotAssigned" UniqueName="3">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="edit3" HeaderStyle-Width="100px" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("3") %></asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="NotAssigned" UniqueName="4">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="edit4" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("4") %></asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="NotAssigned" UniqueName="5">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="edit5" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("5") %></asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="1-tripid" DataField="1-tripid" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="2-tripid" DataField="2-tripid" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="3-tripid" DataField="3-tripid" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="4-tripid" DataField="4-tripid" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="5-tripid" DataField="5-tripid" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="1-statuscolor" DataField="1-statuscolor" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="2-statuscolor" DataField="2-statuscolor" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="3-statuscolor" DataField="3-statuscolor" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="4-statuscolor" DataField="4-statuscolor" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="5-statuscolor" DataField="5-statuscolor" Display="false"></telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True" Height="100%" CssClass="ResultDG"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="Both"
            AllowSorting="false" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="700px" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="1" UniqueName="1">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit1" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("1") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo1" OnClick="VehicelInfo_Click"><%# Eval("1") %></asp:LinkButton>
                            &nbsp;
                            <asp:ImageButton runat="server" Visible="False" ID="TriangleSpinIcon1" ImageUrl="../../image/triangle-spin.gif" OnClick="TriangleSpinIcon_Click"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="2" UniqueName="2">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit2" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("2") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo2" OnClick="VehicelInfo_Click"><%# Eval("2") %></asp:LinkButton>
                            &nbsp;
                            <asp:ImageButton runat="server" Visible="False" ID="TriangleSpinIcon2" ImageUrl="../../image/triangle-spin.gif" OnClick="TriangleSpinIcon_Click"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="3" UniqueName="3">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit3" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("3") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo3" OnClick="VehicelInfo_Click"><%# Eval("3") %></asp:LinkButton>
                            &nbsp;
                            <asp:ImageButton runat="server" Visible="False" ID="TriangleSpinIcon3" ImageUrl="../../image/triangle-spin.gif" OnClick="TriangleSpinIcon_Click"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="4" UniqueName="4">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit4" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("4") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo4" OnClick="VehicelInfo_Click"><%# Eval("4") %></asp:LinkButton>
                            &nbsp;
                            <asp:ImageButton runat="server" Visible="False" ID="TriangleSpinIcon4" ImageUrl="../../image/triangle-spin.gif" OnClick="TriangleSpinIcon_Click"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderText="5" UniqueName="5">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit5" ForeColor="Black" OnClick="Edit_Click" ToolTip="Click to modify this trip"><%# Eval("5") %></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="VehicelInfo5" OnClick="VehicelInfo_Click"><%# Eval("5") %></asp:LinkButton>
                            &nbsp;
                            <asp:ImageButton runat="server" Visible="False" ID="TriangleSpinIcon5" ImageUrl="../../image/triangle-spin.gif" OnClick="TriangleSpinIcon_Click"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" CausesValidation="False"></asp:ImageButton>
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
                    <telerik:GridBoundColumn UniqueName="1-VehImgCount" DataField="1-VehImgCount" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="2-VehImgCount" DataField="2-VehImgCount" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="3-VehImgCount" DataField="3-VehImgCount" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="4-VehImgCount" DataField="4-VehImgCount" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="5-VehImgCount" DataField="5-VehImgCount" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }

                function vehnoCB_DropdownOpening(sender, args) {
                    var vehnoCB = $find('<%= vehnoCB.ClientID%>');
                    var shTypeCB = $find('<%= shTypeCB.ClientID%>');
                    var selectedItems = [], selectedItemsCB = shTypeCB.get_checkedItems();
                    for (var i = 0; i < selectedItemsCB.length; i++)
                        selectedItems.push(selectedItemsCB[i].get_value().toLowerCase());

                    if (selectedItems.length > 0) { 
                        var vehnoCBItems = vehnoCB.get_items();
                        for (var i = 0; i < vehnoCBItems.get_count() ; i++) {
                            var item = vehnoCBItems.getItem(i);
                            var vehParkCodeAttribute = item.get_attributes().getAttribute('opsunitcode');

                            if (!vehParkCodeAttribute) {
                                item.hide()
                            }
                            else if (!selectedItems.includes(vehParkCodeAttribute.toLowerCase())) {
                                item.hide();
                            }
                            else {
                                item.show();
                            }
                        }
                        vehnoCB.commitChanges();
                    } else
                        vehnoCB.setAllItemsVisible(true);
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
