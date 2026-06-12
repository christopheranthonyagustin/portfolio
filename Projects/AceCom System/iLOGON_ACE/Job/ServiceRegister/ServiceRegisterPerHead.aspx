<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterPerHead.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterPerHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ServiceRegisterPerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
        <td>
        &nbsp;<asp:Label ID="AtvtLbl" runat="server" CssClass="pagetitle"></asp:Label>
        </td>
        </tr>
        <tr>
            <td style="height: 20px">
                <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="white" OnClick="SaveBtn_Click" 
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="False" />
                &nbsp;
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="white" OnClick="UpdateBtn_Click" 
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="False" />
                &nbsp;
                    <asp:Button ID="BackButton" runat="server" Text="Hide" CssClass="white" OnClick="BackButton_Click" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="False"/>
                &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
            <td style="height: 20px" align="right">
                &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true"></asp:ValidationSummary>
    </form>
</body>
</html>