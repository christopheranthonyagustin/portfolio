<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SafeEntryRegisterSearch.aspx.cs" Inherits="iWMS.Web.SafeEntry.SafeEntryRegister.SafeEntryRegisterSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search @ SafeEntryRegister</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <%--For DDL and Textbox style--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function ValidateInputTemp(Event) {
                Event = (Event) ? Event : window.event;
                var CharCode = (Event.which) ? Event.which : Event.keyCode;
                var Temperature = document.getElementById('<%=TemperatureTxt.ClientID%>');

            //First Digit (Only allow 3x.x/4x.x)
            if (Temperature.value.length == 0) {
                return (CharCode == 51 || CharCode == 52) ? true : false;
            }

            //Second Digit (Only allow from 35.x to 42.x)
            if (Temperature.value.length == 1) {
                if (Temperature.value.substring(0, 1) == 3) {
                    return (CharCode > 31 && (CharCode < 53 || CharCode > 57)) ? false : true;
                }
                else {
                    return (CharCode > 31 && (CharCode < 48 || CharCode > 50)) ? false : true;
                }
            }

                //Decimal Point
            else if (Temperature.value.length == 2) {
                if (CharCode >= 48 && CharCode <= 57) {
                    //Temperature.value = Temperature.value + '.' + String.fromCharCode(CharCode);
                    Temperature.value = Temperature.value + '.';
                    return true;
                }
                else {
                    return false;
                }
            }
                //Last Digit (Only allow from 35.0  to 42.9)
            else if (Temperature.value.length == 3) {
                return (CharCode > 31 && (CharCode < 48 || CharCode > 57)) ? false : true;
            }
            else if (Temperature.value.length == 4) {
                return false;
            }
            return true;
        }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <div id="FormDiv" class="FormDiv">
            <table style="margin-left: 15px;">
                <tr>
                    <td>
                        <br />
                        <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="white" UseSubmitBehavior="false" CausesValidation="false" OnClientClick="disableBtn(this.id)" OnClick="SearchBtn_Click" />
                    </td>
                    <td>
                        <br />
                        &nbsp;&nbsp;
                        <asp:Label ID="MessageLbl" runat="server" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="margin-left: 15px;">
                <tr>
                    <td>
                        <asp:Label Text="Company Name" runat="server" style="font-size: 13px;"></asp:Label>
                        <asp:TextBox ID="CompanyNameTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;"></asp:TextBox>
                    </td>
                    <td style="padding-left: 7px;">
                        <asp:Label Text="Visitor Name" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="VisitorNameTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;"></asp:TextBox>
                    </td>
                    <td style="padding-left: 7px;">
                        <asp:Label Text="Contact No" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="ContactNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;"></asp:TextBox>
                    </td>
                    <td style="padding-left: 7px;">
                        <asp:Label Text="Identification Number" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="ICNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;"></asp:TextBox>
                    </td>
                       <td style="padding-left: 7px;">
                        <asp:Label Text="ContainerNo" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="ContainerNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 5px;">
                        <asp:Label Text="Vehicle Number" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="CarPlateNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;"></asp:TextBox>
                    </td>
                    <td style="padding-left: 7px; padding-top: 5px;">
                        <asp:Label Text="Temperature" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="TemperatureTxt" runat="server" placeholder="00.0" autocomplete="off" MaxLength="4" autofocus="autofocus" onkeypress="return ValidateInputTemp(event)" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;"></asp:TextBox>
                    </td>
                    <td style="padding-left: 7px; padding-top: 5px;">
                        <asp:Label Text="From Date" runat="server" Font-Size="13px"></asp:Label><br />
                          <telerik:RadDateTimePicker runat="server" RenderMode="Lightweight" ID="DateOfVisitDatePicker" Width="200px" Height="25px" Skin="Bootstrap"
                           DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true">
                          <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                </SpecialDays>
                            </Calendar>
                      </telerik:RadDateTimePicker>
                    </td>
                      <td style="padding-left: 7px; padding-top: 5px;">
                        <asp:Label Text="To Date" runat="server" Font-Size="13px"></asp:Label><br />
                          <telerik:RadDateTimePicker runat="server" RenderMode="Lightweight" ID="ToDateDatePicker" Width="200px" Height="25px" Skin="Bootstrap"
                           DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true">
                          <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                </SpecialDays>
                            </Calendar>
                      </telerik:RadDateTimePicker>
                    </td>
                     <td style="padding-left: 7px; padding-top: 5px;">
                        <asp:Label Text="Vaccination Status" runat="server" Font-Size="13px"></asp:Label>
                        <asp:DropDownList ID="VaccStatusDDL" runat="server" Enabled="True" DataTextField="Descr" CssClass="form-control input-box"
                            DataValueField="item" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 5px;">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table style="margin-left: 15px;">
                <tr>
                    <td style="padding-top: 5px;">
                        <asp:Label Text="Purpose of Visiting" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="PurposeofVisitingTxt" runat="server" CssClass="form-control input-box" Width="200px" Height="50px" Font-Size="13px" Style="border-radius: 5px;" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
