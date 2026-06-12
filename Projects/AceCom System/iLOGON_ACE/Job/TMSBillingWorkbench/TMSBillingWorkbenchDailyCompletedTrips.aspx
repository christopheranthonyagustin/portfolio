<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBillingWorkbenchDailyCompletedTrips.aspx.cs" Inherits="iWMS.Web.Job.TMSBillingWorkbench.TMSBillingWorkbenchDailyCompletedTrips" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyCompletedTrips @ TMS Billing Workbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                MasterTable.rebind();
            }

            function SelectAll(invoker) {
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

            function RowSelected(sender, eventArgs) {
                // uncheck all other checkbox first
                var inputElements = document.getElementsByTagName('input');
                for (var i = 0; i < inputElements.length; i++) {
                    var myElement = inputElements[i];
                    if (myElement.type === "checkbox") {
                        myElement.checked = false;
                    }
                }

                // checked the checkbox
                var checkbox = eventArgs.get_item().findElement('chkObjective');
                checkbox.checked = true;
            }
        </script>
    </telerik:RadCodeBlock>
    <style type="text/css">
        .PrevNext {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .PrevNext:hover {
                background: #6885ca;
            }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td colspan="5">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="FromDate" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Button ID="FromDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="FromDatePrevBtn_Click" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Label ID="FromDateLbl" runat="server" Text="FromDate"></asp:Label>
                                    <br />
                                    <telerik:RadDatePicker ID="FromDatePicker" runat="server" Width="155" Height="25"
                                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                        OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </td>
                                <td valign="top">
                                    <asp:RequiredFieldValidator ID="FromDateTxtReqVal" runat="server" ControlToValidate="FromDatePicker" ErrorMessage="*" ForeColor="Red" />
                                </td>
                                <td>
                                    <br />
                                    <asp:Button ID="FromDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="FromDateNextBtn_Click" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="ToDate" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Button ID="ToDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="ToDatePrevBtn_Click" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Label ID="ToDateLbl" runat="server" Text="ToDate"> 
                                    </asp:Label>
                                    <br />
                                    <telerik:RadDatePicker ID="ToDatePicker" runat="server" Width="155" Height="25"
                                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                        OnSelectedDateChanged="ToDatePicker_SelectedDateChanged" AutoPostBack="true">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </td>
                                <td valign="top">
                                    <asp:RequiredFieldValidator ID="ToDateTxtReqVal" runat="server" ControlToValidate="ToDatePicker" ErrorMessage="*" ForeColor="Red" />
                                </td>
                                <td>
                                    <br />
                                    <asp:Button ID="ToDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="ToDateNextBtn_Click" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="ButtonPanel" runat="server">
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                        Text="Refresh" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="ExcelBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click"
                                        CssClass="green" />
                                    &nbsp;
                                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="false"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" AllowSorting="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="580px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <ClientEvents OnRowSelected="RowSelected" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="Icon" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="SelectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="AttcImgBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="AttcImgBtn_Click"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="BookImgBtn" ImageUrl="../../image/pickdetail.gif" BorderWidth="0" CausesValidation="false"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Book" OnClick="BookImgBtn_Click"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="S/N" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                AutoPostBackOnFilter="true" AllowFiltering="false">
                                <HeaderTemplate>
                                    S/N 
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="TripDateTime" HeaderText="TripDateTime" DataField="TripDateTime" AllowFiltering="false" SortExpression="TripDateTime" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="JobNo" DataField="JobNo" HeaderText="JobNo" SortExpression="JobNo" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="AcBookingNo" DataField="AcBookingNo" HeaderText="Account <br/> BookingNo <br/> EndCustomer"
                                SortExpression="AcCode" AutoPostBackOnFilter="true" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> TripOption" SortExpression="BillSizeType" AllowFiltering="false" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "BillSizeType")%>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "Sector")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="TripTypeDoubleStatus" DataField="TripTypeDoubleStatus" HeaderText="TripType <br/> Double <br/> Status" AutoPostBackOnFilter="true" SortExpression="TripTypeDoubleStatus" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PickUp" DataField="FrAddr" HeaderText="FrAddr" AllowFiltering="false" SortExpression="FrAddr" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="DropOff" DataField="ToAddr" HeaderText="DropOff" AllowFiltering="false" SortExpression="ToAddr" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle" DataField="VehNoDriverTrailer" HeaderText="Vehicle <br/> Driver<br/> Trailer <br/> TrailerPark"
                                SortExpression="VehNoDriverTrailer" AllowFiltering="true" AutoPostBackOnFilter="true" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "VehNoDriverTrailer")%>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "VehParkCode")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ContainerNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo <br/> SealNo" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                SortExpression="ContainerNo" DataField="ContainerNoSealNo" AllowFiltering="true" ItemStyle-Wrap="false" AutoPostBackOnFilter="true">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="ContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>' Style="text-transform: uppercase"></asp:Label>
                                    </br>
                                    <asp:Label runat="server" ID="SealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>' Style="text-transform: uppercase"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="ETAVesselVoyage" HeaderText="ETA <br/> Vessel <br/> Voyage" DataField="ETAVesselVoyage"
                                SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="TripSpecialInstruction" HeaderText="TripSpecialInstruction" SortExpression="TripSpecialInstruction" AllowFiltering="false" DataField="TripSpecialInstruction" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="DocNo" HeaderText="InternalDocNo <br/> OutsourceDocNo" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                SortExpression="InternalDocNo" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="Exref1" HeaderText="OrderNo/ <br/> CustomerReference" SortExpression="Exref1" AllowFiltering="false" DataField="Exref1" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1250px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close" CenterIfModal="true">
        </telerik:RadWindow>
    </form>
</body>
</html>
