<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerDelete.aspx.cs" Inherits="iWMS.Web.Master.Partner.PartnerDelete" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete @ Partner Master</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <br />
                    <asp:Button ID="SubmitBtn" CssClass="white" runat="server" OnClick="SubmitBtn_Click" CausesValidation="true"
                         UseSubmitBehavior="false" Text="Submit"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
