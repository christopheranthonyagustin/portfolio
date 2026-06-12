<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportUpload.aspx.cs"
    Inherits="iWMS.Web.Job.Transporter2.TransportUpload" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>UploadJob</title>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript">
        function SAVEClicking(sender, args) {
            return busyBox.Show();
        }
    </script>

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
    <style type="text/css">
        html {
            overflow: hidden;
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
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                    <tr>
                        <td width="40%"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table>
                                <tr>
                                    <td>
                                        <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iwms:iform ID="formCtl2" runat="server" Visible="false"></iwms:iform>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td rowspan="7" valign="top">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblErrLog" runat="server" CssClass="BlackText" ForeColor="#FF0000"
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;<telerik:RadLabel ID="excelLbl" runat="server" Text="File Location" Visible="false"></telerik:RadLabel>
                            <br />
                            <telerik:RadAsyncUpload runat="server" ID="excelFile" MultipleFileSelection="Disabled" MaxFileInputsCount="1" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <telerik:RadLabel ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded." Visible="false"
                                runat="server">
                            </telerik:RadLabel>
                            <br />
                            <br />
                            <asp:Button ID="excelSendBtn" CssClass="white" runat="server" OnClick="excelSend_Click"
                                Text="UPLOAD" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="false" />
                            <br />
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
                    <tr>
                        <td class="style1">&nbsp;
                        </td>
                        <td>
                            <br />
                            <asp:Label ID="lblErrUpload" CssClass="BlackText" runat="server" Visible="False"
                                ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="summaryLbl" runat="server" ForeColor="#ff0000"></asp:Label>
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
