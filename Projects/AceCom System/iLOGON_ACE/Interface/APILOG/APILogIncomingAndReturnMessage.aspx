<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APILogIncomingAndReturnMessage.aspx.cs" Inherits="iWMS.Web.Interface.APILOG.APILogIncomingAndReturnMessage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>API Log Incoming Message And Return Message</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />

        <table>
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"  />
                    &nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                </td>
            </tr>
        </table>

        <br />
        <br />
        <telerik:RadTextBox runat="server" ID="IncomingCodeTxt"
            Skin="Office2007" TextMode="SingleLine" Rows="1" ReadOnly="true">
        </telerik:RadTextBox>
        <br />
        <br />
        <telerik:RadTextBox runat="server" ID="IncomingTxt" Width="100%"
            Skin="Office2007" TextMode="MultiLine" Rows="10">
        </telerik:RadTextBox>
        <br />
        <br />
        <br />
        <telerik:RadTextBox runat="server" ID="ReturnCodeTxt"
            Skin="Office2007" TextMode="SingleLine" Rows="1" ReadOnly="true">
        </telerik:RadTextBox>
        <br />
        <br />
        <telerik:RadTextBox runat="server" ID="ReturnTxt" Width="100%"
            Skin="Office2007" TextMode="MultiLine" Rows="10">
        </telerik:RadTextBox>
    </form>
</body>
</html>
