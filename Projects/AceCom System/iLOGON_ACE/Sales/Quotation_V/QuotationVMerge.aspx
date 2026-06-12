<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVMerge.aspx.cs" Inherits="iWMS.Web.Sales.Quotation_V.QuotationVMerge" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>VendorQuotationMerge</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
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
                        <asp:Button ID="MergeBtn" runat="server" Text="Merge" Visible="true" CssClass="white"
                            OnClick="MergeBtn_Click"  OnClientClick="disableBtn(this.id,false)"  ToolTip="Merge" UseSubmitBehavior="false"></asp:Button>
                        <asp:Button  ID="Cancel" runat="server" CssClass="white"
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

