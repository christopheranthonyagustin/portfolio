<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerContactCancelTo.aspx.cs" Inherits="iWMS.Web.Master.Partner.PartnerContactCancelTo" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Partner Contact CancelTo</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Button ID="CancelToBtn" class="white" runat="server" OnClick="CancelToBtn_Click" Text="CancelTo"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <table style="z-index: 0" id="Table2" border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
