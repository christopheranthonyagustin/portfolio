<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OCIAgeingAnalysis.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OCIAgeingAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 137px;
        }
        .style2
        {
            width: 178px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" type="text/javascript" src="../../js/checkbox.js"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td class="style1">
                            Entity
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="EntityDDL" runat="server" Width="150px" OnSelectedIndexChanged="EntityDDL_OnSelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            BP Type
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="BPTypeDDL" runat="server" Width="150px" OnSelectedIndexChanged="BPTypeDDL_OnSelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            BP Code
                        </td>
                        <td class="style2">
                            From
                        </td>
                        <td>
                            To
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="BPCodeFrDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="BPCodeToDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            BP Name
                        </td>
                        <td class="style2">
                            From
                        </td>
                        <td>
                            To
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="BPNameFrDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="BPNameToDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Employee
                        </td>
                        <td class="style2">
                            From
                        </td>
                        <td>
                            To
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="EmployeeFrDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="EmployeeToDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Ageing As of
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="AgeingAsOfTxt" runat="server" Width="150px"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="AgeingAsOfTxt" Format="dd/MMM/yyyy">
                            </asp:CalendarExtender>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Print Type
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="PrintTypeDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Output
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="OutputDDL" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="white"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></asp:Button>&nbsp;
                <br>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
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
