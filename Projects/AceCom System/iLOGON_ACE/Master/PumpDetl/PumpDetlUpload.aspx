<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PumpDetlUpload.aspx.cs" Inherits="iWMS.Web.Master.PumpDetl.PumpDetlUpload" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>PumpDetlUpload</title>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iwms.css" type="text/css" rel="stylesheet" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1 {
            width: 50%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Upload" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server" style="margin-left: 10px;">

                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;Format
                        <br />
                            &nbsp;<telerik:RadDropDownList ID="formatDDL" runat="server" Width="156px" Skin="Sunset" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <br />
                            <br />
                            <br />
                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook">
                                <Localization Select="Select a File" />
                            </telerik:RadAsyncUpload>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <br />
                            &nbsp;<asp:Label ID="Label1" Text="Note : Only Microsoft Excel files can be Uploaded." runat="server"></asp:Label>
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;<telerik:RadButton ID="excelSend" runat="server" OnClick="excelSend_Click" Text="Validate"
                            Skin="WebBlue" SingleClick="true" SingleClickText="Uploading...">
                        </telerik:RadButton>
                            <br />
                            <asp:Label ID="summaryLbl" runat="server" ForeColor="#ff0000"></asp:Label>
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
                            <asp:RegularExpressionValidator ID="excelVal" runat="server" ControlToValidate="excelFile"
                                ErrorMessage="This is not a valid file type" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$"
                                Visible="False" />
                            <br />
                            <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                                ForeColor="#ff0000"></asp:Label><br />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="ErrorMsg" CssClass="errorLabel" runat="server"></asp:Label>
                <div id="div-datagrid" style="height: 92%">
                    <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True">
                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem"></ItemStyle>
                        <HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:DataGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
</body>
</html>
