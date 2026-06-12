<%@ Page Language="c#" CodeBehind="IssueCtnrDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.IssueCtnrDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueCtnrDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1 {
            height: 28px;
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
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip2" CausesValidation="false" MultiPageID="RadMultiPage2"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PickCheck" Value="50" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Text="PreLoadCheck" Value="100" runat="server">
                </telerik:RadTab>             
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">
                    <asp:Button ID="AddDetailBtn" runat="server" CssClass="white" Visible="false" Text="New" OnClick="AddDetailBtn_Click"
                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <table id="table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="4" class="style1">
                                    <asp:Button ID="SaveNextBtn" runat="server" Text="Save+Next" ToolTip="SaveAndNext" OnClick="SaveNextBtn_Click"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white" />
                                    &nbsp;
                                            <asp:Button ID="SaveBtn" runat="server" Text="Save" ToolTip="Save" OnClick="SaveBtn_Click"
                                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white" />
                                    &nbsp;
                                           <asp:Button ID="ClosePanelBtn" runat="server" Text="Hide" ToolTip="Hide" OnClick="ClosePanelBtn_Click"
                                               OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white" CausesValidation="False" />
                                    &nbsp; 
                                            <asp:Button ID="PrintChecklistBtn" runat="server" Text="Print Checklist" ToolTip="Print Checklist" OnClick="PrintChecklistBtn_Click" Enabled="false"
                                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelBlue" CausesValidation="False" />
                                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table><br />
                        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
                            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                            <Tabs>
                                <telerik:RadTab Text="General" Value="50" runat="server">
                                </telerik:RadTab>
                                <telerik:RadTab Text="Checklist" Value="200" runat="server">
                                </telerik:RadTab>
                                <telerik:RadTab ID="AttcTab" Text="Attc" Value="100" runat="server">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <asp:Panel ID="FormPanel" runat="server" Visible="True">
                            <table id="table2" border="0" cellspacing="1" cellpadding="1" width="100%">
                                        <tr>
                                            <td nowrap class="style2" style="padding-top: 10px;">
                                                <asp:Label ID="Label1" runat="server" Text="ContainerNo" />
                                                <asp:RequiredFieldValidator Style="z-index: 0" ID="CtnrNoReq" runat="server" ControlToValidate="CtnrNoTxt"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                                <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Skin="Sunset" BackColor="#ded7c6"></telerik:RadTextBox>
                                            </td>
                                            <td nowrap class="style2" style="padding-top: 10px;">
                                                <asp:Label ID="Label4" runat="server" Text="Size/Type" />
                                                <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" ControlToValidate="SizeTypeList"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                                <telerik:RadDropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                                    DataValueField="item" Skin="Sunset" BackColor="#ded7c6">
                                                </telerik:RadDropDownList>
                                            </td>
                                            <td nowrap style="padding-top: 10px;">
                                                <asp:Label ID="Label5" runat="server" Text="SealNo" />
                                                <br>
                                                <telerik:RadTextBox ID="SealNoTxt" runat="server" Style="z-index: 0" Skin="WebBlue"></telerik:RadTextBox>
                                            </td>
                                            <%-- Ticket #1664, Added by JL, 10th May 2016--%>
                                            <td style="padding-top: 10px;">
                                                <asp:Label ID="Label16" runat="server" Text="CargoPackingType"></asp:Label><br />
                                                <telerik:RadDropDownList ID="CargoPackingTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                                    DataValueField="item" Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>
                                             <td style="padding-top: 10px;">
                                                 <asp:Label ID="Label20" runat="server" Text="PickCheckStatus"></asp:Label><br />
                                                <telerik:RadDropDownList ID="PickCheckStatusList" runat="server" Enabled="True" DataTextField="Descr"
                                                    DataValueField="item" Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>
                                            <td style="padding-top: 10px;">
                                                 <asp:Label ID="Label21" runat="server" Text="LoadCheckStatus"></asp:Label><br />
                                                <telerik:RadDropDownList ID="LoadCheckStatusList" runat="server" Enabled="True" DataTextField="Descr"
                                                    DataValueField="item" Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label2" runat="server" Text="ContainerWt" /><br>
                                                <telerik:RadTextBox ID="WeightTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label3" runat="server" Text="ContainerVol" /><br />
                                                <telerik:RadTextBox ID="VolumeTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label6" runat="server" Text="GoodsWt" /><br>
                                                <telerik:RadTextBox ID="GoodsWeightTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label7" runat="server" Text="GoodsVol" /><br />
                                                <telerik:RadTextBox ID="GoodsVolumeTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label9" runat="server" Text="ActGateInDate"></asp:Label><br />
                                                <telerik:RadDateTimePicker ID="actGateInDateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="200px">
                                                    <Calendar>
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDateTimePicker>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label10" runat="server" Text="ActGateOutDate"></asp:Label><br />
                                                <telerik:RadDateTimePicker ID="actGateOutDateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="200px">
                                                    <Calendar>
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDateTimePicker>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label11" runat="server" Text="ExpGateInDate"></asp:Label><br />
                                                <telerik:RadDateTimePicker ID="expGateInDateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="200px">
                                                    <Calendar>
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDateTimePicker>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label12" runat="server" Text="ExpGateOutDate"></asp:Label><br />
                                                <telerik:RadDateTimePicker ID="expGateOutDateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="200px">
                                                    <Calendar>
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDateTimePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label14" runat="server" Text="Status"></asp:Label><br />
                                                <telerik:RadDropDownList ID="CtrnStatus" runat="server" DataValueField="item" DataTextField="Descr"
                                                    Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label15" runat="server" Text="DockCode"></asp:Label><br />
                                                <telerik:RadDropDownList ID="DockCode" runat="server" DataValueField="code" DataTextField="Descr"
                                                    Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>
                                            <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label13" runat="server" Text="DetentionExpiryDate"></asp:Label><br />
                                                <telerik:RadDateTimePicker ID="DetentionExpiryDateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="200px">
                                                    <Calendar>
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDateTimePicker>
                                            </td>
                                            <%--End of Ticket #1664--%>
                                        </tr>
                                        <tr>
                                            <td nowrap class="style2">
                                                <asp:Label ID="Label8" runat="server" Text="Remarks" />
                                                <br>
                                                <asp:TextBox Style="z-index: 0" ID="remarksTxt" runat="server" Rows="3" TextMode="MultiLine"
                                                    Width="210px"></asp:TextBox>
                                            </td>
                                            
                                            <%-- <td nowrap class="style2" valign="top">
                                                <asp:Label ID="Label21" runat="server" Text="LoadCheckStatus"></asp:Label><br />
                                                <telerik:RadDropDownList ID="loadcheckstatusList" runat="server" DataValueField="item" DataTextField="descr"
                                                    Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>--%>
                                        </tr>
                                    </table>
                        </asp:Panel>
                        <asp:Panel ID="CheckListPanel" runat="server" Visible="False">                           
                            &nbsp;<asp:Label ID="Label17" Text="Container Information" Font-Size="15px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label18" Text="(The physical integrity of the container structure must be verified prior to unloading.)" Font-Size="15px" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                            <table id="CheckListTable" border="1 " cellspacing="0" cellpadding="1" width="70%">
                                <tr>
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
                                </tr>
                                <tr>
                                    <td></td>
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
                                    <td></td>
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
                                    <td></td>
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
                                    <td></td>
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
                                    <td></td>
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
                                    <td></td>
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
                            <table cellspacing="10" cellpadding="10" width="100%" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="FileUploadPanel" runat="server">
                                            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="ImgTxtLbl" runat="server">Image Name</asp:Label>
                                                        <br />
                                                        <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename" />
                                                        <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <br />
                                                        <br />
                                                        <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                                            HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2" MultipleFileSelection="Automatic">
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
                                        <br /><br />
                                        
                                        <div class="DropZone1">
                                            <p>
                                                Drop Files Here
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="height: 90vh; overflow: auto;">
                                            <asp:Button ID="DownloadAllBtn" CssClass="blue" runat="server" OnClick="DownloadAllBtn_ServerClick" Text="Download All Files" UseSubmitBehavior="false" />
                                            <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="3" DataKeyField="id"
                                                BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                                BorderWidth="1px" RepeatDirection="Vertical">
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
                                                            <td style="max-width: 300px; word-wrap: break-word">
                                                                <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="ImageTypeSizeLbl" runat="server"></asp:Label>
                                                            </td>
                                                            <td align="right">
                                                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                    OnClick="IssueImageDelete" OnClientClick="return confirm('Confirm to delete ?');">
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
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br>
        <div style="height: 80%; top: 0px; left: 0px;" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>                                
                                <ItemStyle Wrap="false" />
                            <ItemTemplate>
                                <asp:CheckBox ID="lineChkbx" runat="server" />
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
                             <telerik:GridBoundColumn DataField="pickcheckstatus" SortExpression="pickcheckstatus" HeaderText="Pickcheckstatus"
                            ItemStyle-Wrap="false"> 
                             </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="loadcheckstatus" SortExpression="loadcheckstatus" HeaderText="LoadCheckStatus"
                            ItemStyle-Wrap="false">  
                           </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateOutDate" SortExpression="ExpGateOutDate"
                            HeaderText="ExpGateOutDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActGateOutDate" SortExpression="ActGateOutDate"
                            HeaderText="ActGateOutDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DetentionExpiryDate" SortExpression="DetentionExpiryDate"
                            HeaderText="DetentionExpiryDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
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
                        <telerik:GridBoundColumn DataField="ActGateInDate" SortExpression="ActGateInDate"
                            HeaderText="ActGateInDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpGateInDate" SortExpression="ExpGateInDate"
                            HeaderText="ExpGateInDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
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
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="PickCheckRadPageView" Height="500px" />
              <telerik:RadPageView runat="server" ID="PreLoadCheckRadPageView" Height="500px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
