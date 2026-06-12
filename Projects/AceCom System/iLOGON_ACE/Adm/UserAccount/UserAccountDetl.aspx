<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAccountDetl.aspx.cs" Inherits="iWMS.Web.Adm.UserAccount.UserAccountDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UserAccountDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Skin="Windows7" CausesValidation="false">
            <Tabs>
                <telerik:RadTab Text="Main Info" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" DefaultButton="UpdateAccountBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdateAccountBtn" runat="server" Text="Update" OnClick="UpdateAccountBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr>
                        <td class="style2">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            &nbsp;
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailAccList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailAccList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedAccList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
