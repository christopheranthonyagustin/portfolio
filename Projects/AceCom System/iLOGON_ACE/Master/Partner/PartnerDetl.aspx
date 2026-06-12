<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PartnerDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Partner.PartnerDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head runat="server">
    <title>PartnerDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Partner" Value="0" readonly="readonly" runat="server" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab Text="AR-Customer" Value="100" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="AP-Supplier" Value="200" readonly="readonly" runat="server">
            </telerik:RadTab>
             <telerik:RadTab Text="Account" Value="700" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Contact" Value="250" readonly="readonly"  runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Site" Value="300" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Control" Value="400" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Grade" Value="500" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="SKURate" Value="600" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Id="AttcTab" Text="Attc" Value="650" runat="server">
                </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <br />
                <asp:Label ID="PartnerLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" ID="PartnerRadPageView" Height="700px">
            <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                <tr>
                    <td>
                        &nbsp; 
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" 
                                    CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Visible="False" />
                                <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next"
                                     CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                                <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Enabled="false" />
                                <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                                <br /> <br />
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="UpdateBtn" />
                                 <asp:PostBackTrigger ControlID="PrevItemBtn" />
                                 <asp:PostBackTrigger ControlID="NextItemBtn" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="70%" ID="ARCustomerRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="APSupplierRadPageView" />
         <telerik:RadPageView runat="server" Height="90%" ID="AccountRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="ContactRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="SiteRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="ControlRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="GradeRadPageView" />
        <telerik:RadPageView runat="server" Height="110%" ID="SKURateRadPageView" />
        <telerik:RadPageView runat="server" Height="70%" ID="AttcRadPageView" />
    </telerik:RadMultiPage>
    </form>
</body>
</html>
