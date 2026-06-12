<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManpowerSchedWBDetl.aspx.cs"
    Inherits="iWMS.Web.Job.ManpowerPlanning.ManpowerSchedWBDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manpower Schedule Details</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
</head>
<body>

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
            if (window.confirm("Confirm to " + button.get_toolTip() + " this Personnel?")) {
                button.set_autoPostBack(true);
            }
            else {
                button.set_autoPostBack(false);
            }
        }
    </script>

    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all"
        DecorationZoneID="decorationZone" />
    <telerik:RadFormDecorator ID="FormDecorator2" runat="server" DecoratedControls="all"
        DecorationZoneID="decorationZone2" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
        <telerik:RadPageView runat="server" ID="RadPageView1">
            <br />
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="8" align="left">
                        <table border="0">
                            <tr>
                                <td>
                                    <telerik:RadButton ID="OpenBtn" runat="server" OnClick="OpenBtn_Click" Text="Open"
                                        ButtonType="LinkButton">
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
                            </tr>
                        </table>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="left" valign="top">
                        <telerik:RadButton ID="updateBtn" runat="server" OnClick="updateBtn_Click" Text="Update"
                            Skin="WebBlue">
                        </telerik:RadButton>
                        &nbsp;&nbsp;
                        <telerik:RadButton ID="cancelBtn" runat="server" OnClick="cancelBtn_Click" Text="Close"
                            Skin="WebBlue">
                        </telerik:RadButton>
                        <br />
                        <asp:Label runat="server" ID="perAbsLbl" Font-Bold="true" ForeColor="Red"></asp:Label>
                        <br />
                    </td>
                    <td colspan="2">
                        &nbsp;
                    </td>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 10px;">
                    </td>
                </tr>
                <%--<tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>--%>
                <tr>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="Label1" runat="server" Text="JobNo"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="JobTxt" Width="120px" Skin="Office2007" Enabled="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="acidLbl" runat="server" Visible="false" />
                        <asp:Label ID="Label2" runat="server" Text="Account"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="AccTxt" Width="120px" Skin="Office2007" Enabled="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="statusLbl" runat="server" Visible="false" />
                        <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="StatusTxt" Width="120px" Skin="Office2007"
                            Enabled="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="Label15" runat="server" Text="NoOfPkgs"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="NoOfPkgsTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="EqpPerLbl" runat="server"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="PersonnelList" runat="server" DefaultMessage="Select a Personnel" OnSelectedIndexChanged="PerSelectedIndex_changed" AutoPostBack="true"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="Label6" runat="server" Text="Activity"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="ActivityList" runat="server" DefaultMessage="Select an Activity"
                            Enabled="false" DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="Label4" runat="server" Text="Type"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadDropDownList ID="PerTypeList" runat="server" DefaultMessage="Select a Type"
                            DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="width: 110px;" align="right">
                        <asp:Label ID="Label17" runat="server" Text="CargoWt(kg)"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        <telerik:RadTextBox runat="server" ID="JpaGoodsWtTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 290px;" colspan="2">
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
                                                OnSelectedIndexChanged="formCtl_OnDropDownSelectedIndexChanged" Enabled="false">
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
                                                TextMode="MultiLine" Rows="5" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </td>
                    <td style="width: 290px;" colspan="2">
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
                                                OnSelectedIndexChanged="formCtl_OnDropDownSelectedIndexChanged" Enabled="false">
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
                                                TextMode="MultiLine" Rows="5" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </td>
                    <td style="width: 110px;" align="right" valign="top">
                        <asp:Label ID="Label5" runat="server" Text="Activity&nbsp;<br />Remarks&nbsp;"></asp:Label>
                    </td>
                    <td style="width: 180px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="AtvtRemTxt" Width="120px" Skin="Office2007"
                            TextMode="MultiLine" Rows="9" ReadOnly="false">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 110px;" align="right" valign="top">
                        <asp:Label ID="Label18" runat="server" Text="CargoVolume&nbsp;<br />(m3)"></asp:Label>
                        &nbsp;
                        <br />
                        <br />
                        <asp:Label ID="Label19" runat="server" Text="QtyOf&nbsp;&nbsp;<br />Equipment"></asp:Label>
                        &nbsp;
                        <br />
                        <br />
                        <asp:Label ID="Label20" runat="server" Text="BillSizeType"></asp:Label>
                        &nbsp;
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label21" runat="server" Text="CertRequired"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="width: 180px;" valign="top">
                        <telerik:RadTextBox runat="server" ID="JpaGoodsVolTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                        <br />
                        <br />
                        <br />
                        <telerik:RadTextBox runat="server" ID="JpaQtyTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                        <br />
                        <br />
                        <telerik:RadTextBox runat="server" ID="JpaBillSizeTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                        <br />
                        <br />
                        <telerik:RadTextBox runat="server" ID="JpaCertReqTxt" Width="120px" Skin="Office2007"
                            ReadOnly="true" TextMode="MultiLine" Rows="3">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px;">
                        <table border="0">
                            <tr>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="Label11" runat="server" Text="ExpStartTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="AtvtFrDateTimePicker" Width="200px" runat="server"
                                        Enabled="false" DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                </td>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="Label12" runat="server" Text="ExpEndTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="AtvtToDateTimePicker" Width="200px" runat="server"
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                        Enabled="false">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 110px;" align="right" valign="top" rowspan="5">
                        <asp:Label ID="Label10" runat="server" Text="Personnel&nbsp;<br />Remarks&nbsp;"></asp:Label>
                    </td>
                    <td style="width: 180px;" valign="top" rowspan="5">
                        <telerik:RadTextBox runat="server" ID="RemTxt" Width="120px" Skin="Office2007" TextMode="MultiLine"
                            Rows="7">
                        </telerik:RadTextBox>
                    </td>
                    <td style="width: 110px;" align="right" valign="top">
                        &nbsp;
                        <asp:Label ID="manpowerrmkLbl" runat="server" 
                            Text="Manpower&nbsp;&lt;br /&gt;Remarks&nbsp;"></asp:Label>
                    </td>
                    <td style="width: 180px;" valign="top" rowspan="5">
                        <telerik:RadTextBox runat="server" ID="MpRemTxt" Width="120px" Skin="Office2007" TextMode="MultiLine"
                            Rows="7">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="height: 5px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px;">
                        <table border="0">
                            <tr>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="originalFrExpDateLbl" runat="server" Visible="false" />
                                    <asp:Label ID="Label14" runat="server" Text="PlanStartTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="FrExpDateTimePicker" Width="200px" runat="server"
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                        OnSelectedDateChanged="FrExpDateTimePicker_DateChanged" AutoPostBackControl="Both"
                                        Calendar-AutoPostBack="true">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="FrExpDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="Label3" runat="server" Text="PlanEndTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="ToExpDateTimePicker" Width="200px" runat="server"
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                        OnSelectedDateChanged="ToExpDateTimePicker_DateChanged" AutoPostBackControl="Both"
                                        Calendar-AutoPostBack="true">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV3" ControlToValidate="ToExpDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 110px;" align="right">
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
                    <td colspan="4" style="height: 5px;">
                        <table border="0">
                            <tr>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="Label22" runat="server" Text="BillStartTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="BillStartDateTimePicker" Width="200px" runat="server"
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                </td>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="Label23" runat="server" Text="BillEndTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="BillEndDateTimePicker" Width="200px" runat="server"
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 110px;" align="right">
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
                    <td colspan="4" style="height: 5px;">
                        <table border="0">
                            <tr>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="Label8" runat="server" Text="ActualStartTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="FrActDateTimePicker" Width="200px" runat="server" OnSelectedDateChanged="InctStartCalTime_OnDateSelectedChanged" AutoPostBackControl="both"
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                </td>
                                <td style="width: 100px;" align="right">
                                    <asp:Label ID="Label9" runat="server" Text="ActualEndTime"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 280px;" valign="middle">
                                    <telerik:RadDateTimePicker ID="ToActDateTimePicker" Width="200px" runat="server" OnSelectedDateChanged="InctEndCalTime_OnDateSelectedChanged" AutoPostBackControl="both"
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" Height="350px" Width="200px" />
                                    </telerik:RadDateTimePicker>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 110px;" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 180px;">
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Image ID="Personnelimg" runat="server" ImageAlign="Middle" ImageUrl="~/Master/Personnel/MakeThumbNail.aspx" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </form>
</body>
</html>
