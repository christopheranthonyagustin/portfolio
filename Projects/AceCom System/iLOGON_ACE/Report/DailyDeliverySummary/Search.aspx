<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.DailyDeliverySummary.Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <title>Daily Delivery Summary</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    
    <script type="text/javascript">
    function RunClicking(sender, args)
    {
        return busyBox.Show();
    }
    </script>
    
    <style type="text/css">
        .style1
        {
            width: 30%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" class="style1" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="94%">
            &nbsp;<telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Text=" Run " Skin="WebBlue"
                    CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClicking="RunClicking" />
            &nbsp;<asp:Label ID="MessageLbl" runat="server" ForeColor="Red"></asp:Label>
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
