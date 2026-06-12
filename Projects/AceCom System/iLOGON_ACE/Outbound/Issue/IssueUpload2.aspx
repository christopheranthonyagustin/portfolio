<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueUpload2.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueUpload2" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>UploadIssue</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            width: 7%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td colspan="2">
                <asp:Label ID="headerLbl1" runat="server" CssClass="pagetitle">Upload Issue :</asp:Label><br>
                <br>
            </td>
            <td width="40%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iwms:iform ID="formCtl" runat="server"></iwms:iform>
            </td>
            <td rowspan="7" valign="top">
                <asp:Label ID="lblErrLog" runat="server" CssClass="BlackText" ForeColor="#FF0000"
                    Visible="False"></asp:Label>
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
                <asp:Button ID="excelSend" Text=" SEND TO SERVER " runat="server" OnClick="excelSend_Click" />
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
                <asp:Button ID="retrieveBtn" Text=" RETRIEVE " runat="server" CssClass="formbtn"
                    OnClick="retrieveBtn_Click" />
                <asp:RegularExpressionValidator ID="excelVal" runat="server" ControlToValidate="excelFile"
                    ErrorMessage="This is not a valid file type" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$"
                    Visible="False" />
                <br />
                <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#ff0000"></asp:Label><br>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="uploadBtn" CssClass="formbtn" Text=" UPLOAD " runat="server" OnClick="uploadBtn_Click" />
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
        <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True"
            AutoGenerateColumns="false">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <HeaderStyle Wrap="False"></HeaderStyle>
            <Columns>
                <asp:BoundColumn DataField="f1" HeaderText="F1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f2" HeaderText="F2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f3" HeaderText="F3">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f18" HeaderText="F18">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f5" HeaderText="F5">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f19" HeaderText="F19">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f7" HeaderText="F7">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f8" HeaderText="F8">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f9" HeaderText="F9">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f10" HeaderText="F10">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f11" HeaderText="F11">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f12" HeaderText="F12">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f13" HeaderText="F13">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f14" HeaderText="F14">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f15" HeaderText="F15">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f16" HeaderText="F16">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f17" HeaderText="F17">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f18" HeaderText="F18">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f19" HeaderText="F19">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f4" HeaderText="F4">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="f6" HeaderText="F6">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
