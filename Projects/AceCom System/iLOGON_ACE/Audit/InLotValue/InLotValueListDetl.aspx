<%@ Page Language="c#" CodeBehind="InLotValueListDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Audit.InLotValue.InLotValueListDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InLotValueListDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" CausesValidation="false" AutoPostBack="true" SelectedIndex="0"
            Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="320px" ID="MainPageView">
                <table cellspacing="0" cellpadding="0" width="60%" border="0">
                    <tr>
                        <td>
                            <br />
                            &nbsp;<asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="white"
                                OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
                        </td>                      
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;<asp:Label ID="Label2" Text="Notes" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label3" Text="On Click of Update, these new values will be propagated to the following modules" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label4" Text="Declaration Register - Items module" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label5" Text="In Lot Value (this module)" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label6" Text="GR SKU Line module" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label7" Text="SKU Lot module" Font-Size="15px" runat="server"></asp:Label>                           
                            <br />
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
