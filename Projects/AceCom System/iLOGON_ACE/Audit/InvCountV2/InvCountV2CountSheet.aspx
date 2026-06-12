<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV2CountSheet.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV2.InvCountV2CountSheet" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>InvCountV2CountSheet</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">CountSheet</asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel" runat="server">
        <table cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="MsgLbl" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="CountSheet" runat="server">CountSheet</asp:Label>
                </td>
                <td width="30%">
                    :
                    &nbsp;
                    <asp:RequiredFieldValidator ID="SelectCSReq" runat="server" ControlToValidate="SelectCSDDL"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                    <telerik:RadDropDownList ID="SelectCSDDL" runat="server" Skin="WebBlue" Width="200px"></telerik:RadDropDownList> 
                </td>
            </tr>
            <tr>
                <td width="30%">
                    &nbsp;
                </td>
                <td width="70%" align="left">
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="PrintBtn" runat="server" Skin="WebBlue" Text="  Print  "
                        OnClick="PrintBtn_Click" SingleClick="true" SingleClickText="Processing..."></telerik:RadButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>

