<%@ Page Language="c#" CodeBehind="SkuLotListDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Audit.SkuLot.SkuLotListDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuLotListDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        RenderMode="Lightweight" CausesValidation="false" AutoPostBack="true" SelectedIndex="0"
        Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Log" Value="100" runat="server">
            </telerik:RadTab>      
        </Tabs>
    </telerik:RadTabStrip>
     <table>
        <tr>
            <td>
                &nbsp;<asp:Label ID="LotLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="logFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>
     <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="320px" ID="MainPageView">            
                <br>
                &nbsp;&nbsp;                
              <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" Visible="false" />
            <br />
            <br />
            <table>
                <tr>
                    <td valign="top">
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>           
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="320px" ID="LogRadPageView">
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </form>
</body>
</html>
