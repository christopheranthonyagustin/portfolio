<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReOrderSearch.aspx.cs" Inherits="iWMS.Web.Report.ReOrder.ReOrderSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>SKUReplenishmentList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
                    <p>&nbsp;</p>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="white" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;<%--<input class="white" value="Reset" type="reset" >--%>
                    <asp:Button ID="Reset" runat="server" Text="Reset" CssClass="white" OnClick="Reset_Click" />
                    <br>
                    <asp:Label Style="z-index: 0" ID="messageLbl" runat="server" Visible="False" CssClass="errorLabel" ></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
