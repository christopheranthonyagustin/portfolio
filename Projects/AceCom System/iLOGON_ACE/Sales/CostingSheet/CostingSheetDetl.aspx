<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetDetl.aspx.cs"
    Inherits="iWMS.Web.Sales.CostingSheet.CostingSheetDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CostingSheetDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                 <asp:Button ID="priceBreakBtn" runat="server" Text="Price Break" OnClick="priceBreakBtn_Click" Visible="false"
                        CssClass="white"></asp:Button>
                    &nbsp;
                <asp:Button ID="SaveNextBtn" runat="server" Text="Save &amp; Next" OnClick="SaveNextBtn_Click" Visible="false"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                    &nbsp;
                <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" Visible="false"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                    &nbsp;
                 <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" Visible="false"
                     CssClass="white"></asp:Button>
                    &nbsp;
                 <asp:Button ID="BackButton" runat="server" Text="ShowAll" OnClick="BackButton_Click" Visible="true" CausesValidation="False"
                     CssClass="white" ToolTip="ShowAllLines" />
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </form>
</body>
</html>
