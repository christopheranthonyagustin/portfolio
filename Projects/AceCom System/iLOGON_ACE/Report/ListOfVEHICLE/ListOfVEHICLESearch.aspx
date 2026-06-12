<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="ListOfVEHICLESearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.ListOfVEHICLE.ListOfVEHICLESearch" %>
    
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ListOfVEHICLE</title>
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
            </td>
            <td>
            
                <telerik:RadButton ID="CompileBtn" runat="server" CssClass="detailButton"  Skin="WebBlue" Text="Compile"
                OnClick="CompileBtn_Click"></telerik:RadButton>
                &nbsp;
                
                <telerik:RadButton ID="ResetBtn" runat="server" CssClass="detailButton" Skin="WebBlue" Text="Reset" OnClick="ResetBtn_Click"></telerik:RadButton>
                <br>
                <asp:Label Style="z-index: 0" ID="messageLbl" runat="server" Visible="False"  CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
