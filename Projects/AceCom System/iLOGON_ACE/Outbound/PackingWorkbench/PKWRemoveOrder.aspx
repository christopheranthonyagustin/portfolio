<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKWRemoveOrder.aspx.cs" Inherits="iWMS.Web.Outbound.PackingWorkbench.PKWRemoveOrder" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy @ GoodsReceive</title>
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
        <br />
        <table>
            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </ContentTemplate>
            </asp:UpdatePanel>

            <tr>
                <td>
                    <br />
                    <asp:Button ID="SubmitBtn" runat="server" CssClass="white" Text="Submit"
                        OnClick="SubmitBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
