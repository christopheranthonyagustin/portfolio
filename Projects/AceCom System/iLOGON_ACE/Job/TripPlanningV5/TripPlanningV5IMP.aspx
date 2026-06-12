<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5IMP.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5IMP" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningV5IMP</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
        <script type="text/javascript">
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

            function CheckCtnrNoDigit(sender, eventArgs) {
                var grid = $find("<%=ResultDG.ClientID %>");
                var MasterTable = grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length ; i++) {
                    var dataItems = MasterTable.get_dataItems()[i];
                    var ctnrno = dataItems.findControl("ContainerNoTxt").get_textBoxValue();

                    if (ctnrno != "") {
                        var returnstr = ContainerNoCheckDigit(ctnrno);
                        if (returnstr != "Valid") {
                            alert(returnstr + " - [ " + ctnrno + " ]");
                            dataItems.findControl("ContainerNoTxt").focus();
                        }
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="defaultbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td align="left" valign="middle">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td align="left" valign="top">
                    <asp:Button runat="server" ID="defaultBtn" Style="display: none;" />
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                        Text="Refresh" OnClick="RefreshBtn_Click" UseSubmitBehavior="false" />
                    <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="ReleaseBtn" runat="server" CssClass="white" OnClick="ReleaseBtn_Click"
                        Text="Release" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="DischargeBtn" runat="server" CssClass="white" OnClick="DischargeBtn_Click"
                        Text="Discharge" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="ReadyBtn" runat="server" CssClass="white" OnClick="ReadyBtn_Click"
                        Text="Ready" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                        Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                        Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                        Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="EditBtn" class="white" runat="server" OnClick="EditBtn_Click"
                        Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                    <asp:Button ID="DetourBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="DetourBtn_Click" Text="Detour" />
                    <asp:Button ID="PaymentBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="PaymentBtn_Click" Text="Payment" />
                    <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="IncentiveBtn_Click" Text="Incentive" />
                     <asp:Button ID="ChargeBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="ChargeBtn_Click" Text="Charge" />
                    <asp:Button ID="ImportantBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="ImportantBtn_Click" Text="Important" />
                </td>
                <td align="right">
                    <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M" 
                        OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate><br />
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" Height="95%"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" MasterTableView-AllowSorting="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true" OnPreRender="ResultDG_PreRender">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false"/>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="150%" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" TableLayout="Auto">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="80px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="80px"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    &nbsp;
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Release" ItemStyle-HorizontalAlign="Center" DataField="ReleaseDone" HeaderText="Release" SortExpression="Release" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="75px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="75px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="ReleaseDoneLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Discharge" ItemStyle-HorizontalAlign="Center" DataField="DischargeDone" HeaderText="Discharge" SortExpression="Dischrage" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="75px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="75px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="DischargeDoneLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="RequiredDate" HeaderText="Required <br/> Date" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width="60px" HeaderStyle-Width="60px"
                                        SortExpression="ExpDate" AllowSorting="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="false" DataField="ExpEqpspecialinstruction" >
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ExpEqpspecialinstruction", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ETA/Vessel/Voyage" HeaderText="ETA <br/> Vessel <br/> Voyage" DataField="ETAVesselVoyage" ItemStyle-Width="150px"
                                ItemStyle-HorizontalAlign="Center" SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" ItemStyle-Wrap="false" HeaderStyle-Width="160px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("ETAVesselVoyage")) %>
                                    <br />
                                    </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="JobNo/Account/BookingNo" ItemStyle-HorizontalAlign="Center" DataField="JobAcBookingNo" ItemStyle-Width="150px" HeaderStyle-Width="160px"
                                HeaderText="JobNo <br/> Account <br/> BookingNo" SortExpression="JobAcBookingNo" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("JobAcBookingNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>                            
                            <telerik:GridTemplateColumn UniqueName="StoreRent/Expiry/Countdown" ItemStyle-HorizontalAlign="Center" HeaderText="StoreRent <br/> Expiry <br/> Countdown"
                                SortExpression="DischargeStoreRentCountdown" AllowFiltering="false" ItemStyle-Wrap="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="5px"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "DischargeStoreRentCountdown")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                              <telerik:GridTemplateColumn UniqueName="BillSizeType/TripOption" HeaderText="BillSizeType <br/> TripOption" ItemStyle-HorizontalAlign="Center"
                                SortExpression="billsizetype" AllowFiltering="false" ItemStyle-Width="150px" HeaderStyle-Width="140px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "BillSizeType")%>
                                    </br>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "TripOption")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ContainerNo/SealNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo <br/> SealNo"
                                SortExpression="ContainerNo"  ItemStyle-Wrap="false" ItemStyle-Width="150px" HeaderStyle-Width="140px" AutoPostBackOnFilter="true" DataField="ContainerNo">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>
                                    </br>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "SealNo")%>
                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" Width="120px" Display="false"></telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn> 
                             <telerik:GridTemplateColumn UniqueName="VGM" HeaderText="VGM" ItemStyle-HorizontalAlign="Center"
                                SortExpression="VerifiedGrossMass" AllowFiltering="false" ItemStyle-Width="100px" HeaderStyle-Width="100px" DataType="System.Int32">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "VerifiedGrossMass")%>
                                    </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>                          
                            <telerik:GridTemplateColumn UniqueName="Carrier" ItemStyle-HorizontalAlign="Center" HeaderText="Carrier"
                                SortExpression="Carrier" AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="90px" HeaderStyle-Width="90px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CarrierName")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" SortExpression="FrServicePt" AllowFiltering="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="90px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="90px"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" SortExpression="ToServicePt" AllowFiltering="false" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                               <%-- <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="180px"></ItemStyle>--%>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/Trailer" HeaderText="Vehicle <br/> Driver<br/> Trailer" SortExpression="VehNoDriverTrailer" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="160px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="160px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "VehNoDriverTrailer")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="JobSpecialInstruction" HeaderText="JobSpecialInstruction" SortExpression="JobSpecialInstruction" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="160px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="160px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "JobSpecialInstruction")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="TripSpecialInstruction" ItemStyle-Width="145px" HeaderStyle-Width="145px"
                                SortExpression="TripSpecialInstruction" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripTypeDoubleStatus" ItemStyle-HorizontalAlign="Center" HeaderText="TripType <br/> Double <br/> Status" SortExpression="TripTypeDoubleStatus"
                                AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="145px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripTypeDoubleStatus")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PermitNo" ItemStyle-HorizontalAlign="Center" HeaderText="PermitNo" HeaderStyle-Width="140px"
                                SortExpression="PermitNo" AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="100px" >
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PermitNo")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="InternalDocNo/OutsourceDocNo" ItemStyle-HorizontalAlign="Center" HeaderText="InternalDocNo <br/> OutsourceDocNo"
                                SortExpression="InternalDocNo" AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="150px" HeaderStyle-Width="140px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                            </br>
                                            </br>
                                    <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                </ItemTemplate> 
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="VehNo" UniqueName="VehNo" Display="False" />
                            <telerik:GridBoundColumn DataField="PerId" UniqueName="PerId" Display="False" />
                            <telerik:GridBoundColumn DataField="Status" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DischargeDone" UniqueName="DischargeDoneBool" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReleaseDone" UniqueName="ReleaseDoneBool" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequiredDateColour" UniqueName="RequiredDateColour" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBCTNRId" UniqueName="JBCTNRId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IsImportant" UniqueName="IsImportant" Display="False" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
