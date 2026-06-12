<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="iWMS.Web.General.Setting" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Settings</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5/" />
    <link rel="icon" sizes="190x130" href="../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../css/Setting.css" />
    <link rel="stylesheet" type="text/css" href="../css/PasswordReset.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <style type="text/css">
        .changeonboardingkit {
            text-decoration: none;
            cursor: pointer;
            padding-left: 20px !important;
        }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="py-4" style="position: sticky; top: 2px">
                    <div class="custom-menu">
                        <button type="button" id="sidebarCollapse" class="btn btn-primary">
                            <i class="fa fa-bars"></i>
                            <span class="sr-only">Toggle Menu</span>
                        </button>
                    </div>
                    <div class="logo mb-3" style="padding-left: 20px;">
                        <i class="fa fa-cog" aria-hidden="true" style="font-size: 28px"></i>&nbsp;&nbsp;&nbsp;
                		<asp:Label runat="server" Text="Setting" Font-Bold="true" Font-Size="28px"></asp:Label>
                    </div>
                    <ul class="list-unstyled components mb-5" id="MenuList" runat="server">
                        <li class="active">
                            <a id="changepass" style="text-decoration: none; cursor: pointer; padding-left: 20px;"><i class="fa fa-key mr-3" aria-hidden="true"></i>Change Password</a>
                        </li>
                        <li>
                            <a id="changeprofile" style="text-decoration: none; cursor: pointer; padding-left: 20px;"><i class="fa fa-edit mr-3" aria-hidden="true"></i>Change Profile</a>
                        </li>
                        <li>
                            <a id="changefavouriteacc" style="text-decoration: none; cursor: pointer; padding-left: 20px;"><i class="fa fa-user mr-3" aria-hidden="true"></i>Change Favourite Account</a>
                        </li>
                        <%--                        <li>
                            <a id="changeonboardingkit" style="text-decoration: none; cursor: pointer; padding-left: 20px;"><i class="fa fa-file-upload mr-3" aria-hidden="true"></i>Onboarding Kit</a>
                        </li>--%>
                    </ul>
                </div>
            </nav>
            <div id="content" class="container">

                <section class="ftco-section" id="cpass">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-8 col-lg-5">
                                <div class="login-wrap p-4 p-md-5">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-user"></span>
                                    </div>
                                    <h3 class="text-center mb-4">Password Reset</h3>
                                    <div id="form2" runat="server" class="login-form">
                                        <div class="form-group d-flex password-container">
                                            <input type="password" id="OldPasswordTxt" name="OldPasswordTxt" class="form-control rounded-left" placeholder="Old Password" />
                                            <span class="password-toggle" onclick="togglePasswordVisibility(this)" />
                                            <i class="far fa-eye"></i>
                                        </div>
                                        <div class="form-group d-flex password-container">
                                            <input type="password" id="NewPasswordTxt" name="NewPasswordTxt" class="form-control rounded-left" placeholder="New Password" />
                                            <span class="password-toggle" onclick="togglePasswordVisibility(this)" />
                                            <i class="far fa-eye"></i>
                                        </div>
                                        <div class="form-group d-flex password-container">
                                            <input type="password" id="NewPassword2Txt" name="NewPassword2Txt" class="form-control rounded-left" placeholder="Retype Password" />
                                            <span class="password-toggle" onclick="togglePasswordVisibility(this)" />
                                            <i class="far fa-eye"></i>
                                        </div>
                                        <div class="form-group text-center">
                                            <div class="row">
                                                <div class="col-md-5 mr-5">
                                                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" class="btn btn-primary rounded submit" Style="padding: 13px 40px;" />
                                                </div>
                                                <div class="col-md-5">
                                                    <button type="submit" id="ResetBtn" class="btn btn-primary rounded submit" style="padding: 13px 40px;">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div id="cprofile" class="text-center my-5">
                    <h3>There has no logic for now.</h3>
                </div>

                <div id="cfacc" class="text-center my-5">
                    <h3>There has no logic for now.</h3>
                </div>

                <div id="onboardingkit">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row justify-content-center">
                                <div class="col-12 mb-0 row">
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="Label1" Text="Serial No"></asp:Label><br />
                                        <asp:DropDownList ID="SerialNoDDL" AutoPostBack="true" runat="server" OnSelectedIndexChanged="SerialNoDDL_SelectedIndexChanged" CssClass="custom-select input-dropdown" DataTextField="Item2" DataValueField="Descr2" CausesValidation="false" Style="width: 220px; margin-top: 6px; height: 34px; font-size: 15px;">
                                        </asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator ID="SerialNoDDLValidator" runat="server"  ControlToValidate="SerialNoDDL"   InitialValue=""  ErrorMessage="Please Choose" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" class="btn btn-primary rounded submit mt-4 custom-accordion-btn mb-1" />
                                    </div>
                                </div>

                                <div id="PersonnelMessageSection" runat="server" class="Personnel-message-box">
                                    <i class="Personnel-message-icon fas fa-info-circle"></i>
                                    <div class="Personnel-message-header">You cannot perform this function because your user id is not assigned a personnel id in User Master.</div>
                                </div>

                                <div id="NoRecordFound" runat="server">
                                    <asp:Label runat="server" ID="LblNoRecordFound" Text="No Record is found" CssClass="NoRecordFoundRedText"></asp:Label>
                                </div>

                                <div id="ToggleSection" runat="server" class="col-12 mt-5">
                                    <div class="container2 mb-5">
                                        <h2 class="text-center" style="color: #05538C">Onboarding Kit</h2>
                                        <div class="mb-2 row">
                                            <div class="col-md-4">
                                                 <label id="SerialNoLabel" class="form-label2">Serial No</label>
                                                <input type="text" runat="server" id="SerialText" class="form-control" style="width: 100%!important;" align="center" name="SerialNo" placeholder="SerialNo" readonly />
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label2">Brand</label>
                                                <input type="text" runat="server" id="BrandText" class="form-control" style="width: 100%!important;" align="center" name="brand" placeholder="Brand" readonly />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Label runat="server" ID="PersonnelLbl" Text="Personnel" Visible="false"></asp:Label>
                                                <label class="form-label2">Model</label>
                                                <input type="text" runat="server" id="ModelText" class="form-control" style="width: 100%!important;" align="center" name="model" placeholder="Model" readonly />
                                            </div>
                                        </div>

                                        <div class="mb-2 row">
                                            <div class="col-md-4">
                                                <label class="form-label2">Type</label>
                                                <input type="text" runat="server" id="TypeText" class="form-control" style="width: 100%!important;" align="center" name="type" placeholder="Type" readonly />
                                                <input type="text" runat="server" id="ImageUrl" class="form-control" style="width: 100%!important;" align="center" name="type" placeholder="Type" readonly />
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label2">Issue Date</label>
                                                <telerik:RadDatePicker runat="server" RenderMode="Lightweight" ID="IssueDatePicker" Width="100%" Height="40px" Skin="Bootstrap" DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label2">Return Date</label>
                                                <telerik:RadDatePicker runat="server" RenderMode="Lightweight" ID="ReturnDatePicker" Width="100%" Height="40px" Skin="Bootstrap" DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </div>
                                        </div>
                                        <div class="mb-2 row">
                                            <div class="col-md-4">
                                                <label class="form-label2">Remarks</label>
                                                <textarea class="form-control" runat="server" id="RemarkText" name="remark" rows="3"></textarea>
                                                <input type="text" runat="server" id="StatusText" class="form-control" style="width: 100%!important;" align="center" name="Status" placeholder="Status" readonly />
                                            </div>
                                        </div>

                                        <div>
                                            <asp:Button runat="server" ID="UploadBtn" Text="Submit" OnClick="UploadBtn_Click" class="btn btn-primary rounded submit mt-5" Style="padding: 13px 40px; margin-left: 41.5%;" />
                                            <asp:Button runat="server" ID="UpdateOBKBtn" Text="Update" OnClick="UpdateOBKBtn_Click" class="btn btn-primary rounded submit" Style="padding: 13px 40px; margin-left: 25.5%;" />
                                            <asp:Button runat="server" ID="CancelOBKBtn" Text="Cancel" OnClick="CancelOBKBtn_Click" class="btn btn-primary rounded submit" Style="padding: 13px 40px; margin-left: 10.5%;" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive mt-3">
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                                    AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="False">
                                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM p-2" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="FAHandlerId">
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ItemEdit" OnClick="ItemEdit_Click"
                                                        ImageUrl="../image/Onboardingedit.png" Width="15" Height="15" AlternateText="Edit" title="Edit" CausesValidation="false"
                                                        BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                    &nbsp;
                                                                            
                                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ItemDelete"
                                                            ImageUrl="../image/Onboardingdelete.png" Width="15" Height="15" AlternateText="Delete" CausesValidation="false" title="Delete"
                                                            OnClick="ItemDelete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                   
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn HeaderText="Serial No" DataField="SerialNumber" SortExpression="SerialNumber" UniqueName="SerialNumber"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Brand" DataField="Brand" SortExpression="Brand" UniqueName="Brand"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Model" DataField="Model" SortExpression="Model" UniqueName="Model"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Type" DataField="Type" SortExpression="Type" UniqueName="Type"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>
                                           
                                            <telerik:GridBoundColumn HeaderText="Issue Date" DataField="IssueDate" SortExpression="IssueDate" UniqueName="IssueDate" DataFormatString="{0:dd/MMM/yyyy}"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Last Check" DataField="LastCheckDate" SortExpression="LastCheckDate" UniqueName="LastCheckDate" DataFormatString="{0:dd/MMM/yyyy}"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Next Check" DataField="NextCheckDate" SortExpression="NextCheckDate" UniqueName="NextCheckDate" DataFormatString="{0:dd/MMM/yyyy}"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Return Date" DataField="ReturnDate" SortExpression="ReturnDate" UniqueName="ReturnDate" DataFormatString="{0:dd/MMM/yyyy}"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes"
                                                AllowFiltering="true" Reorderable="true">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" SortExpression="StatusDescr" UniqueName="StatusDescr"
                                                AllowFiltering="true">
                                            </telerik:GridBoundColumn>


                                            <%-- <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>--%>
                                            <telerik:GridBoundColumn DataField="Id" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FAMId" Display="false">
                                            </telerik:GridBoundColumn>

                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="../js/Script.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

        $(document).ready(function () {
            ShowHideBlocks();

            $("#sidebarCollapse").on("click", function () {                $("#sidebar").toggleClass("active");            });

            $("#CancelOBKBtn").click(function () {
                $("#UploadBtn").show();
                $("#UpdateOBKBtn").hide();
                $("#CancelOBKBtn").hide();
                $("#SerialNoDDL").val("");
                $("#DepartmentCodeDDL").val("");
                $("#PersonnelIdDDL").val("");
                $("#BrandText").val("");
                $("#BranchDDL").val("");
                $("#StautsText").val("");
                $("#PurchaseDateText").val("");
                $("#IssueDatePicker").val("");
                $("#ReturnDatePicker").val("");
                $("#RemarkText").val("");
            });

            $("#changepass").click(function () {
                $("#cpass").show();
                $("#onboardingkit").hide();
                $("#cprofile").hide();
                $("#cfacc").hide();
                $("#SerialNoDDL").val("");
                $("#DepartmentCodeDDL").val("");
                $("#PersonnelIdDDL").val("");
                $("#BrandText").val("");
                $("#BranchDDL").val("");
                $("#StautsText").val("");
                $("#PurchaseDateText").val("");
                $("#IssueDatePicker").val("");
                $("#ReturnDatePicker").val("");
                $("#RemarkText").val("");
            });

            $("#changeonboardingkit").click(function () {
                $("#onboardingkit").show();
                $("#cpass").hide();
                $("#cprofile").hide();
                $("#cfacc").hide();
            });

            $("#changeprofile").click(function () {
                $("#cprofile").show();
                $("#cfacc").hide();
                $("#cpass").hide();
                $("#onboardingkit").hide();
            });

            $("#changefavouriteacc").click(function () {
                $("#cfacc").show();
                $("#cprofile").hide();
                $("#cpass").hide();
                $("#onboardingkit").hide();
            });

            $("ul.list-unstyled.components li a").click(function () {
                $("ul.list-unstyled.components li").removeClass("active");
                $(this).closest("li").addClass("active");
            });
        });


        function ShowHideBlocks() {
            <telerik:RadCodeBlock runat="server" >
                var selectedValue = $("#<%= SerialNoDDL.ClientID %>").val();
            </telerik:RadCodeBlock>

            if (selectedValue !== "") {
                $("#onboardingkit").show();
                $("#cpass").hide();
                $("#cprofile").hide();
                $("#cfacc").hide();
                $("ul.list-unstyled.components li").removeClass("active");
                $("#changeonboardingkit").closest("li").addClass("active");
                $('#ToggleSection').hide();

            } else {
                $("#cpass").show();
                $("#onboardingkit").hide();
                $("#cprofile").hide();
                $("#cfacc").hide();
                $("ul.list-unstyled.components li").removeClass("active");
                $("#changepass").closest("li").addClass("active");
                $('#ToggleSection').hide();
            }
        }

        function togglePasswordVisibility(icon) {
            var passwordInput = icon.previousElementSibling;
            var eyeIcon = icon.querySelector("i");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                passwordInput.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        }
    </script>
</body>
</html>
