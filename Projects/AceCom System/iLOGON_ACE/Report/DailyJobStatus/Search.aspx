<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.DailyJobStatus.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <title>DailyJobStatus</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            width: 30%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" class="style1" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <table width="70%">
                <tr>
                    <td width="11%">
                        &nbsp;Status&nbsp;&nbsp;
                    </td>
                    <td width="25%">
                        <asp:ListBox ID="StatusList" runat="server" Rows="6" SelectionMode="Multiple" Width="100%" />
                    </td>
                    <td width="13%" align="center">
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
                    <td width="25%">
                        <asp:ListBox ID="SelectedStatusList" runat="server" Rows="6" SelectionMode="Multiple"
                            Width="90%" Style="background-color: Yellow;" />
                    </td>
                    <td width="26%">
                    </td>
                </tr>
                <tr>
                    <td width="11%">
                        &nbsp;
                    </td>
                    <td width="25%">
                        &nbsp;
                    </td>
                    <td width="13%" align="center">
                        &nbsp;
                    </td>
                    <td width="25%">
                        &nbsp;
                    </td>
                    <td width="26%">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="11%">
                        &nbsp;AM/PM&nbsp;
                    </td>
                    <td width="25%">
                        <asp:DropDownList ID="AMPMDDL" runat="server" Height="16px" Width="162px" Style="background-color: White;">
                        </asp:DropDownList>
                    </td>
                    <td width="13%" align="center">
                        &nbsp;
                    </td>
                    <td width="25%">
                        &nbsp;
                    </td>
                    <td width="26%">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </tr>
    </table>
    </tr>
    <tr>
        <td width="6%">
            &nbsp;
        </td>
        <td width="94%">
            <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
                CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();" />
            &nbsp;<asp:Label ID="MessageLbl" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
