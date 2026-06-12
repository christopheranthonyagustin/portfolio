<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2GenInvoice.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2GenInvoice" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>GenerateInvoice @ DDPV2</title>
    <link rel="stylesheet" href="../../css/iWMSTelerik.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <base target="_self" />
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
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="Panel1" runat="server" Width="300px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <asp:Button ID="GenerateBtn" runat="server" CssClass="white" Text="Generate" CausesValidation="true"
                            OnClick="GenerateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
