<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.JobCompleteKPI.Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
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
            <td valign="top" width="70%">
                <table id="Table3" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                            <br>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <%--<asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton"
                    OnClick="CompileBtn_Click"></asp:Button>&nbsp;<input class="detailbutton" value="Reset"
                        type="reset">--%>
                &nbsp;&nbsp;<telerik:RadButton ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton"
                    OnClick="CompileBtn_Click" Skin="WebBlue">
                </telerik:RadButton>
                <telerik:RadButton ID="ResetBtn" runat="server" Text="Reset" OnClick="ResetBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                <br>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
