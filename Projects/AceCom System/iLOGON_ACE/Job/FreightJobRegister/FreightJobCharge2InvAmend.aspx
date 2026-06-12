<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobCharge2InvAmend.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobCharge2InvAmend" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Amend Invoice Details</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
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
    <asp:Panel ID="Panel1" runat="server" Width="300px">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td nowrap class="style2" valign="top">&nbsp; BL Reference:
                    &nbsp;<telerik:RadDropDownList runat="server" ID="Blreflist" DropDownHeight="150px" Width="200px" Skin="WebBlue" CausesValidation="false" Filter="Contains" RenderMode="Lightweight">
                    </telerik:RadDropDownList> <br /> <br />
                </td>
            </tr>
             <br /> 
             <br />
            <tr> 
                <td nowrap class="style2" valign="top">&nbsp; Tank No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<telerik:RadTextBox ID="TankNotxt" runat="server" Width="200px" Height="100px" TextMode="MultiLine">
                    </telerik:RadTextBox> <br />  <br /> 
                </td>
            </tr>
             <br /> 
             <br />
            <tr>
                <td nowrap class="style2" valign="top">&nbsp; Currency: &nbsp;&nbsp;&nbsp;&nbsp;                     
                    &nbsp;&nbsp;<telerik:RadComboBox ID="CurrList" runat="server" Skin="WebBlue"
                        Width="200px" DropDownWidth="150px" CausesValidation="false" Filter="Contains" RenderMode="Lightweight">
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
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<telerik:RadButton ID="UpdateBtn" runat="server" OnClick="UpdateBtn_Click" Skin="WebBlue"
                        Text="Update" Style="top: 19px; left: -1px">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </asp:Panel>    
    </form>
</body>
</html>