<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Job.TripServiceChitPrint.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Trip Service Chit Print</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="50%">
                <table width="100%">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="11%" valign="top">
                                        &nbsp;OpsUnit
                                    </td>
                                    <td style="width: 400px" valign="top">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <telerik:RadListBox runat="server" ID="OpsUnitList" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsUnitList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowDelete="false" AutoPostBackOnTransfer="true" OnTransferred="OpsUnitList_Transferred">
                                            <ButtonSettings AreaWidth="35px" TransferButtons="All"></ButtonSettings>
                                        </telerik:RadListBox>
                                    </td>
                                    <td width="20%">
                                        <telerik:RadListBox runat="server" ID="SelectedOpsUnitList" Height="120px" Width="200px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="11%">
                                        &nbsp;
                                    </td>
                                    <td width="28%">
                                        &nbsp;
                                    </td>
                                    <td width="13%" align="center">
                                        &nbsp;
                                    </td>
                                    <td width="28%">
                                        &nbsp;
                                    </td>
                                    <td width="20%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="11%" valign="top">
                                        &nbsp;Grade
                                    </td>
                                    <td style="width: 400px" valign="top">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <telerik:RadListBox runat="server" ID="PersGradeList" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPersGradeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="PersGradeList_Transferred">
                                        </telerik:RadListBox>
                                    </td>
                                    <td width="20%">
                                        <telerik:RadListBox runat="server" ID="SelectedPersGradeList" Height="120px" Width="200px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="white"
                                OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></asp:Button><input class="white"
                                    value="Reset" type="reset">
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="50%">
                <p>
                    &nbsp;
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<br />
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
