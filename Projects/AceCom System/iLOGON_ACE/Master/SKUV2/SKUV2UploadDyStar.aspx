<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2UploadDyStar.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2UploadDyStar" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>SKUV2UploadDyStar</title>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">

    <style type="text/css">
        .style1 {
            width: 75%;
        }
    </style>

    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .popupHeaderR {
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            background: #859DD4;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-top: 2px solid GREY;
            border-right: 2px solid GREY;
            border-left: 2px solid GREY;
        }

            .popupHeaderR span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
                margin-top: 5px;
            }

            .popupHeaderR a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdButton" runat="server">
            <ContentTemplate>
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
                            &nbsp;<asp:Button ID="excelSend" runat="server" Text="Upload" CssClass="white" OnClick="excelSend_Click"
                                UseSubmitBehavior="false"></asp:Button>
                            <br />
                            <asp:Label ID="summaryLbl" runat="server" ForeColor="#ff0000"></asp:Label>
                            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <br />
                            &nbsp;<asp:Label ID="Label2" Text="Processing Rules:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label3" Text="1. Duplicate SKU records will be ignored. Only one of the duplicated records will be processed." Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label4" Text="2. Pallet Denomination" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" Text="a. Is mandatory for all Trading SKU" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" Text="b. Will be ignored for all Sample SKU" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label7" Text="3. Column [Change Date (IMDG)] must be in DD/MM/YYYY format (or blank). " Font-Size="15px" runat="server"></asp:Label>
                            <br />
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdButton">
            <ProgressTemplate>
                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                </div>
                <div id="LoaderPopup">
                    <a id="loader"></a>
                    <a id="text">We are processing your request ...</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
