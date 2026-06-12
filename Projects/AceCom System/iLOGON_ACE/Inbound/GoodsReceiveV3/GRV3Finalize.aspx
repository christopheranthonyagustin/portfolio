<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3Finalize.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3Finalize" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Finalize @ GoodsReceiveV3</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>&nbsp;&nbsp;<asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Finalize</asp:Label>
                </td>
                <tr>
                    <td colspan="2">&nbsp;
                        <asp:Label ID="MsgLbl" runat="server" />
                    </td>
                </tr>
            <tr>
                <td width="60%" align="left">
                    <br />
                    <br />
                    <br />
                    &nbsp;                                        
                    <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" OnClick="OkayBtn_Click" Visible="true"
                        Text="Okay" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;                  
                    <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click" Visible="true"
                        Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
