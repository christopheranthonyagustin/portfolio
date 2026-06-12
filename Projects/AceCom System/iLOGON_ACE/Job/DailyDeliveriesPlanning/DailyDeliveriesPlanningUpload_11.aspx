<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveriesPlanningUpload_11.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanning.DailyDeliveriesPlanningUpload_11" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iWMS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyDeliveriesPlanningUpload_11</title>
    <link rel="stylesheet" href="../../css/iWMSTelerik.css" />
    <link rel="stylesheet" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <iWMS:iform ID="formCtl" runat="server"></iWMS:iform>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="DownloadTemplateBtn" CssClass="LongLabelWhite" runat="server" OnClick="DownloadTemplateBtn_Click"
                        Text="Download Template" UseSubmitBehavior="false" CausesValidation="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook">
                        <Localization Select="Choose File" />
                        </telerik:RadAsyncUpload>
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
                    <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click1"
                        Text="Upload" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:Label Text="Release Note:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    <asp:Label Text="1. Only Excel files can be uploaded." Font-Size="16px" runat="server" Font-Bold="true"></asp:Label>
                    <br />
                    <asp:Label Text="2. All date values must have the DD/MMM/YYYY format e.g. 12/Jan/2021." Font-Size="16px" runat="server" Font-Bold="true"></asp:Label>
                    <br />
                    <asp:Label Text="3. Booking Date will supersede other values in booking date column" Font-Size="16px" runat="server" Font-Bold="true"></asp:Label>
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>