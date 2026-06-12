<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackIntoCageSearch.aspx.cs" Inherits="iWMS.Web.Outbound.PackIntoCage.PackIntoCageSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PackIntoCageSearh</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>   

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Text="Cage ready to ship" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Cage not closed" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Carton ready for Cage" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Carton not closed" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table width="100%" id="report" runat="server">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="Searchbtn_Click"
                                OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>                
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="900px" ID="CageReadyToShipRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="900px" ID="CageNotClosedRadPageView">
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="900px" ID="CartonReadyForCageRadPageView">
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="900px" ID="CartonNotClosedRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
