<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderTaskGenerate.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderTaskGenerate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tank Order Generate Task</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />
</head>
<body>

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

        function RadConfirm(sender, args) {
            var callBackFunction = Function.createDelegate(sender, function(shouldSubmit) {
                if (shouldSubmit) {
                    //initiate the origianal postback again
                    this.click();
                }
            });

            var text = "All existing tasks will be deleted before generating new tasks. Confirm to proceed?";
            radconfirm(text, callBackFunction, 300, 200, null, "RadConfirm");
            //always prevent the original postback so the RadConfirm can work, it will be initiated again with code in the callback function
            args.set_cancel(true);
        }
    </script>

    <form id="form1" runat="server" method="post">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2">
                Please choose the task category that you wish to generate below.
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 5px;">
            </td>
        </tr>
        <tr>
            <td width="20%" valign="top">
                <asp:Label ID="TaskCatLbl" runat="server">Category :</asp:Label>
            </td>
            <td width="80%" align="left">
                <telerik:RadDropDownList ID="TaskCatList" runat="server" DefaultMessage="Select a Category"
                    DropDownHeight="150px" DropDownWidth="150px" Skin="WebBlue" Width="120px">
                </telerik:RadDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 5px;">
            </td>
        </tr>
        <tr>
            <td width="20%">
                &nbsp;
            </td>
            <td width="80%" align="left">
                <telerik:RadButton Skin="WebBlue" ID="GenerateBtn" runat="server" Text="Generate" OnClientClicking="RadConfirm"
                    OnClick="GenerateDetailBtn_Click">
                </telerik:RadButton>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
