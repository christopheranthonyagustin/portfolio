<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EqpLocationListing.aspx.cs"
    Inherits="iWMS.Web.Report.EqpLocationListing.EqpLocationListing" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <title>EquipmentLocationListing</title>
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
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <br />
                        <td>
                            &nbsp;OpsUnit
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 500px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="AvailOpsList" Height="130px" Width="250px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailOpsList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedOpsList" Height="130px" Width="250px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <br />
                        <td>
                            &nbsp;VehicalType
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 500px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="AvailTypeList" Height="200px" Width="250px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedTypeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailTypeList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedTypeList" Height="200px" Width="250px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" width="30%" class="style2" colspan="2">
            <br />
                &nbsp;<telerik:RadButton ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton" Skin = "WebBlue"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();" />
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

    <script>
               // Instantiate our BusyBox object
               var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
