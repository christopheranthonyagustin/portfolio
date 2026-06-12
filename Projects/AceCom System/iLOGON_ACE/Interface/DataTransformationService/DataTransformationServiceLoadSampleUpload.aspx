<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTransformationServiceLoadSampleUpload.aspx.cs" Inherits="iWMS.Web.Interface.DataTransformationService.DataTransformationServiceLoadSampleUpload" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload @ Issue SerialNo</title>
       <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <br />
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".txt" Skin="Outlook">
                        <Localization Select="Choose File" />
                    </telerik:RadAsyncUpload>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click"
                        Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:Label Text="Note: Only Text files can be uploaded." Font-Size="16px" runat="server" Font-Bold="true"></asp:Label>
                </td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
