<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.VehicleValidityListing.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VehicleValidityListing</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

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
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td class="style1" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="15%">
                            Document Type
                        </td>
                        <td width="3%">
                            &nbsp;
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="AvailImgList" runat="server" Rows="15" SelectionMode="Multiple"
                                Width="100%" />
                        </td>
                        <td width="10%">
                            <br />
                            <br />
                            <asp:Button ID="SelectBtn" runat="server" CssClass="detailbutton" OnClick="SelectBtn_Click"
                                Text=" Select" />
                            <br />
                            <br />
                            <asp:Button ID="RemoveBtn" runat="server" CssClass="detailbutton" OnClick="RemoveBtn_Click"
                                Text="Remove" />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="SelectedImgList" runat="server" Rows="15" SelectionMode="Multiple"
                                Width="90%" Style="background-color: Yellow;" />
                            <%--<asp:RequiredFieldValidator id="rqf1" ControlToValidate="SelectedEqrList" runat="server" ErrorMessage="*" style="z-index: 0; vertical-align: top" />--%>
                        </td>
                        <td width="22%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1" width="10%">
                IncludeExpired
            </td>
            <td class="style1">
                <asp:CheckBox ID="includeExpiredCbox" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                Output
            </td>
            <td class="style1" align="left">
                <asp:DropDownList ID="outputDDL" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></asp:Button>&nbsp;<input
                        class="detailbutton" value="Reset" type="reset">
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
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
