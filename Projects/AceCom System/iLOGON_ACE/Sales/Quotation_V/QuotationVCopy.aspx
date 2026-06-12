<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVCopy.aspx.cs" Inherits="iWMS.Web.Sales.Quotation_V.QuotationVCopy" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>VendorQuotationCopy</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
    <meta content="no-cache" http-equiv="Pragma">
    <style type="text/css">
        .style5 {
            width: 5.25%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <br />
        <table>
            <tr>
                <td class="style5">&nbsp;<asp:Label runat="server" ID="VQTxt" Text="FromVendorQuotationNo"></asp:Label><br />
                    &nbsp;&nbsp;<telerik:RadTextBox ID="VQuCodeTxt" runat="server" AutoPostBack="True" Width="150px" ReadOnly="true">
                    </telerik:RadTextBox>&nbsp;
                </td>
            </tr>
        </table>
        <table cellspacing="2" cellpadding="2">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="CopyBtn" runat="server" Text="Copy" CssClass="white"
            OnClick="CopyBtn_Click" ToolTip="Copy Vendor Quotation"></asp:Button>
        &nbsp;<asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="white"
            OnClick="CloseBtn_Click" Visible="false"></asp:Button><br />
        <br />
        <br />
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
        <a id="A1" runat="server" onserverclick="Redirect_Click">
            <asp:Label ID="CopyLbl" runat="server" ForeColor="Blue"></asp:Label>
        </a>
    </form>
</body>
</html>
