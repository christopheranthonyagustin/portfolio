<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceQuerySearch.aspx.cs" Inherits="iWMS.Web.Job.InvoiceQuery.InvoiceQuerySearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceQuerySearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link  rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table id="report" runat="server" cellspacing="5">
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
                        CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
