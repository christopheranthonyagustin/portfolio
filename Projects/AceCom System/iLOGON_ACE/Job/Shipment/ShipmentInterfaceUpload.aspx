<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Job.Shipment.ShipmentInterfaceUpload" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DeclarationInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
                <br />
                <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                    <tr>
                        <td>
                            <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadButton ID="OkBtn" Text=" OK " runat="server" OnClick="OkBtn_Click" Skin="WebBlue" style="margin-left: 5px;" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
