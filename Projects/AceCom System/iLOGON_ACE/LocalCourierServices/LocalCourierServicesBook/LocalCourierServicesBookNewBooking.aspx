<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesBookNewBooking.aspx.cs" Inherits="iWMS.Web.LocalCourierServices.LocalCourierServicesBook.LocalCourierServicesBookNewBooking" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Booking @ LocalCourierServices</title>
    <link rel="stylesheet" href="../../LocalCourierServices/Style/LocalCourierServices.css" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="../Script/LocalCourierServices.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <img src="../../Image/URLLogo.png" width="110" height="110" alt="Logo" class="logoposition" />

                    <asp:Label runat="server" ID="LicenseLbl" CssClass="License"></asp:Label>
                </td>
            </tr>
        
        </table>


        <ul id="menu" runat="server">
            <div class="icons" style="float: right; padding-right: 10px;">
                <a href="../../LocalCourierServices/LocalCourierServicesBook/LocalCourierServicesBookHome.aspx">
                <img src="../../Image/HomeIcon.png" width="45" height="45" alt="Home" /></a>

                <div class="dropdown">
                    <button class="dropbtn">
                        <img src="../../Image/Profile Head Icon LightBlue.png" width="40" height="40" alt="Profile" /></button>
                    <div class="dropdown-content">
                        <a href="../../LocalCourierServices/LocalCourierServicesBook/LocalCourierServicesBookProfile.aspx">Profile</a>
                        <a href="#">Setting</a>
                        <a href="#">Payment</a>
                        <a href="../../Security/Login.aspx">LogOut</a>
                    </div>
                </div>
            </div>
        </ul>

        <table style="width: 100%;background-color: #f4f9ff;">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="margin: 40px 0px 0px 25%; font-family: Helvetica; font-weight: bold; color: white;">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="AccountLbl" Text="Account"></asp:Label><br />
                                        <telerik:RadComboBox runat="server" ID="AccCombo" AutoPostBack="true" CausesValidation="false" Width="155" OnLoad="AccountCombo_Load" AllowCustomText="false"
                                            Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item">
                                        </telerik:RadComboBox>
                                        <asp:RequiredFieldValidator runat="server" ID="AccountComboReqVal" ControlToValidate="AccCombo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="ShipmentTypeLbl" Text="ShipmentType"></asp:Label><br />
                                        <telerik:RadDropDownList runat="server" ID="ShipmentTypeDDL" AutoPostBack="true" CausesValidation="false" Width="155" OnLoad="ShipmentTypeDDL_Load" OnSelectedIndexChanged="ShipmentTypeDDL_SelectedIndexChanged"></telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="ShipmentTypeDDLReqVal" ControlToValidate="ShipmentTypeDDL" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="CustReferenceLbl" Text="CustReference"></asp:Label><br />
                                        <telerik:RadTextBox runat="server" ID="CustReferenceTxt" CausesValidation="false" Width="155"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="JobTypeLbl" Text="JobType"></asp:Label><br />
                                        <telerik:RadDropDownList runat="server" ID="JobTypeDDL" AutoPostBack="true" CausesValidation="false" OnLoad="JobTypeDDL_Load" Width="155"></telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="JobTypeReqVal" ControlToValidate="JobTypeDDL" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="TransportTypeLbl" Text="TransportType"></asp:Label><br />
                                        <telerik:RadDropDownList runat="server" ID="TransportTypeDDL" AutoPostBack="true" CausesValidation="false" OnLoad="TransportTypeDDL_Load" Width="155"></telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="TransportTypeDDLReqVal" ControlToValidate="TransportTypeDDL" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="BillSizeTypeLbl" Text="BillSizeType"></asp:Label><br />
                                        <telerik:RadDropDownList runat="server" ID="BillSizeTypeDDL" AutoPostBack="true" CausesValidation="false" OnLoad="BillSizeTypeDDL_Load" Width="155"></telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="BillSizeTypeDDLReqVal" ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <telerik:RadRadioButtonList runat="server" ID="BillOptionRadioButtonList" CausesValidation="false"></telerik:RadRadioButtonList>
                            <br />
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="FromPostalCodeLbl" Text="FromPostalCode"></asp:Label><br />
                                        <telerik:RadTextBox runat="server" ID="FromPostalCodeTxt" OnTextChanged="FromPostalCodeTxt_TextChanged" Width="155" AutoPostBack="true" CausesValidation="false"></telerik:RadTextBox>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="ToPostalCodeLbl" Text="ToPostalCode"></asp:Label><br />
                                        <telerik:RadTextBox runat="server" ID="ToPostalCodeTxt" OnTextChanged="ToPostalCodeTxt_TextChanged" Width="155" AutoPostBack="true" CausesValidation="false"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadTextBox runat="server" ID="FromAddressTxt" CausesValidation="false" Width="155" Height="80" TextMode="MultiLine"></telerik:RadTextBox><br />
                                        <asp:RequiredFieldValidator runat="server" ID="FromAddressReqVal" ControlToValidate="FromAddressTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <telerik:RadTextBox runat="server" ID="ToAddressTxt" CausesValidation="false" Width="155" Height="80" TextMode="MultiLine"></telerik:RadTextBox><br />
                                        <asp:RequiredFieldValidator runat="server" ID="ToAddressReqVal" ControlToValidate="ToAddressTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="GoodsInstructionLbl" Text="GoodsInstruction"></asp:Label><br />
                                        <telerik:RadTextBox runat="server" ID="GoodsInstructionTxt" CausesValidation="false" Width="155" Height="80" TextMode="MultiLine"></telerik:RadTextBox>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="SpecialInstructionLbl" Text="SpecialInstruction"></asp:Label><br />
                                        <telerik:RadTextBox runat="server" ID="SpecialInstructionTxt" CausesValidation="false" Width="155" Height="80" TextMode="MultiLine"></telerik:RadTextBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" CssClass="blue" runat="server" OnClick="SubmitBtn_Click"
                        Text="Submit Order" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
