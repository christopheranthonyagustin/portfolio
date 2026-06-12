<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterChargeDetl.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterChargeDetl" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>

<head id="Head1" runat="server">
    <title>Edit Charge @ Billable</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-top: solid 1px gray !important;
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" method="post" runat="server">
      <%--  <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>--%>
         <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager" runat="server"></telerik:RadWindowManager>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" Visible="true" BackColor="Pink" CausesValidation="false"
                                        OnClick="PrevItemBtn_Click" Text="Prev" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="AddChargeBtn" runat="server" CssClass="white" Enabled="true"
                                        OnClick="AddChargesBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                                &nbsp;&nbsp;
                                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" Visible="true" BackColor="Pink"  CausesValidation="false"
                                        OnClick="NextItemBtn_Click" Text="Next" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;&nbsp;
                                    <asp:Label ID="GridLineLbl" runat="server" Visible="true" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Visible="true" />
                                    <asp:Label ID="chkLbl" runat="server" Visible="true" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black" OnClientClick="disableBtn(this.id,true)"></asp:Label>
                                    <asp:Panel runat="server" ID="CopyPanel" Visible="false">
                                        <asp:Button ID="SaveAndNextBtn" runat="server" CssClass="white" Text="Save & Next" Visible="false"
                                        OnClick="SaveAndNextBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                        <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save" Visible="false"
                                        OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                        <asp:Button ID="HideBtn" runat="server" CssClass="white" Text="Cancel" Visible="false" CausesValidation="false"
                                        OnClick="HideBtn_Click" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,false)" />
                                    </asp:Panel>
                                    <br />
                                    <br />
                                    <iWMS:iForm ID="formCtl3" runat="server" />
                                    <br />
                                    <br />
                                    <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="true" Width="30%" BorderWidth="2px" Name
                                        EnableLinqExpressions="False" AllowPaging="True" Skin="Metro" OnNeedDataSource="ResultDG1_NeedDataSource">
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="PrevItemBtn"/> 
                        <asp:PostBackTrigger ControlID="AddChargeBtn"/>
                        <asp:PostBackTrigger ControlID="NextItemBtn"/> 
                        <asp:PostBackTrigger ControlID="SaveAndNextBtn"/>
                        <asp:PostBackTrigger ControlID="SaveBtn"/>
                        <asp:PostBackTrigger ControlID="HideBtn"/>                     
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>