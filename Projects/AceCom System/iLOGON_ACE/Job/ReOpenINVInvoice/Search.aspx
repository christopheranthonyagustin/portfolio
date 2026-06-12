<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.ReOpenINVInvoice.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            height: 45px;
        }
        .style2
        {
            width: 113px;
        }
        .style3
        {
            height: 45px;
            width: 113px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0; margin-right: 0px;" id="Table1" border="0" cellspacing="2"
        cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table id="Table2">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" class="style2">
                <table id="Table3" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Button ID="RetrieveBtn" runat="server" Text="Retrieve" CssClass="detailbutton"
                    OnClick="RetrieveBtn_Click"></asp:Button>
                <asp:Button ID="ReOpenBtn" runat="server" Text="Re-Open" CssClass="detailbutton"
                    OnClick="ReOpenBtn_Click"></asp:Button>
                <asp:Button ID="ResetBtn" runat="server" Text="Reset" CssClass="detailbutton" OnClick="ResetBtn_Click">
                </asp:Button><br />
            </td>
            <td class="style3">
                &nbsp;<br>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
