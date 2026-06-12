<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APSInterfaceUpload.aspx.cs"
    Inherits="iWMS.Web.Outbound.Issue.APSInterfaceUpload" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>APS Interface Upload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td colspan="2" style="height: 10px;" valign="top" align="left">
                <b>APS Interface Upload</b>
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight" 
                    MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".txt" Skin="Outlook">
                    <Localization Select="Select a File" />
                </telerik:RadAsyncUpload>
            </td>
        </tr>
        <tr>
            <td class="style1">
            </td>
            <td>
                <asp:Label ID="lblnote" Text="Note : Only Text files (.txt) can be Uploaded." runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <telerik:RadButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" Text="Upload" Width="70px"
                    Skin="WebBlue" SingleClick="true" SingleClickText="Uploading...">
                </telerik:RadButton>
            </td>
        </tr>
    </table>
    <br />
    <%--<div id="div-datagrid" style="height: 92%">
        <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <HeaderStyle Wrap="False"></HeaderStyle>
        </asp:DataGrid>
    </div>--%>
    </form>
</body>
</html>
