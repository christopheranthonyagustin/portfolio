<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHaulageRatesQRCode.aspx.cs" Inherits="iWMS.Web.Sales.ContainerHaulageRates.ContainerHaulageRatesQRcode" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td valign="top" align="right">
                    <asp:PlaceHolder ID="QUHID_QRCode" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>