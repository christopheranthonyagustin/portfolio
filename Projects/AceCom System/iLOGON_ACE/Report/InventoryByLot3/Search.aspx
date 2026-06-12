<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.InventoryByLot3.Search" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InventoryByLotV3</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">    
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="CompileBtn" class="white" runat="server" OnClick="CompileBtn_Click" Text="Compile" 
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%" id="CheckBoxTB" runat="server">
                <table border="0" cellspacing="3" cellpadding="3" width="100%">
                    <tr>
                        <td style="width: 3px">
                            <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                        </td>
                        <td style="width: 3px">
                            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                        </td>
                        <td align="left">
                            <asp:Label ID="Label1" runat="server">All</asp:Label>
                        </td>
                    </tr>
                </table>
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

