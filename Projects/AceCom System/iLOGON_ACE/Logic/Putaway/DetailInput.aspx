<%@ Page Language="c#" CodeBehind="DetailInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Logic.Putaway.DetailInput" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Step @ Putaway Policy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <base target="_self" />
</head>
<body leftmargin="0" topmargin="0" onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:Label ID="lblProduct" runat="server" Visible="false"></asp:Label> 
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />    
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">
                    <br />
                    <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                    <asp:Label ID="IdLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td valign="top" align="left">
                    <asp:Button ID="SaveNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save &amp; Next"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CloseBtn" class="LongLabelWhite" runat="server" Text="Close Window" OnClick="CloseBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                </td>
            </tr>
        </table>   
    </form>
</body>
</html>
