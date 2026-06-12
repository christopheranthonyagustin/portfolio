<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.DailyVehUtilSchedule.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyVehicleUtilizationSchedule</title>

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

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
        .style3
        {
            height: 17px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <%--<tr>
                        <td width="5%">
                            OpsUnit
                        </td>
                        <td width="1%">
                            &nbsp;
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="AvailOpsList" runat="server" Rows="6" SelectionMode="Multiple" Width="100%" />
                        </td>
                        <td width="7%" align="center">
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
                            <asp:ListBox ID="SelectedOpsList" runat="server" Rows="6" SelectionMode="Multiple"
                                Width="90%" Style="background-color: Yellow;" />
                        </td>
                        <td width="37%">
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="style3">
                            &nbsp;&nbsp;OpsUnit
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 400px" valign="top">
                            <telerik:RadListBox runat="server" ID="AvailOpsList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                CausesValidation="false" OnTransferred="AvailOpsList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedOpsList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 5px">
            </td>
        </tr>
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td style="height: 5px">
            </td>
        </tr>
        <tr>
            <td valign="top" width="30%" class="style2" colspan="2">
               &nbsp;<telerik:RadButton ID="CompileBtn" runat="server" Text="Compile" OnClick="CompileBtn_Click"
                    AutoPostBack="true" Skin="WebBlue" OnClientClick="busyBox.Show()">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td valign="top" width="70%" class="style2" colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
                &nbsp;<br />
            </td>
        </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");        
    </script>

</body>
</html>
