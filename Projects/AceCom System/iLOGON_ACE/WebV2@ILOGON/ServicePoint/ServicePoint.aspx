<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePoint.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.ServicePoint.ServicePoint" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Point</title>
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
    <script type="text/javascript" src="../Script/WebV2.js"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            //For ToPostalCode TextChanged
            $(document).on('change', '#' + '<%= PostalCodeTxtBox.ClientID %>', function () {
                var PostalCode = $(this).val();
                $.ajax({
                    url: 'ServicePointGetAddress.aspx/PostalCode',
                    data: '{PostalCode: "' + PostalCode + '"}',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if (result.d) {
                            if (result.d) {
                                var ReturnVal = result.d;
                                if (!ReturnVal.includes("invalid")) {
                                    $('#' + '<%= AddrTxtBox.ClientID %>').val(ReturnVal);
                                }
                                else {
                                    alert(ReturnVal);
                                    $('#' + '<%= AddrTxtBox.ClientID %>').val("");
                                }
                            }
                        }
                    },
                    failure: function (response) {
                        alert('Check Postal Code Again.');
                    }
                });
            });

            //For Code Text Changed
            $(document).on('change', '#' + '<%= CodeTxtBox.ClientID %>', function () {
                var Code = $(this).val();
                $('#' + '<%= DescrTxtBox.ClientID %>').val(Code);
            });

            //Clear Data when Modal popup closed
            $(document).on('hidden.bs.modal', '#myModal', function () {
                window.location.reload(true);
            })
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <!-- Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header" style="padding: 35px 50px;">
                        <h1>Service Point</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body" style="background-color: #fafafd;">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="font-family: Helvetica; font-weight: bold; color: black; margin-left: 73px; margin-bottom: 35px; font-size: 14px;">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <br />
                                                        <asp:Label runat="server" ID="AccountLbl" Text="Account"></asp:Label><br />
                                                        <telerik:RadComboBox runat="server" ID="AccCombo" AutoPostBack="true" CausesValidation="false" Width="300px" OnLoad="AccountCombo_Load" AllowCustomText="false"
                                                            Filter="Contains" ShowMoreResultsBox="true" DropDownAutoWidth="Enabled" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableVirtualScrolling="true">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <br />
                                                        <asp:Label Text="Code" runat="server"></asp:Label>
                                                        <asp:RequiredFieldValidator runat="server" ID="CodeReqVal" ControlToValidate="CodeTxtBox" ErrorMessage="*" ForeColor="Red" ValidationGroup="Success"></asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="CodeTxtBox" runat="server" CssClass="form-control input-box" Width="180px" Height="35px" Font-Size="15px" Style="border-radius: 3px;"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 50px;"></td>
                                                    <td>
                                                        <br />
                                                        <asp:Label Text="Description" runat="server"></asp:Label>
                                                        <asp:RequiredFieldValidator runat="server" ID="DescrReqVal" ControlToValidate="DescrTxtBox" ErrorMessage="*" ForeColor="Red" ValidationGroup="Success"></asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="DescrTxtBox" runat="server" CssClass="form-control input-box" Width="180px" Height="35px" Font-Size="15px" Style="border-radius: 3px;"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <td>
                                                    <asp:Label Text="Postal Code" runat="server"></asp:Label>
                                                    <asp:RequiredFieldValidator runat="server" ID="ToPostalCodeReqVal" ControlToValidate="PostalCodeTxtBox" ErrorMessage="*" ForeColor="Red" ValidationGroup="Success"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="PostalCodeTxtBox" runat="server" CssClass="form-control input-box" Width="180px" Height="32px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                                </td>
                                                <td style="width: 50px;"></td>
                                                <td style="padding-top: 6px;">
                                                    <br />
                                                    <asp:Label Text="Address" runat="server"></asp:Label>
                                                    <asp:RequiredFieldValidator runat="server" ID="AddrReqVal" ControlToValidate="AddrTxtBox" ErrorMessage="*" ForeColor="Red" ValidationGroup="Success"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="AddrTxtBox" runat="server" TextMode="MultiLine" CssClass="form-control input-box" Width="450px" Height="65px" Style="border-radius: 3px; font-size: 14px"></asp:TextBox>
                                                </td>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="SubmitOrderBtn" OnClientClick="Validate(this.id);" ValidationGroup="Success" OnClick="Submit_ServerClick" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-check-square-o"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">&nbsp;&nbsp;Submit Service Point</span></asp:LinkButton>
                        &nbsp;
                        <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="font-family: Arial; font-size: 13px;"><span class="fa fa-times"></span>&nbsp;&nbsp;Close</button>
                    </div>
                </div>
            </div>
        </div>

        <table style="background-color: white; width: 100%; margin-top: 0%; margin-bottom: 0%; margin-left: 75px;">
            <tr style="font-family: Arial;">
                <td style="color: #32387d; padding-top: 16px;">
                    <asp:Label runat="server" Text="Service Point" Font-Bold="true" Font-Size="19px"></asp:Label>
                </td>
                <td style="float: right; padding-top: 15px; padding-right: 18%;">
                    <p>
                        <a class="btn btn-primary has-spinner" id="CreateBtn" runat="server" href="#" data-toggle="modal" data-target="#myModal" causesvalidation="false" style="font-family: Arial; font-size: 13px;">
                            <i class="fa fa-plus"></i>&nbsp;&nbsp;Create Service Point
                        </a>
                    </p>
                </td>
            </tr>
        </table>
        <br />
        <table style="background-color: white; width: 98%; margin-top: 0%; margin-bottom: 10px; margin-left: 75px;">
            <tr style="font-family: Arial; font-size: 16.5px;">
                <td>
                    <asp:Label runat="server" Text="Code"></asp:Label>
                    <asp:TextBox ID="CodeTxt" runat="server" CssClass="form-control input-box" Width="170px" Height="30px" Style="border-radius: 5px; font-size: 14px"></asp:TextBox>
                </td>
                <td style="float: right; padding-top: 15px; padding-right: 29%;">
                    <asp:LinkButton ID="FilterSOBtn" OnClientClick="DisableBtn(this.id, false);" OnClick="FilterBtn_ServerClick" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-filter fa_custom"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Filter</span></asp:LinkButton>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" OnNeedDataSource="ResultDG_NeedDataSource" AutoGenerateColumns="false" Skin="Office2010Blue" RenderMode="Lightweight"
            AllowSorting="true" AllowPaging="true" GridLines="None" Style="width: 90%; margin-left: 5%; margin-right: 0; font-family: Arial; font-size: 13px;">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" PageSize="50" TableLayout="Fixed" Width="100%">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AcCode" UniqueName="Account" SortExpression="Account" HeaderText="Account" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Code" UniqueName="Code" SortExpression="Code" HeaderText="Code" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Descr" UniqueName="Description" SortExpression="Description" HeaderText="Description" HeaderStyle-Width="300px" ItemStyle-Width="300px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ZipCode" UniqueName="PostalCode" SortExpression="PostalCode" HeaderText="Postal Code" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Addr" UniqueName="Address" SortExpression="Address" HeaderText="Address">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
