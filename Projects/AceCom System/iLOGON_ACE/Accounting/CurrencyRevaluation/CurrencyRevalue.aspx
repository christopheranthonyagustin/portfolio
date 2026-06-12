<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyRevalue.aspx.cs" Inherits="iWMS.Web.Accounting.CurrencyRevaluation.CurrencyRevalue" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Revalue @ Currency Revaluation </title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <base target="_self">
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

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <asp:Button ID="RevalueBtn" CssClass="white" runat="server" OnClick="RevalueBtn_Click" Text="Revalue"
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>

        <table style="width: 100%" runat="server">
            <tr>
                <td class="style1">&nbsp;<asp:Label ID="ReleaseNotesLbl" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />

                    <asp:Label ID="ReleaseNotesLbl1" Text="1. Only records with the following characteristics will be considered " Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="ReleaseNotesLbla" Text="a. Status [30-Posted to GL]" Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="ReleaseNotesLblb" Text="b. AmountOS is not zero " Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="ReleaseNotesLblc" Text="c. Created on or before the revaluation date" Font-Size="15px" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>

