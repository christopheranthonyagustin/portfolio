<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterForm.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterForm" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>

    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
        CausesValidation="false" AutoPostBack="True" SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Book-a-Date" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Activity" Value="300" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Manpower" Value="350" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Personnel" Value="400" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Charge" Value="450" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Payable" Value="500" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="P&L" Value="550" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Task" Value="600" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Attc" Value="650" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Log" Value="700" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <table>
        <tr>
            <td>
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
            <td>
                <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None">
                    <Items>
                        <telerik:RadMenuItem Text="Print">
                        </telerik:RadMenuItem>
                    </Items>
                </telerik:RadMenu>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true" >
        <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
            &nbsp;
            <asp:Button ID="UpdateFormBtn" runat="server" CssClass="white" Visible="false" Text="Update" 
                OnClick="UpdateBtn_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="InputPopup" class="white" runat="server" Text="Instruction" 
                OnClientClick="window.open('TransportStandingOrder.aspx','popUpWindow', 'height=341,width=542,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');" Visible="false" /><asp:Button ID="InputPopupNo" class="white" runat="server" Text="Instruction" disabled="true" OnClientClick="window.open('TransportStandingOrder.aspx','popUpWindow', 'height=341,width=542,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');" Visible="false" />
            <br>
            <br>
            <asp:UpdatePanel ID="SCPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server" ></iWMS:iForm>
                <iWMS:iForm ID="formCtl4" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="90%" ID="BookADateRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="ActivityRadPageView" />
        <telerik:RadPageView runat="server" Height="90%" ID="ManpowerRadPageView" />
        <telerik:RadPageView runat="server" Height="90%" ID="PersonnelRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="ChargeRadPageView" />
        <telerik:RadPageView runat="server" Height="71%" ID="PayableRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="PnLRadPageView" />
        <telerik:RadPageView runat="server" Height="90%" ID="TaskRadPageView" />
        <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="LogRadPageView" />        
    </telerik:RadMultiPage>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
        DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:">
    </asp:ValidationSummary>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">                                
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>