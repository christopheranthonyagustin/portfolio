<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMAirJobRegisterAdd.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMAirJobRegisterAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMAirJobRegisterAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .align {
            margin-left: 36%;
        }
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel" CausesValidation="false"
                                        OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="9" colspan="9" valign="top">
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                                <td></td>
                                <td colspan="9" rowspan="9" valign="top">
                                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                    <br />
                                    <telerik:RadLabel ID="MarksAndNumberLbl" Text="MarksAndNumber" Font-Size="Small" runat="server"></telerik:RadLabel>
                                    &nbsp;                                 
                                     <telerik:RadLabel ID="DescriptionLbl" Text="Description" Font-Size="Small" runat="server" CssClass="align"></telerik:RadLabel>
                                    <br />
                                    <telerik:RadTextBox ID="MarksAndNumberTxt" TextMode="MultiLine" runat="server" Width="320px" Height="320px" Resize="Both"
                                        Font-Size="Medium" Skin="WebBlue" ToolTip="MarksAndNumber">
                                    </telerik:RadTextBox>&nbsp;
                                    <telerik:RadTextBox ID="DescriptionTxt" TextMode="MultiLine" runat="server" Width="320px" Height="320px" Resize="Both"
                                        Font-Size="Medium" Skin="WebBlue" ToolTip="Description">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="AddBtn" />
                        <asp:PostBackTrigger ControlID="CancelBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
