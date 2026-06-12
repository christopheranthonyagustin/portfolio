<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="iTabCtl.ascx.cs" Inherits="iWMS.Web.Control.iTabCtl" %>
<script type="text/javascript">
    function ActiveTabChanged(sender, e) {
        var activeTab = $get('<%= activeTab.ClientID %>');
        activeTab.value = sender.get_activeTabIndex();
    }
</script>
<asp:TabContainer ID="tabContainer" runat="server" CssClass="ajax__tab_jquery-theme" OnClientActiveTabChanged="ActiveTabChanged">
</asp:TabContainer>
<asp:HiddenField ID="activeTab" runat="server" />