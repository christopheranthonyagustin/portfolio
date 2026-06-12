<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelIncentiveAdd.aspx.cs" Inherits="iWMS.Web.Master.PersonnelIncentive.PersonnelIncentiveAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Personnel Incentive Add</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                </td>
            </tr>
        </table>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
    </form>
</body>
</html>
