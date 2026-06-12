<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Graphlet.WareHouseAnalysis.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Warehouse Analysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="1" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="FormatRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="CriteriaRadPageView">
                <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                <br />
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="CompileBtn" runat="server" Text="Run" CausesValidation="false" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id, false)"
                                UseSubmitBehavior="false" class="white" />
                        </td>
                        <td>
                            <asp:Button ID="RunBtn" runat="server" Text="Run" CssClass="white" OnClick="RunBtn_Click"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                            <asp:Button ID="SaveTemplateBtn" runat="server" Text="Save Template" CausesValidation="false" OnClick="SaveTemplateBtn_Click" OnClientClick="disableBtn(this.id, false)"
                                UseSubmitBehavior="false" class="LongLabelWhite" Visible="false" />
                        </td>
                        <td>
                            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                        </td>
                    </tr>
                </table>

                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel_13" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl13" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel_17" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl17" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel_23" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl23" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel_29" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl29" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel19" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel19" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl19" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePane31" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel_31" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl31" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel47" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel47" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl47" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel41" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel41" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl41" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel37" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel37" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl37" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>


                <asp:UpdatePanel ID="UpdatePanel43" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel43" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl43" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel53" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel53" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl53" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel59" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel59" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl59" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel61" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel61" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl61" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel67" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel67" runat="server" Visible="false">
                            <table border="0" cellspacing="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl67" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel71" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel71" runat="server" Visible="false">
                            <table border="0" cellspacing="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl71" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePane73" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel73" runat="server" Visible="false">
                            <table border="0" cellspacing="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl73" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="TemplateRadPageView" Height="600px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
