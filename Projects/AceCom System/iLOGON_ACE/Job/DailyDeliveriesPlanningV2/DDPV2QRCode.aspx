<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2QRCode.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QRCode</title>
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css"  />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css"  />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:PlaceHolder ID="QRCodePlaceHolder" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
