<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvHoldDetlCount.aspx.cs"
    Inherits="iWMS.Web.HouseKeeping.InvHold.InvHoldDetlCount" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Inventory Hold Count</title>

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
            <td style="width: 10%">
                <br />
                <br />
            </td>
            <td>
            </td>
        </tr>
        <tr>
           <%-- <td>
                <asp:Label ID="excelLbl" runat="server">File Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
            </td>--%>
            <td>
                &nbsp;<asp:Label ID="excelLbl" runat="server">File Location</asp:Label> 
                <br />  
                <%--<asp:FileUpload ID="excelFile" runat="server" />--%>
                <telerik:RadAsyncUpload runat="server" ID="excelFile" MultipleFileSelection ="Disabled" MaxFileInputsCount="1" />   
            </td>
        </tr>
        <tr>            
            <td>
                <telerik:RadDropDownList ID="excelssDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="excelssDDL_SelectedIndexChanged"
                    Visible="false" />
                <br />
                <asp:Label ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded."
                    runat="server"></asp:Label><br />
                <br />
                <telerik:RadButton ID="excelSend" Text=" VALIDATE & UPLOAD " runat="server" Skin ="WebBlue" OnClick="excelSend_Click"
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
