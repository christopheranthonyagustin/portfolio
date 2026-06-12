<%@ Page Language="c#" CodeBehind="TransportCtnrDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterLD.TransportCtnrDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportCtnrDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css" />

    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function OnClientClick() {
                var Grid = $find("<%= ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length; i++) {
                    var row = MasterTable.get_dataItems()[i];
                    if (row.get_expanded() == false) {
                        row.set_expanded(true);
                    }
                    else
                        row.set_expanded(false);
                }
            }

        </script>

    </telerik:RadCodeBlock>
</head>
<body onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="left" colspan="10">
                    <asp:Button ID="AddDetailBtn" runat="server" CssClass="white" Visible="false" Text="New" OnClick="AddDetailBtn_Click"
                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                    &nbsp;                
                <asp:Button ID="ContAddBtn" runat="server" CssClass="white" Text="BulkAdd" OnClick="ContainerAddBtn_Click" ToolTip="Quick Container Add"
                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" Visible="false" />
                    &nbsp;  
                <asp:Button ID="GenerateTripBtn" runat="server" CssClass="white" Visible="false" Text="GenTrip" OnClick="GenerateTripBtn_Click" />
                    &nbsp;  
                <asp:Button ID="MassChangeBtn" runat="server" CssClass="white" Text="Change" OnClick="MassChangeBtn_Click"
                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" Visible="false" />
                    &nbsp; 
                <asp:Button ID="DelImgBtn" runat="server" CssClass="white" Text="Delete" OnClick="DeleteAllBtn_Click" ToolTip="Delete Selected Container(s)"
                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" Visible="false" />
                    &nbsp;               
                <asp:Button ID="VoidAllBtn" runat="server" CssClass="white" Text="VoidAllTrip" OnClick="VoidAllBtn_Click"
                    OnClientClick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm VoidAll?')" UseSubmitBehavior="true" />
                    &nbsp;                
                <asp:Button ID="switchEqpBtn" runat="server" CssClass="white" Text="Switch" OnClick="switchBtn_Click"
                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" Enabled="false" Visible ="true"/>
                    &nbsp;               
                <asp:Button ID="CollapseExpandBtn" runat="server" CssClass="white" Text="ShowHide" OnClientClick="OnClientClick();" UseSubmitBehavior="false" />
                    &nbsp;                                            
                <asp:Button ID="TransferEqpBtn" runat="server" CssClass="white" Text="Transfer" OnClick="TransferEqpBtn_Click" OnClientClick="disableBtn(this.id)"
                    UseSubmitBehavior="false" Enabled="false" Visible ="true" />
                    &nbsp;
                <asp:Button ID="PopFromSpBtn" runat="server" CssClass="green" Text="ShipPlan" OnClick="PopFromSpBtn_Click"
                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" Visible="false" />
                    &nbsp;
                <asp:Button ID="PopToGIBtn" runat="server" CssClass="white" Text="PopToGI" OnClick="PopToGIBtn_Click"
                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" Visible="false" />
                </td>
                <td>
                    <asp:Label ID="PrintChargeLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <table id="Table" border="0" cellspacing="1" cellpadding="1" width="100%" runat="server">
                            <tr>
                                <td colspan="3" align="left">
                                    <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save &amp; Next" OnClick="SaveNextBtn_Click"
                                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />
                                    &nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click"
                                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />
                                    &nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="white" Text="Hide" OnClick="ClosePanelBtn_Click"
                                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" CausesValidation="false" />

                                    &nbsp;&nbsp;<asp:Label ID="GridLineLbl" runat="server" CssClass="pagetitle"></asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                                <td align="right" class="style2"></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EqpTypelbl" runat="server">ShipmentType</asp:Label>
                                    <asp:RequiredFieldValidator ID="EqpTypeReq" runat="server" ControlToValidate="EqpTypeList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadDropDownList ID="EqpTypeList" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        OnSelectedIndexChanged="EqpTypeList_SelectedIndexChanged" AutoPostBack="True"
                                        DataTextField="Descr" DataValueField="item" Enabled="True" CausesValidation="false"
                                        Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="JobTypelbl" runat="server">JobType</asp:Label>
                                    <asp:RequiredFieldValidator ID="JobTypeReq" runat="server" ControlToValidate="JobTypeList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadDropDownList ID="JobTypeList" runat="server" AutoPostBack="True" CausesValidation="false"
                                        DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px" Skin="Sunset" OnSelectedIndexChanged="JobTypeList_SelectedIndexChanged"
                                        BackColor="Yellow">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="TptTypelbl" runat="server">TransportType</asp:Label>
                                    <asp:RequiredFieldValidator ID="TptTypeReq" runat="server" ControlToValidate="TptTypeList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadDropDownList ID="TptTypeList" runat="server" AutoPostBack="True" CausesValidation="false"
                                        DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px" Skin="Sunset"
                                        BackColor="Yellow" OnSelectedIndexChanged="TptTypeList_SelectedIndexChanged">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="expdatelbl" runat="server">StartDate</asp:Label>
                                    <asp:RequiredFieldValidator Style="z-index: 0" ID="RequiredFieldValidator6" runat="server"
                                        ControlToValidate="expDatepicker" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadDatePicker ID="expDatepicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset" AutoPostBack="true"
                                        OnSelectedDateChanged="expDatepicker_SelectedDateChanged">
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:Label ID="exptimelbl" runat="server">StartTime </asp:Label>
                                    <asp:RequiredFieldValidator ID="ExpTimeReq" runat="server" ControlToValidate="ExpTimeList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadDropDownList ID="ExpTimeList" runat="server" Enabled="True" DataTextField="Descr"
                                        CausesValidation="false" AutoPostBack="true" Skin="Sunset" DataValueField="item"
                                        Width="155px" OnSelectedIndexChanged="ExpTimeList_SelectedIndexChanged">
                                    </telerik:RadDropDownList>
                                </td>
                                <%--<td>
                                <asp:Label ID="expdatelbl" runat="server">StartDate</asp:Label>
                                <asp:CalendarExtender ID="expDateTxt_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="expDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                    Format="dd/MMM/yyyy">
                                </asp:CalendarExtender>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="expDateTxt" ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <telerik:RadTextBox ID="expDateTxt" runat="server" Width="155px"></telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="exptimelbl" runat="server">StartTime</asp:Label>
                                <asp:RequiredFieldValidator ID="ExpTimeReq" runat="server" ControlToValidate="ExpTimeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <telerik:RadDropDownList ID="ExpTimeList" runat="server" Enabled="True" DataTextField="Descr"
                                    AutoPostBack="true" DataValueField="item"  Width="155px" OnSelectedIndexChanged="ExpTimeList_SelectedIndexChanged">
                                </telerik:RadDropDownList>
                            </td>--%>
                                <td class="style1">
                                    <asp:Label ID="billoption1lbl" runat="server">BillOption1</asp:Label><br />
                                    <telerik:RadDropDownList ID="billoption1DDL" runat="server" Enabled="True" Width="155px"
                                        OnSelectedIndexChanged="BillOption1_SelectedIndexChanged" AutoPostBack="True"
                                        CausesValidation="false">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="ooglbl" runat="server">OutOfGauge</asp:Label><br />
                                    <telerik:RadDropDownList ID="OOGList" runat="server" Enabled="True" DataTextField=""
                                        DataValueField="item" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap class="style1">
                                    <asp:Label ID="sizetypelbl" runat="server">BillSizeType</asp:Label>
                                    <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" ControlToValidate="SizeTypeList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadDropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" Skin="Sunset" BackColor="Yellow" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td nowrap class="style1">
                                    <asp:Label ID="ctnrwtlbl" runat="server">ContainerWt(KG)</asp:Label>
                                    <%--<asp:RequiredFieldValidator style="Z-INDEX: 0" id="WeightReq" runat="server" ControlToValidate="WeightTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="WeightCompareVal" runat="server" ControlToValidate="WeightTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                    <telerik:RadTextBox ID="WeightTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td nowrap class="style1">
                                    <asp:Label ID="ctnrvollbl" runat="server">ContainerVol(M3)</asp:Label>
                                    <%--<asp:RequiredFieldValidator style="Z-INDEX: 0" id="VolumeReq" runat="server" ControlToValidate="VolumeTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="VolumeCompareVal" runat="server" ControlToValidate="VolumeTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                    <telerik:RadTextBox ID="VolumeTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                    <br>
                                </td>
                                <td>
                                    <asp:Label ID="enddatelbl" runat="server">EndDate</asp:Label>
                                    <br />
                                    <telerik:RadDatePicker ID="EndDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" OnSelectedDateChanged="EndDatePicker_OnDateSelectedChanged"
                                        AutoPostBack="True" CausesValidation="false">
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:Label ID="endtimelbl" runat="server">EndTime</asp:Label><br />
                                    <telerik:RadDropDownList ID="EndTimeList" runat="server" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" Width="155px" OnSelectedIndexChanged="EndTimeList_SelectedIndexChanged"
                                        AutoPostBack="True">
                                    </telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator ID="EndTimeValidator1" runat="server" ControlToValidate="EndTimeList"
                                        Enabled="false" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                </td>
                                <%--<td>
                                <asp:Label ID="enddatelbl" runat="server">EndDate</asp:Label>
                                <asp:CalendarExtender ID="endDateTxt_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="endDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                    Format="dd/MMM/yyyy">
                                </asp:CalendarExtender>
                                <br />
                                <telerik:RadTextBox ID="endDateTxt" runat="server" Width="155px"></telerik:RadTextBox>
                            </td>
                            <td class="style1">
                                <asp:Label ID="endtimelbl" runat="server">EndTime</asp:Label><br />
                                <telerik:RadDropDownList ID="EndTimeList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" Width="155px">
                                </telerik:RadDropDownList>
                            </td>--%>
                                <td class="style1">
                                    <asp:Label ID="billoption2lbl" runat="server">BillOption2</asp:Label><br />
                                    <telerik:RadDropDownList ID="billoption2DDL" runat="server" Enabled="True" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td class="style1">
                                    <asp:Label ID="overhtlbl" runat="server">OverHeight</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="OverHtTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap>
                                    <asp:Label ID="ctnrnolbl" runat="server">EquipmentReference</asp:Label>
                                    <asp:RequiredFieldValidator Style="z-index: 0" ID="CtnrNoReq" runat="server" ControlToValidate="CtnrNoTxt"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="goodswtlbl" runat="server">GoodsWt(KG)</asp:Label>
                                    <%-- <asp:RequiredFieldValidator style="Z-INDEX: 0" id="GoodsWeightReq" runat="server" ControlToValidate="GoodsWeightTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="GoodsWeightCompareVal" runat="server" ControlToValidate="GoodsWeightTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                    <telerik:RadTextBox ID="GoodsWeightTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="goodsvollbl" runat="server">GoodsVol(M3)</asp:Label>
                                    <%--<asp:RequiredFieldValidator style="Z-INDEX: 0" id="GoodsVolumeReq" runat="server" ControlToValidate="GoodsVolumeTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="GoodsVolumeCompareVal" runat="server" ControlToValidate="GoodsVolumeTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                    <telerik:RadTextBox ID="GoodsVolumeTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="goodsrevtonlbl" runat="server">GoodsRevTon</asp:Label><br />
                                    <telerik:RadTextBox ID="GoodsRevTonTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="bktimeLbl" runat="server">BookingTime</asp:Label><br />
                                    <telerik:RadDatePicker ID="bookingtimeDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                    </telerik:RadDatePicker>
                                    <br />
                                </td>
                                <td nowrap class="style3">
                                    <asp:Label ID="bkRefLbl" runat="server">BookingRef</asp:Label><br />
                                    <telerik:RadTextBox ID="bkRefTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td class="style1">
                                    <asp:Label ID="overlenFlbl" runat="server">OL(Front, cm)</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="OverLenFTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap valign="top">
                                    <asp:Label ID="sealnolbl" runat="server">SealNo</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="SealNoTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="remarkslbl" runat="server">Remarks</asp:Label>
                                    <br>
                                    <telerik:RadTextBox Style="z-index: 0" ID="remarksTxt" runat="server" Rows="3" TextMode="MultiLine"
                                        Width="155px" Height="80px">
                                    </telerik:RadTextBox><br />
                                    <asp:Label ID="Label3" runat="server">SpecialInstruction</asp:Label>
                                    <br>
                                    <telerik:RadTextBox Style="z-index: 0" ID="spinstruTxt" runat="server" Rows="3" TextMode="MultiLine"
                                        Width="155px" Height="80px">
                                    </telerik:RadTextBox>
                                </td>
                                <td nowrap valign="top">
                                    <asp:Label ID="qtyLbl" runat="server">EqpQty</asp:Label>
                                    <asp:CompareValidator Style="z-index: 0" ID="Comparevalidator1" runat="server" ControlToValidate="QtyTxt"
                                        ErrorMessage="#" Type="Integer" ValueToCompare="0" Operator="GreaterThanEqual"></asp:CompareValidator><br>
                                    <telerik:RadTextBox ID="QtyTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="Label1" runat="server">GoodsDescription</asp:Label>
                                    <br>
                                    <telerik:RadTextBox Style="z-index: 0" ID="descrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                        Width="155px" Height="80px">
                                    </telerik:RadTextBox>
                                </td>
                                <td nowrap valign="top">
                                    <asp:Label ID="frserviceptlbl" runat="server">CollectFrom</asp:Label>
                                    <%--<asp:RequiredFieldValidator id="FrServiceTypeReq" runat="server" ControlToValidate="FrServicePointList" ErrorMessage="*"></asp:RequiredFieldValidator>--%><br>
                                    <telerik:RadComboBox ID="FrServicePointList" runat="server" Width="155px" Filter="Contains"
                                        CausesValidation="false" Skin="WebBlue" AllowCustomText="false" DropDownWidth="500px"
                                        Enabled="True" DataTextField="Descr" DataValueField="item" OnSelectedIndexChanged="FrServicePointList_SelectedIndexChanged"
                                        AutoPostBack="True">
                                    </telerik:RadComboBox>
                                    <%--<asp:Label ID="fraddrlbl" runat="server">From Address</asp:Label>--%>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="FrAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                        Width="155px" Height="80px">
                                    </telerik:RadTextBox>
                                </td>
                                <td nowrap valign="top" class="style2">
                                    <asp:Label ID="toserviceptlbl" runat="server">DeliverTo</asp:Label>
                                    <%--<asp:RequiredFieldValidator id="ToServiceTypeReq" runat="server" ControlToValidate="ToServicePointList" ErrorMessage="*"></asp:RequiredFieldValidator>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;<br>
                                    <telerik:RadComboBox ID="ToServicePointList" runat="server" Filter="Contains" CausesValidation="false"
                                        Skin="WebBlue" AllowCustomText="false" DropDownWidth="500px" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" OnSelectedIndexChanged="ToServicePointList_SelectedIndexChanged"
                                        AutoPostBack="True" Width="155px">
                                    </telerik:RadComboBox>
                                    <%--<asp:Label ID="toaddrlbl" runat="server">To Address</asp:Label>--%>&nbsp;&nbsp;&nbsp;
                                <br />
                                    <br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="ToAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                        Width="155px" Height="80px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="BlNoLbl" runat="server">BlNo</asp:Label><br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="BlNoTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="PermitNoLbl" runat="server">PermitNo</asp:Label><br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="PermitNoTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="PortNetNoLbl" runat="server">PortNetNo</asp:Label><br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="PortNetNoTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td nowrap class="style2" valign="top">                                   
                                    <asp:Label ID="TransporterLbl" runat="server">VendorOpCode</asp:Label><br />                                   
                                    <telerik:RadComboBox ID="TransporterCodeTxt" runat="server" Filter="Contains" CausesValidation="false"
                                    Skin="WebBlue" AllowCustomText="false" DropDownWidth="500px" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" AutoPostBack="True" OnSelectedIndexChanged="TransporterCodeTxt_SelectedIndexChanged" Width="155px">
                                    </telerik:RadComboBox>                                     
                                     <%--<telerik:RadTextBox ID="TransporterCodeTxt" runat="server" AutoPostBack="True" OnTextChanged="TransporterCodeTxt_TextChanged"
                                        CausesValidation="false" Width="155px">
                                    </telerik:RadTextBox>--%>
                                    <%--<asp:LinkButton ID="LookupBtn" runat="server" CausesValidation="False" OnClick="LookupBtn_Click">
                                        <img align="absmiddle" border="0" src="../../image/icon-lookup.gif"></asp:LinkButton>--%>
                                    <br />
                                    <asp:Label ID="TransporternameLbl" runat="server">VendorOpName</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="TransporterNameTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    &nbsp;&nbsp;&nbsp;
                                <br />
                                    <asp:Label ID="NoofPackagesLbl0" runat="server">NoOfPackages</asp:Label><br />
                                    <telerik:RadTextBox ID="NoofPackagesTxt0" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="NoofPalletLbl1" runat="server">NoOfPallets</asp:Label><br />
                                    <telerik:RadTextBox ID="NoofPalletsTxt1" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="NoOfTripsLbl" runat="server">NoOfTrips</asp:Label><br />
                                    <telerik:RadTextBox ID="NoOfTripsTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="RequireMPChkBox" runat="server" Text="ReqManpowerSupport" />
                                </td>
                                <td class="style1" valign="top">
                                    <asp:Label ID="orgbkrefLbl" runat="server">OriginalBookingRef</asp:Label><br />
                                    <telerik:RadTextBox ID="orgbkRefTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="quaycranelbl" runat="server">QuayCrane</asp:Label><br />
                                    <telerik:RadTextBox ID="QuayCraneTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="cellnolbl" runat="server">CellNo</asp:Label><br />
                                    <telerik:RadTextBox ID="CellNoTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="NoOfHoursLbl" runat="server">NoOfHours</asp:Label><br />
                                    <telerik:RadTextBox ID="NoOfHoursTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="NoOfHeadCountLbl" runat="server">NoOfHeadCount</asp:Label><br />
                                    <telerik:RadTextBox ID="NoOfHeadCountTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="DetentionExpiryDateLBl" runat="server">DetentionExpiryDate</asp:Label><br />
                                    <telerik:RadDatePicker ID="DetentionExpDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                    </telerik:RadDatePicker>
                                </td>
                                <td valign="top">
                                    <asp:Label ID="overlenRlbl" runat="server">OL(Rear, cm)</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="OverLenRTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="overwtlbl" runat="server">OW(Left,cm)</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="OverWtLTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="overwidrightlbl" runat="server">OW(Right, cm)</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="OverWidRTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <asp:Label ID="PoliceEsc_Lbl" runat="server">PoliceEscort</asp:Label>
                                    <br />
                                    <telerik:RadDropDownList ID="PolEsc_ddl" runat="server" Enabled="True" Width="155px">
                                    </telerik:RadDropDownList>
                                    <br />
                                    <asp:Label ID="Label2" runat="server">OutRider</asp:Label>
                                    <br />
                                    <telerik:RadDropDownList ID="outrider_ddl" runat="server" Enabled="True" Width="155px">
                                    </telerik:RadDropDownList>
                                    <br />
                                    <asp:Label ID="ltapermitnoLbl" runat="server">LTAPermitNo</asp:Label>
                                    <br />
                                    <telerik:RadTextBox ID="ltapermitTxt" runat="server" Style="z-index: 0" Width="155px">
                                    </telerik:RadTextBox>
                                    <telerik:RadTextBox ID="TransporterIdTxt" runat="server" Style="z-index: 0" Visible="false"
                                        Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="CntAddPanel" runat="server" Visible="False">
                        <table id="Table2" border="0" cellspacing="0" cellpadding="0" width="90%">
                            <tr>
                                <td colspan="3">
                                    <br />

                                    <asp:Button ID="Redobtn" runat="server" CssClass="white" Text=" Redo " OnClick="Redobtn_Click"
                                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" Visible="false" />

                                    <asp:Button ID="Validatebtn" runat="server" CssClass="white" Text="Validate" OnClick="Validatebtn_Click"
                                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />

                                    <asp:Button ID="SaveBtn2" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn2_Click" Visible="false" />

                                    <asp:Button ID="ClosePanelBtn2" runat="server" CssClass="white" Text="Hide" OnClick="ClosePanelBtn2_Click"
                                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                                </td>
                                <%--<td colspan="3">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                            <td align="right" class="style2">
                            </td>--%>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server">ShipmentType</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ShpTypeList"
                                        ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadDropDownList ID="ShpTypeList" runat="server" Skin="Sunset" BackColor="Yellow"
                                        OnSelectedIndexChanged="ShpTypeList_SelectedIndexChanged" AutoPostBack="True"
                                        DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server">JobType</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="JobTypList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadDropDownList ID="JobTypList" runat="server" AutoPostBack="True" Skin="Sunset"
                                        BackColor="Yellow" DataTextField="Descr" DataValueField="item" Enabled="True"
                                        Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="TransTypeLbl" runat="server">TransportType</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TransTypeList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadDropDownList ID="TransTypeList" runat="server" AutoPostBack="True" Skin="Sunset"
                                        BackColor="Yellow" DataTextField="Descr" DataValueField="item" Enabled="True"
                                        Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="BillTypeLbl" runat="server">BillSizeType</asp:Label>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="BillTypeList"
                                    ErrorMessage="*" ></asp:RequiredFieldValidator>--%>
                                    <br />
                                    <telerik:RadDropDownList ID="BillTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" Skin="Sunset" BackColor="Yellow" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="expDateLbl1" runat="server">StartDate</asp:Label>
                                    <%-- <asp:RequiredFieldValidator Style="z-index: 0" ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="expStartDate" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                    <br />
                                    <telerik:RadDatePicker ID="expStartDate" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:Label ID="STimelbl" runat="server">StartTime </asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ExpTimeList1"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadDropDownList ID="ExpTimeList1" runat="server" Enabled="True" DataTextField="Descr"
                                        CausesValidation="false" AutoPostBack="true" DataValueField="item" Skin="Sunset"
                                        BackColor="Yellow" Width="155px" OnSelectedIndexChanged="ExpTimeList1_SelectedIndexChanged">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <asp:Label ID="ContNolbl" runat="server">ContainerNo</asp:Label>
                                    <br>
                                    <telerik:RadTextBox Style="z-index: 0" ID="ContNoTxt" runat="server" Rows="3" Skin="Sunset"
                                        BackColor="#ded7c6" TextMode="MultiLine" Width="155px" Height="90px" OnTextChanged="ContNoTxt_TextChanged"
                                        AutoPostBack="true">
                                    </telerik:RadTextBox>
                                </td>
                                <td valign="top">
                                    <asp:Label ID="Sealnumlbl" runat="server">SealNo</asp:Label>
                                    <br>
                                    <telerik:RadTextBox Style="z-index: 0" ID="SealNumtxt" runat="server" Rows="3" Skin="WebBlue"
                                        TextMode="MultiLine" Width="155px" Height="90px">
                                    </telerik:RadTextBox>
                                </td>
                                <td valign="top">
                                    <asp:Label ID="ctnrwtlbl1" runat="server">ContainerWt(KG)</asp:Label>
                                    <br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="CtnrWtTxt" runat="server" Rows="3" Skin="WebBlue"
                                        TextMode="MultiLine" Width="155px" Height="90px">
                                    </telerik:RadTextBox>
                                </td>
                                <td valign="top">
                                    <asp:Label ID="goodswtlbl1" runat="server">GoodsWt(KG)</asp:Label>
                                    <br>
                                    <telerik:RadTextBox ID="GoodsWtTxt" runat="server" Skin="WebBlue" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td valign="top">
                                    <asp:Label ID="remarkslbl1" runat="server">Remarks</asp:Label>
                                    <br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="cntremarksTxt" runat="server" Skin="WebBlue"
                                        Rows="3" TextMode="MultiLine" Width="155px" Height="80px">
                                    </telerik:RadTextBox>
                                </td>
                                <td colspan="5">
                                    <asp:Label Style="z-index: 0" ID="DuplicateCntMsg" Visible="false" runat="server"
                                        CssClass="errorLabelBig"></asp:Label>
                                    <br>
                                    <asp:Label Style="z-index: 0" ID="DuplicateItemMsg" Visible="false" runat="server"
                                        CssClass="errorLabelBig"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowPaging="true" AllowSorting="true" Skin="Metro" AllowFilteringByColumn="true"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            OnDetailTableDataBind="ResultDG_DetailTableDataBind">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true"
                Selecting-AllowRowSelect="true" />
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                HierarchyLoadMode="Client">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" Width="100%" SkinID="Telerik" HeaderStyle-BackColor="#05538C" HeaderStyle-ForeColor="White"
                        AllowFilteringByColumn="false" AllowPaging="false" TableLayout="Fixed">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="150px">
                                <ItemTemplate>
                                    <a id="TripDetlEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="CtnrTripDetail_Edit"
                                        runat="server">
                                        <img id="Img1" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                            title="Edit" runat="server" /></a> <a id="OutsourceBtn" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onserverclick="Outsource_Click" runat="server">
                                                <img id="OutsourceImg" src="../../image/outsource.png" width="15" height="15" border="0"
                                                    alt="Outsource" title="Outsource" visible="false" runat="server" /></a>
                                    <a id="A4" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="Remarks_Click"
                                        runat="server">
                                        <img id="Img7" src="../../image/remarks.png" width="15" height="15" border="0" alt="Add Remarks"
                                            title="Add Remarks" runat="server" /></a> <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm copy?')" onserverclick="CtnrTripDetail_Copy"
                                                runat="server">
                                                <img id="Img4" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy exact"
                                                    title="Copy exact" runat="server" /></a> <a id="A1" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                        onclick="return confirm('Confirm copy with reverse address?')" onserverclick="CtnrTripDetail_CopyRA"
                                                        runat="server">
                                                        <img id="Img5" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy reverse address"
                                                            title="Copy reverse address" runat="server" /></a> <a id="A2" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                onserverclick="CtnrTripDetail_Detour" runat="server">
                                                                <img id="Img3" src="../../image/detour.png" width="15" height="15" border="0" alt="Detour"
                                                                    title="Detour" runat="server" /></a> <a id="TripDetlDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                        onclick="return confirm('All associated service chit & incentive for this trip will be voided as well. Confirm Void?')"
                                                                        onserverclick="CtnrTripDetail_Delete" runat="server">
                                                                        <img id="Img2" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                                            title="Delete" runat="server" /></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" ColumnGroupName="id"
                                SortExpression="id" UniqueName="id" Reorderable="true" Display="false" HeaderStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="jbid" DataField="jbid" AllowFiltering="true"
                                ColumnGroupName="jbid" SortExpression="jbid" UniqueName="jbid" Reorderable="true"
                                Display="false" HeaderStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="jbctnrid" DataField="jbctnrid" AllowFiltering="true"
                                ColumnGroupName="jbctnrid" SortExpression="jbctnrid" UniqueName="jbctnrid" Reorderable="true"
                                Display="false" HeaderStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FromDate" DataField="frexpdate" AllowFiltering="true"
                                ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate" HeaderStyle-Width="100px"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToDate" DataField="toactdate" AllowFiltering="true"
                                ColumnGroupName="toactdate" SortExpression="toactdate" UniqueName="toactdate" HeaderStyle-Width="100px"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" HeaderStyle-Width="450px"
                                HeaderText="Status" />
                            <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true" HeaderStyle-Width="450px"
                                ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true"
                                HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ShipmentType" DataField="eqptypedescr" AllowFiltering="true"
                                Display="false" ColumnGroupName="eqptypedescr" SortExpression="eqptypedescr"
                                UniqueName="eqptypedescr" Reorderable="true" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EqpRef" DataField="ctnrno" AllowFiltering="true"
                                Display="false" ColumnGroupName="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno"
                                Reorderable="true" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SealNo" DataField="sealno" AllowFiltering="true" HeaderStyle-Width="100px"
                                ColumnGroupName="sealno" SortExpression="sealno" UniqueName="sealno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="ctnrtype" AllowFiltering="true"
                                Display="false" ColumnGroupName="ctnrtype" SortExpression="ctnrtype" UniqueName="ctnrtype"
                                Reorderable="true" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BookingRef" DataField="bookingref" AllowFiltering="true"
                                ColumnGroupName="bookingref" SortExpression="bookingref" UniqueName="bookingref"
                                Display="false" Reorderable="true" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BookingRefOriginal" DataField="bookingreforiginal"
                                AllowFiltering="true" ColumnGroupName="bookingreforiginal" SortExpression="bookingreforiginal"
                                Display="false" UniqueName="bookingreforiginal" Reorderable="true" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Trip" DataField="tripcount" AllowFiltering="true"
                                ColumnGroupName="tripcount" SortExpression="tripcount" UniqueName="tripcount"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="1000px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddrShort" AllowFiltering="true"
                                ColumnGroupName="fraddrShort" SortExpression="fraddrShort" UniqueName="fraddrShort"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="1000px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddrShort" AllowFiltering="true"
                                ColumnGroupName="toaddrShort" SortExpression="toaddrShort" UniqueName="toaddrShort"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FrSvcPt" DataField="frservicept" AllowFiltering="true"
                                ColumnGroupName="frservicept" SortExpression="frservicept" Display="false" UniqueName="frservicept"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true"
                                ColumnGroupName="fraddr" SortExpression="fraddr" Display="false" UniqueName="fraddr"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToSvcPt" DataField="toservicept" AllowFiltering="true"
                                ColumnGroupName="toservicept" SortExpression="toservicept" Display="false" UniqueName="toservicept"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true"
                                ColumnGroupName="toaddr" SortExpression="toaddr" Display="false" UniqueName="toaddr"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" AllowFiltering="true"
                                ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno" Reorderable="true"
                                HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="perid" SortExpression="perid"
                                HeaderText="PerId" />
                            <telerik:GridBoundColumn HeaderText="AssignDriver" DataField="pername" AllowFiltering="true"
                                ColumnGroupName="pername" SortExpression="pername" UniqueName="pername" Reorderable="true"
                                HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailerno" AllowFiltering="true"
                                ColumnGroupName="trailerno" SortExpression="trailerno" UniqueName="trailerno"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SchTime" DataField="frexptime" AllowFiltering="true"
                                ColumnGroupName="frexptime" SortExpression="frexptime" UniqueName="frexptime"
                                Display="false" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TripOption" DataField="sectordescr" AllowFiltering="true"
                                ColumnGroupName="sectordescr" SortExpression="sectordescr" UniqueName="sector" Reorderable="true"
                                HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SvcChit" DataField="svcchitno" AllowFiltering="true"
                                ColumnGroupName="svcchitno" SortExpression="svcchitno" UniqueName="svcchitno"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TrailerLoc" DataField="traileraddr" AllowFiltering="true"
                                ColumnGroupName="traileraddr" SortExpression="traileraddr" UniqueName="traileraddr"
                                Display="false" Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GeoLat" DataField="trailergeolat" AllowFiltering="true"
                                ColumnGroupName="trailergeolat" SortExpression="trailergeolat" UniqueName="trailergeolat"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GeoLng" DataField="trailergeolng" AllowFiltering="true"
                                ColumnGroupName="trailergeolng" SortExpression="trailergeolng" UniqueName="trailergeolng"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PickDropDate" DataField="trailerdate" AllowFiltering="true"
                                ColumnGroupName="trailerdate" SortExpression="trailerdate" UniqueName="trailerdate"
                                Display="false" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TripRemarks" DataField="remarks" AllowFiltering="true"
                                ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks" Reorderable="true"
                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="3000px" ItemStyle-Width="3000px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TripRemarks(DriverOnly)" DataField="remarks2"
                                AllowFiltering="true" ColumnGroupName="remarks2" SortExpression="remarks2" UniqueName="remarks2"
                                Reorderable="true" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="3000px"
                                ItemStyle-Width="3000px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="JBCtnr_Copy"
                                runat="server">
                                <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                    title="Copy" runat="server" /></a> <a id="EscortLbl" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onserverclick="EscortBtn_Click" runat="server">
                                        <img id="Img3" src="../../image/PoliceEscort.jpg" width="15" height="15" border="0"
                                            title="Police Escort" alt="Police Escort" runat="server"></a>
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                            <%-- <asp:ImageButton runat="server" Visible="True" ID="PrintBtn" ImageUrl="../../image/printer.png"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Print LTA Form"
                                OnClick="PrintBtn_Click" CausesValidation="False"></asp:ImageButton>--%>
                            <asp:Label ID="PrintLbl" runat="server" />
                            <a id="lnkPrint" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Print LTA?')"
                                onserverclick="PrintBtn_Click" runat="server">
                                <img id="printImg" src="../../image/printer.png" width="15" height="15" border="0"
                                    alt="Print LTA" runat="server"></a>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="Detail_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    runat="server"></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="eqptypedescr" SortExpression="eqptypedescr" HeaderText="ShipmentType"
                        ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eqptype" SortExpression="eqptype" Display="false"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" Display="false" />
                    <telerik:GridBoundColumn DataField="jobtypedescr" SortExpression="jobtypedescr" HeaderText="JobType"
                        ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tpttypedescr" SortExpression="tpttypedescr" HeaderText="TptType"
                        ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrtypedescr" SortExpression="ctnrtypedescr"
                        HeaderText="BillSizeType" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="bkref" SortExpression="bkref" HeaderText="BookingRef"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="EqpRef"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrnosealno" SortExpression="ctnrnosealno" HeaderText="EqpRef / SealNo"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="SealNo"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="CtnrWt"
                        DataFormatString="{0:#,0.000}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrvol" SortExpression="ctnrvol" HeaderText="CtnrVol"
                        DataFormatString="{0:#,0.000}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="GoodsWt"
                        DataFormatString="{0:#,0.000}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="GoodsVol"
                        DataFormatString="{0:#,0.000}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="goodsrevton" SortExpression="goodsrevton" HeaderText="GoodsRevTon"
                        DataFormatString="{0:#,0.000}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="noofplt" HeaderText="Pallets" SortExpression="noofplt"
                        ItemStyle-Wrap="False" AllowFiltering="false" ItemStyle-HorizontalAlign="Center"
                        DataFormatString="{0:N}" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="frservicept" SortExpression="frservicept" HeaderText="FrServicePt"
                        Display="false" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toservicept" SortExpression="toservicept" HeaderText="ToServicePt"
                        Display="false" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="StartDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exptime" SortExpression="exptime" HeaderText="StartTime"
                        Display="false" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="enddate" HeaderText="EndDate" Visible="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="endtime" SortExpression="endtime" HeaderText="EndTime"
                        Display="false" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fraddrShort" SortExpression="fraddrShort" HeaderText="FrAddr"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toaddrShort" SortExpression="toaddrShort" HeaderText="ToAddr"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="frserviceptdescr" SortExpression="frserviceptdescr"
                        Display="false" HeaderText="FrSvcPt" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FrAddr"
                        Display="false" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toserviceptdescr" SortExpression="toserviceptdescr"
                        Display="false" HeaderText="ToSvcPt" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddr"
                        Display="false" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="billoption1descr" SortExpression="billoption1descr"
                        HeaderText="BillOption1" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="billoption2descr" SortExpression="billoption2descr"
                        HeaderText="BillOption2" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eqpgoodsdescr" SortExpression="billoption2descr"
                        HeaderText="GoodsDescr " ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="noofpkg" HeaderText="NoOfPkg" SortExpression="noofpkg"
                        ItemStyle-Wrap="False" AllowFiltering="false" ItemStyle-HorizontalAlign="Center"
                        DataFormatString="{0:N}" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eqpspecialinstruction" SortExpression="eqpspecialinstruction"
                        HeaderText="SpecialInstruction" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eqpremarks" SortExpression="eqpremarks" HeaderText="EqpRemarks"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="outriderdescr" SortExpression="outriderdescr"
                        HeaderText="OutRider" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ltapermitno" SortExpression="ltapermitno" HeaderText="LTAPermitNo"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RequireManpowerSupport" SortExpression="RequireManpowerSupport"
                        HeaderText="ReqManSupport" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="overht" SortExpression="overht" HeaderText="OverHt"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="overlengthfront" SortExpression="overlengthfront"
                        HeaderText="OL(Front)" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="overlengthrear" SortExpression="overlengthrear"
                        HeaderText="OL(Rear)" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="overwidthleft" SortExpression="overwidthleft"
                        HeaderText="OW(Left)" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="overwidthright" SortExpression="overwidthright"
                        HeaderText="OW(Right)" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="nooftrips" SortExpression="nooftrips" HeaderText="NoOfTrips"
                        DataFormatString="{0:#,0.0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="noofhours" SortExpression="noofhours" HeaderText="NoOfHours"
                        DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="noofheadcount" SortExpression="noofheadcount"
                        HeaderText="NoOfPax" DataFormatString="{0:#,0.0}" ItemStyle-HorizontalAlign="Right"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="bkreforiginal" SortExpression="bkreforiginal"
                        HeaderText="OriginalBookingRef" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Descr"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tpterid" SortExpression="tpterid" HeaderText="TransporterId"
                        Display="false" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tptercode" SortExpression="tptercode" HeaderText="Vendor"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tptername" SortExpression="tptername" HeaderText="Name"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="oog" SortExpression="oog" HeaderText="OOG" ItemStyle-HorizontalAlign="Right"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="bookingtime" SortExpression="bookingtime" HeaderText="BookingTime"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False" DataFormatString="{0:dd/MMM/yyyy HH:mm}"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DetentionExpiryDate" SortExpression="DetentionExpiryDate" HeaderText="DetentionExpiryDate"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False" DataFormatString="{0:dd/MMM/yyyy}"
                        HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="quaycrane" SortExpression="quaycrane" HeaderText="QuayCrane"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cellno" SortExpression="cellno" HeaderText="CellNo"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sno" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="policeescort" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="policeescortby" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="billoption1" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="billoption2" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eqpdescr" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eqpspecialinstruction" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eqpremarks" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="billoption2" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="blno" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="permitno" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="portnetno" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jobtype" Display="false" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tpttype" Display="false" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
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
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <%--Message Confrim area start--%>
        <asp:Button runat="server" ID="btnConfrimPopUp" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeConfirmPopup" runat="server" PopupControlID="pnlConfirmBox"
            TargetControlID="btnConfrimPopUp" CancelControlID="btnCancel_Confirm" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlConfirmBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk_Confirm">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblConfirmPopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrConfirmPopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblConfirmPopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk_Confirm" runat="server" Text="OK" OnClick="btnOkConfirm_Click" />
                                </div>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnCancel_Confirm" runat="server" Text="Cancel" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message Confrim area end--%>
    </form>
</body>
</html>
