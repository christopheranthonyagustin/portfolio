<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.DailyRevenueTransSummary.Search" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>DailyRevenueTransactionSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td style="height:5px"></td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="60%">
                <%--Ticket #5100: PILSG : Enhancement to Daily Revenue Transaction Summary--%>
                <tr>
                        <td style="width: 400" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="AvailList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="Sunset" AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                    <%--<tr>
                        
                        <td width="25%">
                            <asp:ListBox ID="AvailList" runat="server" Rows="10" SelectionMode="Multiple" Width="100%" />
                        </td>
                        <td width="10%" align="center">
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
                            <asp:ListBox ID="SelectedList" runat="server" Rows="10" SelectionMode="Multiple"
                                Width="90%" Style="background-color: Yellow;" />
                        </td>
                        <td width="30%">
                        </td>
                    </tr>--%>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height:5px"></td>
        </tr>
        <tr>
            <td>
                <telerik:RadButton ID="CompileBtn" runat="server" CssClass="detailbutton" OnClick="CompileBtn_Click"
                    Text="Compile" OnClientClick="return busyBox.Show();" />
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
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
