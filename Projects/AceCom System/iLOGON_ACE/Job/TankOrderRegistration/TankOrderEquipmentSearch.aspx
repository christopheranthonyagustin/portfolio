<%@ Page Language="c#" CodeBehind="TankOrderEquipmentSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderEquipmentSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TankOrderEquipmentSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;<asp:Button Style="z-index: 0; height: 24px;" ID="SearchBtn" 
        runat="server" CssClass="detailbutton"
        Text="Search" OnClick="SearchBtn_Click"></asp:Button>
    &nbsp;<br>
    <br />
    <br>
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
        CssClass="errorLabel"></asp:Label></form>
</body>
</html>
