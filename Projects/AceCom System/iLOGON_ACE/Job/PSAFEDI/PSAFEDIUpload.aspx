<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSAFEDIUpload.aspx.cs"
    Inherits="iWMS.Web.Job.PSAFEDI.PSAFEDIUpload" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Upload PSA FEDI</title>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style1 {
            width: 7%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Upload" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="style1">
                    <asp:Label ID="excelLbl" runat="server">File Location:</asp:Label>
                </td>
                <td>
                    <%--<asp:FileUpload ID="excelFile" runat="server" />--%>
                    <telerik:RadAsyncUpload runat="server" ID="excelFileUpload" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".csv" Skin="Outlook">
                        <Localization Select="Select a File" />
                    </telerik:RadAsyncUpload>
                </td>
                <td colspan="5" valign="top">
                    <asp:Image runat="server" ID="LogoImg" ImageUrl="~/Image/PSA.png" />
                </td>
            </tr>
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="lblnote" Text="Note : Only files in .CSV format can be uploaded."
                        runat="server"></asp:Label><br />
                    <br />
                    <telerik:RadButton ID="excelSend" runat="server" OnClick="excelSend_Click" Text=" VALIDATE & UPLOAD " Skin="WebBlue"
                        SingleClick="true" SingleClickText="Uploading...">
                    </telerik:RadButton>
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
                <td class="style1">&nbsp;
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
            <%--<tr>
				<td class="style1">&nbsp;</td>
				<td><asp:button id="uploadBtn" CssClass="formbtn" Text=" UPLOAD " Runat="server" 
                        onclick="uploadBtn_Click" OnClientClick="return busyBox.Show();" />
                        <br /><asp:label id="lblErrUpload" CssClass="BlackText" Runat="server" Visible="False" ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:label>
                <br /><br />
                </td>
			</tr>--%>
        </table>
        <br />
        <div id="div-datagrid" style="height: 92%">
            <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True"
                AutoGenerateColumns="False">
                <AlternatingItemStyle></AlternatingItemStyle>
                <ItemStyle Wrap="False"></ItemStyle>
                <HeaderStyle Wrap="False" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <Columns>
                    <asp:TemplateColumn>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            S/No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="message" HeaderText="Message" SortExpression="message">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="billnumber" HeaderText="BillNumber" SortExpression="billnumber">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="billdate" HeaderText="BillDate" SortExpression="billdate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="totalamt" HeaderText="Amount" SortExpression="totalamt"
                        DataFormatString="{0:F2}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundColumn>
                </Columns>
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
