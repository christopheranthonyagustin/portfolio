<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterCancel.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterCancel" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FMJob Register Cancel</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
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

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>                
            </tr>
            <tr>
               <td>
                    <telerik:RadLabel ID="ReasonLbl" Text="Reason" Font-Size="Small" runat="server"> </telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="ReasonTxt" TextMode="MultiLine" runat="server" Resize="Both"
                    Font-Size="Medium" Skin="WebBlue" Height="150px" Width="320px"></telerik:RadTextBox> 
                </td>
                <td valign="top">
                    <asp:RequiredFieldValidator ID="ReasonTxtLReqVal" runat="server" ControlToValidate="ReasonTxt" ErrorMessage="*" ForeColor="Red" Display="Dynamic"/>
                </td>          
            </tr>
            <tr>
                <td>
                    <Br />
                    <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click"
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Text="Submit" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
