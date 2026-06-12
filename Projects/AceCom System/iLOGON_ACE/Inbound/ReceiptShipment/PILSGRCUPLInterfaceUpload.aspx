<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PILSGRCUPLInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.PILSGRCUPLInterfaceUpload" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iForm" TagPrefix="iWMS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Upload</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td colspan="2" style="height: 10px; font-size: 17px" valign="top" align="left">
                    <b>UPL Interface Upload</b>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ExcelDDL" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server" Font-Bold="true" Font-Size="Small"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
