<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="LocAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Loc.LocAdd" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>LocAdd</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">    
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Count" Value="100" runat="server">
            </telerik:RadTab>          
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0"  CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadMultiPage" DefaultButton="AddBtn">
            <br>
            <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />  
                <br>
                    <br>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm> 
                </ContentTemplate>
            </asp:UpdatePanel>     
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="CountRadPageView">
            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
        </telerik:RadPageView>        
    </telerik:RadMultiPage>
   
    &nbsp;    
   <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />  
    </form>
</body>
</html>
