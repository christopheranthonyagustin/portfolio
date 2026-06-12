<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutawayWorkbenchAdjustShortage.aspx.cs" Inherits="iWMS.Web.Inbound.PutawayWorkbench.PutawayWorkbenchAdjustShortage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adjust Shortage @ Putaway Workbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="recordsLbl" runat="server">Records Selected</asp:Label>
                    <br />
                    <asp:TextBox ID="rcTxt" runat="server" Width="140px" ReadOnly="true" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="reasonLbl" runat="server"> Reason</asp:Label>
                    <br />
                    <asp:TextBox ID="reTxt" TextMode="MultiLine" runat="server" Width="140px" />
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                    <asp:Button ID="SubmitBtn" CssClass="white" runat="server" Text="Submit" OnClick="SubmitBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
