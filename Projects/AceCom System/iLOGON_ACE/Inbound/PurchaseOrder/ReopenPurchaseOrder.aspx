<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReopenPurchaseOrder.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.ReopenPurchaseOrder" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reopen Reason</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
         <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    &nbsp;<asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Reopen Reason</asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table cellspacing="2" cellpadding="2" width="100%">            
                <tr>
                    <td >&nbsp;
                        <asp:Label ID="ReasonLbl" runat="server">Reason : </asp:Label>
                        <asp:TextBox ID="ReasonTxt" BackColor="Yellow" runat="server" Width="155px" Height="20px"></asp:TextBox>

                    </td>
                </tr>
                <tr>                
                    <td align="left">
                        <br />&nbsp;
                        <asp:Button ID="OKBtn" CssClass="white" runat="server" OnClick="OKBtn_Click" Visible="true"  
                            Text="Okay" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                    </td>
                </tr>
        </table>    
    </form>
</body>
</html>
