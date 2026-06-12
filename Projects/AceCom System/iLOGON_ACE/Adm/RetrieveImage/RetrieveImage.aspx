<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RetrieveImage.aspx.cs"
    Inherits="iWMS.Web.Adm.RetrieveImage.RetrieveImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../css/iWMS.css" rel="stylesheet" type="text/css" />
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script type="text/javascript">
        <!--
        function confirmation() {
            var answer = confirm("Image will be retrieve to folder. Confirm to proceed?")
            if (answer) {
                busyBox.Show();
                return true;
            } else {
                return false;
            }
        }
        //-->
    </script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div><br />
        <table>
            <tr valign="top">
                <td>
                    <asp:Label ID="TableLbl" runat="server" Text="TableName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TableTxt" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="ExTableTxt" runat="server" Text="Eg.jbimage,rcimage,isimage"></asp:Label>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="idLbl" runat="server" Text="id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="idTxt" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="EgIdLbl" runat="server" Text="Eg.jbid,rcid,isid"></asp:Label>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="DestLbl" runat="server" Text="Destination"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="DestTxt" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="EgDestLbl" runat="server" Text="Eg.D:\Example"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="RetrieveBtn" runat="server" Text="RetrieveImage" OnClick="RetrieveBtn_Click" OnClientClick="return confirmation();" />
                </td>
            </tr>
        </table>
    </div>
    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
    </form>
</body>
</html>
