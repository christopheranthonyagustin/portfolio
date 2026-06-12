<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.ReceiptTaskSummary.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Receipt Task Summary</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td valign="top">
                    <table width="50%" border="0">
                        <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                         <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style1">
                                <table id="TaskTable" border="0" cellpadding="0" cellspacing="0" width="100%" runat="server">
                                    <tr>
                                        <td class="style5">&nbsp;<asp:Label ID="TaskCodeLbl" runat="server">TaskCode</asp:Label>
                                    </td>
                                    </tr>                                    
                                    <tr>
                                        <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="AvailList" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAvailList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="AvailList_Transferred">
                                        </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedAvailList" Height="120px" Width="200px"
                                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                AllowDelete="false" Style="background-color: Yellow;">
                                            </telerik:RadListBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdButton" runat="server">
                                    <ContentTemplate>
                                        &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label><br />
                                        <br />
                                        &nbsp;&nbsp;<asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Run" />
                                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
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
