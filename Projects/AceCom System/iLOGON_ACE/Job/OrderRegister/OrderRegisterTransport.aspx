<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderRegisterTransport.aspx.cs" Inherits="iWMS.Web.Job.OrderRegister.OrderRegisterTransport" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Order Register Transport</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
</style>
<script language="javascript" type="text/javascript">
function closepopup() {
$find('ModalPopupExtender1').hide();
}
</script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="false"  />
                    <asp:Button ID="InsertBtn" CssClass="white" runat="server" OnClick="InsertBtn_Click" Text="Add"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="false"  />
                    <asp:Label Style="z-index: 0" ID="TransportLbl" runat="server" CssClass="errorLabel" Visible="false" ForeColor="Red">This type of Job was not selected.
                    </asp:Label>
                </td>
                </tr>
                <tr>
                <td>             <br />       
                    <iWMS:iForm ID="formCtl" runat="server" />
                </td>
            </tr>
        </table>
        <br>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>        
    </form>
</body>
    </html>