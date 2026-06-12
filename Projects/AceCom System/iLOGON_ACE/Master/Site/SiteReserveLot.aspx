<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteReserveLot.aspx.cs" Inherits="iWMS.Web.Master.Site.SiteReserveLot" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>ReserveSiteLotNo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td style="width: 40%;">
                        <asp:Label runat="server" Text="Account"></asp:Label>
                        <br />
                        <telerik:RadDropDownList ID="acc_ddl" runat="server" BackColor="Yellow" DropDownHeight="360px" Skin="WebBlue" Width="155px">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px;">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Lot Type"></asp:Label>
                        <br />
                        <telerik:RadDropDownList ID="lottype_ddl" runat="server" DropDownHeight="360px" Skin="WebBlue" Width="155px">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px;">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="No. of Lots"></asp:Label>
                        <br />
                        <telerik:RadTextBox ID="NoLots_tbox" runat="server" Width="155px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px;">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Reason"></asp:Label>
                        <br />
                        <telerik:RadTextBox ID="Reason_tbox" runat="server" Width="300px" TextMode="MultiLine" Rows="6" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px;">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="ReserveLotBtn" CssClass="white" runat="server" OnClick="ReserveLot_Btn_Click"
                            Text="Submit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
