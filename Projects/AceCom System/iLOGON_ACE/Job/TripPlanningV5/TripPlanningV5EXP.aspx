<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5EXP.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5EXP" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningV5EXP</title>
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
                     <asp:Button ID="ReadyBtn" runat="server" CssClass="white" OnClick="ReadyBtn_Click"
                         Text="Ready" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="ESNBtn" runat="server" CssClass="white" Text="ESN" CausesValidation="false"
                        OnClick="ESNBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                        Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="PregateBtn" runat="server" CssClass="white" Text="Pregate" CausesValidation="false"
                        OnClick="PregateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="140%" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" EditMode="InPlace" TableLayout="Auto">
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
                            <telerik:GridTemplateColumn UniqueName="Ready" ItemStyle-HorizontalAlign="Center" DataField="ReadyDone" HeaderText="Ready" SortExpression="ReadyDone" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="3px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="3px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="ReadyDoneLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ESN" ItemStyle-HorizontalAlign="Center" DataField="ESNDone" HeaderText="ESN" SortExpression="ESNDone" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="5px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="5px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="ESNLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="JobNo/Account/BookingNo" ItemStyle-HorizontalAlign="Center" DataField="JobAcBookingNo1"
                                HeaderText="JobNo <br/> Account <br/> BookingNo <br> PortnetNo" SortExpression="JobAcBookingNo1" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("JobAcBookingNo1")) %>
                                    <br />
                                    <%# string.Format("{0:}",  Eval("PornetNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ETA/Vessel/Voyage" HeaderText="ETA <br/> Vessel <br/> Voyage" DataField="ETAVesselVoyage"
                                ItemStyle-HorizontalAlign="Center" SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("ETAVesselVoyage")) %>
                                    <br />
                                    </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ETA/Countdown" HeaderText="ETA <br/> Countdown" DataField="ETACountdown" ItemStyle-HorizontalAlign="Center"
                                SortExpression="ETACountdown" AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("ETACountdown")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ContainerNo/SealNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo <br/> SealNo"
                                SortExpression="ContainerNo" ItemStyle-Wrap="false" AutoPostBackOnFilter="true" DataField="ContainerNo">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>
                                    <br></br>
                                    <br></br>
                                    <%# DataBinder.Eval(Container.DataItem, "SealNo")%>
                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" Width="120px" Display="false"></telerik:RadTextBox>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo") %>'
                                        TextMode="SingleLine" Enabled="true" Width="120px" ClientEvents-OnValueChanged="CheckCtnrNoDigit">
                                    </telerik:RadTextBox>
                                    <br></br>
                                    <br></br>
                                    <telerik:RadTextBox runat="server" ID="SealNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo") %>'
                                        TextMode="SingleLine" Enabled="true" Width="120px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="VGM" HeaderText="VGM" ItemStyle-HorizontalAlign="Center"
                                SortExpression="VerifiedGrossMass" AllowFiltering="false" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "VerifiedGrossMass")%>
                                    </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="BillSizeType/TripOption" HeaderText="BillSizeType <br/> TripOption" ItemStyle-HorizontalAlign="Center"
                                SortExpression="billsizetype" AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="70px" HeaderStyle-Width="70px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billsizetype")%>
                                    <br></br>
                                    <br></br>
                                    <%# DataBinder.Eval(Container.DataItem, "TripOption")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                        DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="WebBlue" Width="130px"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'
                                        DropDownWidth="130px">
                                    </telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator ID="BillSizeTypeDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" />
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="TripOptionList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# TripOptionDS%>' Skin="WebBlue" Width="130px"
                                        DropDownWidth="130px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionDS,DataBinder.Eval(Container.DataItem, "TripOption").ToString())%>'>
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/Trailer" HeaderText="Vehicle <br/> Driver<br/> Trailer" ItemStyle-HorizontalAlign="Center"
                                SortExpression="VehNoDriverTrailer" AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "VehNoDriverTrailer")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# vehListDS%>' Skin="WebBlue" Width="160px"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "VehNo").ToString())%>'
                                        OnSelectedIndexChanged="VehicleSelectedIndex_Changed" AutoPostBack="true">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# driverListDS%>' Skin="WebBlue" Width="160px"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(driverListDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'>
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="TrailerNoList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# TrailerNoDS%>' Skin="WebBlue" Width="160px"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerNoDS,DataBinder.Eval(Container.DataItem, "TrailerNo").ToString())%>'>
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" SortExpression="FrServicePt" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="180px"></ItemStyle>
                                <ItemTemplate>
                                    <%--  <%# DataBinder.Eval(Container.DataItem, "FrServicePtDescr")%>
                                    <br></br>
                                    <br></br>--%>
                                    <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="160px"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                        OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                        TextMode="MultiLine" Enabled="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" SortExpression="ToServicePt" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="100px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="100px"></ItemStyle>
                                <ItemTemplate>
                                    <%--  <%# DataBinder.Eval(Container.DataItem, "ToServicePtDescr")%>
                                    <br></br>
                                    <br></br>--%>
                                    <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="160px"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                        OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                        TextMode="MultiLine" Enabled="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="JobSpecialInstruction" HeaderText="JobSpecialInstruction" SortExpression="JobSpecialInstruction" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="100px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="100px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "JobSpecialInstruction")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="JobSpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "JobSpecialInstruction") %>'
                                        Enabled="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PermitType/PermitNo" HeaderText="PermitType <br/> PermitNo" ItemStyle-HorizontalAlign="Center"
                                SortExpression="PermitTypePermitNo" AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PermitTypePermitNo")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="InternalDocNo/OutsourceDocNo" ItemStyle-HorizontalAlign="Center" HeaderText="InternalDocNo <br/> OutsourceDocNo"
                                SortExpression="InternalDocNo" AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                    <br></br>
                                    <br></br>
                                    <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="InternalDocNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "InternalDocNo") %>'
                                        TextMode="SingleLine" Enabled="true" Width="120px">
                                    </telerik:RadTextBox>
                                    <br></br>
                                    <br></br>
                                    <telerik:RadTextBox runat="server" ID="OutsourceDocNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo") %>'
                                        TextMode="SingleLine" Enabled="true" Width="120px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="TripSpecialInstruction" SortExpression="TripSpecialInstruction" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="60px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="60px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                        Enabled="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripTypeDoubleStatus" ItemStyle-HorizontalAlign="Center" HeaderText="TripType <br/> Double <br/> Status" SortExpression="TripTypeDoubleStatus"
                                AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripTypeDoubleStatus")%>
                                    <br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="VehNo" UniqueName="VehNo" Display="False" />
                            <telerik:GridBoundColumn DataField="PerId" UniqueName="PerId" Display="False" />
                            <telerik:GridBoundColumn DataField="Status" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ESNDone" UniqueName="ESNV" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PregateDone" UniqueName="PregateV" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReadyDone" UniqueName="ReadyV" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IsImportant" UniqueName="IsImportant" Display="False" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
