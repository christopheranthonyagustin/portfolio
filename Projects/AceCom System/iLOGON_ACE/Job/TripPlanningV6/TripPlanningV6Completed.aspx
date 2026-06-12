<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV6Completed.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV6.TripPlanningV6Completed" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Trip Planning V5 Completed</title>
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
                document.location.href = document.location.href;
            }

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

            var startingIndex = 0, gridViewID = '<%= ResultDG.MasterTableView.ClientID %>';
                function selectCheckbox(e, selectedIndex) {
                    if (e.shiftKey) {
                        if (startingIndex < selectedIndex) {
                            $(':checkbox', '#' + gridViewID).slice(startingIndex, selectedIndex).prop("checked", true);
                        }
                        else
                            $(':checkbox', '#' + gridViewID).slice(selectedIndex, startingIndex).prop("checked", true);
                    }
                    startingIndex = selectedIndex;
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

        .headerbutton {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: white;
            z-index: 100;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
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
                                    <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Label ID="frdatelbl" runat="server" Text="FromDate"> 
                                    </asp:Label>
                                    <br />
                                    <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155" Height="25"
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
                                    <asp:RequiredFieldValidator ID="FromDateTxtReqVal" runat="server" ControlToValidate="FromDateTxt" ErrorMessage="*" ForeColor="Red" />
                                </td>
                                <td>
                                    <br />
                                    <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
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
                                    <asp:Button ID="ToDatePrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="ToDatePrevBtn_Click" UseSubmitBehavior="false" />
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
                                    <asp:Button ID="ToDateNextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="ToDateNextBtn_Click" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="FormCtlPanel" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="FormCtlUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <iWMS:iForm ID="formCtl" runat="server" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Panel ID="ButtonPanel" runat="server">
                        <br />
                        <table class="headerbutton">
                            <tr>
                                <td>
                                    <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                        Text="Refresh" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Button ID="OpenBtn" runat="server" CssClass="white" Text="Open" OnClick="OpenBtn_Click"
                                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,true)" />
                                </td>
                                <td>
                                    <asp:Button ID="EditBtn" class="white" runat="server" OnClick="EditBtn_Click"
                                        Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Button ID="PaymentBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                        OnClick="PaymentBtn_Click" Text="Payment" />
                                </td>
                                <td>
                                    <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                        OnClick="IncentiveBtn_Click" Text="Incentive" />
                                </td>
                                <td>
                                    <asp:Button ID="ChargeBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                        OnClick="ChargeBtn_Click" Text="Charge" />
                                </td>
                                <td>
                                    <asp:Button ID="ExcelBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click"
                                        CssClass="green" ToolTip="Export To Excel" /><br>
                                </td>
                                <td>
                                    <asp:Button ID="CopyBtn" runat="server" Text="Copy" CausesValidation="false" CssClass="white"
                                        OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                                <td align="right">
                                    <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M"
                                        OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
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
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnPreRender="ResultDG_PreRender" MasterTableView-AllowSorting="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowFilteringByColumn="true" Height="60%">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="470px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <ClientEvents OnRowSelected="RowSelected" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true" HorizontalAlign="Center" />
                    <ItemStyle Wrap="true" HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle Wrap="true" HorizontalAlign="Center"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="2000px" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" />
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="lblEditBtn"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="AttcImg_Click"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="BookImg" ImageUrl="../../image/pickdetail.gif" BorderWidth="0" CausesValidation="false"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Book" OnClick="BookImg_Click"></asp:ImageButton>
                                    <asp:Label runat="server" ID="PIconLbl" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="S/N" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                AllowFiltering="false" HeaderText="S/N">
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripDateTime" HeaderText="TripDateTime" AllowFiltering="false"
                                SortExpression="TripDateTime" AllowSorting="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("TripDateTime")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="jbno" DataField="JobNo" HeaderText="JobNo" AutoPostBackOnFilter="true" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="AcBookingNo" DataField="AcBookingNo" ItemStyle-Width="220px" HeaderStyle-Width="220px"
                                HeaderText="Account <br/> BookingNo <br/> EndCustomer" SortExpression="AcCode" AutoPostBackOnFilter="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("AcBookingNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> TripOption"
                                SortExpression="billsizetype" AllowFiltering="false" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billsizetype")%>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "Sector")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripTypeDoubleStatus" HeaderText="TripType <br/> Double <br/> Status" ItemStyle-Width="220px" HeaderStyle-Width="220px"
                                SortExpression="TripTypeDoubleStatus" AutoPostBackOnFilter="true" DataField="TripTypeDoubleStatus" AllowSorting="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripTypeDoubleStatus")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" SortExpression="FrAddr" AllowFiltering="false" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" SortExpression="ToAddr" AllowFiltering="false" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle" DataField="VehNoDriverTrailer" HeaderText="Vehicle <br/> Driver<br/> Trailer <br/> TrailerPark" ItemStyle-HorizontalAlign="Center"
                                SortExpression="VehNoDriverTrailer" AllowFiltering="true" AllowSorting="true" AutoPostBackOnFilter="true" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "VehNoDriverTrailer")%>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "vehparkcode")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ContainerNo" HeaderText="ContainerNo <br/> SealNo" ItemStyle-Width="220px" HeaderStyle-Width="220px"
                                SortExpression="ContainerNo" DataField="ContainerNo" AllowFiltering="true" AutoPostBackOnFilter="true" AllowSorting="true">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="ContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>' Style="text-transform: uppercase"></asp:Label>
                                    </br>
                                    <asp:Label runat="server" ID="SealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>' Style="text-transform: uppercase"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vessel" HeaderText="ETA <br/> Vessel <br/> Voyage" SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" ItemStyle-Width="220px" HeaderStyle-Width="220px"
                                DataField="ETAVesselVoyage" AllowSorting="true" AllowFiltering="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("ETAVesselVoyage")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="SpecialInstruction" HeaderText="SpecialInstruction" SortExpression="TripSpecialInstruction" AllowFiltering="false" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DocNo" HeaderText="InternalDocNo <br/> OutsourceDocNo" SortExpression="InternalDocNo" AllowFiltering="false" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="OrderNo/CustomerReference" HeaderText="OrderNo/ <br/> CustomerReference"
                                SortExpression="Exref1" AutoPostBackOnFilter="true" ItemStyle-Width="180px" HeaderStyle-Width="180px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("Exref1")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Required/Date" HeaderText="Required <br/> Date" ItemStyle-Width="155px" HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center"
                                AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="ExpDateOnly" DataField="ExpDateOnly">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblRequire" Text='<%# DataBinder.Eval(Container.DataItem, "ExpDateBookingTime", "{0:dd/MMM/yyyy <br/> HH:mm}")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="lblDate" Text='<%# DataBinder.Eval(Container.DataItem, "EqpRemarks")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DetentionExpiryCountdown" HeaderText="Detention <br/> Expiry <br/> Countdown <br/> DetentionExpiryEditBy <br/> DetentionExpiryEditOn" ItemStyle-HorizontalAlign="Center"
                                SortExpression="DetentionExpiryDate" AllowFiltering="false" ItemStyle-Width="190px" HeaderStyle-Width="190px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblExpiry" Text='<%# DataBinder.Eval(Container.DataItem, "DetentionExpiryDate", "{0:dd/MMM}")%>'></asp:Label>
                                    <asp:Label runat="server" ID="lblExpiryFull" Text='<%# DataBinder.Eval(Container.DataItem, "DetentionExpiryDate", "{0:dd/MMM/yyyy}")%>' Style="display: none"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="lblCountdown" Text='<%# DataBinder.Eval(Container.DataItem, "DetentionCountdownRemark")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="LblDetentionExpiryEditBy" Text='<%# DataBinder.Eval(Container.DataItem, "DetentionExpiryEditBy")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="LblDetentionExpiryEditOn" Text='<%# DataBinder.Eval(Container.DataItem, "DetentionExpiryEditDate", "{0:dd/MMM/yyyy hh:mm}")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                            <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                            <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                            <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipmentType" Display="False"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:HiddenField ID="HiddenField" runat="server" />
        <telerik:RadWindow ID="AttcIconRadWindow" runat="server" VisibleOnPageLoad="true" Title="Attc @ TripPlanningV6" Width="800px" Height="600px"
            NavigateUrl='<%# "TripPlanningV6Attc.aspx?JBId="+ HiddenField.Value %>'
            Modal="true" Left="100px" Top="20px" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </form>
</body>
</html>
