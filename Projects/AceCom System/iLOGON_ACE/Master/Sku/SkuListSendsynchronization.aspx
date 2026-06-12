<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkuListSendsynchronization.aspx.cs" Inherits="iWMS.Web.Master.Sku.SkuListSendsynchronization" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SkuListSendSynchroiation</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div style="float: left">
            <table>
                <tr>
                    <td>
                        <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                        <iwms:iform ID="formCtl2" runat="server" Visible="false"></iwms:iform>
                    </td>
                 </tr>
            </table>
        </div>
        <div style="float: left; padding-top: 15px;">
            <asp:Button ID="SynchronizeNowBtn" runat="server" CssClass="LongLabelWhite" Text="Synchronize now" OnClick="SynchronizeNowBtn_Click"
                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        </div>
        <table style="width: 100%">
            <tr>
                <td class="style1">
                    <br />
                    &nbsp;<asp:Label ID="Label" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label1" Text="1. To use this feature, the Account must have the necessary configuration in Account Master Control. " Font-Size="15px" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
