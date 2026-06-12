<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderMobileCrane.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderMobileCrane" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MobileCrane @ TMS Booking Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>&nbsp;<asp:Button ID="AddBtn" runat="server" Text="Add" class="white" OnClick="AddBtn_Click"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="False" RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007"
            AutoPostBack="True">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl_JBHead" runat="server" />
                        <iWMS:iForm ID="formCtl_JBCtnr" runat="server" />
                        <iWMS:iForm ID="formCtl_JBCtnrTrip" runat="server" />
                        <br />
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="CtnrGridUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <telerik:RadGrid ID="ResultDG_Ctnr" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_Ctnr_NeedDataSource" Width="50%">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true" CssClass="DGAlternateItem"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true" CssClass="DGItem"></ItemStyle>
                                                <HeaderStyle Wrap="false"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="CtnrNoGrid">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                            <HeaderTemplate>
                                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                            <HeaderTemplate>
                                                                S/N
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%#Container.ItemIndex+1%>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="ShipmentType <br/> JobType" HeaderStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <telerik:RadDropDownList ID="ShipmentTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" Enabled="false"
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# ShipmentTypeDS%>' Width="100px" DropDownWidth="100px"
                                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ShipmentTypeDS,DataBinder.Eval(Container.DataItem, "ShipmentType").ToString())%>'>
                                                                </telerik:RadDropDownList>
                                                                <br />
                                                                <telerik:RadDropDownList ID="JobTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# JobTypeDS%>' Width="100px" DropDownWidth="100px"
                                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(JobTypeDS,DataBinder.Eval(Container.DataItem, "JobType").ToString())%>'>
                                                                </telerik:RadDropDownList>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="TransportType <br/> BillSizeType" HeaderStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <telerik:RadDropDownList ID="TransportTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# TransportTypeDS%>' Width="100px" DropDownWidth="100px"
                                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TransportTypeDS,DataBinder.Eval(Container.DataItem, "TransportType").ToString())%>'>
                                                                </telerik:RadDropDownList>
                                                                <br />
                                                                <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# BillSizeTypeDS%>' Width="100px" DropDownWidth="100px"
                                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "BillSizeType").ToString())%>'>
                                                                </telerik:RadDropDownList>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="StartDate <br/> EndDate" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <telerik:RadDateTimePicker ID="StartDateDP" runat="server" Width="170px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "StartDate") %>'
                                                                    DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                                </telerik:RadDateTimePicker>
                                                                <br />
                                                                <telerik:RadDateTimePicker ID="EndDateDP" runat="server" Width="170px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "EndDate") %>'
                                                                    DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                                </telerik:RadDateTimePicker>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Pick-Up" HeaderStyle-HorizontalAlign="Center" UniqueName="PickUp"
                                                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                            <HeaderTemplate>
                                                                Pick-Up
                                                                <br />
                                                                Pick-Up Address
                                                                <br />
                                                                <asp:LinkButton ID="SamePickUpLnkBtn" OnClick="Control_Fill" runat="server" Text="SamePick-Up" ForeColor="Blue" CausesValidation="false"></asp:LinkButton>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <telerik:RadComboBox ID="PickUpCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="170px" DropDownAutoWidth="Enabled"
                                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "PickUp").ToString())%>'
                                                                    OnClientSelectedIndexChanged="PickUpCombo_SelectedIndexChanged">
                                                                </telerik:RadComboBox>
                                                                <br />
                                                                <telerik:RadTextBox ID="PickUpAddrTxt" runat="server" Width="170px" Skin="WebBlue" TextMode="MultiLine"
                                                                    Text='<%# DataBinder.Eval(Container.DataItem, "PickUpAddr") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Drop-Off" HeaderStyle-HorizontalAlign="Center" UniqueName="DropOff"
                                                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                            <HeaderTemplate>
                                                                Drop-Off
                                                                <br />
                                                                Drop-Off Address
                                                                <br />
                                                                <asp:LinkButton ID="SameDropOffLnkBtn" OnClick="Control_Fill" runat="server" Text="SameDrop-Off" ForeColor="Blue" CausesValidation="false">
                                                                </asp:LinkButton>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <telerik:RadComboBox ID="DropOffCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="170px" DropDownAutoWidth="Enabled"
                                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "DropOff").ToString())%>'
                                                                    OnClientSelectedIndexChanged="DropOffCombo_SelectedIndexChanged">
                                                                </telerik:RadComboBox>
                                                                <br />
                                                                <telerik:RadTextBox ID="DropOffAddrTxt" runat="server" Width="170px" Skin="WebBlue" TextMode="MultiLine"
                                                                    Text='<%# DataBinder.Eval(Container.DataItem, "DropOffAddr") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddCtnr" ValidationGroup="NA"
                                                                    ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                                    OnClick="AddCtnr_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="10px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" Visible="True" ID="Delete" ImageUrl="../../image/deleted.png" ValidationGroup="NA"
                                                                    Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteCtnr_Click"
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
                            <tr>
                                <td>
                                    <br />
                                    &nbsp;
                                    <asp:Button ID="AddBtn2" runat="server" Text="Add" class="white" OnClick="AddBtn_Click" ClientIDMode="Static"
                                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="AddBtn2" />
                    </Triggers>
                </asp:UpdatePanel>
                
                <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                    <script type="text/javascript">
                        function PickUpCombo_SelectedIndexChanged(sender, eventArgs) {
                            var PickUpCombo = eventArgs.get_item();
                            var PickUpAddrTxt = $get(sender.get_id().replace("PickUpCombo", "PickUpAddrTxt"));
                            PickUpAddrTxt.value = PickUpCombo.get_value().split("|")[1];
                        }

                        function DropOffCombo_SelectedIndexChanged(sender, eventArgs) {
                            var DropOffCombo = eventArgs.get_item();
                            var DropOffAddrTxt = $get(sender.get_id().replace("DropOffCombo", "DropOffAddrTxt"));
                            DropOffAddrTxt.value = DropOffCombo.get_value().split("|")[1];
                        }
                    </script>
                </telerik:RadCodeBlock>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
