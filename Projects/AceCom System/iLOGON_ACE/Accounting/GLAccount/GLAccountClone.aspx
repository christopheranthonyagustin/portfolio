<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLAccountClone.aspx.cs" Inherits="iWMS.Web.Accounting.GLAccount.GLAccountClone" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purge Account</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript">
        function OnClientClose(sender, args) {
            sender.setUrl("about:blank");
        }
    </script>
    
</head>
<body onload="javascript:window.focus();">
   <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
       <telerik:RadWindow runat="server" ID="GLAccountCloneRadWindow" VisibleOnPageLoad="true" Title="Clone @ GL Account"
            Width="500" Height="300" VisibleStatusbar="false" OnClientClose="OnClientClose">
            <ContentTemplate>
                
                <div>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </div>
                <table>
                   <tr>
                      <td>
                       <asp:Button ID="CompileBtn" runat="server" Text="Submit" CausesValidation="false" OnClick="OkayBtn_Click" OnClientClick="disableBtn(this.id, true)"
                            UseSubmitBehavior="false" class="white" />
                       </td>
                   </tr>
                </table>
           </ContentTemplate>
        </telerik:RadWindow>
    </form>
</body>
</html>
