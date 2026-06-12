<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.MthlyFCLTransportDtl.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>MonthlyFCLTransport</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            height: 30px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td class="style1"><br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="14%">
                            Equipment Type
                        </td>
                        <td width="3%">
                            &nbsp;
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="AvailEqrList" runat="server" Rows="6" SelectionMode="Multiple" Width="100%" />
                        </td>
                        <td width="10%">
                            <br />
                            <br />
                            <asp:Button ID="SelectBtn" runat="server" CssClass="white" OnClick="SelectBtn_Click"
                                Text=" Select" />
                            <br />
                            <br />
                            <asp:Button ID="RemoveBtn" runat="server" CssClass="white" OnClick="RemoveBtn_Click"
                                Text="Remove" />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="SelectedEqrList" runat="server" Rows="6" SelectionMode="Multiple"
                                Width="90%" Style="background-color: Yellow;" />
                        </td>
                        <td width="23%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="14%">
                            Job Type
                        </td>
                        <td width="3%">
                            &nbsp;
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="AvailJobList" runat="server" Rows="6" SelectionMode="Multiple" Width="100%" />
                        </td>
                        <td width="10%">
                            <br />
                            <br />
                            <asp:Button ID="SelectBtn2" runat="server" CssClass="white" OnClick="SelectBtn2_Click"
                                Text="Select" />
                            <br />
                            <br />
                            <asp:Button ID="RemoveBtn2" runat="server" CssClass="white" OnClick="RemoveBtn2_Click"
                                Text="Remove" />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="SelectedJobList" runat="server" Rows="6" SelectionMode="Multiple"
                                Width="90%" Style="background-color: Yellow;" />
                        </td>
                        <td width="23%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="CompileBtn" runat="server" CssClass="white" OnClick="CompileBtn_Click"
                    Text="Compile" OnClientClick="return busyBox.Show();" />
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
