<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2UploadV2.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2UploadV2" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>SKUV2Upload</title>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1 {
            width: 25%;
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
        <br />
        <table id="formatTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">

            <tr>
                <td colspan="2">
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                </td>
                <td valign="top">&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <iwms:iform ID="formCtl2" runat="server"></iwms:iform>
                </td>
                <td valign="top">&nbsp;
                </td>
            </tr>
        </table>
        <asp:Panel ID="okBtnPanel" runat="server" Visible="false">
            <table id="Table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <br />
                        <br />
                        <asp:Button ID="OkBtn" class="white" runat="server" OnClick="OkBtn_Click"
                            Text="OK" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="stdUploadPanel" runat="server" Visible="false">
            <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td class="style1">
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
                        <asp:Label ID="Label1" Text="Note : Only Microsoft Excel files can be Uploaded." runat="server"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <br />
                        <asp:Button ID="excelSend" runat="server" Text="Upload" CssClass="white" OnClick="excelSend_Click"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
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
            <div id="div-datagrid" style="height: 92%">
                <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True">
                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem"></ItemStyle>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                </asp:DataGrid>
            </div>
        </asp:Panel>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
