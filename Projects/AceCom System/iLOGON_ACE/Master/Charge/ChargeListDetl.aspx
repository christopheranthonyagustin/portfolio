<%@ Page Language="c#" CodeBehind="ChargeListDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.Charge.ChargeListDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ChargeCode</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="GLMappingTab" Text="GLMapping" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SKURateTab" Text="SKURate" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr style="height: 3px">
            </tr>
            <tr>
                <td>&nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <br />
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    <asp:CheckBox ID="SaveOnPanChk" ToolTip="SaveOnPan" runat="server" Enabled="true" Visible="False" />
                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <table cellspacing="0" cellpadding="0" width="60%" border="0">
                    <tr>
                        <br />
                        <td align="left">
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" 
                                OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" display="false" />
                            &nbsp;
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
                            &nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" 
                                OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" display="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="EntityRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="SKURadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:ValidationSummary Style="z-index: 0" ID="valSummary" runat="server" CssClass="RedText"
            EnableClientScript="true" DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
    </form>
</body>
</html>
