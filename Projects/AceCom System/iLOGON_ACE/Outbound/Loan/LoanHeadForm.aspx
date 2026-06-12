<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanHeadForm.aspx.cs" Inherits="iWMS.Web.Outbound.Loan.LoanHeadForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>LoanHeadForm</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") 
                    myElement.checked = invoker.checked;
                else 
                    myElement.checked = invoker.UnChecked
            }
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Header" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Detail" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Trans" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <table><tr><td><asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label></td></tr></table>
        
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" 
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderInfoRadPageView">
                <br /><br />
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="True" OnClientClick="disableBtn(this.id,true)" 
                UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click"></asp:Button>
                <br /><br />
                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="DetailRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TransRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
