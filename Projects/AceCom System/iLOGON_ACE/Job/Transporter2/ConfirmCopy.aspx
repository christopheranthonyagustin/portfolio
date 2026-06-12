<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmCopy.aspx.cs" Inherits="iWMS.Web.Job.Transporter2.ConfirmCopy" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Confirm Copy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Pragma" content="no-cache">
    <base target="_self" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">

        function closeWin()
        {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            if (confirm("Confirm to Close?")) {
                confirm_value.value = "Ok";
            }           
            document.forms[0].appendChild(confirm_value);

            if (confirm_value.value == "Ok") {
                GetRadWindow().close();
                return true;
            }
        }

        function confirmcopy()
        {
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";

                if (confirm("Confirm to Copy?"))
                {
                    confirm_value.value = "Yes";
                }
                else
                {
                    confirm_value.value = "No";
                }
                document.forms[0].appendChild(confirm_value);

                if (confirm_value.value == "Yes")
                {
                    GetRadWindow().close();
                    return true;
                }
                else
                {
                    return false;
                }                    
            }

        function GetRadWindow()
        {
            var oWindow = null;
            if (window.radWindow)
            oWindow = window.radWindow;
            else if (window.frameElement.radWindow)
            oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        </script>


</head>
<body onload="javascript:window.focus();">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Confirm to Copy?</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MsgLbl" runat="server" />
               
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Button id="CancelBtn" runat="server" Text=" Cancel " CssClass="detailbutton"  Skin="WebBlue" Enabled="true" onclick="CancelBtn_Click" OnClientClick="closeWin();" />
                 &nbsp;
                <asp:Button id="OkayBtn" runat="server" Text=" Okay " CssClass="detailbutton"  Skin="WebBlue" Enabled="true" onclick="OkayBtn_Click" OnClientClick="confirmcopy();" />
                
                 <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
