<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.KPIAnalysis.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KPI Analysis</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:radtabstrip runat="server" id="RadTabStrip1" multipageid="RadMultiPage1" ontabclick="RadTabClick"
            causesvalidation="false" autopostback="true" selectedindex="50" skin="Windows7">
            <tabs>
                <telerik:radtab text="Format" value="0" runat="server">
                </telerik:radtab>
                <telerik:radtab text="Criteria" value="50" runat="server">
                </telerik:radtab>
            </tabs>
        </telerik:radtabstrip>
        <telerik:radmultipage runat="server" id="RadMultiPage1" selectedindex="1" cssclass="outerMultiPage">
            <telerik:radpageview runat="server" id="FormatRadPageView">
            </telerik:radpageview>
            <telerik:radpageview runat="server" id="CriteriaRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                </table>

                <asp:Panel ID="Panel13" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <tr>
                                <td>
                                    <iwms:iform id="formCtl13" runat="server"></iwms:iform>
                                </td>
                            </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="Panel17" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iwms:iform id="formCtl17" runat="server"></iwms:iform>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="Panel19" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iwms:iform id="formCtl19" runat="server"></iwms:iform>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="Panel23" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <tr>
                                <td>
                                    <iwms:iform id="formCtl23" runat="server"></iwms:iform>
                                </td>
                            </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="Panel29" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iwms:iform id="formCtl29" runat="server"></iwms:iform>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="Panel31" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <tr>
                                <td>
                                    <iwms:iform id="formCtl31" runat="server"></iwms:iform>
                                </td>
                            </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="Panel37" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iwms:iform id="formCtl37" runat="server"></iwms:iform>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RunBtn" runat="server" Text="Run" OnClick="RunBtn_Click" CausesValidation="false"
                                CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </telerik:radpageview>
        </telerik:radmultipage>
    </form>
</body>
</html>
