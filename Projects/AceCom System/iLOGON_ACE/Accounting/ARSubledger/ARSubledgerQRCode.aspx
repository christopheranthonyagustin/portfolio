<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARSubledgerQRCode.aspx.cs" Inherits="iWMS.Web.Accounting.ARSubledger.ARSubledgerQRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QRCode</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
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
    <div>
    
    </div>
    </form>
</body>
</html>
