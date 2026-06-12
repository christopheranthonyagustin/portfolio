<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterGenInvoice.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterGenInvoice" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GenerateNewInvoice</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
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
    </script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="compile_Click">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="1"
            MinDisplayTime="500" Transparency="40" BackColor="#f5f5f0">
            <div style="vertical-align: middle;">
                <asp:Image ID="Image1" runat="server" ImageUrl="../../Image/loading-image.gif" Width="50"
                    Height="50" AlternateText="loading" CssClass="MyLoadingImage"></asp:Image>
            </div>
        </telerik:RadAjaxLoadingPanel>
        <br />
        <asp:Panel ID="Panel1" runat="server" Width="300px">
            &nbsp;
            <table border="0" cellpadding="4" cellspacing="5" width="80%">
                <tr>
                    <td>
                        <telerik:RadLabel ID="InvoiceLbl" runat="server" Text="Invoice:"></telerik:RadLabel>
                    </td>
                    <td>
                    <telerik:RadComboBox ID="InvNoList" runat="server" Skin="WebBlue" Width="180px" DropDownWidth="170px"
                        CausesValidation="false" Filter="Contains" RenderMode="Lightweight" Enabled="true">
                    </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="InvoiceDateLbl" runat="server" Text="InvoiceDate:"></telerik:RadLabel>
                    </td>
                   <td>
                    <telerik:RadDatePicker ID="InvoiceDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="InvoiceDatePickerReqVal" runat="server"
                            ControlToValidate="InvoiceDatePicker" ErrorMessage="*" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="EntityLbl" runat="server" Text="Entity:"></telerik:RadLabel>
                    </td>
                    <td>
                    <telerik:RadDropDownList runat="server" ID="EntityList" DropDownHeight="200px" Width="180px"
                        Skin="WebBlue" CausesValidation="false" Filter="Contains" RenderMode="Lightweight" Enabled="false">
                    </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="AccountLbl" runat="server" Text="Account:"></telerik:RadLabel>
                    </td>
                    <td>
                    <telerik:RadComboBox ID="AccountList" runat="server" Skin="WebBlue" Width="180px" DropDownWidth="170px"
                        CausesValidation="false" Filter="Contains" RenderMode="Lightweight" Enabled="false">
                    </telerik:RadComboBox> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="CurrencyLbl" runat="server" Text="Currency:"></telerik:RadLabel>
                    </td>
                    <td>
                    <telerik:RadComboBox ID="CurrList" runat="server" Skin="WebBlue" Width="180px" DropDownWidth="180px"
                        CausesValidation="false" Filter="Contains" RenderMode="Lightweight" Enabled="false">
                    </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="PayTermsLbl" runat="server" Text="PayTerms:"></telerik:RadLabel>
                    </td>
                   <td>
                        <telerik:RadComboBox ID="PaytermsList" runat="server" Skin="WebBlue" Width="180px" DropDownWidth="180px"
                            CausesValidation="false" Filter="Contains" RenderMode="Lightweight">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="PaymentInfoLbl" runat="server" Text="PaymentInfo:"></telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="PaymentInfoList" runat="server" Skin="WebBlue" Width="180px" DropDownWidth="180px"
                            CausesValidation="false" Filter="Contains" RenderMode="Lightweight">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="TypeLbl" runat="server" Text="Type:"></telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="DRTypelist" runat="server" Skin="Sunset" Width="170px" DropDownWidth="170px"
                            CausesValidation="false" Filter="Contains" RenderMode="Lightweight">
                        </telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="DRTypelist" ErrorMessage="*" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="RemarksLbl" runat="server" Text="Remarks:"></telerik:RadLabel>
                    </td>
                    <td>
                   <telerik:RadTextBox ID="RemarksTxt" runat="server" Skin="WebBlue" Width="180px" ></telerik:RadTextBox>
                    </td>
                </tr>
                  <tr>
                      <td>
                        <telerik:RadLabel ID="DeliveryDateLbl" runat="server" Text="DeliveryDate:"></telerik:RadLabel>
                    </td>
                    <td>
                    <telerik:RadDatePicker ID="DeliveryDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="WebBlue">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="GenerateBtn" runat="server" CssClass="white" Text="Generate" CausesValidation="true"
                     OnClick="GenerateBtn_Click" OnClientClick="disableBtn(this.id,true)"  UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
