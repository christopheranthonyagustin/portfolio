<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SMSQUEUECheckCredit.aspx.cs" Inherits="iWMS.Web.Interface.SMSQUEUE.SMSQUEUECheckCredit" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>SMSQUEUE Check Credit</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <base target="_self" />

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            sender.setUrl("about:blank");
        }
    </script>
    <style type="text/css">
        .style1 {
            padding-left:90px;
        }
        .style2 {
            padding-left:220px;
        }
    </style>    
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />        
        <telerik:RadWindow runat="server" ID="SMSQCheckCreditRadWindow" VisibleOnPageLoad="true" Title="Check SMS Credit"
            Width="500" Height="350" VisibleStatusbar="false" OnClientClose="OnClientClose">           
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <br /><br />
                            <asp:Label ID="CheckCreditlbl" runat="server" Font-Bold="true" Font-Size="XX-Large" CssClass="style1"/> <br />
                            <asp:Label ID="ReturnValuelbl" runat="server" Font-Bold="true" Font-Size="XX-Large" CssClass="style2" />
                            <br /><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:25%">
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:33%">
                            <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true"></telerik:RadWindowManager>
                             <br /><br />
                            <asp:Button ID="SMSBtn" runat="server" CssClass="white" OnClick="SMSBtn_Click"
                                Text="SendSMS" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        </td>
                    </tr>
                </table>         
            </ContentTemplate>
        </telerik:RadWindow>       
    </form>
</body>
</html>

