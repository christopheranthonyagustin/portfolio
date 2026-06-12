<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocUtilizationSearch.aspx.cs"
    Inherits="iWMS.Web.Report.LocUtilization.LocUtilizationSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>LocUtilization</title>
   <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 36px;
        }
        .style4
        {
            width: 6.15%;
        }
        .style5
        {
            width: 5.25%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
         <tr>
            <td valign="top" width="30%">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
           <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="style5">
                            &nbsp;Zone
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="ZoneList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="ZoneToExclList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="ZoneList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="ZoneToExclList" Height="120px" Width="200px"
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
                      <td class="style4">
                          &nbsp;LocationCat
                      </td>
                    </tr>
                    <tr>
                        <td style="width: 400" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="LocationCatList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="LoccatToExclList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="LocationCatList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="LoccatToExclList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="Sunset" AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                </table>
            </td>
           </tr>
         </table>

        </tr>
        </br>
        <tr>
            <td>
            &nbsp;&nbsp;
                <telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Skin="WebBlue" Text="Compile"
                    CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();">
                </telerik:RadButton>&nbsp;
                <%--<input class="detailButton" value="Reset" type="reset" />--%>
                <telerik:RadButton ID="resetBtn" runat="server" Skin="WebBlue" Text="Reset" CssClass="detailbutton" OnClick="ResetBtn_Click">
                </telerik:RadButton><br>
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
                &nbsp;
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
