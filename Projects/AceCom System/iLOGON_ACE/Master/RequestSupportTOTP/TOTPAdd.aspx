<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TOTPAdd.aspx.cs" Inherits="iWMS.Web.Master.RequestSupportTOTP.TOTPAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New @ Request Support TOTP</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function copyToClipboard(element) {
                /* Get the text content of the link */
                var textToCopy = document.getElementById('<%= TOTPKeyHiddenField.ClientID %>').value;
                /* Create a temporary input element */
                var tempInput = document.createElement('input');
                tempInput.value = textToCopy;

                /* Append the input element to the DOM */
                document.body.appendChild(tempInput);

                /* Select the input content */
                tempInput.select();
                tempInput.setSelectionRange(0, 99999); /* For mobile devices */

                /* Copy the selected text to the clipboard */
                document.execCommand('copy');

                /* Remove the temporary input element from the DOM */
                document.body.removeChild(tempInput);
            }
        </script>

    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip" MultiPageID="RadMultiPage" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <a id="TOTPLink" runat="server" style="font-weight: bold; font-size: larger;" visible="false"></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:HiddenField ID="TOTPKeyHiddenField" runat="server" />

                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="GeneratedTOTPLbl" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Red">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <br />
                                        <a id="GeneratedTOTPLink" runat="server" style="font-weight: bold; font-size: 24px; color: red; text-decoration: none" onclick="copyToClipboard(this)"></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="GenerateBtn" class="white" runat="server" OnClick="GenerateBtn_Click"
                                Text="Generate" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
            </telerik:RadPageView>
            <telerik:RadPageView ID="LogRadPageView" runat="server"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TOTPDashboardRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
