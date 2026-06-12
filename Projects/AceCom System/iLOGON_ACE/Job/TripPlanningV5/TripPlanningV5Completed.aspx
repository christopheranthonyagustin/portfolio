<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5Completed.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5Completed" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
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
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
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
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 6%;
        }
    </style>
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
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="defaultbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td class="style2" colspan="5">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
                <td width="70%" align="right"></td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
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
                <td>
                    <br />
                    <asp:Button runat="server" ID="defaultBtn" Style="display: none;" />
                    <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                        Text="Refresh" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </td>
                <td style="padding-right: 10%">
                    <br />
                    <asp:Button ID="OpenBtn" runat="server" CssClass="white" Text="Open" OnClick="OpenBtn_Click"
                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,true)" />
                    &nbsp;
                <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                    Text="POD" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="EditBtn" class="white" runat="server" OnClick="EditBtn_Click"
                    Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                    &nbsp;
                    <asp:Button ID="PaymentBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="PaymentBtn_Click" Text="Payment" />
                    &nbsp;  
                    <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="IncentiveBtn_Click" Text="Incentive" />
                     <asp:Button ID="ChargeBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="ChargeBtn_Click" Text="Charge" />
                    <asp:Button ID="ExportToExcelBtn" runat="server" CssClass="longlabelgreen"  UseSubmitBehavior="false"
                        OnClick="ExportToExcelBtn_Click" Text="ExportToExcel" />
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnPreRender="ResultDG_PreRender" MasterTableView-AllowSorting="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound"                    
                    AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="470px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="2000px" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
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
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="lblEditBtn"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="TripDateTime" HeaderText="TripDateTime" ItemStyle-HorizontalAlign="Center" AllowFiltering="false"
                                         SortExpression="TripDateTime" AllowSorting="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripDateTime")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="StartDatePicker" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "TripFrDate") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "TripFrDate").ToString()) ? DataBinder.Eval(Container.DataItem, "TripFrDate") : DateTime.Now %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <br />
                                            <asp:Label runat="server" ID="TripFrDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripFrDOW")%>' />
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    <asp:Label runat="server" ID="TripToDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripToDOW")%>' />
                                            <br />
                                            <telerik:RadDropDownList ID="TripFrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripFrTime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripFrTimeDDLReqVal" runat="server"
                                                ControlToValidate="TripFrTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                            <telerik:RadDropDownList ID="TripToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripToTime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripToTimeDDLReqVal" runat="server"
                                                ControlToValidate="TripToTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="JobNo" ItemStyle-HorizontalAlign="Center" DataField="JobAcBookingNo"
                                         HeaderText="JobNo <br/> Account <br/> BookingNo" SortExpression="JobAcBookingNo" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("JobAcBookingNo")) %>
                                        </ItemTemplate>
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
                                    <telerik:GridTemplateColumn UniqueName="TripTypeDoubleStatus" ItemStyle-HorizontalAlign="Center" HeaderText="TripType <br/> Double <br/> Status" 
                                        SortExpression="TripTypeDoubleStatus" AllowFiltering="false" AllowSorting="true" DataField="TripTypeDoubleStatus" AutoPostBackOnFilter="true" >
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "TripTypeDoubleStatus")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" SortExpression="FrServicePt" AllowFiltering="false" ItemStyle-Wrap="true">
                                        <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                        <ItemTemplate>            
                                                  <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" SortExpression="ToServicePt" AllowFiltering="false" ItemStyle-Wrap="true">
                                        <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                        <ItemTemplate>
                                                  <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br/> Driver<br/> Trailer" ItemStyle-HorizontalAlign="Center"
                                         SortExpression="VehNoDriverTrailer" AllowFiltering="false" AllowSorting="true" ItemStyle-Wrap="false">
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
                                    <telerik:GridTemplateColumn UniqueName="Vessel" HeaderText="ETA <br/> Vessel <br/> Voyage" DataField="ETAVesselVoyage" 
                                        ItemStyle-HorizontalAlign="Center" SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("ETAVesselVoyage")) %>
                                            <br />
                                            </br>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="SpecialInstruction" HeaderText="SpecialInstruction" SortExpression="SpecialInstruction" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="160px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="160px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="SpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                                Enabled="true">
                                            </telerik:RadTextBox>
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
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="jbcid" UniqueName="jbcid" Display="False"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                                    <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                                    <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:datagrid id="ExportGrid" runat="server" Visible="False" Width="100%" BorderColor="Black"
				CellPadding="2" BorderStyle="None" ShowFooter="True" GridLines="Both" AutoGenerateColumns="False">
				<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Left" BackColor="White"></FooterStyle>
				<AlternatingItemStyle Wrap="False" BackColor="White"></AlternatingItemStyle>
				<ItemStyle ForeColor="Black" BackColor="White"></ItemStyle>
				<HeaderStyle Font-Bold="True" HorizontalAlign="Center" ForeColor="Black" BackColor="White"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="JobNo" SortExpression="JobNo" ReadOnly="True" HeaderText="JobNumber"></asp:BoundColumn>
					<asp:BoundColumn DataField="AcCode" SortExpression="AcCode" ReadOnly="True" HeaderText="Account"></asp:BoundColumn>
					<asp:BoundColumn DataField="ContainerNo" SortExpression="ContainerNo" ReadOnly="True" HeaderText="ContainerNo"></asp:BoundColumn>
					<asp:BoundColumn DataField="SealNo" SortExpression="SealNo" ReadOnly="True" HeaderText="SealNo"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
    </form>
</body>
</html>
