<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2MassChange.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2MassChange" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CostingSheetMassChange</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self" />
</head>
<body>

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

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        <br />
                        <asp:Button Style="z-index: 0" ID="ChangeBtn" runat="server" Text="ProceedToChange"
                            Visible="true" CssClass="detailButton" OnClick="ChangeBtn_Click"></asp:Button>
                        <asp:Button Style="z-index: 0" ID="Cancel" runat="server" CssClass="detailButton"
                            Visible="True" Text="Cancel" OnClick="CancelBtn_Click" CausesValidation="false"></asp:Button>
                    </td>
                </tr>
            </table>
            &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
                CssClass="errorLabel"></asp:Label>
        </div>
    </form>
</body>
</html>
