<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkuUpload.aspx.cs" Inherits="iWMS.Web.Master.Sku.SkuUpload" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuUpload</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td width="20%">
                <asp:Label ID="headerLbl1" runat="server" CssClass="pagetitle">Upload SKU :</asp:Label><br>
                <br>
            </td>
            <td width="40%">
            </td>
            <td width="40%">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="excelLbl" runat="server">File Location:</asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="excelFile" runat="server" />
            </td>
            <td rowspan="6" valign="top">
                <asp:Label ID="lblErrLog" runat="server" CssClass="BlackText" ForeColor="#FF0000"
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded."
                    runat="server"></asp:Label><br />
                <br />
                <asp:Button ID="excelSend" Text=" SEND TO SERVER " runat="server" OnClick="excelSend_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="excelssLbl" runat="server" Visible="false">Spreadsheet Name:</asp:Label>
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
            <td>
                &nbsp;
            </td>
            <td>
                <%--<asp:Button ID="retrieveBtn" Text=" RETRIEVE " runat="server" CssClass="formbtn"
                    OnClick="retrieveBtn_Click" />--%>
                          <asp:Button ID="retrieveBtn" runat="server"  OnClick="retrieveBtn_Click" Text="RETRIEVE"
                    OnClientClick="disableBtn(this.id,false)" ToolTip="RETRIEVE" UseSubmitBehavior="false" CssClass="white" />
                <asp:RegularExpressionValidator ID="excelVal" runat="server" ControlToValidate="excelFile"
                    ErrorMessage="This is not a valid file type" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$"
                    Visible="False" />
                <br />
                <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#ff0000"></asp:Label><br>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
               <%-- <asp:Button ID="uploadBtn" CssClass="formbtn" Text=" UPLOAD " runat="server" OnClick="uploadBtn_Click" />--%>
                  <asp:Button ID="uploadBtn" runat="server"  OnClick="uploadBtn_Click" Text="UPLOAD"
                    OnClientClick="disableBtn(this.id,false)" ToolTip="UPLOAD" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <asp:Label ID="lblErrUpload" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid" style="height: 60%">
        <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <HeaderStyle Wrap="False"></HeaderStyle>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
