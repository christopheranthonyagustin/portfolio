<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Page Language="c#" CodeBehind="ListOfPersonnelSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.ListOfPersonnel.ListOfPersonnelSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ListOfPersonnel</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%">
                <p>
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td>
            <telerik:RadButton ID="CompileBtn" runat="server" CssClass="detailbutton" Text="Compile"
                OnClick="CompileBtn_Click" Skin="WebBlue">
            </telerik:RadButton>
            &nbsp;&nbsp;
            <telerik:RadButton ID="ResetBtn" runat="server" CssClass="detailbutton" Text="Reset"
                OnClick="ResetBtn_Click" Skin="WebBlue">
            </telerik:RadButton><br>
                <asp:Label Style="z-index: 0" ID="messageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>            
        </tr>
    </table>
    </form>
</body>
</html>
