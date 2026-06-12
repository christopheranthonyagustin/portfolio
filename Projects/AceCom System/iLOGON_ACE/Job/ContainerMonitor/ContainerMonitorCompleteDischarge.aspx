<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerMonitorCompleteDischarge.aspx.cs" Inherits="iWMS.Web.Job.ContainerMonitor.ContainerMonitorCompleteDischarge" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Container Monitor Complete Discharge</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }
        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }
        function close() {
            GetRadWindow().close();
        }
    </script>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
        <script type="text/javascript">
            function CheckCtnrNoDigit(sender, eventArgs, index) {
                var grid = $find("<%=ResultDG1.ClientID %>");
                var MasterTable = grid.get_masterTableView();
                var dataItems = MasterTable.get_dataItems();
                var ctnrno = dataItems[index].findControl("ContainerNoTxt").get_textBoxValue();

                if (ctnrno != "") {
                    var returnstr = ContainerNoCheckDigit(ctnrno);
                    if (returnstr != "Valid") {
                        alert(returnstr + " - [ " + ctnrno + " ]");
                        dataItems[index].findControl("ContainerNoTxt").focus();
                    }
                }
            }

            function selectAll(invoker, checkboxId) {
                var grid = $find("<%=ResultDG1.ClientID %>");
                var masterTable = grid.get_masterTableView();
                var dataItems = masterTable.get_dataItems();

                for (var i = 0; i < dataItems.length; i++) {
                    $telerik.findElement(dataItems[i].get_element(), checkboxId).checked = invoker.checked;
                }
            }
        </script>
    </telerik:RadScriptBlock>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel runat="server" ID="UpdatePanel">
            <ContentTemplate>
                <table cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Container Monitor Import Summary</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True"
                                Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click"
                                Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                <asp:Button ID="CloseBtn" CssClass="white" runat="server" OnClick="CloseBtn_Click" Text="Close"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                            <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                    AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG1_NeedDataSource"
                    OnItemDataBound="ResultDG1_ItemDataBound" Width="80%">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <%--<Selecting AllowRowSelect="true" />--%>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="Released" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <div>Released</div>
                                    <input id="cbSelectAllReleased" name="cbSelectAllReleased" type="checkbox" onclick="selectAll(this, 'chkReleased')">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="JBCtnrIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "JBCtnrId") %>' Visible="false"></asp:Label>
                                    <asp:CheckBox ID="chkReleased" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Discharge" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <div>Discharge</div>
                                    <input id="cbSelectAllDischarge" name="cbSelectAllDischarge" type="checkbox" onclick="selectAll(this, 'chkDischarge')">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkDischarge" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Ready For Return" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <div>Ready For Return</div>
                                    <input id="cbSelectAllReady" name="cbSelectAllReady" type="checkbox" onclick="selectAll(this, 'chkReady')">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkReady" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="VGM" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="VGMTxt" runat="server" Width="150px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "VGM") %>'>
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="VGMTxtCompVal" runat="server" ControlToValidate="VGMTxt"
                                        EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ContainerNo" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="ContainerNoTxt" runat="server" Width="150px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo") %>'
                                        ClientEvents-OnValueChanged='<%# "function (s,a){CheckCtnrNoDigit(s,a," + Container.ItemIndex + ");}" %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="SealNo" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="SealNoTxt" runat="server" Width="150px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="expdate" HeaderText="RequiredDate" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadDatePicker ID="RequiredDate" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "expdate") %>'
                                        DateInput-DateFormat="dd/MMM/yyyy" Skin="WebBlue" ValidateRequestMode="Enabled" Width="150px">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DetentionExpiryDate" HeaderText="DetentionExpiryDate" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadDatePicker ID="DetentionExpiryDate" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "DetentionExpiryDate") %>'
                                        DateInput-DateFormat="dd/MMM/yyyy" Skin="WebBlue" ValidateRequestMode="Enabled" Width="150px">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Size" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadDropDownList ID="SizeDDL" runat="server" Skin="Office2007" DataSource='<%# BillSizeTypeDS %>' DataTextField="descr" DataValueField="item"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "sizetype").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Released" Display="false" />
                            <telerik:GridBoundColumn DataField="Discharge" Display="false" />
                            <telerik:GridBoundColumn DataField="Ready" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="true" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridBoundColumn HeaderText="RequiredDate" DataField="expdate" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="expdate" SortExpression="expdate" UniqueName="expdate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="RequiredTime" DataField="EqpRemarks" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="EqpRemarks" SortExpression="EqpRemarks" UniqueName="EqpRemarks" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TripType" DataField="type" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="TripType" SortExpression="TripType" UniqueName="TripType" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="containerno" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="ContainerNo" SortExpression="ContainerNo" UniqueName="ContainerNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SealNo" DataField="sealno" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="SealNo" SortExpression="SealNo" UniqueName="SealNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="From" DataField="frexpdate" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="From" SortExpression="From" UniqueName="From" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="To" DataField="toactdate" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="To" SortExpression="To" UniqueName="To" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Pick-up" DataField="fraddr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="Pick-up" SortExpression="Pick-up" UniqueName="Pick-up" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Drop-Off" DataField="toaddr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="Drop-Off" SortExpression="Drop-Off" UniqueName="Drop-Off" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="DriverName" DataField="name" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="DriverName" SortExpression="DriverName" UniqueName="DriverName" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehnodescr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="VehNo" SortExpression="VehNo" UniqueName="VehNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailernodescr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="TrailerNo" SortExpression="TrailerNo" UniqueName="TrailerNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="statuscolourcode" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="UpdateBtn" />
                <asp:PostBackTrigger ControlID="NextItemBtn" />
                <asp:PostBackTrigger ControlID="PrevItemBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
