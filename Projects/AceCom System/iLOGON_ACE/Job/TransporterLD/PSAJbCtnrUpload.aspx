<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSAJbCtnrUpload.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterLD.PSAJbCtnrUpload" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>UploadJob</title>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 7%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td colspan="2">
                <asp:Label ID="acIdLbl" runat="server" Visible="false" /><br />
                <br />
            </td>
            <td width="40%">
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="excelLbl" runat="server">File Location:</asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="excelFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style1">
            </td>
            <td>
                <asp:Label ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded."
                    runat="server"></asp:Label><br />
                <br />
                <asp:Button ID="excelSend" Text=" VALIDATE " runat="server" OnClick="excelSend_Click"
                    OnClientClick="busyBox.Show();" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="excelssLbl" runat="server" Visible="False">Spreadsheet Name:</asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="excelssDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="excelssDDL_SelectedIndexChanged"
                    Visible="false" />
                <br />
                <asp:Button ID="excelssBtn" Text="Get WorkSheet" runat="server" CssClass="formbtn"
                    Visible="false" />
                <asp:Label ID="warningLbl" CssClass="BlackText" runat="server" Visible="false">Please close excel file (if still open) before clicking Get Worksheet</asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <%--<asp:button id="retrieveBtn" Text=" RETRIEVE " Runat="server"  CssClass="formbtn"
                            onclick="retrieveBtn_Click" />--%>
                <asp:RegularExpressionValidator ID="excelVal" runat="server" ControlToValidate="excelFile"
                    ErrorMessage="This is not a valid file type" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$"
                    Visible="False" />
                <br />
                <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#ff0000"></asp:Label><br />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="uploadBtn" CssClass="formbtn" Text=" UPLOAD " runat="server" OnClick="uploadBtn_Click"
                    OnClientClick="busyBox.Show();" />
                <br />
                <asp:Label ID="lblErrUpload" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid" style="height: 92%">
        <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <HeaderStyle Wrap="False"></HeaderStyle>
        </asp:DataGrid>
    </div>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
