<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARAMEXInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Outbound.WithdrawalRequest.ARAMEXInterfaceUpload" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MSAS Interface Upload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />

        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td colspan="2" style="height: 10px;" valign="top" align="left">
                    <b>MSAS Interface Upload</b>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="excelLbl" runat="server">File Location:</asp:Label>
                </td>
                <td>
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight" 
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td>
                    <asp:Label ID="lblnote" Text="Note : Only Excel file can be uploaded." runat="server"></asp:Label>
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
                    <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                </td>
                <td>
                    <telerik:RadButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" Text="Upload" Width="70px"
                        Skin="WebBlue" SingleClick="true" SingleClickText="Uploading...">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>

        <br />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" ForeColor="Black"></asp:Label>
        <div id="div-datagrid" style="height: 92%">
            <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" AutoGenerateColumns="true" BorderStyle="None" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <HeaderStyle Wrap="False"></HeaderStyle>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
