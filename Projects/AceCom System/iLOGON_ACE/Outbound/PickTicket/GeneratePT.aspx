<%@ Page Language="c#" CodeBehind="GeneratePT.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.PickTicket.GeneratePT" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GeneratePT</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="GenerateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Generate" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table cellspacing="2" cellpadding="2" width="100%" border="0">
            <tr>
                <td class="boldtext">Generate Pick Ticket For Order Plan #
                <asp:Label ID="OpIdLbl" runat="server"></asp:Label>
                    <asp:TextBox ID="OpIdTxt" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Please note that only outstanding pick detail will be populated into pick ticket
                </td>
            </tr>
            <tr>
                <td class="pagetitle"><br />Please choose Pick Ticket Option
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="PTOptionRB" runat="server" Width="224px">
                        <asp:ListItem Value="10">Consolidated Pick Ticket</asp:ListItem>
                        <asp:ListItem Value="20">Pick Ticket Per Issue</asp:ListItem>
                        <asp:ListItem Value="30">Pick Ticket By Zone</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><br />Remark :
                <asp:TextBox ID="RemarkTxt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><br />
                    <%--     <telerik:RadButton ID="GenerateBtn" runat="server" Skin="WebBlue" Text="Generate" CssClass="detailbutton"
                        OnClick="GenerateBtn_Click">
                    </telerik:RadButton>--%>
                    <asp:Button ID="GenerateBtn" class="white" runat="server" OnClick="GenerateBtn_Click" Text="Generate"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                    &nbsp;
          <%--      <telerik:RadLinkButton ID="RadButton1" runat="server" Skin="WebBlue" Text="Cancel" CssClass="detailbutton"
                    NavigateUrl="javascript:history.go(-1)">
                </telerik:RadLinkButton>--%>
                    <%--  <asp:LinkButton ID="LinkButton1" runat="server" Text="Cancel" CssClass="White"   NavigateUrl="javascript:history.go(-1)"></asp:LinkButton>--%>
                    <input type="button" value="Cancel"
                        onclick="javascript: history.go(-1)" class="White">&nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
