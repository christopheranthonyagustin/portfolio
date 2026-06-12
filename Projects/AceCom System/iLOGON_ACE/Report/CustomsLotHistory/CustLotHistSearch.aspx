<%@ Page Language="c#" CodeBehind="CustLotHistSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.CustomsLotHistory.CustLotHistSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CustomsLotNoHistory</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" class="style1">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" RepeatColumns="2" Width="511px"
                                CellSpacing="4" CellPadding="5">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </td> </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
                CssClass="detailButton" OnClick="CompileBtn_Click"></asp:Button>&nbsp;<asp:Button
                    ID="ResetBtn" CausesValidation="false" runat="server" Text="Reset" CssClass="detailButton"
                    OnClick="UpdateBtn_Click"></asp:Button>
            <br />
            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        </td>
    </tr>
    </table>
    </form>
</body>
</body>
</html>
