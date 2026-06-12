<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5Others.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5Others" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningV5Others</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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
        <table>
            <tr>
                <td align="left" valign="middle">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td align="left" valign="top">
                    <asp:Button runat="server" ID="defaultBtn" style="display:none;" /> 
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white"  OnClientClick="disableBtn(this.id,false)"
                        Text="Refresh" OnClick="RefreshBtn_Click" UseSubmitBehavior="false"/>                    
                    &nbsp;
                    <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                        Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                        Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                        Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;         
                    <asp:Button ID="EditBtn" class="white" runat="server" OnClick="EditBtn_Click"
                        Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                    &nbsp;              
                    <asp:Button ID="DetourBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="DetourBtn_Click" Text="Detour" />
                    &nbsp;
                    <asp:Button ID="PaymentBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="PaymentBtn_Click" Text="Payment" />
                    &nbsp;  
                    <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="IncentiveBtn_Click" Text="Incentive" />
                     <asp:Button ID="ChargeBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="ChargeBtn_Click" Text="Charge" />
                    &nbsp;
                    <asp:Button ID="ImportantBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="ImportantBtn_Click" Text="Important" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate><br />
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" Height="95%"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" MasterTableView-AllowSorting="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnPreRender="ResultDG_PreRender"
                    AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true"/>
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false"/>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="100%" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" EditMode="InPlace">
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
                                    BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click">
                                    </asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="RequiredDate" HeaderText="RequiredDate <br/> RequiredTime" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width="60px" HeaderStyle-Width="60px"
                                        SortExpression="ExpDate" AllowSorting="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="false" DataField="ExpEqpspecialinstruction" >
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ExpEqpspecialinstruction", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="JobNo" ItemStyle-HorizontalAlign="Center" DataField="JobAcBookingNo" 
                                HeaderText="JobNo <br/> Account <br/> BookingNo <br> PortnetNo" SortExpression="JobAcBookingNo" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("JobAcBookingNo")) %>
                                    <br />
                                    <%# string.Format("{0:}",  Eval("PornetNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vessel" HeaderText="ETA <br/> Vessel <br/> Voyage"  DataField="ETAVesselVoyage" ItemStyle-HorizontalAlign="Center" 
                                SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("ETAVesselVoyage")) %>
                                    <br/></br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ContainerNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo <br/> SealNo"
                                 SortExpression="ContainerNo" AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>
                                    </br>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "SealNo")%>
                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" Width="120px" Display="false"></telerik:RadTextBox>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo") %>'
                                        TextMode="SingleLine" Enabled="true" Width="120px" ClientEvents-OnValueChanged="CheckCtnrNoDigit">
                                    </telerik:RadTextBox>
                                    </br>
                                    </br>
                                    <telerik:RadTextBox runat="server" ID="SealNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo") %>'
                                        TextMode="SingleLine" Enabled="true" Width="120px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> TripOption" ItemStyle-HorizontalAlign="Center"
                                SortExpression="billsizetype" AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billsizetype")%>
                                    </br>
                                    </br>
                                    <%# DataBinder.Eval(Container.DataItem, "Sector")%>
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
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionDS,DataBinder.Eval(Container.DataItem, "Sector").ToString())%>'>
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripTypeDoubleStatus" ItemStyle-HorizontalAlign="Center" HeaderText="TripType <br/> Double <br/> Status" SortExpression="TripTypeDoubleStatus" AllowFiltering="false">
                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="120px" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="120px"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripTypeDoubleStatus")%>
                                    </br>                                    
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br/> Driver<br/> Trailer" ItemStyle-HorizontalAlign="Center"
                                SortExpression="VehNo" AllowFiltering="false" ItemStyle-Wrap="false">
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
                            <telerik:GridTemplateColumn UniqueName="DocNo" ItemStyle-HorizontalAlign="Center" HeaderText="InternalDocNo <br/> OutsourceDocNo"
                                 SortExpression="InternalDocNo" AllowFiltering="false" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                            </br>
                                            </br>
                                    <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="InternalDocNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "InternalDocNo") %>'
                                        TextMode="SingleLine" Enabled="true" Width="120px">
                                    </telerik:RadTextBox>
                                    </br>
                                    </br>
                                <telerik:RadTextBox runat="server" ID="OutsourceDocNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo") %>'
                                    TextMode="SingleLine" Enabled="true" Width="120px">
                                </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" SortExpression="FrServicePt" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="180px"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <%--<telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="160px"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                        OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />--%>
                                    <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                        TextMode="MultiLine" Enabled="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" SortExpression="ToServicePt" AllowFiltering="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="180px"></ItemStyle>
                                <ItemTemplate>
                                   <%-- <%# DataBinder.Eval(Container.DataItem, "ToServicePtDescr")%>
                                    </br>
                                    </br>--%>
                                    <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <%--<telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="160px"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                        OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />--%>
                                    <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                        TextMode="MultiLine" Enabled="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="SpecialInstruction" HeaderText="SpecialInstruction" SortExpression="SpecialInstruction" AllowFiltering="false">
                                        <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="SpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                                 Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                             </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jbcid" UniqueName="jbcid" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                            <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                            <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                            <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                            <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IsImportant" UniqueName="IsImportant" Display="False" />
                             <telerik:GridBoundColumn DataField="RequiredDateColour" UniqueName="RequiredDateColour" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
