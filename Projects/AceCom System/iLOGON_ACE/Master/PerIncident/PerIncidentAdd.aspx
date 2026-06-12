<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Page Language="c#" CodeBehind="PerIncidentAdd.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.PerIncident.PerIncidentAdd" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>PerIncident</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Attc" Value="100" runat="server">
            </telerik:RadTab> 
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" >
            <br />&nbsp;            
            <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="   Add   " OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
            <br>
            <br>
            <table>
            <tr>
                <td valign="top">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            </table>
            <table>       
            <tr>
            <td colspan="2">
                <asp:Label ID="ImageLbl" runat="server"></asp:Label>
            </td>
            </tr>
            <tr>
            <td>
                <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
            </td>
            </tr>
            </table> 
    
            </ItemTemplate>
            <footerstyle forecolor="Black" backcolor="#CCCCCC"></footerstyle>
            <headerstyle font-bold="True" forecolor="White" backcolor="#000084"></headerstyle>
            </asp:datalist>
            <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
            </td> </tr>
            
            <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
            <td colspan="2">
            <asp:Panel ID="FileUploadPanel" runat="server">
            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                <tr>
                <td>
                     <input id="ImageFile" type="file" name="ImageFile" runat="server" visible="false">
                </td>
                </tr>
            </table>
            </asp:Panel>
            </td>
            </tr>
            &nbsp;<br>
            <br>
            <iframe id="incidentDetlPackFrame" style="width: 95%; height: 45%" marginheight="0"
            frameborder="no" marginwidth="0" runat="server" visible="false"></iframe>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
        </telerik:RadPageView> 
    </telerik:RadMultiPage> 
    </form>
</body>
</html>
