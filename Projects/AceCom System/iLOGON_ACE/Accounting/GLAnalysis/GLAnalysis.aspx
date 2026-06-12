<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLAnalysis.aspx.cs" Inherits="iWMS.Web.Accounting.GLAnalysis.GLAnalysis" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GLAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="CompileBtn">
         <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Selected="true">
                </telerik:RadTab>
                <telerik:RadTab Text="Template" Value="60" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="1" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="FormatRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="CriteriaRadPageView">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <table border="0" style="border-spacing: 0px;">
                                <tr>
                                    <td>
                                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                        <br />
                                        &nbsp;
                             <asp:Button ID="CompileBtn" runat="server" Text="Run" CssClass="white" CausesValidation="false" ToolTip="Run"
                                 OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                        &nbsp;
                <br />
                                        &nbsp;&nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="compilebtn" />
                        </Triggers>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="Panel1" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                                <tr id="trformCtl" runat="server">
                                    <td>
                                        <iWMS:iForm ID="formCtl13" runat="server"></iWMS:iForm>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl17" runat="server"></iWMS:iForm>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl19" runat="server"></iWMS:iForm>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl23" runat="server"></iWMS:iForm>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl29" runat="server"></iWMS:iForm>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl41" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:Panel ID="Panel31" runat="server" Visible="false">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                    <tr>
                                        <td valign="top">
                                            <iWMS:iForm ID="formCtlEnt31" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <iWMS:iForm ID="formCtl31" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>

                    <asp:Panel ID="Panel37" runat="server" Visible="false">
                        <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <iWMS:iForm ID="formCtl37" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            <br />
                                            <asp:Label Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                            <asp:Label Text="This report is showing top 50 Accounts." Font-Size="15px" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                     <asp:Panel ID="Panel43" runat="server" Visible="false">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                    <tr>
                                        <td valign="top">
                                            <iWMS:iForm ID="formCtlEnt43" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <iWMS:iForm ID="formCtl43" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:Panel ID="Panel47" runat="server" Visible="false">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                    <tr>
                                        <td valign="top">
                                            <iWMS:iForm ID="formCtlEnt47" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <iWMS:iForm ID="formCtl47" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>

                    <br />
                    <br />
                    <table style="width: 100%" runat="server">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label2" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;
                                <asp:Label ID="ReleaseNotes1Lbl" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="Label14" Text=" ] rows in your query, the results will be automatically exported to Excel." Font-Size="15px" runat="server"></asp:Label>
                                <br />
                            <%--    &nbsp;--%>
                             <%--   <asp:Label ID="ReleaseNotes2Lbl" Text="2. Only transactions that are of status 30-Posted will be extracted for reporting." Font-Size="15px" runat="server" Visible="false"></asp:Label>
                                <br />--%>
                                &nbsp;<asp:Label ID="Label3" Text=" 2. Only GL Journal records with status 30-Posted will be extracted for reporting." Font-Size="15px" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label4" Text=" 3. {IncludeUnpostedRecords} refers to GL, AR, AP, Cash Book Receipts & Payments records that are in status 10-Unposted" Font-Size="15px" runat="server"></asp:Label>
                            </td>
                            <td class="style1">
                                <asp:Label ID="Label1" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;
                                <asp:Label ID="ReleaseNotes1Lbl1" Text=" 1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl1" Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="Label5" Text=" ] rows in your query, the results will be automatically exported to Excel." Font-Size="15px" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label12" Text=" 2. Only GL Journal records with status 30-Posted will be extracted for reporting." Font-Size="15px" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label13" Text=" 3. {IncludeUnpostedRecords} refers to GL, AR, AP, Cash Book Receipts & Payments records that are in status 10-Unposted" Font-Size="15px" runat="server"></asp:Label>
                            </td>
                            <td class="style1">
                                <asp:Label ID="Label6" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;
                                <asp:Label ID="ReleaseNotes1Lbl17" Text=" 1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl7" Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="Label9" Text=" ] rows in your query, the results will be automatically exported to Excel." Font-Size="15px" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label10" Text=" 2. Only GL Journal records with status 30-Posted will be extracted for reporting." Font-Size="15px" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label11" Text=" 3. {IncludeUnpostedRecords} refers to GL Journal records that are in status 10-Unposted" Font-Size="15px" runat="server"></asp:Label>
                            </td>
                             <td class="style1">
                                 <asp:Label ID="Label7" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;
                                <asp:Label ID="ReleaseNotes1Lbl43" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl43" Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="Label16" Text=" ] rows in your query, the results will be automatically exported to Excel." Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="TemplateRadPageView" Height="600px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

