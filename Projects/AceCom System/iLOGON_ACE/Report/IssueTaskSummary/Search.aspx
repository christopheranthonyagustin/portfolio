<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.IssueTaskSummary.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Issue Task Summary</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top">
                <table width="50%" border="0">
                    <tr>
                        <td width="50%">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                   <%-- <tr>
                    <td colspan="2" class="style1">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">--%>
                    <tr>
                    <td colspan="2" class="style1">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">
                            &nbsp;TaskCode
                        </td>
                        <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="AvailList" Height="120px" Width="200px"
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
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                             
                    <tr>
                        <td>
                        <br />&nbsp;
                            <telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile" Skin ="WebBlue"
                                CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();">
                            </telerik:RadButton>&nbsp;
                             <%--<telerik:RadButton ID="ResetBtn" CausesValidation="false" runat="server" Text="Reset" Skin ="WebBlue"
                                CssClass="detailButton" OnClick="ResetBtn_Click" >
                            </telerik:RadButton>--%>
                            <%--<input class="detailButton" value="Reset" type="reset">--%>
                            <br />
                            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
