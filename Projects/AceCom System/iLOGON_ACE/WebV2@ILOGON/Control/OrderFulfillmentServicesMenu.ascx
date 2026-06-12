<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderFulfillmentServicesMenu.ascx.cs" Inherits="iWMS.Web.WebV2_ILOGON.Control.OrderFulfillmentServicesMenu" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<link rel="stylesheet" href="../Style/OrderFulfillmentServices.css" type="text/css" />
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

    // For OrderLineTextbox change
    var TimeOut = null;
    function OrderLineCount(t) {
        clearTimeout(TimeOut);
        TimeOut = setTimeout(function () {

            var CreateOrderLineBtn = document.getElementById('CreateOrderLineDiv');
            CreateOrderLineBtn.style.display = "none";

            var OrderLineDiv = document.getElementById('<%= OrderLineDiv.ClientID %>');
            OrderLineDiv.style.display = "none";

            var OrderLineTable = document.getElementById('<%= CreateOrderLineTable.ClientID %>');
            OrderLineTable.style.display = "block";

            for (var i = 0; i < t.value; i++) {
                var OrderLineDiv = '<tr class="OrderLineRow">' +
                '<td><input type="text" name="SKUCode' + i + '" class="form-control input-box inputskucode" data-index="' + i + '"/></td>' +
                '<td><input type="text" readonly="readonly" name="Description' + i + '" class="form-control input-box inputskudescr" data-index="' + i + '" /></td>' +
                '<td><input type="text" readonly="readonly" name="CustomLotNo' + i + '" class="form-control input-box inputlot4" data-index="' + i + '" /></td>' +
                '<td><input type="text" readonly="readonly" name="UOM' + i + '" class="form-control input-box inputuom" data-index="' + i + '" /></td>' +
                '<td><input type="text" name="Qty' + i + '" class="form-control input-box inputqty" data-index="' + i + '" /></td>' +
                '<td width="6%"><button type="button" id="DeleteOrderLineBtn" class="btn btn btn-danger btn-xs DeleteOrderLine">Remove</button></td>' +
                '</tr>';
                $('#OrderLineTable').append(OrderLineDiv); // Adding these controls to Main table class  
            }

            document.getElementById('<%= OrderLineCountTextBox.ClientID %>').value = ""; //Clear OrderLineCountTextBox value after popup close
        }, 500)
    }

    // For Remove Icon in Each Row
    $(document).on("click", ".DeleteOrderLine", function () {
        $(this).closest("tr").remove(); // closest used to remove the respective 'tr' in which I have my controls

        if ($("#OrderLineTable tbody tr.OrderLineRow").length == 0) {
            document.getElementById('<%= CreateOrderLineTable.ClientID %>').style.display = "none";
            document.getElementById('CreateOrderLineDiv').style.display = "block";
        }
    });

    // For AddOrderLineBtn Click
    $(document).on("click", '#' + '<%= AddOrderLineBtn.ClientID %>', function () {
        var RowCount = $('.OrderLineRow').length + 1;
        var OrderLineDiv = '<tr class="OrderLineRow">' +
                '<td><input type="text" name="SKUCode' + RowCount + '" class="form-control input-box inputskucode" data-index="' + RowCount + '"/></td>' +
                '<td><input type="text" readonly="readonly" name="Description' + RowCount + '" class="form-control input-box inputskudescr" data-index="' + RowCount + '"/></td>' +
                '<td><input type="text" readonly="readonly" name="CustomLotNo' + RowCount + '" class="form-control input-box inputlot4" data-index="' + RowCount + '" /></td>' +
                '<td><input type="text" readonly="readonly" name="UOM' + RowCount + '" class="form-control input-box inputuom" data-index="' + RowCount + '" /></td>' +
                '<td><input type="text" name="Qty' + RowCount + '" class="form-control input-box inputqty" data-index="' + RowCount + '" /></td>' +
                '<td><button type="button" id="DeleteOrderLineBtn" class="btn btn btn-danger btn-xs DeleteOrderLine">Remove</button></td>' +
                '</tr>';
        $('#OrderLineTable').append(OrderLineDiv);
    });

    // For SKUCode Change
    $(document).on("change", '.inputskucode', function () {
        var SKUCode = $(this).val();
        var index = $(this).attr('data-index');

        var AcName = $('#' + '<%= AccountCombo.ClientID %>').val();
        $.ajax({
            url: 'OrderFulfillmentServicesOrderLine.aspx/GetSKUInfo',
            data: JSON.stringify({
                SKUCode: SKUCode,
                AcName: AcName
            }),
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.d) {
                    if (result.d) {
                        if (!result.d.includes("invalid") && result.d != "" && !result.d.includes("ListOfSKUDT")) {
                            var ReturnVal = result.d;
                            var SplitVal = ReturnVal.split('|');
                            $('input[name = "Description' + index + '"]').val(SplitVal[0]);
                            $('input[name = "CustomLotNo' + index + '"]').val(SplitVal[1]);
                            $('input[name = "UOM' + index + '"]').val(SplitVal[2]);
                        }
                        else if (result.d.includes("invalid")) {
                            var ReturnMessage = result.d.replace('invalid ', '');
                            $('input[name = "SKUCode' + index + '"]').val("");
                            $('input[name = "Description' + index + '"]').val("");
                            $('input[name = "CustomLotNo' + index + '"]').val("");
                            $('input[name = "UOM' + index + '"]').val("");
                            alert(ReturnMessage);
                        }
                        else if (result.d.includes("ListOfSKUDT")) {
                            OpenRadWindow(index);
                        }
                    }
                }
            },
            failure: function (response) {
                alert('Check SKU Code Again.');
            }
        });
    });

    // Open RadWindow Function 
    function OpenRadWindow(row) {
        // Close RadWindow
        const close_fun = function () {
            $find("<%=RadWindowManager1.ClientID%>").close();
            var AcName = $('#' + '<%= AccountCombo.ClientID %>').val();
            $.ajax({
                url: 'OrderFulfillmentServicesSelectSKUInfo.aspx/ReturnSKUInfo',
                data: JSON.stringify({
                    AcName: AcName
                }),
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    if (result.d) {
                        var ReturnVal = result.d;
                        var SplitVal = ReturnVal.split('|');
                        $('input[name = "Description' + row + '"]').val(SplitVal[0]);
                        $('input[name = "CustomLotNo' + row + '"]').val(SplitVal[1]);
                        $('input[name = "UOM' + row + '"]').val(SplitVal[2]);
                    }
                },
                failure: function (response) {
                    alert('Check SKU Code Again.');
                }
            });
        };

        var WindowManager = GetRadWindowManager();

        if (WindowManager) {
            var RadWindow = WindowManager.open("ListOfSKU.aspx");
            if (RadWindow) {
                RadWindow.set_initialBehaviors(Telerik.Web.UI.WindowBehaviors.None);
                RadWindow.set_behaviors(Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Resize);
                RadWindow.setActive(true);
                RadWindow.SetModal(true);
                RadWindow.center();
                RadWindow.set_visibleStatusbar(false);
                RadWindow.set_keepInScreenBounds(true);
                RadWindow.set_minWidth(640);
                RadWindow.set_minHeight(480);
                RadWindow.setSize(640, 480);
                RadWindow.set_destroyOnClose(true);
                RadWindow.add_close(close_fun);
            }
        }
    }

    //Call RadWindowManager
    function GetRadWindowManager() {
        return $find("<%=RadWindowManager1.ClientID%>");
    }

    $(function () {
        //Open Popup for Order Line
        $('[pd-popup-open]').on('click', function (e) {
            //We will show popup when Account Combobox is not null
            var AcCode = $('#' + '<%= AccountCombo.ClientID %>').val();
            if (AcCode.length > 0) {
                var targeted_popup_class = jQuery(this).attr('pd-popup-open');
                $('[pd-popup="' + targeted_popup_class + '"]').fadeIn(100);
            }
            else {
                alert('Please select Account.');
            }
            e.preventDefault();
        });

        //Close Popup for Order Line
        $('[pd-popup-close]').on('click', function (e) {
            var targeted_popup_class = jQuery(this).attr('pd-popup-close');
            $('[pd-popup="' + targeted_popup_class + '"]').fadeOut(200);

            e.preventDefault();
        });
    });

        // To Prevent Page reload when Enter Key
        $(document).ready(function () {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
            })
        })

        //Call function for Save Changes Table
        function GetOrderLineTableValue() {
            //Create an Array to hold the Table values.
            var Orders = new Array();
            var CheckSKUCode = false;

            $("#OrderLineTable tbody tr.OrderLineRow").each(function () {
                var SKUCode = $(this).find("input.inputskucode").val();
                var SKUDescr = $(this).find("input.inputskudescr").val();
                var CustomsLotNo = $(this).find("input.inputlot4").val();
                var UOM = $(this).find("input.inputuom").val();
                var Qty = $(this).find("input.inputqty").val();

                if (SKUCode == "" || SKUCode == null) {
                    alert('Please make sure SKU Code is not empty.');
                    return false;
                }
                else {
                    var JsonObj = {};
                    JsonObj['SKUCode'] = SKUCode;
                    JsonObj['SKUDescr'] = SKUDescr;
                    JsonObj['CustomsLotNo'] = CustomsLotNo;
                    JsonObj['UOM'] = UOM;
                    JsonObj['Qty'] = Qty;

                    Orders.push(JsonObj);
                    CheckSKUCode = true;
                }
            });

            if (CheckSKUCode == true) {
                var JsonArr = JSON.stringify(Orders);
                document.getElementById("OrderLineHiddenInput").value = JsonArr;
                alert('Order Line Saved Successfully.');
            }
        }

        //For Save Changes Button Click
        $(document).on("click", '#' + '<%= Save.ClientID %>', function () {
            GetOrderLineTableValue();
        });

        //We will allow to type only integer value for Order Line Poup
        function validate(evt) {
            var theEvent = evt || window.event;

            // Handle paste
            if (theEvent.type === 'paste') {
                key = event.clipboardData.getData('text/plain');
            } else {
                // Handle key press
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
            }
            var regex = /[0-9]|\./;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
        }

        //For Create Order Button Validation
        function Validate(id) {
            if (Page_ClientValidate("Success")) {
                var btn = document.getElementById(id);
                btn.disabled = true;
                btn.innerHTML = "Processing...";
            } else {
                alert("Please select Account.");
            }
        }
</script>

<input type="hidden" id="OrderLineHiddenInput" name="OrderLineHiddenInput" value="" />

<!-- Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header" style="padding: 35px 50px;">
                <h1>Create Order</h1>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="background-color: #fafafd;">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="font-family: Helvetica; font-weight: bold; color: black; margin-left: 73px; font-size: 14px;">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label runat="server" ID="AccountLbl" Text="Account"></asp:Label><br />
                                                <telerik:RadComboBox runat="server" ID="AccountCombo" AutoPostBack="false" CausesValidation="false" Width="300px" OnLoad="AccountCombo_Load" AllowCustomText="false"
                                                    Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableVirtualScrolling="true">
                                                </telerik:RadComboBox>
                                                <asp:RequiredFieldValidator runat="server" ID="AccountComboReqVal" ControlToValidate="AccountCombo" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 190px;"></td>
                                            <td>
                                                <br />
                                                <asp:Label runat="server" ID="PriorityLbl" Text="Priority"></asp:Label><br />
                                                <asp:DropDownList ID="PriorityDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 220px; margin-top: 6px; height: 34px; font-size: 15px;">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>

                                    <table style="margin-top: 10px">
                                        <tr>
                                            <td>
                                                <telerik:RadRadioButtonList runat="server" ID="TypeRadioButtonList" AutoPostBack="false" CausesValidation="false"></telerik:RadRadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Your Order No" runat="server"></asp:Label>
                                                <asp:TextBox ID="YourOrderNoTxt" runat="server" placeholder="Enter Your Order No" AutoPostBack="false" CssClass="form-control input-box" Width="180px" Height="35px" Font-Size="15px" Style="border-radius: 3px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Customer Code" runat="server"></asp:Label>
                                                <br />
                                                <telerik:RadComboBox runat="server" ID="CustomerCodeCombo" AutoPostBack="true" CausesValidation="false" Width="300px" OnLoad="CustomerCodeCombo_Load" AllowCustomText="false" OnSelectedIndexChanged="CustomerCodeCombo_SelectedIndexChanged"
                                                    Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableVirtualScrolling="true" EnableLoadOnDemand="true">
                                                </telerik:RadComboBox>
                                            </td>
                                            <td style="width: 190px;"></td>
                                            <td>
                                                <br />
                                                <asp:Label Text="Customer Name" runat="server"></asp:Label>
                                                <asp:TextBox ID="CustomerNameTxt" runat="server" CssClass="form-control input-box" Width="180px" Height="35px" Style="border-radius: 3px; font-size: 14px" ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Expected Date" runat="server"></asp:Label>
                                                <br />
                                                <telerik:RadDatePicker runat="server" RenderMode="Lightweight" ID="ExpectedDatePicker" Width="180px" Height="35px" Skin="Bootstrap" DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td style="width: 190px;"></td>
                                            <td>
                                                <br />
                                                <telerik:RadRadioButtonList runat="server" ID="DeliveryTimingRadioButtonList" CausesValidation="false"></telerik:RadRadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label runat="server" Text="City"></asp:Label><br />
                                                <asp:DropDownList ID="CityDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 220px; margin-top: 6px; height: 34px; font-size: 15px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 190px;"></td>
                                            <td>
                                                <br />
                                                <asp:Label Text="Contact No" runat="server"></asp:Label>
                                                <asp:TextBox ID="ContactNoTxt" runat="server" CssClass="form-control input-box" Width="180px" Height="35px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label runat="server" Text="Country"></asp:Label><br />
                                                <asp:DropDownList ID="CountryDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 220px; margin-top: 6px; height: 34px; font-size: 15px;">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 190px;"></td>
                                            <td>
                                                <br />
                                                <asp:Label Text="Fax" runat="server"></asp:Label>
                                                <asp:TextBox ID="FaxTxt" runat="server" CssClass="form-control input-box" Width="180px" Height="35px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Label Text="Postal Code" runat="server"></asp:Label>
                                                <asp:TextBox ID="PostalCodeTxt" runat="server" CssClass="form-control input-box" Width="180px" Height="32px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                            <td style="width: 190px;"></td>
                                            <td>
                                                <br />
                                                <asp:Label Text="Delivery Address" runat="server"></asp:Label>
                                                <asp:TextBox ID="DeliveryAddrTxt" runat="server" TextMode="MultiLine" CssClass="form-control input-box" Width="450px" Height="65px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="OrderLineDiv" runat="server" class="popup" pd-popup="popupNew">
                                <div class="popup-inner">
                                    <h1>How Many ?</h1>
                                    <br />
                                    <input type="text" id="OrderLineCountTextBox" class="form-control input-box" runat="server" oninput="OrderLineCount(this)" width="180px" height="32px" style="border-radius: 3px; font-size: 15px;" onkeypress='validate(event)' />
                                    <a pd-popup-close="popupNew" href="#" class="btn btn-danger btn-default pull-left" style="font-family: Arial; font-size: 13px; margin-top: 17%; margin-left: 35%;"><span class="fa fa-times"></span>&nbsp;Close</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <br />
                            <div id="CreateOrderLineDiv" style="margin-left: 40%">
                                <a class="btn btn-primary has-spinner" id="CreateOrderLineBtn" pd-popup-open="popupNew" href="#" runat="server" causesvalidation="false" style="font-family: Arial; font-size: 13px;">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;Create Order Line
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="CreateOrderLineTable" runat="server" style="display: none; margin-left: 73px; width: 100%">
                                <tr>
                                    <td style="float: left; clear: left; width: 100%">
                                        <a class="btn btn-primary" id="AddOrderLineBtn" runat="server" causesvalidation="false" style="font-family: Arial; font-size: 13px;">
                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;Add Order Line
                                        </a>
                                        &nbsp;
                                        <a class="btn btn-primary" id="Save" runat="server" causesvalidation="false" style="font-family: Arial; font-size: 13px;">
                                            <i class="fa fa-save"></i>&nbsp;&nbsp;Save Changes
                                        </a>
                                    </td>

                                    <td style="float: left; clear: left; width: 120%">
                                        <br />
                                        <div>
                                            <table id="OrderLineTable" class="table table-striped table-bordered" cellspacing="0" style="font-size: 13px;">
                                                <thead>
                                                    <tr>
                                                        <th width="20%">SKU</th>
                                                        <th>Description</th>
                                                        <th width="17%">Custom Lot No.</th>
                                                        <th width="13%">UOM</th>
                                                        <th width="13%">Qty</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="OrderLineRow">
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <asp:LinkButton ID="SubmitOrderBtn" OnClientClick="Validate(this.id);" ValidationGroup="Success" OnClick="Submit_ServerClick" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-plus"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Create Order</span></asp:LinkButton>
                &nbsp;
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="font-family: Arial; font-size: 13px;"><span class="fa fa-times"></span>&nbsp;&nbsp;Close</button>
            </div>
        </div>
    </div>
</div>

<telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>

<table style="background-color: white; width: 100%; margin-top: 0px; margin-bottom: 0px; margin-left: 75px;">
    <tr style="font-family: Arial;">
        <td style="color: #32387d; padding-top: 16px;">
            <asp:Label runat="server" Text="Release Order" Font-Bold="true" Font-Size="19px"></asp:Label>
        </td>
        <td style="float: right; padding-top: 15px; padding-right: 21%;">
            <p>
                <a class="btn btn-primary has-spinner spin" id="CreateRequestBtn" runat="server" href="#" data-toggle="modal" data-target="#myModal" causesvalidation="false" style="font-family: Arial; font-size: 13px;">
                    <i class="fa fa-plus"></i>&nbsp;&nbsp;Create Order
                </a>
            </p>
        </td>
    </tr>
</table>
