<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesMenu.ascx.cs" Inherits="iWMS.Web.WebV2_ILOGON.Control.LocalCourierServicesMenu" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<link rel="stylesheet" href="../Style/LocalCourierServices.css" type="text/css" />
<%--For DDL and Textbox style--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
<%--Modal popup--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>
<%-- For Spinner --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<script type="text/javascript">
    //For ToPostalCode TextChanged
    $(document).on('change', '#' + '<%= ToPostalCodeText.ClientID %>', function () {
        var PostalCode = $(this).val();

        $.ajax({
            url: 'LocalCourierServicesGetAddress.aspx/PostalCode',
            data: '{PostalCode: "' + PostalCode + '"}',
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.d) {
                    if (result.d) {
                        var ReturnVal = result.d;
                        if (!ReturnVal.includes("invalid")) {
                            $('#' + '<%= ToAddrText.ClientID %>').val(ReturnVal);
                        }
                        else {
                            alert(ReturnVal);
                            $('#' + '<%= ToAddrText.ClientID %>').val("");
                            $('#' + '<%= ToPostalCodeText.ClientID %>').val("");
                            document.getElementById('<%=ToPostalCodeText.ClientID%>').focus();
                        }
                    }
                }
            },
            failure: function (response) {
                alert("Check Postal Code Again.");
            }
        });
    });


    //For FromPostalCode TextChanged
    $(document).on('change', '#' + '<%= FrPostalCodeTxt.ClientID %>', function () {
        var PostalCode = $(this).val();
        $.ajax({
            url: 'LocalCourierServicesGetAddress.aspx/PostalCode',
            data: '{PostalCode: "' + PostalCode + '"}',
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.d) {
                    if (result.d) {
                        var ReturnVal = result.d;
                        if (!ReturnVal.includes("invalid")) {
                            $('#' + '<%= FrAddressTxt.ClientID %>').val(ReturnVal);
                        }
                        else {
                            alert(ReturnVal);
                            $('#' + '<%= FrAddressTxt.ClientID %>').val("");
                            $('#' + '<%= FrPostalCodeTxt.ClientID %>').val("");
                            document.getElementById('<%=FrPostalCodeTxt.ClientID%>').focus();
                        }
                    }
                }
            },
            failure: function (response) {
                alert('Error Occur: Check Postal Code Again.');
            }
        });
    });

    //For Mobile Number Text Changed
    $(document).on('change', '#' + '<%= MobileNoTxt.ClientID %>', function () {
        var MobileNo = $(this).val();
        if (MobileNo.length != 8) {
            alert("Please enter correct Mobile No.");
            $(this).val("");
            document.getElementById('<%=MobileNoTxt.ClientID%>').focus();
        }
    });

    //Clear Data when Modal popup closed
    $(document).on('hidden.bs.modal', '#myModal', function () {
        window.location.reload(true);
    })

    //Prevent resubmission when page is refresh
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }

    // We will refresh location after showing Alertbox 
    function close() {
        window.location.reload(true);
    }
</script>

<%--Start Region for Upload Excel File--%>
<script type="text/javascript">
    //Clear Data when Modal popup closed
    $(document).on('hidden.bs.modal', '#UploadModal', function () {
        window.location.reload(true);
    });

    //For UploadBtn Button Click
    function CheckFileExist() {
        var AccountCombo = $find('<%=AccountCombo.ClientID %>');
        var InputFile = $find('<%=InputFile.ClientID %>');
        var UploadFile = InputFile.getUploadedFiles();
        if (UploadFile.length == 0) {
            alert("Please select a file to Upload.")
            AccountCombo.disabled = true;
            return false;
        }
    }

    // For DownloadTemplate Button Click
    function DownloadTemplate_Click() {
        window.location.href = "../Template/DeliverySchedule-BOLLORE@SDS.xls";
    }

    function Validate(id) {
        if (Page_ClientValidate("Success")) {
            var btn = document.getElementById(id);
            btn.disabled = true;
            btn.innerHTML = "Processing...";
        } else {
            alert("Please make sure all fields are not blank.");
        }
    }

    function DisableBtn(id, check) {
        var btn = document.getElementById(id);
        btn.disabled = true;
        btn.innerHTML = "Processing...";
    }
</script>
<%--End Region for Upload Excel File--%>

<!-- Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header" style="padding: 35px 50px;">
                <h1>Create Order</h1>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="background-color: #fafafd;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="font-family: Helvetica; font-weight: bold; color: black; margin-left: 73px; font-size: 14px;">
                    <ContentTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label runat="server" ID="AccountLbl" Text="Account"></asp:Label><br />
                                                <telerik:RadComboBox runat="server" ID="AccCombo" AutoPostBack="true" CausesValidation="false" Width="300px" OnLoad="AccountCombo_Load" AllowCustomText="false"
                                                    Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableVirtualScrolling="true">
                                                </telerik:RadComboBox>
                                                <asp:RequiredFieldValidator runat="server" ID="AccountComboReqVal" ControlToValidate="AccCombo" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 190px;"></td>
                                            <td>
                                                <br />
                                                <asp:Label runat="server" ID="ParcelSizeTypeLbl" Text="Parcel Size Type"></asp:Label><br />
                                                <asp:DropDownList ID="ParcelSizeTypeDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 220px; margin-top: 6px; height: 34px; font-size: 15px;">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="ParcelSizeTypeReqVal" ControlToValidate="ParcelSizeTypeDDL" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>

                                    <table style="margin-top: 15px">
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:RequiredFieldValidator ID="BillOptionReqVal" ValidationGroup="Success" ErrorMessage="&nbsp;&nbsp;Delivery Option *" ControlToValidate="BillOptionRBL" runat="server" ForeColor="Red" Display="Dynamic" />
                                                <asp:RadioButtonList ID="BillOptionRBL" runat="server" CausesValidation="false" RepeatDirection="Horizontal" ValidationGroup="Success" RepeatLayout="Table" CssClass="RadioButtonList"></asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Your Order No" runat="server"></asp:Label>
                                                <asp:RequiredFieldValidator runat="server" ID="YourOrderNoReqNo" ControlToValidate="YourOrderNoTxt" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="YourOrderNoTxt" runat="server" placeholder="Enter Your Order No" CssClass="form-control input-box" Width="180px" Height="35px" Font-Size="15px" Style="border-radius: 3px;"></asp:TextBox>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 6px;">
                                                <br />
                                                <asp:Label Text="Recipient Name" runat="server"></asp:Label>
                                                <asp:RequiredFieldValidator runat="server" ID="NameReqVal" ControlToValidate="NameTxt" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="NameTxt" runat="server" CssClass="form-control input-box" Width="180px" Height="35px" Font-Size="15px" Style="border-radius: 3px;"></asp:TextBox>
                                            </td>
                                            <td style="width: 50px;"></td>
                                            <td style="padding-top: 6px;">
                                                <br />
                                                <asp:Label Text="Mobile No" runat="server"></asp:Label>
                                                <asp:RequiredFieldValidator runat="server" ID="MobileReqVal" ControlToValidate="MobileNoTxt" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <table style="margin-left: -2%">
                                                    <tr>
                                                        <td>
                                                            <asp:RequiredFieldValidator runat="server" ID="CountryCodeReqVal" ControlToValidate="CountryCodeDDL" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            <asp:DropDownList ID="CountryCodeDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Usrdef01" DataValueField="Usrdef01" CausesValidation="false" Style="width: 60px; height: 35px; font-size: 15px; border-radius: 3px;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 5px;"></td>
                                                        <td>
                                                            <asp:TextBox ID="MobileNoTxt" runat="server" placeholder="E.g.  81234567" CssClass="form-control input-box" Width="180px" Height="35px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 6px;">
                                                <br />
                                                <asp:Label runat="server" Text="Pick-up Service Point"></asp:Label><br />
                                                <telerik:RadComboBox runat="server" ID="FrServicePtCombo" AutoPostBack="true" CausesValidation="false" ValidationGroup="Success" Width="300px" OnLoad="FrServicePtCombo_Load" AllowCustomText="false" OnSelectedIndexChanged="FrServicePtCombo_SelectedIndexChanged"
                                                    Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableVirtualScrolling="true" EnableAutomaticLoadOnDemand="true">
                                                </telerik:RadComboBox>
                                                <asp:RequiredFieldValidator runat="server" ID="FrServicePtReqVal" ControlToValidate="FrServicePtCombo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 50px;"></td>
                                            <td style="padding-top: 6px;">
                                                <br />
                                                <asp:Label Text="Pick-up Postal Code" runat="server"></asp:Label>
                                                <asp:RequiredFieldValidator runat="server" ID="FrPostalCodeReqVal" ControlToValidate="FrPostalCodeTxt" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="FrPostalCodeTxt" runat="server" CssClass="form-control input-box" Width="180px" Height="32px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Pick-up Route" runat="server"></asp:Label><br />
                                                <asp:DropDownList ID="FrRouteDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 220px; margin-top: 6px; height: 34px; font-size: 15px;">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="FrRouteReqVal" ControlToValidate="FrRouteDDL" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 50px;"></td>
                                            <td style="padding-top: 6px;">
                                                <br />
                                                <asp:Label Text="Pick-up Address" runat="server"></asp:Label>
                                                <asp:RequiredFieldValidator runat="server" ID="FrAddressReqVal" ControlToValidate="FrAddressTxt" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="FrAddressTxt" runat="server" TextMode="MultiLine" CssClass="form-control input-box" Width="450px" Height="65px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 29px;">
                                                <asp:Label runat="server" Text="Drop-off Service Point"></asp:Label><br />
                                                <telerik:RadComboBox runat="server" ID="ToServicePtCombo" AutoPostBack="true" CausesValidation="false" ValidationGroup="Success" Width="300px" OnLoad="ToServicePtCombo_Load" AllowCustomText="false" OnSelectedIndexChanged="ToServicePtCombo_SelectedIndexChanged"
                                                    Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableVirtualScrolling="true" EnableAutomaticLoadOnDemand="true">
                                                </telerik:RadComboBox>
                                                <asp:RequiredFieldValidator runat="server" ID="ToServicePtReqVal" ControlToValidate="ToServicePtCombo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 50px;"></td>
                                            <td style="padding-top: 6px;">
                                                <br />
                                                <asp:Label Text="Drop-off Postal Code" runat="server"></asp:Label>
                                                <asp:RequiredFieldValidator runat="server" ID="ToPostalCodeReqVal" ControlToValidate="ToPostalCodeText" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="ToPostalCodeText" runat="server" CssClass="form-control input-box" Width="180px" Height="32px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Drop-off Route" runat="server"></asp:Label><br />
                                                <asp:DropDownList ID="ToRouteDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 220px; margin-top: 6px; height: 34px; font-size: 15px;">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="ToRouteReqVal" ControlToValidate="ToRouteDDL" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 50px;"></td>
                                            <td style="padding-top: 6px;">
                                                <br />
                                                <asp:Label Text="Drop-off Address" runat="server"></asp:Label>
                                                <asp:RequiredFieldValidator runat="server" ID="ToAddrReqVal" ControlToValidate="ToAddrText" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="ToAddrText" runat="server" TextMode="MultiLine" CssClass="form-control input-box" Width="450px" Height="65px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Special Instruction" runat="server"></asp:Label>
                                                <asp:TextBox ID="SpecialInstructionText" runat="server" TextMode="MultiLine" ReadOnly="true" CssClass="form-control input-box" Width="450px" Height="65px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <p style="margin-left: 40%">
                                        <asp:LinkButton ID="SubmitOrderBtn" OnClientClick="Validate(this.id);" ValidationGroup="Success" OnClick="SubmitBtn_Click" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-check-square-o"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Submit Order</span></asp:LinkButton>
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="font-family: Arial; font-size: 13px;"><span class="fa fa-times"></span>&nbsp;&nbsp;Close</button>
            </div>
        </div>
    </div>
</div>


<!-- Start Upload Modal -->
<div class="modal fade" id="UploadModal">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header" style="padding: 15px 15px;">
                <h1>Upload File</h1>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="background-color: #fafafd;">
                <asp:UpdatePanel ID="UploadUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table style="width: 80%; font-family: Arial; font-weight: bold; color: black; margin-left: 50px; font-size: 14px;">
                            <tr>
                                <td>
                                    <br />
                                    <asp:Label runat="server" ID="Label1" Text="Account"></asp:Label><br />
                                    <telerik:RadComboBox runat="server" ID="AccountCombo" AutoPostBack="true" CausesValidation="false" Width="300px" OnLoad="AccCombo_Load" AllowCustomText="false" OnSelectedIndexChanged="AccountCombo_SelectedIndexChanged"
                                        Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableVirtualScrolling="true" EnableAutomaticLoadOnDemand="true">
                                    </telerik:RadComboBox>
                                    <asp:RequiredFieldValidator runat="server" ID="AccComboReqVal" ControlToValidate="AccountCombo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <table id="UploadFeatureTable" runat="server" visible="false">
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker runat="server" RenderMode="Lightweight" ID="DeliveryDatePicker" Width="180px" Height="35px" Skin="Bootstrap" DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:LinkButton ID="DownloadTempBtn" OnClientClick="DisableBtn(this.id, false);DownloadTemplate_Click();" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-download"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Download Template</span></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <div class="form-group files">
                                                    <telerik:RadAsyncUpload runat="server" ID="InputFile" RenderMode="Lightweight"
                                                        HideFileInput="true" Skin="Outlook" MultipleFileSelection="Automatic" DropZones=".DropZone">
                                                        <Localization Select="Choose File" />
                                                    </telerik:RadAsyncUpload>
                                                </div>
                                                <div class="DropZone">
                                                    <p style="text-align: center; margin-top: 7rem;">
                                                        Drop Files Here
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Label Text="Release Note:" Font-Size="13px" Font-Bold="true" runat="server"></asp:Label>
                                                <br />
                                                <asp:Label Text="1. Only Excel files can be uploaded." Font-Size="12px" runat="server" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label Text="2. All date values must have the DD/MMM/YYYY format <br/>e.g. 12/Jan/2021." Font-Size="12px" runat="server" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label Text="3. Delivery Date will supersede other values in delivery date column" Font-Size="12px" runat="server" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="ExcelDDL" runat="server" Visible="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:LinkButton ID="ExcelUploadBtn" OnClientClick="DisableBtn(this.id, false);CheckFileExist();" CssClass="btn btn-primary" OnClick="UploadBtn_ServerClick" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-upload"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Upload</span></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="font-family: Arial; font-size: 13px;"><span class="fa fa-times"></span>&nbsp;&nbsp;Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End Upload Modal -->

<table style="background-color: white; width: 100%; margin-top: 0%; margin-bottom: 0%; margin-left: 75px;">
    <tr style="font-family: Arial;">
        <td style="color: #32387d; padding-top: 16px;">
            <asp:Label runat="server" Text="Shipment Order" Font-Bold="true" Font-Size="19px"></asp:Label>
        </td>
        <td style="float: right; padding-top: 15px; padding-right: 16%;">
            <p>
                <a class="btn btn-primary has-spinner" id="CreateRequestBtn" runat="server" href="#" data-toggle="modal" data-target="#myModal" causesvalidation="false" style="font-family: Arial; font-size: 13px;">
                    <i class="fa fa-plus"></i>&nbsp;&nbsp;Create Order
                </a>

                <a class="btn btn-primary has-spinner" id="MainUploadBtn" runat="server" href="#" data-toggle="modal" data-target="#UploadModal" causesvalidation="false" style="font-family: Arial; font-size: 13px;">
                    <i class="fa fa-upload"></i>&nbsp;&nbsp;Excel Upload
                </a>
            </p>
        </td>
    </tr>
</table>
