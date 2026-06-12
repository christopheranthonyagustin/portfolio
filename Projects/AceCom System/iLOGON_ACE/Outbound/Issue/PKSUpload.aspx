<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKSUpload.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.PKSUpload" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Upload Packing Serial Number</title>
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
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
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td colspan="2">
                <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" Text="Packing Serial Number Interface Upload" Font-Size="Medium" />
                <br />
                <br />
                <asp:Label ID="IssueInfoLbl" runat="server" CssClass="BoldOnly" Font-Size="Small" />
                <br />
                <asp:Label ID="CustRef" runat="server" CssClass="BoldOnly" Font-Size="Small" />
                <br />
                <br />
                <br />
            </td>
            
        </tr>
        <tr>
        
       
            <td style="width: 10%">
                <asp:Label ID="excelLbl" runat="server">File Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="excelFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <asp:DropDownList ID="excelssDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="excelssDDL_SelectedIndexChanged"
                    Visible="false" />
                <br />
                <asp:Label ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded."
                    runat="server"></asp:Label><br />
                <br />
                <asp:Button ID="excelSend" Text=" VALIDATE & UPLOAD " runat="server" OnClick="excelSend_Click"
                    OnClientClick="return busyBox.Show();" />
                <br />
                <asp:Label ID="summaryLbl" runat="server" ForeColor="#ff0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <asp:RegularExpressionValidator ID="excelVal" runat="server" ControlToValidate="excelFile"
                    ErrorMessage="This is not a valid file type" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$"
                    Visible="False" />
                <br />
                <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#ff0000"></asp:Label><br />
            </td>
        </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
</body>
</html>
