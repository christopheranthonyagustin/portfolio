<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionOutboundAnalysis.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionOutboundAnalysis.DistributionOutboundAnalysis" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OpenCloseBalanceV2</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function disableRunBtn(id, check) {
            if (check) {
                if (Page_ClientValidate('')) {
                    var btn = document.getElementById(id);
                    btn.disabled = true;
                    btn.value = "Processing...";
                }
                else {
                    return false;
                }
            }
            else {
                var btn = document.getElementById(id);
                btn.disabled = true;
                btn.value = "Processing...";
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form2" method="post" runat="server">
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
                <br /><br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="CompileBtn" runat="server" Text="Run" CausesValidation="false" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" class="white" />
                        </td>
                        <td>
                            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
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
                        <asp:Panel ID="Panel_19" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl19" runat="server" />
                                      </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel_23" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl23" runat="server" />
                                      </td>
                                </tr>
                            </table>
                        </asp:Panel>
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
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

