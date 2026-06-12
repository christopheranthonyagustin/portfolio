<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateFreightJobETA.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.UpdateFreightJobETA" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>UpdateTankOrderETA</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Freight Job Register Update ETA</asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="ScanOutPanel" runat="server">
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="MsgLbl" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="40%">                    
                    <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                <td width="60%">
                    &nbsp;<asp:TextBox ID="ReasonTxt" BackColor="Yellow" runat="server" Width="155px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="40%">
                    &nbsp;
                </td>
                <td width="60%" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="CancelBtn0" runat="server" OnClick="CancelBtn_Click" 
                        OnClientClick="return busyBox.Show();" Text="Cancel" />
                    &nbsp;
                    <asp:Button ID="OkayBtn" runat="server" OnClick="OkayBtn_Click" 
                        OnClientClick="return busyBox.Show();" Text="Okay" Width="57px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>
    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>