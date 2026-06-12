<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SafeEntryRegisterAdd.aspx.cs" Inherits="iWMS.Web.SafeEntry.SafeEntryRegister.SafeEntryRegisterAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add @ SafeEntryRegister</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <%--For DDL and Textbox style--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        .CurrentDateTimeDiv {
            width: 30%;
            height: 65px;
            border-radius: 10px;
            border: 2px solid black;
            text-align: center;
            /*margin-left: 30%;*/
            background-color: #f5f6fb;
            font-family: Arial;
        }

        .FormDiv {
            margin-left: 30%;
            font-family: Arial;
        }
    </style>
    <telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
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

            function SwitchField(Event) {
                var Temperature = document.getElementById('<%=TemperatureTxt.ClientID%>');
                if (Temperature.value.length > 3) {
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div id="CurrentDateTimeDiv" class="CurrentDateTimeDiv">
            <asp:Label ID="CurrentDateLbl" runat="server" Font-Bold="true" Font-Size="Larger"></asp:Label>
            <br />
            <asp:Label ID="CurrentTimeLbl" runat="server" Font-Bold="true" Font-Size="Larger"></asp:Label>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td style="padding-left: 15px;">
                        <asp:Label Text="Identification Number" runat="server" Font-Size="13px"></asp:Label>
                        <br />
                        <asp:TextBox ID="ICNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px"
                            Style="border-radius: 3px;" BackColor="#C4A484" AutoPostBack="true" OnTextChanged="ICNoTxt_TextChanged"></asp:TextBox>

                    </td>
                    <td>
                        <br />
                        <asp:Button ID="RetrieveBtn" runat="server" Text="Retrieve" CssClass="white" UseSubmitBehavior="false" CausesValidation="false"
                            OnClientClick="disableBtn(this.id, false)" OnClick="RetrieveBtn_Click" Width="70px" />
                    </td>
                    <td style="padding-left: 15px;">
                        <asp:Label Text="Visitor Pass Number" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="PassNumberTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 3px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Contact No" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="ContactNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px"
                            Style="border-radius: 3px;" BackColor="#C4A484"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                        <br />
                        <asp:Button ID="RetrieveContactNoBtn" runat="server" Text="Retrieve" CssClass="white" UseSubmitBehavior="false" CausesValidation="false"
                            OnClientClick="disableBtn(this.id, false)" OnClick="RetrieveContactNoBtn_Click" Width="70px" />
                    </td>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Temperature" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="TemperatureTxt" runat="server" placeholder="00.0" autocomplete="off" MaxLength="4" autofocus="autofocus" onkeypress="return ValidateInputTemp(event)" onkeyup="SwitchField(event)" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 3px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Tenant" runat="server" Font-Size="13px"></asp:Label>
                        <asp:DropDownList ID="TenantDDL" runat="server" Enabled="True" DataTextField="Descr" CssClass="form-control input-box"
                            DataValueField="item" Width="150px" Height="30px" Font-Size="13px" Style="border-radius: 3px;">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <br />
                        <asp:Label Text="" runat="server"></asp:Label>
                    </td>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Vaccination Status" runat="server" Font-Size="13px"></asp:Label>
                        <asp:DropDownList ID="VaccStatusDDL" runat="server" Enabled="True" DataTextField="Descr" CssClass="form-control input-box"
                            DataValueField="item" Width="150px" Height="30px" Font-Size="13px" Style="border-radius: 3px;" BackColor="#C4A484">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Company Name" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="CompanyNameTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px"
                            Font-Size="13px" Style="border-radius: 3px;"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                        <asp:Label Text="" runat="server"></asp:Label>
                    </td>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Date Of Visit" runat="server" Font-Size="13px"></asp:Label><br />
                        <telerik:RadDateTimePicker runat="server" RenderMode="Lightweight" ID="DateOfVisitDatePicker" Width="200px" Height="25px" Skin="Bootstrap"
                            DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDateTimePicker>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Visitor Name" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="VisitorNameTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px"
                            Font-Size="13px" Style="border-radius: 3px;"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                        <asp:Label Text="" runat="server"></asp:Label>
                    </td>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Check Out Date" runat="server" Font-Size="13px"></asp:Label><br />
                        <telerik:RadDateTimePicker runat="server" RenderMode="Lightweight" ID="CheckOutDateDatePicker" Width="200px" Height="25px" Skin="Bootstrap"
                            DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDateTimePicker>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Vehicle Number" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="CarPlateNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px"
                            Style="border-radius: 3px;"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                        <br />
                        <asp:Button ID="RetrieveVehicleNoBtn" runat="server" Text="Retrieve" CssClass="white" UseSubmitBehavior="false" CausesValidation="false"
                            OnClientClick="disableBtn(this.id, false)" OnClick="RetrieveVehicleNoBtn_Click" Width="70px" />
                    </td>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Container In" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="ContainerNoTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 3px;"></asp:TextBox>

                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Purpose of Visiting" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="PurposeofVisitingTxt" runat="server" CssClass="form-control input-box" Width="220px" Height="50px"
                            Font-Size="13px" Style="border-radius: 3px;" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td style="padding-left: 20px;">
                        <br />
                        <asp:Label Text="Container Out" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="ContainerOutTxt" runat="server" CssClass="form-control input-box" Width="150px" Height="25px" Font-Size="13px" Style="border-radius: 3px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Label Text="Comments Box" runat="server" Font-Size="13px"></asp:Label>
                        <asp:TextBox ID="CommentsBoxTxt" runat="server" CssClass="form-control input-box" Width="220px" Height="50px"
                            Font-Size="13px" Style="border-radius: 3px;" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td style="padding-left: 20px;">
                        <asp:Label Text="Container Remarks" runat="server" Font-Size="13px"></asp:Label>
                        <asp:DropDownList ID="ContainerRemDDL" runat="server" Enabled="True" DataTextField="Descr" CssClass="form-control input-box"
                            DataValueField="item" Width="150px" Height="30px" Font-Size="13px" Style="border-radius: 3px;">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;">
                        <br />
                        <asp:Button ID="SubmitBtn" runat="server" Text="Submit" CssClass="white" UseSubmitBehavior="false" CausesValidation="false" OnClientClick="disableBtn(this.id, false)" OnClick="SubmitBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
