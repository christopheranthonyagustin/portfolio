<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="FinishedGoodsTransfer.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.FinishedGoodsTransfer.Search" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="HEAD1" runat="server">
    <title>FinishedGoodsTransfer</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <style type="text/css">
        .style1
        {
            height: 45px;
        }
        .style2
        {
            width: 113px;
        }
        .style3
        {
            height: 45px;
            width: 113px;
        }
    </style>

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0; margin-right: 0px;" id="Table1" border="0" cellspacing="2"
        cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table id="Table2">
                    <tr>
                        <td>
                           <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                           <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" class="style2">
                <table id="Table3" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
               <%-- <asp:Button ID="displayBtn" runat="server" Text="Display" CssClass="detailbutton"
                    OnClick="Display_Btn_Click"></asp:Button>
                <asp:Button ID="transferBtn" runat="server" Text="Transfer" CssClass="detailbutton"
                    OnClick="Transfer_Btn_Click" OnClientClick="return busyBox.Show();"></asp:Button>
                <asp:Button ID="resetBtn" runat="server" Text="Reset" CssClass="detailbutton" OnClick="Reset_Btn_Click">
                </asp:Button>--%>
                &nbsp; &nbsp;&nbsp;<telerik:RadButton ID="displayBtn" runat="server" Text="Display" CssClass="detailbutton" Skin="WebBlue"
                    OnClick="Display_Btn_Click"></telerik:RadButton>
                <telerik:RadButton ID="transferBtn" runat="server" Text="Transfer" CssClass="detailbutton"
                    OnClick="Transfer_Btn_Click" OnClientClick="return busyBox.Show();" Skin="WebBlue"></telerik:RadButton>
                <telerik:RadButton ID="resetBtn" runat="server" Text="Reset" CssClass="detailbutton" OnClick="Reset_Btn_Click" Skin="WebBlue"></telerik:RadButton>
                <br />
            </td>
            <td class="style3">
                &nbsp;<br>
            </td>
        </tr>
    </table>
<iframe id="BusyBoxIFrame" ondrop="return false;" frameBorder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
           <script>
               // Instantiate our BusyBox object
               var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
           </script>

    </form>
</body>
</html>
