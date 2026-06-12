<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeaQuoteTnCUpdate.aspx.cs" Inherits="iWMS.Web.BusManagement.MakeaQuote.MakeaQuoteTnCUpdate" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Term and Conditions
    </title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="UpdatesBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Update" UseSubmitBehavior="false" />
                    </td>
                    <td>
                        <asp:Button ID="Printbtn" runat="server" Text="Print" OnClick="Printbtn_Click" Visible="false"
                            OnClientClick="disableBtn(this.id,false)" CssClass="blue" ToolTip="Print" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            <iWMS:iForm ID="formCtl1" runat="server" Visible="false"></iWMS:iForm>
            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        </div>
    </form>
</body>
</html>
