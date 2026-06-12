<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimRequestInterfaceUpload_17.aspx.cs" Inherits="iWMS.Web.Master.ClaimRequest.ClaimRequestInterfaceUpload_17" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Claim Request</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table>
            <tr>
                <td>&nbsp;
                   <asp:Label runat="server" Text="Claim Request Upload" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Button ID="DownloadTemplateBtn" CssClass="LongLabelWhite" runat="server" OnClick="DownloadTemplateBtn_Click"
                        Text="Download Template" UseSubmitBehavior="false" CausesValidation="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                    <br />
                    <br />
                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
                <td>
                    <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click"
                        Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
