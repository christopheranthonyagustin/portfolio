<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsigneePartnerAdd.aspx.cs" Inherits="iWMS.Web.Master.ConsigneePartner.ConsigneePartnerAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ConsigneePartberAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="GenCodeBtn" class="white" runat="server" OnClick="GenCodeBtn_Click" Text="GenCode"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="false" CausesValidation="false" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="AddBtn" />
                <asp:PostBackTrigger ControlID="GenCodeBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
