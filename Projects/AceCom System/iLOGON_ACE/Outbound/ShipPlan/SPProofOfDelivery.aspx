<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SPProofOfDelivery.aspx.cs"
    Inherits="iWMS.Web.Outbound.ShipPlan.SPProofOfDelivery" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Proof Of Delivery</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <asp:Button ID="SaveBtn" runat="server" Text="Save"   ToolTip="Save"  CssClass="white" OnClick="SaveBtn_Click" />
                        &nbsp;
                    <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="white" OnClick="CloseBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
