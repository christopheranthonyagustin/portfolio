<%@ Page Language="c#" CodeBehind="VehicleImage.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Vehicle.VehicleImage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>VehicleImage</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            width: 294px;
        }

        .style2 {
            height: 37px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload="javascript:window.focus();">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td>
                    <br />
                    &nbsp;
                <asp:Button ID="ImageSubmit" class="white" runat="server" OnClick="ImageSubmit_ServerClick" Text="Add" Visible="True" UseSubmitBehavior="true"></asp:Button>
                    &nbsp;
                    <asp:Button ID="AddBtn" class="white" runat="server" OnClick="ImageSubmit_ServerClick" Text="Add" Visible="false" UseSubmitBehavior="true"></asp:Button>
                    <asp:Button ID="BackButton" class="white" runat="server" OnClick="BackButton_Click" Text="Hide" Visible="True" UseSubmitBehavior="true"></asp:Button>
                    <br>
                </td>
            </tr>
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
                                        <telerik:RadLabel ID="ImageLbl" runat="server">
                                        </telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadLabel ID="ImageDescrLbl" runat="server">
                                        </telerik:RadLabel>
                                        <br />
                                        <telerik:RadLabel ID="ImageTypeSizeLbl" runat="server">
                                        </telerik:RadLabel>
                                    </td>
                                    <td align="right">
                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                            OnClick="VehImageDelete">
                                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                runat="server">
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                        <%--<SeparatorTemplate>
								|
							</SeparatorTemplate>--%>
                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                    </asp:DataList><br>
                    <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td class="style1">Type<br />
                                    <telerik:RadComboBox ID="Type" runat="server" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" Width="155px" Skin="WebBlue" AutoPostBack="true"
                                        AllowCustomText="false" RenderMode="Lightweight" Filter="Contains">
                                    </telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="TypeReq" runat="server" ControlToValidate="Type"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <td>ReferenceNo<br />
                                        <telerik:RadTextBox ID="Reftxtbox" Width="135px" runat="server"></telerik:RadTextBox>
                                    </td>
                            </tr>
                            <%--<TR>
									<TD>Type</TD>
									<TD><INPUT id="ImageType" name="ImageType" runat="server">
										<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="ImageFile" ErrorMessage="*"></asp:RequiredFieldValidator></TD>
								</TR>--%>
                            <tr>
                                <td class="style1">FromDate<br />
                                    <%--<asp:TextBox ID="FrmDateTxt" runat="server" />
                                <asp:CalendarExtender ID="FrmDateTxt_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="FrmDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                    Format="dd/MMM/yyyy">
                                </asp:CalendarExtender>--%>
                                    <telerik:RadDatePicker ID="FrmDateTxt" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                    </telerik:RadDatePicker>
                                </td>
                                &nbsp;<td>ToDate<br />
                                    <%-- <asp:TextBox ID="ToDateTxt" runat="server" />
                                    <asp:CalendarExtender ID="ToDateTxt_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="ToDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                        Format="dd/MMM/yyyy">
                                    </asp:CalendarExtender>--%>
                                    <telerik:RadDatePicker ID="ToDateTxt" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                    </telerik:RadDatePicker>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>Amount
                                <br />
                                    <telerik:RadTextBox ID="Amountbox" runat="server">
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="AmtCompareVal" runat="server" ControlToValidate="Amountbox"
                                        ErrorMessage="*" Type="Double"></asp:CompareValidator>
                                </td>
                                <td>Status<br />
                                    <telerik:RadDropDownList ID="ImageStatus" runat="server" Enabled="true" DataTextField="Descr"
                                        DataValueField="item" Width="138px" Skin="WebBlue">
                                    </telerik:RadDropDownList>
                            </tr>
                            <tr>
                                <td class="style1">AttachmentName<br />
                                    <telerik:RadTextBox ID="ImageName" runat="server">
                                    </telerik:RadTextBox>
                                    &nbsp;
                                <%--<asp:RequiredFieldValidator ID="ImagenameReqVal" runat="server" 
                                                ControlToValidate="ImageName" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                    <telerik:RadLabel ID="MessageLbl" runat="server" CssClass="errorLabel">
                                    </telerik:RadLabel>
                                    <br />
                                    <asp:CheckBox ID="ReAttachedChkBox" runat="server" Checked="False" Style="z-index: 0"
                                        Text="Re-Attach" AutoPostBack="true" OnCheckedChanged="ReAttachedChkBox_CheckedChanged" />
                                    <td>
                                        <telerik:RadLabel ID="FileLbl" runat="server" Text="File">
                                        </telerik:RadLabel>
                                        <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                            DropZones=".DropZone1,#DropZone2" />
                                        <%--<asp:Label ID="FileLbl" runat="server"></asp:Label>
                                <br />
                                <input id="ImageFile" runat="server" name="ImageFile" type="file">--%>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="ImageFile" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                    </td>
                            </tr>
                            <tr>
                                <td class="style1">Remarks1<br />
                                    <telerik:RadTextBox ID="Remarks1" runat="server" Height="90px" Width="249px" TextMode="MultiLine">
                                    </telerik:RadTextBox>
                                    <td>Remarks2<br />
                                        <telerik:RadTextBox ID="Remarks2" runat="server" Height="90px" Width="249px" TextMode="MultiLine">
                                        </telerik:RadTextBox>
                                    </td>
                            </tr>
                            <tr>
                                <td class="style1"></td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <input id="ImageNameNA" runat="server" name="ImageName" visible="false" />
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
