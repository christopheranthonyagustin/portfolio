<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.TripSumByTptType.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripSumByTptType</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" type="text/javascript" src="../../js/checkbox.js"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </tr>
        <table width="70%">
            <tr>
                <td width="11%">
                    &nbsp;TptType&nbsp;&nbsp;
                </td>
                <td width="25%">
                    <asp:ListBox ID="TptTypeList" runat="server" Rows="6" SelectionMode="Multiple"
                        Width="100%" />
                </td>
                <td width="13%" align="center">
                    <br />
                    <br />
                    <asp:Button ID="SelectTptTypeBtn" runat="server" CssClass="detailbutton" OnClick="SelectTptTypeBtn_Click"
                        Text=" >> " />
                    <br />
                    <br />
                    <asp:Button ID="RemoveTptTypeBtn" runat="server" CssClass="detailbutton" OnClick="RemoveTptTypeBtn_Click"
                        Text=" << " />
                    <br />
                    <br />
                    <br />
                </td>
                <td width="25%">
                    <asp:ListBox ID="SelectedTptTypeList" runat="server" Rows="6" SelectionMode="Multiple"
                        Width="90%" Style="background-color: Yellow;" />
                </td>
                <td width="26%">
                </td>
            </tr>
           
            <tr>
                <td width="11%">
                    &nbsp;</td>
                <td width="25%">
                    &nbsp;</td>
                <td width="13%" align="center">
                    &nbsp;</td>
                <td width="25%">
                    &nbsp;</td>
                <td width="26%">
                    &nbsp;</td>
            </tr>
           
            <tr>
                <td width="11%">
                    &nbsp;Format&nbsp;</td>
                <td width="25%">
                    <asp:DropDownList ID="FormatDDL" runat="server" Height="16px" Width="162px" 
                        Style="background-color: Yellow;">
                    </asp:DropDownList>
                </td>
                <td width="13%" align="center">
                    &nbsp;</td>
                <td width="25%">
                    &nbsp;</td>
                <td width="26%">
                    &nbsp;</td>
            </tr>
           
        </table>
         <tr>
        <td>
        </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></asp:Button>&nbsp;
                <br>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
            </td>
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
