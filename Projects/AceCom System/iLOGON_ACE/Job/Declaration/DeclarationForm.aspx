<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeclarationForm.aspx.cs" Inherits="iWMS.Web.Job.Declaration.DeclarationForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Declaration Form</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Items" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label> &nbsp;
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;&nbsp;
                    <telerik:RadButton ID="PopulateReceiptBtn" runat="server" Skin="WebBlue" Text="PopToReceipt" Visible="false" CssClass="detailButton"
                        OnClick="PopulateReceiptBtn_Click" Style="z-index: 0"></telerik:RadButton>
                &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="GeneralRadPageView">
                <table width="20%" id="Table1" runat="server">
                    <tr>
                        <td class="style1">
                            <asp:Button ID="Button1" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="true" ToolTip="Search" />
                        </td>
                    </tr>
                </table>
                <br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                &nbsp; &nbsp;       
    <asp:Label Style="z-index: 0" ID="Label1" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ContainerRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="ItemsRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="LogRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
