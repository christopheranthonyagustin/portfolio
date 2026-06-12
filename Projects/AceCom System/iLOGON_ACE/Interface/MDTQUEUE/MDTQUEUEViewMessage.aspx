<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MDTQUEUEViewMessage.aspx.cs" Inherits="iWMS.Web.Interface.MDTQUEUE.MDTQUEUEViewMessage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MDTQueueViewMessage</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                <ContentTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev"
                                CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next"
                                CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                        </td>
                    </tr>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="PrevItemBtn" />
                    <asp:PostBackTrigger ControlID="NextItemBtn" />
                </Triggers>
            </asp:UpdatePanel>
        </table>
        <br />
        <table>
            <tr>
                <td>
                    <telerik:RadTextBox runat="server" ID="ReturnTxt" Width="600%"
                        Skin="Office2007" TextMode="MultiLine" Rows="10">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
