<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueBlockLocReallocate.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueBlockLocReallocate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Block Lo Reallocate @ Goods Issue</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <div style = "color:red"><b>You are about to block the above location from being allocated.</b></div>
        <br />
        <table>
            <tr>
                <td>
                    <telerik:RadLabel Text=" Block Reason" Font-Size="Small" runat="server"></telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="BlockReasonTxt" TextMode="MultiLine" runat="server" Skin="Sunset"
                        Font-Size="Medium" Height="150px" Width="320px" BackColor="#ded7c6">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ProceedBtn" runat="server" CssClass="white" Text="Proceed"
            OnClick="ProceedBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
        &nbsp;
       <asp:Button ID="CloseWindowBtn" class="LongLabelWhite" runat="server" OnClick="CloseWindowBtn_Click"
           OnClientClick="disableBtn(this.id,false )" UseSubmitBehavior="false" Text="Close Window" />
    </form>
</body>
</html>
