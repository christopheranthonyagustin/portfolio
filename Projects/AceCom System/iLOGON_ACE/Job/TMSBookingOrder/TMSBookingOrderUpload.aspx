<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderUpload.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderUpload" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>TMS Booking Order Upload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
                        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
                        <Tabs>
                            <telerik:RadTab Text="Upload" Value="0" readonly="readonly" runat="server">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
