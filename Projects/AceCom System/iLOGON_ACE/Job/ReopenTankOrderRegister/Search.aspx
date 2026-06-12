<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.ReopenTankOrderRegister.Search" %>

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
    <script language="javascript" src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            height: 45px;
        }

        .style2 {
            width: 113px;
        }

        .style3 {
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
                            <td>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;<asp:Button ID="RetrieveBtn" runat="server" Text="Retrieve" CssClass="blue" OnClick="RetrieveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="ReOpenBtn" runat="server" Text="Reopen" CssClass="white" OnClick="ReOpenBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="ResetBtn" runat="server" Text="Reset" CssClass="white" OnClick="ResetBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" /><br />
                </td>
                <td class="style3">&nbsp;<br>
                </td>
            </tr>
        </table>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
