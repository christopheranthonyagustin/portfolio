<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseOrderPopulateToJobDec.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.PurchaseOrderPopulateToJobDec" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Customs Declaration @ Purchase Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
    <script type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('btnDeclareOkay').click();
        }
    </script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }
    </script>
</head>
<body leftmargin="0" topmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="PopulateBtn" runat="server" CssClass="white" Text="Populate"
                        OnClick="PopulateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                     <iWMS:iForm ID="formCtl" runat="server" />
                    <%--<asp:Label ID="jobNoLbl" runat="server">JobNo</asp:Label>
                    <br />
                    <telerik:RadTextBox ID="jobNoTxt" runat="server" Width="155px">
                    </telerik:RadTextBox>--%>
                    
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td>
                    <asp:LinkButton Style="z-index: 0" ID="LinkLbl" runat="server" CssClass="linkLabelBig"
                        OnClick="LinkLbl_Click"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="NoteLbl" runat="server" Text="To populate to a new Job, leave the JobNo blank." Font-Bold="true" Font-Size="Small"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
