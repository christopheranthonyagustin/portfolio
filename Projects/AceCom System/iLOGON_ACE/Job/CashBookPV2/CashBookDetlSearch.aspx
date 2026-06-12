<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookDetlSearch.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV2.CashBookDetlSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Detail Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">

    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="PVLineSearch" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                    <br />
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False" />
                </td>

                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="50%">
                        <tr>
                            <label>Status</label>
                            <td width="25%">
                                <telerik:RadListBox runat="server" ID="CBList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                                    AllowTransfer="true" TransferToID="SelectedCBList" TransferMode="Move" AllowTransferDuplicates="false"
                                    SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                    AutoPostBackOnTransfer="true" OnTransferred="CBList_Transferred">
                                </telerik:RadListBox>
                            </td>
                            <td width="13%" align="center">
                                <br />
                                <br />
                            </td>
                            <td width="25%">
                                <telerik:RadListBox runat="server" ID="SelectedCBList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false" BackColor="Yellow">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
