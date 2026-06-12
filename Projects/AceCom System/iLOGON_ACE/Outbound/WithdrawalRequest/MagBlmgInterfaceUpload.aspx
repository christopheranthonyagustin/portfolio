<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MagBlmgInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Outbound.WithdrawalRequest.MagBlmgInterfaceUpload" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MAG-BLMG Interface Upload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .style1 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" AsyncPostBackTimeout="400" />
        <asp:Panel ID="Panel1" runat="server" Width="500px">
            <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td colspan="2" style="height: 10px;" valign="top" align="left">
                        <asp:Label ID="AccountLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <b>MAG-BLMG Interface Upload</b>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="excelLbl" runat="server">File Location:</asp:Label>
                    </td>
                    <td>
                        <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                            MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                    </td>
                </tr>
                <tr>
                    <td class="style1"></td>
                    <td>
                        <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style1">&nbsp;
                <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdButton" runat="server">
                            <ContentTemplate>
                                <br />
                                &nbsp;&nbsp;<asp:Button ID="uploadBtn" class="white" runat="server" OnClick="uploadBtn_Click"
                                    Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:UpdateProgress ID="updateProgress" runat="server">
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
