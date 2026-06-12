<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerChangeStatus.aspx.cs" Inherits="iWMS.Web.Master.Partner.PartnerChangeStatus" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Partner Change Status</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                 <asp:Label Id="LabelActiveInactive" Text="Active Partner" Font-Bold="true"  runat="server"></asp:Label>              
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                 
                <telerik:RadCheckBox ID="PartnerCheckBox" Checked="true" Enabled="false" runat="server"></telerik:RadCheckBox>
 
                <asp:Label Id="Lbl1" Text="Partner (default ticked cannot be change)"  runat="server"></asp:Label>
                 <br />
                </td>                
            </tr>
            <tr>
                <td>
                    <asp:Label Id="SelectedCodeLbl" Text="Active Same Code in" Font-Bold="true"  runat="server"></asp:Label>              
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <%--<asp:Label id="Label2" Text="Inactive Same Code in" runat="server"/>--%>
                    <telerik:RadCheckBox ID="AccountCheckBox" runat="server" Text="Account"></telerik:RadCheckBox>
                    <br />
                    <telerik:RadCheckBox ID="CustomerCheckBox" runat="server" Text="Customer"></telerik:RadCheckBox>
                    <br />
                    <telerik:RadCheckBox ID="SupplierCheckBox" runat="server" Text="Supplier"></telerik:RadCheckBox>
                    <br />
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                       <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click" CausesValidation="true"
                         UseSubmitBehavior="false" Text="Submit" OnClientClick="disableBtn(this.id)"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
