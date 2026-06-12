<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyRidesPlanningGanttDetl.aspx.cs" Inherits="iWMS.Web.BusManagement.DailyRidesPlanning.DailyRidesPlanningGanttDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Daily Rides Planning Pop-Up</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
</head>
<body>
    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
    
    <style type="text/css">
        /* The switch - the box around the slider */
        .switch {
          position: relative;
          display: inline-block;
          width: 60px;
          height: 28px;
        }

        /* Hide default HTML checkbox */
        .switch input {display:none;}

        /* The slider */
        .slider {
          position: absolute;
          cursor: pointer;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
           background-color: #A8A8A8;
          -webkit-transition: .4s;
          transition: .4s;
        }

        .slider:before {
          position: absolute;
          content: "";
          height: 22px;
          width: 28px;
          left: 3px;
          bottom: 3px;
          background-color: white;
          -webkit-transition: .4s;
          transition: .4s;
        }

        input:checked + .slider {
           background-color: #393;
        }

        input:focus + .slider {
          box-shadow: 0 0 1px #393;
        }

        input:checked + .slider:before {
          -webkit-transform: translateX(26px);
          -ms-transform: translateX(26px);
          transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
          border-radius: 5px;
        }

        .slider.round:before {
          border-radius: 20%;
        }
    </style>
    
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

        function OnClientClicking(button, args) {
            if (window.confirm("Confirm to " + button.get_toolTip() + " this Trip?")) {
                button.set_autoPostBack(true);
            }
            else {
                button.set_autoPostBack(false);
            }
        }
    </script>

    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" EnableScriptCombine="false" />
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all"
        DecorationZoneID="decorationZone" />
    <telerik:RadFormDecorator ID="FormDecorator2" runat="server" DecoratedControls="all"
        DecorationZoneID="decorationZone2" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="10">
            </telerik:RadTab>
            <telerik:RadTab Text="Job" Value="20">
            </telerik:RadTab>
            <telerik:RadTab Text="Vol" Value="30">
            </telerik:RadTab>
            <telerik:RadTab Text="VslVoy" Value="40">
            </telerik:RadTab>
            <telerik:RadTab Text="Incentive" Value="50">
            </telerik:RadTab>
            <telerik:RadTab Text="Notify" Value="60">
            </telerik:RadTab>
            <telerik:RadTab Text="SMS" Value="70">
            </telerik:RadTab>
            <telerik:RadTab Text="Payment" Value="80">
            </telerik:RadTab>
            <%--<telerik:RadTab Text="PaymentPV2" Value="90">
            </telerik:RadTab>--%>
            <telerik:RadTab Text="ModUnit" Value="90">
            </telerik:RadTab>
            <telerik:RadTab Text="Attendant" Value="110">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
        <telerik:RadPageView runat="server" ID="RadPageView1">
            <br />
            
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="10" align="left">
                        <table border="0">
                            <tr>
                                <td>
                                    <telerik:RadButton ID="OpenBtn" runat="server" OnClick="OpenBtn_Click" Text="Open"
                                        ButtonType="LinkButton">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="DischargeBtn" runat="server" OnClick="DischargeBtn_Click"
                                        Text="Discharged" ButtonType="LinkButton">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="EmptiedBtn" runat="server" OnClick="EmptiedBtn_Click" Text="Emptied"
                                        ToolTip="Emptied" ButtonType="LinkButton" OnClientClicking="OnClientClicking">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="RExportBtn" runat="server" OnClick="RExportBtn_Click" Text="R-Export"
                                        ToolTip="R-Export" ButtonType="LinkButton" OnClientClicking="OnClientClicking">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="AssignBtn" runat="server" OnClick="AssignBtn_Click" Text="Assign"
                                        ButtonType="LinkButton">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="CompletedBtn" runat="server" OnClick="CompletedBtn_Click"
                                        Text="Completed" ButtonType="LinkButton">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="VoidBtn" runat="server" OnClick="VoidBtn_Click" Text="Void"
                                        ToolTip="Void" ButtonType="LinkButton" OnClientClicking="OnClientClicking">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="CancelledBtn" runat="server" OnClick="CancelledBtn_Click"
                                        Text="Cancelled" ButtonType="LinkButton">
                                    </telerik:RadButton>
                                    &nbsp;
                                </td>
                                <td align="right" width="450px">
                                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="10" align="left">
                        <telerik:RadButton ID="updateBtn" runat="server" OnClick="updateBtn_Click" Text="Update"
                            Skin="WebBlue" SingleClick="true" SingleClickText="Updating...">
                        </telerik:RadButton>
                        &nbsp;&nbsp;
                        <telerik:RadButton ID="cancelBtn" runat="server" OnClick="cancelBtn_Click" Text="Close"
                            CausesValidation="false" Skin="WebBlue">
                        </telerik:RadButton>
                        <br />
                        <br />
                    </td>   
                </tr>
            </table>
            <asp:UpdatePanel ID="SCPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%"> 
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="tripCountLbl" runat="server" Visible="false" />
                        <asp:Label ID="Label1" runat="server" Text="JobNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="JobTxt" Width="120px" Skin="Office2007" Enabled="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label21" runat="server" Text="ShipmentType"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ShipmentTypeTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="statusLbl" runat="server" Visible="false" />
                        <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="StatusTxt" Width="120px" Skin="Office2007"
                            Enabled="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label3" runat="server" Text="ContainerNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="EqpNoTxt" Width="120px" Skin="Office2007"
                            AutoPostBack="True" OnTextChanged="EqpNoTxt_TextChanged">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label72" runat="server" Text="GoodsWt(KGS)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="goodswtTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>                
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label65" runat="server" Text="PIC/CS"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="PICTxt" Width="120px" Skin="Office2007" ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label20" runat="server" Text="JobType"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="JobTypeTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label44" runat="server" Text="BookTime"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDateTimePicker ID="BkTimeDateTimePicker" Width="172px" runat="server"
                            DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        </telerik:RadDateTimePicker>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label5" runat="server" Text="SealNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="SealNoTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label74" runat="server" Text="GoodsVol(M3)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="goodsvolTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="acidLbl" runat="server" Visible="false" />
                        <asp:Label ID="Label2" runat="server" Text="Account"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="AccTxt" Width="120px" Skin="Office2007" Enabled="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label19" runat="server" Text="TransportType"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="TptTypeTxt" Width="120px" Skin="Office2007"
                            TextMode="MultiLine" Rows="2" ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label95" runat="server" Text="VendorDocNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OutsourceDocTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>&nbsp;
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label66" runat="server" Text="CellNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="CellNoTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label76" runat="server" Text="NoOfPkgs"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="noofpkgsTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label67" runat="server" Text="OrderBy"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OrderByTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label6" runat="server" Text="TripType"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="TripTypeList" runat="server" DefaultMessage="Select a TripType"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px" AutoPostBack="true" 
                            OnSelectedIndexChanged="TripTypeSelectedIndex_changed">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label10" runat="server" Text="VehNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadComboBox ID="PrimerList" runat="server" DefaultMessage="Select a PrimeMover"
                            DropDownWidth="150px" Width="120px" Height="200px" Skin="WebBlue" AutoPostBack="true"
                            OnSelectedIndexChanged="VehNoSelectedIndex_changed" CausesValidation="false"
                            Filter="Contains" RenderMode="Lightweight">
                        </telerik:RadComboBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label55" for="switch1" runat="server" Text="ESNStatus"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <!-- Rounded switch -->
                        <label class="switch">
                          <input id="switchcb" runat="server" type="checkbox" name="switch">
                          <div class="slider round"></div>
                        </label>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label78" runat="server" Text="ActNoOfPkgs"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="actnoofpkgsTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>
                        <asp:CompareValidator ID="CompareValidator8" runat="server" Operator="DataTypeCheck"
                            Type="Double" ControlToValidate="actnoofpkgsTxt" ErrorMessage="#" />
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label9" runat="server" Text="BkRef"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="BkRefTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label4" runat="server" Text="BillSizeType"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="SizeTypeList" runat="server" DefaultMessage="Select a BillSizeType"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label11" runat="server" Text="Driver"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadComboBox ID="DriverList" runat="server" OnSelectedIndexChanged="DriverSelectedIndex_changed"
                            AutoPostBack="true" Skin="WebBlue" Width="120px" DropDownWidth="150px" CausesValidation="false"
                            Filter="Contains" RenderMode="Lightweight">
                        </telerik:RadComboBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label70" runat="server" Text="OL(Front,CM)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OLFTxt" Width="120px" Skin="Office2007" Enabled="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label80" runat="server" Text="CtnrWt(KGS)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ctnrwtTxt" Width="120px" Skin="Office2007"
                            Enabled="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label41" runat="server" Text="SvcChit"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="SvcChitTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label8" runat="server" Text="TripOption"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="TripOptionList" runat="server" DefaultMessage="Select a TripOption"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label69" runat="server" Text="Chassis&nbsp;<br />Type"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="ChassisTypeList" runat="server" DefaultMessage="Select a ChassisType"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px" AutoPostBack="true"
                            OnSelectedIndexChanged="ChassisTypeList_IndexChanged">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label73" runat="server" Text="OL(Rear,CM)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OLRTxt" Width="120px" Skin="Office2007" Enabled="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label54" runat="server" Text="TripCount"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="TripCountTxt" Width="120px" Skin="Office2007"
                            Enabled="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label71" runat="server" Text="OutriderVendor"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OutriderVendorTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label68" runat="server" Text="BillOption2"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="BillOption2List" runat="server" DefaultMessage="Select a BillOption2"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label12" runat="server" Text="TrailerNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadComboBox ID="TrailerList" runat="server" DefaultMessage="Select a Trailer"
                            DropDownWidth="150px" Width="120px" Height="200px" Skin="WebBlue" AutoPostBack="true"
                            OnSelectedIndexChanged="TrailerList_IndexChanged" CausesValidation="false" Filter="Contains"
                            RenderMode="Lightweight">
                        </telerik:RadComboBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label75" runat="server" Text="OW(Left,CM)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OWLTxt" Width="120px" Skin="Office2007" Enabled="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="CtnrRdyDateLbl" runat="server" Text="CtnrRdyDate" Visible="false"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDateTimePicker ID="RadDateTimePicker3" Width="172px" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                            Skin="Office2007" PopupDirection="BottomRight" Visible="false">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        </telerik:RadDateTimePicker>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label89" runat="server" Text="EscortStartDate"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDateTimePicker ID="RadDateTimePicker1" Width="172px" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                            Skin="Office2007" PopupDirection="BottomRight">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        </telerik:RadDateTimePicker>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label93" runat="server" Text="TrailerType"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="TrailerTypeList" runat="server" DefaultMessage="Select a TrailerType"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                        &nbsp;
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label39" runat="server" Text="PickDrop"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="TrailerPickDropList" runat="server" DefaultMessage="Select a PickDrop"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label77" runat="server" Text="OW(Right,CM)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OWRTxt" Width="120px" Skin="Office2007" Enabled="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label90" runat="server" Text="EscortEndDate"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDateTimePicker ID="RadDateTimePicker2" Width="172px" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                            Skin="Office2007" PopupDirection="BottomRight">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        </telerik:RadDateTimePicker>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label94" runat="server" Text="EscortDocNo"></asp:Label>
                        &nbsp;&nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="EscortDocTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>&nbsp;
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label40" runat="server" Text="TrailerPark"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadComboBox ID="VehParkList" runat="server" DefaultMessage="Select a VehParkCode"
                            DropDownWidth="150px" Width="120px" Height="200px" Skin="WebBlue" CausesValidation="false"
                            Filter="Contains" RenderMode="Lightweight">
                        </telerik:RadComboBox>
                        &nbsp;
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label79" runat="server" Text="OH(CM)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="OHTxt" Width="120px" Skin="Office2007" Enabled="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="10" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 280px;" colspan="2">
                        <div id="decorationZone">
                            <fieldset>
                                <legend><b>CollectFrom</b></legend>
                                <table border="0" width="275px">
                                    <tr>
                                        <td style="width: 95px;" align="right">
                                            <asp:Label ID="Label13" runat="server" Text="CollectFrom"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadDropDownList ID="FrSvcPtList" runat="server" DefaultMessage="Select a From Service Point"
                                                DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px" AutoPostBack="true"
                                                OnSelectedIndexChanged="formCtl_OnDropDownSelectedIndexChanged">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 95px;" align="right">
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" Width="120px" Skin="Office2007"
                                                TextMode="MultiLine" Rows="5">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 95px;" align="right">
                                            <asp:Label ID="originalFrExpDateLbl" runat="server" Visible="false" />
                                            <asp:Label ID="Label14" runat="server" Text="ArrivalTime"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadDateTimePicker ID="FrExpDateTimePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                Skin="Office2007" PopupDirection="TopRight" OnSelectedDateChanged="FrExpDateTimePicker_DateChanged"
                                                AutoPostBackControl="Both">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                                <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                            </telerik:RadDateTimePicker>
                                            <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="FrExpDateTimePicker"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 95px;" align="right">
                                            <asp:Label ID="Label15" runat="server" Text="DepartTime"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadDateTimePicker ID="FrActDateTimePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                Skin="Office2007" PopupDirection="TopRight">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                                <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                            </telerik:RadDateTimePicker>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </td>
                    <td style="width: 280px;" colspan="2">
                        <div id="decorationZone2">
                            <fieldset>
                                <legend><b>DeliverTo</b></legend>
                                <table border="0" width="275px">
                                    <tr>
                                        <td style="width: 95px;" align="right">
                                            <asp:Label ID="Label16" runat="server" Text="DeliverTo"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadDropDownList ID="ToSvcPtList" runat="server" DefaultMessage="Select a To Service Point"
                                                DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px" AutoPostBack="true"
                                                OnSelectedIndexChanged="formCtl_OnDropDownSelectedIndexChanged">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 95px;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" Width="120px" Skin="Office2007"
                                                TextMode="MultiLine" Rows="5">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 95px;" align="right">
                                            <asp:Label ID="Label17" runat="server" Text="ArrivalTime"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadDateTimePicker ID="ToExpDateTimePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                Skin="Office2007" PopupDirection="TopRight" OnSelectedDateChanged="ToExpDateTimePicker_DateChanged"
                                                AutoPostBackControl="Both">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                                <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                            </telerik:RadDateTimePicker>
                                            <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="ToExpDateTimePicker"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 95px;" align="right">
                                            <asp:Label ID="Label18" runat="server" Text="CompTime"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td style="width: 180px;">
                                            <telerik:RadDateTimePicker ID="ToActDateTimePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                Skin="Office2007" PopupDirection="TopRight">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                                <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                            </telerik:RadDateTimePicker>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </td>
                    <td style="width: 100px;" align="right" valign="top">
                        <asp:Label ID="Label81" runat="server" Text="Goods&nbsp;<br />Description&nbsp;"></asp:Label>
                    </td>
                    <td style="width: 180px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="jbcdescrTxt" Width="120px" Skin="Office2007"
                            TextMode="MultiLine" Rows="7" ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right" valign="top">
                        <asp:Label ID="Label42" runat="server" Text="Trip&nbsp;<br />Remarks&nbsp;<br />(ForDriverOnly)&nbsp;"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label88" runat="server" Text="Trip&nbsp;<br />Remarks&nbsp;"></asp:Label>
                    </td>
                    <td style="width: 180px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="TripRemTxt" Width="120px" Skin="Office2007"
                            TextMode="MultiLine" Rows="7">
                        </telerik:RadTextBox>
                        <br />
                        <br />
                        <telerik:RadTextBox runat="server" ID="TripRem2Txt" Width="120px" Skin="Office2007"
                            TextMode="MultiLine" Rows="7">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
            </asp:UpdatePanel> 
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView2">
            <br />
            <telerik:RadButton ID="RadButton1" runat="server" OnClick="CloseBtn_Click" Text="Close"
                CausesValidation="false" Skin="WebBlue">
            </telerik:RadButton> 
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <%--<tr>
                    <td colspan="6" align="left">
                        <telerik:RadButton ID="updateBtn2" runat="server" OnClick="updateBtn_Click" Text="Update"
                            Skin="WebBlue">
                        </telerik:RadButton>
                        &nbsp;&nbsp;
                        <telerik:RadButton ID="cancelBtn2" runat="server" OnClick="cancelBtn_Click" Text="Close"
                            Skin="WebBlue">
                        </telerik:RadButton>
                        <br />
                        <br />
                    </td>
                </tr>--%>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label24" runat="server" Text="CustomerRef"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="CustRefTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label22" runat="server" Text="FreeStorageExpiry"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="FreeStorExpTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                        <td style="width: 130px;" align="right" valign="top">
                            <asp:Label ID="Label82" runat="server" Text="DetentionExpiry"></asp:Label>
                            &nbsp;
                        </td>
                        <td style="width: 240px;" valign="top">
                            <telerik:RadTextBox runat="server" ID="DetentionExpTxt" Width="180px" Skin="Office2007"
                                ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label85" runat="server" Text="Carrier"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="CarrierNameTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                        <br />
                        <telerik:RadTextBox runat="server" ID="CarrierAddrTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label86" runat="server" Text="FForwarder"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="FFNameTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                        <br />
                        <telerik:RadTextBox runat="server" ID="FFAddrTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label87" runat="server" Text="Shipper"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ExporterNameTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                        <br />
                        <telerik:RadTextBox runat="server" ID="ExporterAddrTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label25" runat="server" Text="JobDescription"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="JobDescrTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label84" runat="server" Text="ExportEdoASN/UCI"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="OutEsnAsnTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label27" runat="server" Text="EqpRemarks"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="EqpRemTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label91" runat="server" Text="JobSpecialInstruction"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="SpecialInstrTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label83" runat="server" Text="ImportEdoASN/UCI"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="InEdoAsnTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label26" runat="server" Text="EqpSpecialInstruction"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="EqpSpecialInstrTxt" Width="180px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="5">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label52" runat="server" Text="StevedoreName"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="StevedoreNameTxt" Width="180px" Skin="Office2007"
                                ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label53" runat="server" Text="ConnSteveName"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="ConnSteveNameTxt" Width="180px" Skin="Office2007"
                                ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView3">
            <br />
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="6" align="left">
                        <telerik:RadButton ID="RadButton2" runat="server" OnClick="CloseBtn_Click" Text="Close"
                            CausesValidation="false" Skin="WebBlue">
                        </telerik:RadButton>
                        &nbsp;
                        <telerik:RadButton ID="VolupdateBtn" runat="server" OnClick="VolupdateBtn_Click"
                            Text="Update" Skin="WebBlue" Visible="true">
                        </telerik:RadButton>
                        &nbsp;&nbsp;
                        <%--  <telerik:RadButton ID="cancelBtn3" runat="server" OnClick="cancelBtn_Click" Text="Close"
                            Skin="WebBlue">
                        </telerik:RadButton>--%>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label28" runat="server" Text="ExpectedWt"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ExpectedWtTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label29" runat="server" Text="ActualWt"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ActualWtTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label30" runat="server" Text="ExpectedVol"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ExpectedVolTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label31" runat="server" Text="ActualVol"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ActualVolTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label32" runat="server" Text="ExpectedPkg"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ExpectedPkgTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label33" runat="server" Text="ActualPkg"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ActualPkgTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label34" runat="server" Text="ExpectedPlt"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ExpectedPltTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        <asp:Label ID="Label35" runat="server" Text="ActualPlt"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        <telerik:RadTextBox runat="server" ID="ActualPltTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 130px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 240px;">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView4">
            <br />
            <telerik:RadButton ID="RadButton3" runat="server" OnClick="CloseBtn_Click" Text="Close"
                CausesValidation="false" Skin="WebBlue">
            </telerik:RadButton>
            &nbsp;
            <telerik:RadButton ID="VslVoyUpdateBtn" runat="server" OnClick="VslVoyUpdateBtn_Click"
                Text="Update" Skin="WebBlue" Visible="true">
            </telerik:RadButton>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label43" runat="server" Text="Vessel"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="VesselTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label45" runat="server" Text="Voyage"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="VoyageTxt" Width="120px" Skin="Office2007"
                            ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label46" runat="server" Text="POL"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="POLTxt" Width="120px" Skin="Office2007" ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label47" runat="server" Text="POD"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="PODTxt" Width="120px" Skin="Office2007" ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 95px;" align="right">
                        <asp:Label ID="Label23" runat="server" Text="ETA"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDateTimePicker ID="ETADateTimePicker" Width="170px" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                            Skin="Office2007" PopupDirection="TopRight">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        </telerik:RadDateTimePicker>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label56" runat="server" Text="ETD"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ETDTxt" Width="120px" Skin="Office2007" ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label49" runat="server" Text="Complete&nbsp;<br />Discharge&nbsp;"></asp:Label>
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="CompDischargeTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label50" runat="server" Text="BkRef"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="BookRefTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label51" runat="server" Text="PermitNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="PermitNoTxt" Width="120px" Skin="Office2007">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label96" runat="server" Text="ConnVessel"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ConnVesselTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label97" runat="server" Text="ConnVoyage"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ConnVoyageTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label98" runat="server" Text="ConnCarrierName"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ConnCarrierNameTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label99" runat="server" Text="ConnPOD"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ConnPODTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label100" runat="server" Text="ConnETA"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ConnETATxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        <asp:Label ID="Label101" runat="server" Text="ConnETD"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="ConnETDTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                    </td>
                    <td style="width: 100px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView5">
            <br />
           <table border="0" cellpadding="0" cellspacing="0" width="80%">
                <tr>
                    <td align="left">
                        <telerik:RadButton ID="RadButton4" runat="server" OnClick="CloseBtn_Click" Text="Close"
                            CausesValidation="false" Skin="WebBlue">
                        </telerik:RadButton>
                        &nbsp;
                        <telerik:RadButton ID="SvcChitUpdateBtn" runat="server" OnClick="SvcChitUpdateBtn_Click"
                            Text="Update" Skin="WebBlue" SingleClick="true" SingleClickText="Processing...">
                        </telerik:RadButton>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                <td>
                <iWMS:iForm ID="formCtl2" runat="server"/>
                </td>                   
                    <td style="width: 280px;" valign="middle" align="left" rowspan="3">
                        <asp:Label ID="incentiveLbl" runat="server" Font-Bold="true" Font-Size="30pt" Text="0.00"></asp:Label>
                    </td>
                </tr>                
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView6">
            <br />
            <table id="Table1" border="0" cellspacing="0" cellpadding="0" runat="server" width="100%">
                <tr>
                    <td align="left">
                        <telerik:RadButton ID="RadButton5" runat="server" OnClick="CloseBtn_Click" Text="Close"
                            CausesValidation="false" Skin="WebBlue">
                        </telerik:RadButton>
                        &nbsp;
                        <telerik:RadButton ID="NotifyUpdateBtn" runat="server" OnClick="NotifyUpdateBtn_Click"
                            Text="Update" Skin="WebBlue" SingleClick="true" SingleClickText="Processing..."
                            ToolTip="Update Email Notification">
                        </telerik:RadButton>
                        &nbsp;
                        <asp:Label ID="MsgLbl" runat="server" ForeColor="Green" Text="Email Notification Updated"
                            Visible="false" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadButton ID="EmailNotifyCBox" runat="server" ToggleType="CheckBox" ButtonType="ToggleButton"
                            AutoPostBack="true" OnCheckedChanged="EmailNotifyCBox_Changed">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Notify When Completed"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Dont notify when completed"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                        <asp:Label ID="AddUserLbl" runat="server" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadTextBox runat="server" ID="NotifyEmailTxt" Width="450px" Skin="Office2007"
                            TextMode="MultiLine" Rows="7">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView7">
            <br />
            <telerik:RadButton ID="RadButton6" runat="server" OnClick="CloseBtn_Click" Text="Close"
                CausesValidation="false" Skin="WebBlue">
            </telerik:RadButton>
            &nbsp;
            <telerik:RadButton ID="SendMsgBtn" runat="server" CssClass="detailButton" Skin="WebBlue"
                Text="   Send   " OnClick="SendMsgBtn_Click">
            </telerik:RadButton>
            &nbsp;
            <asp:Label ID="SendMessageLbl" runat="server" ForeColor="Green" Text="Successfully sent message!"
                Visible="false" />
            <br />
            <br />
            <table id="Table2" border="0" cellspacing="0" cellpadding="0" runat="server" width="100%">
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label36" runat="server" Text="Name"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="PerNameTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                    <td align="left" rowspan="2" valign="top" style="width: 740px;">
                        <asp:Image ID="Personnelimg" runat="server" ImageAlign="left" ImageUrl="~/Master/Personnel/MakeThumbNail.aspx" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label37" runat="server" Text="Mobile"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="MobileTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label105" runat="server" Text="DocumentPickUp"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadDropDownList ID="CollectDocsFromList" runat="server" DefaultMessage="Select PickUpLocation"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px" 
                            AutoPostBack="true" OnSelectedIndexChanged="CollectDocsFromList_IndexChanged">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label102" runat="server" Text="VoicePingID"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="VoicePingTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label103" runat="server" Text="SendMsgPlatform"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadDropDownList ID="PlatformList" runat="server" DefaultMessage="Select one"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label104" runat="server" Text="MessageFormat"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 240px;" valign="top">
                        <telerik:RadDropDownList ID="MsgFormatListDDL" runat="server" DefaultMessage="Select SMSFormat"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px"
                             AutoPostBack="true" OnSelectedIndexChanged="MsgFormatListDDL_IndexChanged">
                        </telerik:RadDropDownList>
                    </td>
                </tr>                 
                <tr>
                    <td colspan="3" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;" align="right" valign="top">
                        <asp:Label ID="Label38" runat="server" Text="SMS"></asp:Label>
                        &nbsp;
                    </td>
                    <td colspan="2" style="width: 980px;">
                        <telerik:RadTextBox runat="server" ID="SMStxt" Width="450px" Skin="Office2007" TextMode="MultiLine"
                            Rows="18">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="PaymentRegPageView" Height="750px" />
        <telerik:RadPageView runat="server" ID="RadPageView8">
            <table id="Table3" border="0" cellspacing="0" cellpadding="0" runat="server" width="100%">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadButton ID="RadButton7" runat="server" OnClick="CloseBtn_Click" Text="Close"
                            CausesValidation="false" Skin="WebBlue">
                        </telerik:RadButton>
                        &nbsp;
                        <telerik:RadButton ID="SaveModUnitBtn" runat="server" OnClick="SaveModUnitBtn_Click"
                            Text="Save" ButtonType="LinkButton" Visible="false" Enabled="false">
                        </telerik:RadButton>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top"
                                EditMode="InPlace">
                                <CommandItemSettings ShowRefreshButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon" HeaderStyle-Width="50px">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="ResultDG_Delete" runat="server">
                                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                                    title="Delete" runat="server" /></a>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="Sno" AllowFiltering="false"
                                        HeaderStyle-Width="50px">
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderTemplate>
                                            S/No
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ModularUnitNo" HeaderText="ModularUnitNo"
                                        HeaderStyle-Width="200px">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#DataBinder.Eval(Container,"DataItem.trailernodescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="TrailerNoList" runat="server" DefaultMessage="Select a Capacity"
                                                DropDownHeight="150px" Skin="WebBlue" DataSource='<%# TrailerNoListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerNoListDS,DataBinder.Eval(Container.DataItem, "trailerno").ToString())%>'
                                                DataTextField="descr" DataValueField="vehno">
                                            </telerik:RadDropDownList>
                                            <telerik:RadTextBox runat="server" ID="TrailerNoListTxt" Visible="false" Skin="Office2007" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="vehparkdescr" HeaderText="vehpark">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#DataBinder.Eval(Container, "DataItem.vehparkcode")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="vehparkMUDDL" runat="server" DefaultMessage="Select a vehpark"
                                                Width="120px" DropDownHeight="150px" Skin="WebBlue" DataSource='<%#vehparkListDS%>'
                                                DataTextField="vehparkcap" DataValueField="item">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="pickdropdescr" HeaderText="pick drop">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#DataBinder.Eval(Container, "DataItem.trailerpickdrop")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="pickdropMUDDL" runat="server" DefaultMessage="Select a pick drop"
                                                Width="120px" DropDownHeight="150px" Skin="WebBlue" DataSource='<%# pickdropListDS%>'
                                                DataTextField="descr" DataValueField="item">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#DataBinder.Eval(Container, "DataItem.remarks")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="remTxt" Text='<%#DataBinder.Eval(Container,"DataItem.remarks")%>'
                                                Skin="Office2007" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView9" Height="600px">
            <br />
            <telerik:RadButton ID="RadButton8" runat="server" OnClick="CloseBtn_Click" Text="Close"
                CausesValidation="false" Skin="WebBlue">
            </telerik:RadButton>
            <br />
            <br />
            <table>
                <tr>
                    <td>
                        Personnel
                    </td>
                    <td>
                        <telerik:RadListBox runat="server" ID="PersonnelList" Height="120px" Width="250px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPersonnelsList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="PersonnelList_Transferred">
                        </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedPersonnelsList" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            Skin="WebBlue" AllowDelete="false">
                        </telerik:RadListBox>
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td valign="top" width="50%" class="style2" colspan="2">
                        <telerik:RadButton ID="SaveBtn" runat="server" Width="60" Text="Save" Skin="WebBlue"
                            OnClick="SaveBtn_Click" OnClientClick="busyBox.Show();" />
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
        targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
        backgroundcssclass="MessageBoxPopupBackground">
    </ajaxtoolkit:modalpopupextender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
