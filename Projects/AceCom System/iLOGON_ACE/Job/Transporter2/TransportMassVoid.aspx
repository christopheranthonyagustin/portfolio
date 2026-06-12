<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportMassVoid.aspx.cs"
    Inherits="iWMS.Web.Job.Transporter2.TransportMassVoid" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>MassVoid</title>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        .style1
        {
            width: 60px;
        }
    </style>
   <%-- <style type="text/css">
        .style1
        {
            width: 7%;
        }
        #BusyBoxIFrame
        {
            height: 10px;
            margin-right: 0px;
            width: 170px;
        }
    </style>--%>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td>
                <iwms:iform ID="formCtl" runat="server"></iwms:iform>
            </td>
           <%-- <td valign="right">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="right">
                            <asp:Label ID="lblErrLog" runat="server" CssClass="BlackText" ForeColor="#FF0000"
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>--%>
        </tr>
    </table>
    <%--&nbsp;&nbsp;<telerik:RadButton ID="voidSend" runat="server" Skin="WebBlue" OnClick="voidSend_Click" Text="MassVoid" />--%>
        <asp:Button ID="voidSend" class="blue" runat="server" OnClick="voidSend_Click" Text="Void" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="lblnote" Text="Note : Only Jobs that are 10-Open will be voided."
        runat="server"></asp:Label>
    </form>
</body>
</html>
