<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyJobPlanningPlan.aspx.cs" Inherits="iWMS.Web.MoveManagement.DailyJobPlanning.DailyJobPlanningPlan" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyRidesPlanningPlan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
    </script>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

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
    </style>
        <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="PlanTab" Text="Plan" Value="0" runat="server" Enabled="true" Selected="true">
                </telerik:RadTab>
                <telerik:RadTab Id="QueueTab" Text="Queue" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ActivityTab" Text="Activity" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ManpowerTab" Text="Manpower" Value="150" runat="server">
                </telerik:RadTab>                 
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainInfoRadPageView" Height="0px">
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                            </asp:Label>
                            <br />
                            <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Panel ID="NewTripPanel" runat="server">
                                <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="AlternativeBtn" runat="server" CssClass="white" Text="Alternative"
                                OnClick="AlternativeBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;                                                                 
                            <asp:Button ID="SpeedUpBtn" runat="server" CssClass="white" Text="SpeedUp"
                                OnClick="SpeedUpBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                                Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp; 
                            <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                Text="Assigned" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp; 
                            <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="CastingBtn" runat="server" CssClass="white" OnClick="CastingBtn_Click"
                                Text="Casting" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </asp:Panel>
                        </td>
                        <td>
                            <br />
                            <telerik:RadMenu ID="RadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                                OnItemClick="RadMenu_ItemClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Notify" PostBack="false"
                                        Value="Print">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CAPTAIN" Text="I'm your Bus Captain"
                                                Visible="false" />
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="NAME" Text="Clear my name"
                                                Visible="false" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
                              OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <ClientSettings>
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <HeaderStyle Wrap="false" />
                            <AlternatingItemStyle Wrap="false" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="100%" 
                                PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" EditMode="InPlace">
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                                &nbsp;
                                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>                                              
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="SMSIcon" Enabled="false"
                                                ImageUrl="../../image/SMS.png" Width="18" Height="18" AlternateText="SMSicon"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <br />
                                            <br />
                                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="EmailIcon" Enabled="false"
                                                ImageUrl="../../image/Email.png" Width="18" Height="18" AlternateText="Emailicon"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="AltIcon"
                                                ImageUrl="../../image/AlternativePersonnel.png" Width="22" Height="22" AlternateText="AltIcon" Enabled="false"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Account <br /> JobNo" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("AcCode")) %>
                                            <br />
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("JobNo")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# string.Format("{0:}",Eval("AcCode")) %>
                                            <br />
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("JobNo")) %>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>    
                                    <telerik:GridTemplateColumn UniqueName="BookingDateTime" HeaderText="Booking DateTime">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("TripFrDate")) %>
                                             <br />  <br />  
                                                 <%# string.Format("{0:}",Eval("TripFrExpDOW")) %>
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                <%# string.Format("{0:}",Eval("TripToActDOW")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                             <%# string.Format("{0:}",Eval("triptotime")) %>
                                            <br />                                           
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                             <telerik:RadDatePicker ID="StartDatePicker" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "TripFrDate")  %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="StartDatePickerReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="StartDatePicker" ErrorMessage="*" />
                                            <br />
                                            <asp:Label runat="server" ID="TripFrDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripFrExpDOW")%>' />
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                            <asp:Label runat="server" ID="TripToDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripToActDOW")%>' />
                                            <br />
                                            <telerik:RadDropDownList ID="TripFrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripFrTime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripFrTimeDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="TripFrTimeDDL" ErrorMessage="*" />

                                            <telerik:RadDropDownList ID="TripToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "triptotime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripToTimeDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="TripToTimeDDL" ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                              
                                    <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br/> Driver">
                                        <ItemTemplate>
                                         <%# string.Format("{0:}",Eval("VehNo")) %>
                                            <br />
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("Name")) %>                                            
                                        </ItemTemplate>
                                       <EditItemTemplate>
                                           <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# vehListDS%>' Skin="Sunset"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "VehNo").ToString())%>'
                                                OnSelectedIndexChanged="VehicleSelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# driverListDS%>' Skin="Sunset"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(driverListDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'>
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp">
                                       <ItemTemplate>
                                           <br />    
                                         <%# string.Format("{0:}",Eval("FrServicePt")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("fraddr")) %>                        
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrPostalCode")) %>             
                                            <br />              
                                           <br /> 
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="FrPostalCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "FrPostalCode") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                             <br />
                                            <br />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff">
                                          <ItemTemplate>
                                          <br />
                                         <%# string.Format("{0:}",Eval("ToServicePt")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("toaddr")) %>                        
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToPostalCode")) %>        
                                             <br />   
                                              <br />               
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                             <br />
                                             <br />
                                            <telerik:RadTextBox runat="server" ID="ToPostalCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ToPostalCode") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                             <br />
                                             <br />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TourGuideName" HeaderText="TourGuideName <br> ContactNo">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TourGuideName")) %>
                                            <telerik:RadComboBox ID="TourGuideNameList" runat="server" DataTextField="descr" DataValueField="item"
                                                 Skin="WebBlue"  DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"                                             
                                                OnSelectedIndexChanged="TourGuideName_SelectedIndex_Changed" AutoPostBack="true" Visible="false">
                                            </telerik:RadComboBox>
                                              <asp:HiddenField ID="TourGuideNameTxt" runat="server" />
                                            <br />
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TourGuideContactNo")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadComboBox ID="TourGuideNameList" runat="server" DataTextField="descr" DataValueField="item"
                                                 Skin="WebBlue"  DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"                                             
                                                OnSelectedIndexChanged="TourGuideName_SelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                              <asp:HiddenField ID="TourGuideNameTxt" runat="server" />
                                             <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="TourGuideContactNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TourGuideContactNo") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> BillOption1" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                         <ItemTemplate>
                                         <%# string.Format("{0:}",Eval("billsizetype")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("billoption1")) %>                                   
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up" Enabled="false"
                                                DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="WebBlue"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'>
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up" Enabled="false"
                                                DataValueField="Item" DataSource='<%# BillOption1DS%>' Skin="WebBlue"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "billoption1").ToString())%>'>
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Trip" HeaderText="TripOption" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                         <ItemTemplate>
                                         <%# string.Format("{0:}",Eval("TripOption")) %>                               
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="TripOptionDDL" runat="server" DataTextField="descr" ExpandDirection="Up" Enabled="true"
                                                DataValueField="Item" DataSource='<%# TripOptionDS%>' Skin="Sunset"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionDS,DataBinder.Eval(Container.DataItem, "TripOption").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripOptionDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="TripOptionDDL" ForeColor="Red" ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription">
                                         <ItemTemplate>
                                         <%# string.Format("{0:}",Eval("TripDescr")) %>                               
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripDescr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="SpecialInstruction">
                                        <ItemTemplate>
                                         <%# string.Format("{0:}",Eval("TripSpecialInstruction")) %>                               
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                                         <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Status" HeaderStyle-HorizontalAlign="Center" Display="false">
                                        <ItemTemplate>
                                            <asp:Label ID="StatusLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" HeaderText="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="MobileNo" UniqueName="MobileNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AltPerId" UniqueName="AltPerId" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltPerName" UniqueName="AltPerName" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltVehNo" UniqueName="AltVehNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltPerMobileNo" UniqueName="AltPerMobileNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltRemarks" UniqueName="AltRemarks" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltDetected" UniqueName="AltDetected" Display="False" />
                                    <telerik:GridBoundColumn DataField="SMSDetected" UniqueName="SMSDetected" Display="False" />
                                    <telerik:GridBoundColumn DataField="EmailDetected" UniqueName="EmailDetected" Display="False" />
                                    <telerik:GridBoundColumn DataField="TourGuideName" UniqueName="TourGuideName" Display="False" />
                                    <telerik:GridBoundColumn DataField="TourGuideContactNo" UniqueName="TourGuideContactNo" Display="False" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="QueueRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="GanttRadpageview" Height="700px" />
            <telerik:RadPageView runat="server" ID="SMSRadpageview" Height="700px" />
            <telerik:RadPageView runat="server" ID="CommsRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="PaymentRadPageView" Height="700px" />
            <%--<telerik:RadPageView runat="server" ID="ActivityRadPageView" Height="700px" />--%>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
