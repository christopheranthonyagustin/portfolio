<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.CBAnalysisJbAccEnt.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CBAnalysisJbAccEnt</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style4
        {
            width: 139px;
        }
        .style6
        {
            width: 187px;
        }
        .style7
        {
            width: 47px;
        }
        .style8
        {
            width: 220px;
        }
        .style10
        {
            width: 119px;
        }
        .style11
        {
            width: 128px;
        }
    </style>

    </head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" type="text/javascript" src="../../js/checkbox.js"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
    <tr>
    <td class="style8">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
    <td class="style4"></td>
    <td class="style7"></td>
    <td class="style6"></td>
    <td></td>
    </tr>
    </table>
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
    
    <tr>
    <td class="style11">&nbsp;Type</td>
    <td class="style4">
                                        <asp:ListBox ID="TypeList" runat="server" 
            Rows="6" SelectionMode="Multiple" 
                                            Width="91%" />
                                    </td>
    <td class="style7">
                                        <br />
                                        <br />
                                        <asp:Button ID="SelectBtn" runat="server" CssClass="detailbutton" OnClick="SelectBtn_Click"
                                            Text=" >> " />
                                        <br />
                                        <br />
                                        <asp:Button ID="RemoveBtn" runat="server" CssClass="detailbutton" OnClick="RemoveBtn_Click"
                                            Text=" << " />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
    <td class="style6">
                                        <asp:ListBox ID="SelectedTypeList" 
            runat="server" Rows="6" SelectionMode="Multiple"
                                            Width="76%" 
            Style="background-color: Yellow; margin-left: 23px;" />
                                    </td>
    <td>&nbsp;</td>
    </tr>
    </table>
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
    <tr>
    <td class="style10">
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                    </td>
    <td class="style4">&nbsp;</td>
    <td class="style7">&nbsp;</td>
    <td class="style6">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    
    <tr>
    <td class="style10">
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></asp:Button>
                                        <br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                                    </td>
    <td class="style4">
                                        <br />
                                    </td>
    <td class="style7">&nbsp;</td>
    <td class="style6">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    </table>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>
