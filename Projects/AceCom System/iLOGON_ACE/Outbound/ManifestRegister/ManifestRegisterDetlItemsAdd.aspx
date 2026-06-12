<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManifestRegisterDetlItemsAdd.aspx.cs" Inherits="iWMS.Web.Outbound.ManifestRegister.ManifestRegisterDetlItemsAdd" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>ManifestRegisterDetlItemsAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
    <base target="_self">
 
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
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <table border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="mrNoLbl" runat="server" CssClass="pagetitle"></asp:Label>&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <br />
                &nbsp;<asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add"  
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                &nbsp;<asp:Button ID="AddNextBtn" class="white" runat="server" OnClick="AddNextBtn_Click" Text="AddandNext"  
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                &nbsp;<asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel"  
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
            </td>
        </tr> 
    </table>
    </form>
</body>
</html>
