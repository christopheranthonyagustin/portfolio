<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JBCTS_UPL_17.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.JBCTS_UPL_23" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Booking Order Upload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td colspan="2" style="height: 10px;" valign="top" align="left">
                    <b>JBCTS Upload</b>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                    <br />
                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                <asp:DropDownList ID="ExcelDDL" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Visible="true"
                        Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
