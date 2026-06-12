<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterVendorInvoicePost.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterVendorInvoicePost" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post @ Vendor Invoice</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:RadioButtonList ID="DateRadioBtn" runat="server" CausesValidation="false">
                        <asp:ListItem Value="CurrentDate">Current Date</asp:ListItem>
                        <asp:ListItem Value="InvoiceDate">Invoice Date</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="PostBtn" runat="server" Text="Post" CssClass="white" UseSubmitBehavior="false" OnClick="PostBtn_Click" OnClientClick="disableBtn(this.id)" />
                    <asp:Button ID="CloseWindowBtn" runat="server" Text="Close Window" CssClass="LongLabelWhite" UseSubmitBehavior="false" OnClick="CloseWindowBtn_Click" OnClientClick="disableBtn(this.id)" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
