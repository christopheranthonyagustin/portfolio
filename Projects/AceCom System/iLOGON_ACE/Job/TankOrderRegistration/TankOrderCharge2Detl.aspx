<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderCharge2Detl.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderCharge2Detl" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GenerateNewInvoice</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
     <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
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
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="300px">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td nowrap class="style2" valign="top">
                    &nbsp; BL Reference: &nbsp;
                    <telerik:RadDropDownList runat="server" ID="Blreflist" DropDownHeight="200px" Width="200px"
                        Skin="WebBlue" CausesValidation="false" Filter="Contains" RenderMode="Lightweight">
                    </telerik:RadDropDownList>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td nowrap class="style2" valign="top">
                    &nbsp; Tank No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <telerik:RadTextBox ID="TankNotxt" runat="server" Width="200px" TextMode="MultiLine"
                        Rows="6">
                    </telerik:RadTextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td nowrap class="style2" valign="top">
                    &nbsp; PaymentTerms:                   
                    <telerik:RadDropDownList runat="server" ID="PayTermList" DropDownHeight="200px" Width="170px"
                        Skin="WebBlue" CausesValidation="false" Filter="Contains" RenderMode="Lightweight">
                    </telerik:RadDropDownList>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td nowrap class="style2" valign="top">
                    &nbsp; Currency: &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <telerik:RadComboBox ID="CurrList" runat="server" Skin="WebBlue" Width="100px" DropDownWidth="200px"
                        CausesValidation="false" Filter="Contains" RenderMode="Lightweight" Enabled="false">
                    </telerik:RadComboBox>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<telerik:RadButton ID="RadButton1" runat="server" OnClick="GenerateBtn_Click" SingleClick="true" SingleClickText="Processing..."
                        Skin="WebBlue" Text="Generate" Style="top: 19px; left: -1px">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
