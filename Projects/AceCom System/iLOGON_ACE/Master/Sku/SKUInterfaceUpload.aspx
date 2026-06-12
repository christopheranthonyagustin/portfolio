<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Master.Sku.SKUInterfaceUpload" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SKUInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Interface" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                        </td>
                    </tr>
                </table>
                <table style="width: 100%">
                    <tr>
                        <td class="style1">&nbsp;<asp:Label ID="Label13" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label1" Text="1. This function will only support upload formats that are setup at the Account level. " Font-Size="15px" runat="server"></asp:Label>

                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
