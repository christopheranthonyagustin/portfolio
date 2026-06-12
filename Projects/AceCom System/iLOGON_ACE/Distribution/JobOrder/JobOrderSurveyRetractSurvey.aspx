<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderSurveyRetractSurvey.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderSurveyRetractSurvey" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Retract Survey @ JobOrder Survey</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                    <br />
                    <asp:TextBox ID="ReasonTxt" runat="server" TextMode="MultiLine" Width="90%" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="RetractSurveyBtn" runat="server" Text="Confirm" CssClass="White" Enabled="False" OnClick="RetractSurveyBtn_Click"
                        OnClientClick="return confirm('All survey line items will be deleted during the Retract Survey process. Do you wish to proceed?');" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>