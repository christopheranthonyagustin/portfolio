<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3Container.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3Container" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Container @ GoodsReceiveV2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .style1 {
            height: 28px;
        }

        .style2 {
            height: 36px;
        }

        .DropZone1 {
            width: 200px;
            height: 90px;
            background-color: #F2F2F2;
            border-color: #CCCCCC;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 5px;
            position: relative;
        }
    </style>
    <script language="Javascript" type="text/javascript">
       <!--
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    //-->
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultItemDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">
                    <asp:Button ID="AddDetailBtn" runat="server" OnClick="AddDetailBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" Text="New" Visible="false" />
                    &nbsp;
                     <asp:Button ID="GRNBtn" runat="server" OnClick="GRNBtnBtn_Click"
                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" Text="GRN" Visible="true" />
                    &nbsp;
                    <asp:Button ID="ContainerTallyBtn" CssClass="LongLabelBlue" runat="server" OnClick="ContainerTallyBtn_Click" Text="Container Tally Sheet"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false" />
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <table id="Table2" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="4" class="style1">&nbsp;
                             <asp:Button ID="SaveNextBtn" runat="server" Text="Save+Next" ToolTip="SaveAndNext" OnClick="SaveNextBtn_Click"
                                 OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white" />
                                    &nbsp;
                              <asp:Button ID="SaveBtn" runat="server" Text="Save" ToolTip="Save" OnClick="SaveBtn_Click"
                                  OnClientClick="disableBtn(this.id,false); this.value = 'Processing...';" UseSubmitBehavior="false" class="white" />
                                    &nbsp;
                                   <asp:Button ID="ClosePanelBtn" runat="server" Text="Hide" ToolTip="Hide" OnClick="ClosePanelBtn_Click"
                                       OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white" CausesValidation="False" />
                                    &nbsp;
                                    <asp:Button ID="PrintChecklistBtn" runat="server" Text="Print Checklist" ToolTip="Print Checklist" OnClick="PrintChecklistBtn_Click"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" CausesValidation="False" />
                                    &nbsp;
                                    <asp:Button ID="PrintTallySheetBtn" runat="server" Text="Print Tally Sheet" ToolTip="Print Tally Sheet" OnClick="PrintTallySheetBtn_Click"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelBlue" CausesValidation="False" />
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false"
                            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                            <Tabs>
                                <telerik:RadTab Text="General" Value="0" runat="server">
                                </telerik:RadTab>
                                <telerik:RadTab Text="Checklist" Value="100" runat="server">
                                </telerik:RadTab>
                                <telerik:RadTab ID="AttcTab" Text="Attc" Value="200" runat="server">
                                </telerik:RadTab>
                                <telerik:RadTab ID="ItemsTab" Text="Items" Value="300" runat="server">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <br />
                        &nbsp;
                                 <asp:Panel ID="FormPanel" runat="server" Visible="True">
                                     <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                                         <tr>
                                             <td nowrap class="style2">ContainerNo
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="CtnrNoReq" runat="server" ControlToValidate="CtnrNoTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                                 <telerik:RadTextBox ID="CtnrNoTxt" runat="server" BackColor="Yellow">
                                                 </telerik:RadTextBox>
                                             </td>
                                             <td nowrap class="style2">Size/Type
                               
                                <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" ControlToValidate="SizeTypeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                                 <telerik:RadDropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                                     DataValueField="item" BackColor="Yellow" Skin="WebBlue">
                                                 </telerik:RadDropDownList>
                                             </td>
                                             <td nowrap>SealNo
                                <br>
                                                 <telerik:RadTextBox ID="SealNoTxt" runat="server" Style="z-index: 0">
                                                 </telerik:RadTextBox>
                                             </td>

                                             <td nowrap class="style2">CargoPackingType
                                <br>
                                                 <telerik:RadDropDownList ID="CargoPackingTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                                     DataValueField="item" BackColor="Yellow" Skin="WebBlue">
                                                 </telerik:RadDropDownList>
                                             </td>

                                             <td nowrap>&nbsp;
                                             </td>
                                             <td nowrap>&nbsp;
                                             </td>
                                         </tr>
                                         <tr>
                                             <td nowrap class="style2" valign="top">ContainerWt<br>
                                                 <telerik:RadTextBox ID="WeightTxt" runat="server">
                                                 </telerik:RadTextBox>
                                             </td>
                                             <td nowrap class="style2" valign="top">ContainerVol<br />
                                                 <telerik:RadTextBox ID="VolumeTxt" runat="server">
                                                 </telerik:RadTextBox>
                                             </td>
                                             <td nowrap class="style2" valign="top">GoodsWt<br>
                                                 <telerik:RadTextBox ID="GoodsWeightTxt" runat="server">
                                                 </telerik:RadTextBox>
                                             </td>
                                             <td nowrap class="style2" valign="top">GoodsVol<br />
                                                 <telerik:RadTextBox ID="GoodsVolumeTxt" runat="server">
                                                 </telerik:RadTextBox>
                                             </td>
                                             <td nowrap>&nbsp;
                                             </td>

                                         </tr>
                                         <tr>

                                             <td nowrap class="style2" valign="top">ExpGateInDate<br />
                                                 <telerik:RadDateTimePicker ID="ExpGateInDateTimePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                     DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="150px">
                                                     <Calendar>
                                                         <SpecialDays>
                                                             <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                         </SpecialDays>
                                                     </Calendar>
                                                     <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                                 </telerik:RadDateTimePicker>
                                             </td>

                                             <td nowrap class="style2" valign="top">ExpGateOutDate<br />
                                                 <telerik:RadDateTimePicker ID="ExpGateOutDateTimePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                     DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="150px">
                                                     <Calendar>
                                                         <SpecialDays>
                                                             <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                         </SpecialDays>
                                                     </Calendar>
                                                     <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                                 </telerik:RadDateTimePicker>
                                             </td>

                                             <td nowrap class="style2" valign="top">ActGateInDate<br />
                                                 <telerik:RadDateTimePicker ID="ActGateInDateTimePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                     DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="150px">
                                                     <Calendar>
                                                         <SpecialDays>
                                                             <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                         </SpecialDays>
                                                     </Calendar>
                                                     <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                                 </telerik:RadDateTimePicker>
                                             </td>

                                             <td nowrap class="style2" valign="top">ActGateOutDate<br />
                                                 <telerik:RadDateTimePicker ID="ActGateOutDateTimePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                     DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="150px">
                                                     <Calendar>
                                                         <SpecialDays>
                                                             <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                         </SpecialDays>
                                                     </Calendar>
                                                     <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                                 </telerik:RadDateTimePicker>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td nowrap class="style2">CtnrStatus
                                <br>
                                                 <telerik:RadDropDownList ID="CtnrStatusList" runat="server" Enabled="True" DataTextField="Descr"
                                                     DataValueField="item" BackColor="Yellow" Skin="WebBlue">
                                                 </telerik:RadDropDownList>
                                             </td>

                                             <td nowrap class="style2" valign="top">DockCode<br>
                                                 <telerik:RadDropDownList ID="DockCodeList" DataTextField="Descr"
                                                     DataValueField="code" runat="server">
                                                 </telerik:RadDropDownList>
                                             </td>

                                             <td nowrap class="style2" valign="top">DetentionExpiryDate<br />
                                                 <telerik:RadDateTimePicker ID="DetentionExpiryDateTimePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                     DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="150px">
                                                     <Calendar>
                                                         <SpecialDays>
                                                             <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                         </SpecialDays>
                                                     </Calendar>
                                                     <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                                 </telerik:RadDateTimePicker>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td nowrap class="style2">Remarks<br>
                                                 <telerik:RadTextBox Style="z-index: 0" ID="remarksTxt" runat="server" Rows="3" TextMode="MultiLine"
                                                     Width="210px">
                                                 </telerik:RadTextBox>
                                             </td>
                                             <td nowrap class="style2" valign="top">
                                                 <asp:Label ID="ChokingWoodLabel" runat="server" Text="<b>Choking Wood</b>" /><br />
                                                 <telerik:RadTextBox ID="ChokingWoodTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                             </td>
                                             <td nowrap class="style2" valign="top">
                                                 <asp:Label ID="TareWeightLabel" runat="server" Text="<b>Tare Weight</b>" /><br />
                                                 <telerik:RadTextBox ID="TareWeightTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                             </td>
                                             <td nowrap class="style2" valign="top">
                                                 <asp:Label ID="VerifiedGrossMassLabel" runat="server" Text="<b>VGM</b>" /><br />
                                                 <telerik:RadTextBox ID="VerifiedGrossMassTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                             </td>
                                         </tr>
                                     </table>
                                 </asp:Panel>
                        <asp:Panel ID="CheckListPanel" runat="server" Visible="False">
                            &nbsp;<asp:Label ID="Label1" Text="Container Information" Font-Size="15px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label2" Text="(The physical integrity of the container structure must be verified prior to unloading.)" Font-Size="15px" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                            <table id="CheckListTable" border="1 " cellspacing="0" cellpadding="1" width="70%">
                                <%-- <tr>
                                    <td colspan="6"><b>(1)&nbsp;Checking on Seal</b></td>
                                </tr>
                                <tr>
                                    <td align="right">(a)</td>
                                    <td>Is seal integrity verified during pickup and/or prior to unsealing/unloading                                        
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="Seal_id1" runat="server" Text="Yes" />
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox runat="server" ID="SealARem" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">(b)</td>
                                    <td>Is the View-Verify-Tug-Twist method used before unsealing                                    
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="Seal_id2" runat="server" Text="Yes" />
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox runat="server" ID="SealBRem" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="6"><b>(2)&nbsp;Undercarriage</b></td>
                                </tr>
                                <tr>
                                    <td align="right">(a)</td>
                                    <td>Support beams are visible                                        
                                    </td>
                                    <td align="left">
                                        <asp:RadioButton ID="UC_id1" runat="server" Text="Yes" GroupName="UCGroup" />
                                        <asp:RadioButton ID="UC_id2" runat="server" Text="No" GroupName="UCGroup" />
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox runat="server" ID="UCRem" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="6"><b>(3)&nbsp;Outside/Inside Doors</b></td>
                                </tr>
                                <tr>
                                    <td align="right">(a)</td>
                                    <td>Secure and reliable locking mechanisms                                        
                                    </td>
                                    <td align="left">
                                        <asp:RadioButton ID="DoorA_id1" runat="server" Text="Yes" GroupName="DoorAGroup" />
                                        <asp:RadioButton ID="DoorA_id2" runat="server" Text="No" GroupName="DoorAGroup" />
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox runat="server" ID="DoorARem" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">(b)</td>
                                    <td>All bonding materials are same color                                        
                                    </td>
                                    <td align="left">
                                        <asp:RadioButton ID="DoorB_id1" runat="server" Text="Yes" GroupName="DoorBGroup" />
                                        <asp:RadioButton ID="DoorB_id2" runat="server" Text="No" GroupName="DoorBGroup" />
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox runat="server" ID="DoorBRem" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">(c)</td>
                                    <td>No Loose Bolts/Plates and repairs                                        
                                    </td>
                                    <td align="left">
                                        <asp:RadioButton ID="DoorC_id1" runat="server" Text="Yes" GroupName="DoorCGroup" />
                                        <asp:RadioButton ID="DoorC_id2" runat="server" Text="No" GroupName="DoorCGroup" />
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox runat="server" ID="DoorCRem" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="6"><b>(4)&nbsp;Left Side & Right Side</b></td>
                                </tr>
                                <tr>
                                    <td align="right">(a)</td>
                                    <td>No unusual repairs to structural beams                                        
                                    </td>
                                    <td align="left">
                                        <asp:RadioButton ID="SideA_id1" runat="server" Text="Yes" GroupName="SideAGroup" />
                                        <asp:RadioButton ID="SideA_id2" runat="server" Text="No" GroupName="SideAGroup" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideA_id3" runat="server" Text="Scratches" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideA_id4" runat="server" Text="Oil Stain" /></td>
                                    <td>
                                        <asp:CheckBox ID="SideA_id5" runat="server" Text="Black Mark" /></td>
                                </tr>
                                <tr>
                                    <td align="right">(b)</td>
                                    <td>Repairs to the walls on the inside of the container must be visible on the outside.                                       
                                    </td>
                                    <td align="left">
                                        <asp:RadioButton ID="SideB_id1" runat="server" Text="Yes" GroupName="SideBGroup" />
                                        <asp:RadioButton ID="SideB_id2" runat="server" Text="No" GroupName="SideBGroup" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideB_id3" runat="server" Text="Rusty" /></td>
                                    <td>
                                        <asp:CheckBox ID="SideB_id4" runat="server" Text="Hole" /></td>
                                    <td>
                                        <asp:CheckBox ID="SideB_id5" runat="server" Text="Dented" /></td>
                                </tr>
                                <tr>
                                    <td align="right" rowspan="2">(c)</td>
                                    <td rowspan="2">Blocks & vents are visible                                       
                                    </td>
                                    <td align="left" rowspan="2">
                                        <asp:RadioButton ID="SideC_id1" runat="server" Text="Yes" GroupName="SideCGroup" />
                                        <asp:RadioButton ID="SideC_id2" runat="server" Text="No" GroupName="SideCGroup" />
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="SideC_id3" runat="server" Text="Scratches" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideC_id4" runat="server" Text="Oil Stain" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideC_id5" runat="server" Text="Black Mark" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="SideC_id6" runat="server" Text="Rusty" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideC_id7" runat="server" Text="Hole" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideC_id8" runat="server" Text="Dented" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" rowspan="2">(d)</td>
                                    <td rowspan="2">Tap side walls and listen for hollow sound, if there is unusual repairs on the wal                                       
                                    </td>
                                    <td align="left" rowspan="2">
                                        <asp:RadioButton ID="SideD_id1" runat="server" Text="Yes" GroupName="SideDGroup" />
                                        <asp:RadioButton ID="SideD_id2" runat="server" Text="No" GroupName="SideDGroup" />
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="SideD_id3" runat="server" Text="Painting Mar" /></td>
                                    <td align="left" colspan="2">
                                        <asp:CheckBox ID="SideD_id4" runat="server" Text="Old Patching Mark" /></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="SideD_id5" runat="server" Text="Protruding" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="SideD_id6" runat="server" Text="Others" />
                                    </td>
                                    <td>
                                        <label for="SideD_id7">Other Remarks</label>
                                        <asp:TextBox runat="server" ID="SideD_id7"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="6"><b>(5)&nbsp;Front Wall</b></td>
                                </tr>
                                <tr>
                                    <td align="right" rowspan="2">(a)</td>
                                    <td rowspan="2">Tap side walls and listen for hollow sound, if there is unusual repairs on the wall                                        
                                    </td>
                                    <td align="left" rowspan="2">
                                        <asp:RadioButton ID="Wall_id1" runat="server" Text="Yes" GroupName="WallGroup" />
                                        <asp:RadioButton ID="Wall_id2" runat="server" Text="No" GroupName="WallGroup" />
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="Wall_id3" runat="server" Text="Painting Mar" /></td>
                                    <td align="left" colspan="2">
                                        <asp:CheckBox ID="Wall_id4" runat="server" Text="Old Patching Mark" /></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="Wall_id5" runat="server" Text="Protruding" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="Wall_id6" runat="server" Text="Others" />
                                    </td>
                                    <td>
                                        <label for="Wall_id7">Other Remarks</label>
                                        <asp:TextBox runat="server" ID="Wall_id7"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="6"><b>(6)&nbsp;Ceiling/Roof</b></td>
                                </tr>
                                <tr>
                                    <td align="right" rowspan="2">(a)</td>
                                    <td rowspan="2">Tap side walls and listen for hollow sound, if there is unusual repairs on the wall                                        
                                    </td>
                                    <td align="left" rowspan="2">
                                        <asp:RadioButton ID="Roof_id1" runat="server" Text="Yes" GroupName="RoofGroup" />
                                        <asp:RadioButton ID="Roof_id2" runat="server" Text="No" GroupName="RoofGroup" />
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="Roof_id3" runat="server" Text="Painting Mar" /></td>
                                    <td align="left" colspan="2">
                                        <asp:CheckBox ID="Roof_id4" runat="server" Text="Old Patching Mark" /></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="Roof_id5" runat="server" Text="Protruding" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="Roof_id6" runat="server" Text="Others" />
                                    </td>
                                    <td>
                                        <label>Other Remarks</label>
                                        <asp:TextBox runat="server" ID="Roof_id7"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="6"><b>(7)&nbsp;Floor</b></td>
                                </tr>
                                <tr>
                                    <td align="right" rowspan="4">(a)</td>
                                    <td rowspan="4">Floor is flat. No unusual repairs.                                        
                                    </td>
                                    <td align="left" rowspan="4">
                                        <asp:RadioButton ID="Floor_id1" runat="server" Text="Yes" GroupName="FloorGroup" />
                                        <asp:RadioButton ID="Floor_id2" runat="server" Text="No" GroupName="FloorGroup" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="Floor_id3" runat="server" Text="Scratches" /></td>
                                    <td>
                                        <asp:CheckBox ID="Floor_id4" runat="server" Text="Oil Stain" /></td>
                                    <td>
                                        <asp:CheckBox ID="Floor_id5" runat="server" Text="Black Mark" /></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="Floor_id6" runat="server" Text="Rusty" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="Floor_id7" runat="server" Text="Tyre Mark" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="Floor_id8" runat="server" Text="Humid" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="Floor_id9" runat="server" Text="Painting Mark" />
                                    </td>
                                    <td colspan="2">
                                        <asp:CheckBox ID="Floor_id10" runat="server" Text="Old Patching Mark" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="Floor_id11" runat="server" Text="Protruding" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="Floor_id12" runat="server" Text="Others" />
                                    </td>
                                    <td>
                                        <label>Other Remarks</label>
                                        <asp:TextBox runat="server" ID="Floor_id13"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="6"><b>(8)&nbsp;Choking</b></td>
                                </tr>
                                <tr>
                                    <td align="right">(a)</td>
                                    <td>Ensure Choking wood to be apply during container stuffing & unstuffing                                        
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="Choking_id1" runat="server" Text="Yes" />
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="Choking_id2" runat="server" Text="Choking wood" />
                                    </td>
                                </tr>--%>
                                <tr>
                                    <%--<td></td>--%>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;                                        
                                        <label for="temperature">Temperature</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox type="double" runat="server" ID="TemperatureTextBox" Width="50%" align="right" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                    </td>
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label for="SealNoCheck">SealNoCheck</label>
                                    </td>
                                    <td colspan="4">
                                        <asp:RadioButton ID="SealNoCheckY" runat="server" Text="Yes" GroupName="SealNoCheckGroup" />
                                        <asp:RadioButton ID="SealNoCheckN" runat="server" Text="No" GroupName="SealNoCheckGroup" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td></td>--%>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>TemperatureCheck</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
                                        <asp:RadioButton ID="TemperatureCheckY" runat="server" Text="Yes" GroupName="TemperatureCheckGroup" />
                                        <asp:RadioButton ID="TemperatureCheckN" runat="server" Text="No" GroupName="TemperatureCheckGroup" />
                                    </td>
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>WetDampCheck</label>
                                    </td>
                                    <td colspan="4">
                                        <asp:RadioButton ID="WetDampCheckY" runat="server" Text="Yes" GroupName="WetDampCheckGroup" />
                                        <asp:RadioButton ID="WetDampCheckN" runat="server" Text="No" GroupName="WetDampCheckGroup" />
                                    </td>
                                </tr>

                                <tr>
                                    <%--<td></td>--%>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>FloorWallCheck</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
                                        <asp:RadioButton ID="FloorWallCheckY" runat="server" Text="Yes" GroupName="FloorWallCheckGroup" />
                                        <asp:RadioButton ID="FloorWallCheckN" runat="server" Text="No" GroupName="FloorWallCheckGroup" />
                                    </td>
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>PestActivityCheck</label>
                                    </td>
                                    <td colspan="4">
                                        <asp:RadioButton ID="PestActivityCheckY" runat="server" Text="Yes" GroupName="PestActivityCheckGroup" />
                                        <asp:RadioButton ID="PestActivityCheckN" runat="server" Text="No" GroupName="PestActivityCheckGroup" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td></td>--%>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>FoulSmellCheck</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
                                        <asp:RadioButton ID="FoulSmellCheckY" runat="server" Text="Yes" GroupName="FoulSmellCheckGroup" />
                                        <asp:RadioButton ID="FoulSmellCheckN" runat="server" Text="No" GroupName="FoulSmellCheckGroup" />
                                    </td>
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>CargoExteriorCheck</label>
                                    </td>
                                    <td colspan="4">
                                        <asp:RadioButton ID="CargoExteriorCheckY" runat="server" Text="Yes" GroupName="CargoExteriorCheckGroup" />
                                        <asp:RadioButton ID="CargoExteriorCheckN" runat="server" Text="No" GroupName="CargoExteriorCheckGroup" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td></td>--%>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>CargoLabellingCheck</label>&nbsp;&nbsp;&nbsp; &nbsp;
                                        <asp:RadioButton ID="CargoLabellingCheckY" runat="server" Text="Yes" GroupName="CargoLabellingCheckGroup" />
                                        <asp:RadioButton ID="CargoLabellingCheckN" runat="server" Text="No" GroupName="CargoLabellingCheckGroup" />
                                    </td>
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>CargoFilmWrapCheck</label>
                                    </td>
                                    <td colspan="4">
                                        <asp:RadioButton ID="CargoFilmWrapCheckY" runat="server" Text="Yes" GroupName="CargoFilmWrapCheckGroup" />
                                        <asp:RadioButton ID="CargoFilmWrapCheckN" runat="server" Text="No" GroupName="CargoFilmWrapCheckGroup" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td></td>--%>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>CargoFoulSmellCheck</label>
                                        &nbsp;&nbsp;&nbsp;                                  
                                        <asp:RadioButton ID="CargoFoulSmellCheckY" runat="server" Text="Yes" GroupName="CargoFoulSmellCheckGroup" />
                                        <asp:RadioButton ID="CargoFoulSmellCheckN" runat="server" Text="No" GroupName="CargoFoulSmellCheckGroup" />
                                    </td>
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label>CargoPestActivityCheck</label>
                                    </td>
                                    <td colspan="4">
                                        <asp:RadioButton ID="CargoPestActivityCheckY" runat="server" Text="Yes" GroupName="CargoPestActivityCheckGroup" />
                                        <asp:RadioButton ID="CargoPestActivityCheckN" runat="server" Text="No" GroupName="CargoPestActivityCheckGroup" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="AttcPanel" runat="server" Visible="False">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td colspan="2">
                                        <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                            BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                            BorderWidth="1px" RepeatDirection="Horizontal">
                                            <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                            <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                                            <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label ID="ImageLbl" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="ImageTypeSizeLbl" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right">
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                OnClick="ReceiptImageDelete" OnClientClick="return confirm('Confirm to delete ?');">
                                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                                    runat="server">
                                                            </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                                        </asp:DataList><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="FileUploadPanel" runat="server">
                                            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="ImgTxtLbl" runat="server">Image Name</asp:Label>
                                                        <br />
                                                        <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename" />
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <br />
                                                        <br />
                                                        <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                                            HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                                                            <Localization Select="Select a File" />
                                                        </telerik:RadAsyncUpload>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">
                                                        <iWMS:iForm ID="formCtl" runat="server" Visible="false"></iWMS:iForm>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;&nbsp;
                                <asp:Button ID="UploadBtn" CssClass="blue" runat="server" OnClick="ImageSubmit_ServerClick" Text="UPLOAD" UseSubmitBehavior="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td colspan="2">
                                        <div class="DropZone1">
                                            <p>
                                                Drop Files Here
                                            </p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="ItemsPanel" runat="server" Visible="False">
                        <table id="Table3" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="4" class="style1">&nbsp;
                             <asp:Button ID="NewItemBtn" runat="server" Text="New" ToolTip="New" OnClick="NewItemBtn_Click"
                                 OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white" />
                                    &nbsp;
                                    <asp:Label ID="Label4" runat="server" class="pagetitle" Style="padding-left: 10px"></asp:Label>&nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div>
                            <telerik:RadGrid ID="ResultItemDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" ShowStatusBar="true"
                                AllowMultiRowSelection="true" OnNeedDataSource="ResultItemDG_NeedDataSource" OnItemCommand="ResultItemDG_ItemCommand"
                                OnItemDataBound="ResultItemDG_ItemDataBound" OnBatchEditCommand="ResultItemDG_BatchEditCommand"
                                ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                </ClientSettings>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50"
                                    HeaderStyle-HorizontalAlign="Center" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true" CommandItemDisplay="Top" EditMode="Batch">
                                    <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                    onserverclick="Delete_Row" runat="server">
                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                        runat="server"></a>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="No" AllowFiltering="false"
                                            HeaderText="No" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="markings" UniqueName="markings" SortExpression="markings" HeaderText="markings"
                                            AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="qty" UniqueName="qty" SortExpression="qty" HeaderText="qty"
                                            ItemStyle-Width="100px" HeaderStyle-Width="50px" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn UniqueName="uom" SortExpression="uom" HeaderText="uom"
                                            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblUom" Text='<%# string.Format("{0:}",Eval("uom")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="UOMDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                    DataValueField="Item" Skin="Sunset" Width="70px"
                                                    DropDownWidth="100px" OnLoad="UOMDDL_Load">
                                                </telerik:RadDropDownList>

                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="length" SortExpression="length" HeaderText="length"
                                            ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="width" SortExpression="width" HeaderText="width"
                                            ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="height" SortExpression="height" HeaderText="height"
                                            ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="volume" SortExpression="volume" HeaderText="volume"
                                            ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="grossweight" SortExpression="grossweight" HeaderText="grossweight"
                                            ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rem" UniqueName="rem" SortExpression="rem" HeaderText="rem"
                                            AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="adddate" HeaderText="AddDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="100px" HeaderStyle-Width="100px" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="adduser" HeaderText="AddUser"
                                            ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="editdate" HeaderText="EditDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="100px" HeaderStyle-Width="100px" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                            HeaderText="EditUser" ItemStyle-Width="100px" HeaderStyle-Width="100px" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </asp:Panel>
            </tr>
        </table>
        <br>
        <div style="height: 80%; top: 0px; left: 0px;" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
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
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="Detail_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                        runat="server"></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <HeaderTemplate>
                                S/N
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="SealNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="Size/Type"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="ContainerWt"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrvol" SortExpression="ctnrvol" HeaderText="ContainerVol"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="GoodsWt"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="GoodsVol"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateInDate" SortExpression="ExpGateInDate"
                            HeaderText="ExpGateInDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActGateInDate" SortExpression="ActGateInDate"
                            HeaderText="ActGateInDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DetentionExpiryDate" SortExpression="DetentionExpiryDate"
                            HeaderText="DetentionExpiryDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CargoPackingType" SortExpression="CargoPackingType"
                            HeaderText="CargoPackingType" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CtnrStatus" SortExpression="CtrnStatus" HeaderText="CtrnStatus"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CtnrSize" SortExpression="CtrnSize" HeaderText="CtrnSize"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DockCode" SortExpression="DockCode" HeaderText="DockCode"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateOutDate" SortExpression="ExpGateOutDate"
                            HeaderText="ExpGateOutDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActGateOutDate" SortExpression="ActGateOutDate"
                            HeaderText="ActGateOutDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>

        <telerik:RadCodeBlock ID="RadcodeBlock" runat="server">
            <script type="text/javascript">

                var Uom = function (uom, uomCode) {
                    // to display the text to user
                    this.uom = uom;
                    // for server use
                    this.uomCode = uomCode;
                }

                Uom.prototype.equals = function (data) {
                    if (this.uom === data.uom) {
                        return true;
                    }
                    return false;
                }
                Uom.prototype.toString = function () {
                    return JSON.stringify({
                        uom: this.uomCode,
                        uomDescr: this.uom // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    });
                }

                function GetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "uom") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var uom = $telerik.findElement(container, "lblUom").innerText;
                        args.set_value(new Uom(uom));
                    }
                }

                function GetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "uom") {
                        args.set_cancel(true);
                        var uom = args.get,
                            uom = $telerik.findControl(container, "UOMDDL").get_selectedItem().get_text(),
                            uomValue = $telerik.findControl(container, "UOMDDL").get_selectedItem().get_value();
                        args.set_value(new Uom(uom, uomValue));
                    }
                }

                function SetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "uom") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findControl(container, "UOMDDL").findItemByText(value.uom).select();
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
