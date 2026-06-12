<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookAnalysis.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookAnalysis.CashBookAnalysis" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CashBookAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table border="0" style="border-spacing: 0px;">
                    <tr>
                        <td>
                            <br />
                           <asp:Button ID="CompileBtn" runat="server" Text="Run" CssClass="white" CausesValidation="false" ToolTip="Run"
                               OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <br />
                            &nbsp;&nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="Panel1" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr id="trformCtl" runat="server">
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td width="1%"></td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label7" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label12" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel ID="Panel_31" runat="server" Visible="false">
                    <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                        <tr>
                            <td valign="top">
                                <iWMS:iForm ID="formCtl31" runat="server" />
                            </td>
                        </tr>
                        <tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label9" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label10" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl3" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label13" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel_37" runat="server" Visible="false">
                    <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                        <tr>
                            <td valign="top">
                                <iWMS:iForm ID="formCtl37" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label3" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label4" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl1" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label8" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel_41" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr id="tr1" runat="server">
                            <td>
                                <iWMS:iForm ID="formCtl41" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="compilebtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>

