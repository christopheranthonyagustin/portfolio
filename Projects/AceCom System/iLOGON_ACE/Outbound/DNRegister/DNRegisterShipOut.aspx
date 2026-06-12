<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DNRegisterShipOut.aspx.cs" Inherits="iWMS.Web.Outbound.DNRegister.DNRegisterShipOut" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>DNRegisterShipOut</title>
    <base target="_self" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">DNRegister Ship Out</asp:Label>
            </td>
        </tr>
    </table>
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td width="10%">

            </td>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                &nbsp;<telerik:RadButton ID="ShipOutBtn" runat="server" Skin="WebBlue" Text="ShipOut"
                    OnClick="ShipOutBtn_Click" SingleClick="true" SingleClickText="Processing..."></telerik:RadButton>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
