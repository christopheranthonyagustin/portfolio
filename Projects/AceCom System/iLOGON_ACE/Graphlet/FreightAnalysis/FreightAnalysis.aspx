<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightAnalysis.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.FreightAnalysis" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Freight Analysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="1" Skin="Windows7">
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
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="1" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="FormatRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="CriteriaRadPageView">
                <asp:Panel ID="Panel1" runat="server" Width="500px">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <br />
                                        <asp:Button ID="CompileBtn" runat="server" Text="Run" CausesValidation="false" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id, true)"
                                            UseSubmitBehavior="true" class="white" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl19" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl31" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl37" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl41" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel29" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtlEnt29" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl29" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td class="style1">&nbsp;<asp:Label ID="Label16" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                                        <br />
                                                        &nbsp;<asp:Label ID="Label19" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                                        <asp:Label ID="MaxRecordLbl1" Font-Size="15px" runat="server"></asp:Label>
                                                        &nbsp;<asp:Label ID="Label21" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <asp:Panel ID="Panel83" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl83" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td class="style1">&nbsp;<asp:Label ID="Label3" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                                        <br />
                                                        &nbsp;<asp:Label ID="Label5" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                                        <asp:Label ID="Label6" Font-Size="15px" runat="server"></asp:Label>
                                                        &nbsp;<asp:Label ID="Label7" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <%--43--%>
                                <asp:Panel ID="Panel43" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel43" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl43" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <%--43--%>
                                <%--47--%>
                                <asp:Panel ID="Panel47" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel47" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl47" runat="server" />
                                                        &nbsp;
                                                        <asp:Label ID="Label14" Text="*Notes:Please choose only one set of Date" Font-Size="15px" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <%--47--%>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel53" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel53" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl53_Ent" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl53" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel59" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel59" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl59_Ent" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl59" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel61" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel61" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl61_Ent" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl61" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel67" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel67" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl67" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                        <%-- <tr>
                            <td align="left">&nbsp;
                            <asp:Label ID="UserTypelbl" runat="server"></asp:Label>
                                <br />
                                <telerik:RadListBox ID="SelectedList" runat="server"
                                    AllowDelete="false" AllowReorder="false" ButtonSettings-AreaWidth="35px"
                                    Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px" Visible="false">
                                </telerik:RadListBox>
                                <br />
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel71" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel71" runat="server">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <iWMS:iForm ID="formCtl71" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td class="style1">&nbsp;<asp:Label ID="Label1" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                                        <br />
                                                        &nbsp;<asp:Label ID="Label2" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                                        <asp:Label ID="MaxRecordLbl71" Font-Size="15px" runat="server"></asp:Label>
                                                        &nbsp;<asp:Label ID="Label4" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel73" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl73_Ent" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl73" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel79" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel79" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl79_Ent" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl79" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <asp:Panel ID="Panel89" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtlEnt89" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <iWMS:iForm ID="formCtl89" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td class="style1">&nbsp;<asp:Label ID="Label8" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                                        <br />
                                                        &nbsp;<asp:Label ID="Label9" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                                        <asp:Label ID="Label10" Font-Size="15px" runat="server"></asp:Label>
                                                        &nbsp;<asp:Label ID="Label11" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdErrLbl" runat="server">
                                    <ContentTemplate>
                                        &nbsp;
                                        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                            Visible="False"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>

                    </table>
                </asp:Panel>
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                        </div>
                        <div id="LoaderPopup">
                            <a id="loader"></a>
                            <a id="text">We are processing your request ...</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="TemplateRadPageView" Height="600px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
