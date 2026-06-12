<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.CrossCharge.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <title>EquipmentExpirySchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
        <br />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="2%">
                            &nbsp;
                        </td>
                        <td width="27%">
                            Vehicle Owner
                        </td>
                        <td width="1%">
                            &nbsp;
                        </td>
                        <td width="45%">
                            <asp:DropDownList ID="vehowner_ddl" runat="server" Width="90%" />
                        </td>
                        <td width="25%">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style1" width="30%">
                <table>
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%" class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" width="30%" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="2%">
                            &nbsp;
                        </td>
                        <td width="27%">
                            Output
                        </td>
                        <td width="1%">
                            &nbsp;
                        </td>
                        <td width="45%">
                            <asp:DropDownList ID="output_ddl" runat="server" Width="90%" BackColor="Yellow" />
                        </td>
                        <td width="25%">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%" class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" width="30%" class="style2"><br />
                <asp:Button ID="CompileBtn" runat="server" Text="Print" CssClass="white" OnClick="CompileBtn_Click"
                    OnClientClick="busyBox.Show();" />
            </td>
            <td valign="top" width="70%" class="style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="30%">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td width="70%">
                &nbsp;<br />
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
