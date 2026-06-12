<%@ Page Language="c#" CodeBehind="PartnerGrade.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Partner.PartnerGrade" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PartnerGrade</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="height: 20px">
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
            </td>
            <td style="height: 20px" align="left"> 
               <br />
                <asp:Button ID="SaveNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save &amp; Next"  Visible="False" />
                <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save"  Visible="False" />
                <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" /> 
                <asp:Button ID="BackButton" class="white" runat="server" OnClick="BackButton_Click" Text="All Item(s)" 
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="True" />
            </td>
        </tr>
        <tr>
            <td colspan="2"><br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true"></asp:ValidationSummary>
    </form>
</body>
</html>
