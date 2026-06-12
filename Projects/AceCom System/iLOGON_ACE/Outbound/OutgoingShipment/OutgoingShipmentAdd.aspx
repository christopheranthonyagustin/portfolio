<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutgoingShipmentAdd.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.OutgoingShipmentAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueAdd</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

    <script language="javascript" type="text/javascript">
        function tab2_onclick() {

        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;<asp:Button Style="z-index: 0" ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" 
        UseSubmitBehavior="false" CssClass="white"></asp:Button><br>
    <br>
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Shipping" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Party" Value="150" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Detail" Value="200" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Copy" Value="250" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <table>
        <tr>
            <td>
                <asp:Button Style="z-index: 0" ID="UpdateBtn" runat="server" OnClientClick="disableBtn(this.id,false)" 
        UseSubmitBehavior="false" CssClass="white" Text="Update" Visible="False" OnClick="UpdateBtn_Click"></asp:Button>&nbsp;&nbsp;<a
                        onclick="parent.frames[0].document.getElementById('tb1').value=1;"><asp:Button ID="AddDetailBtn"
                            runat="server" Text="More >" Visible="False" CssClass="detailButton" OnClick="AddDetailBtn_Click">
                        </asp:Button></a> &nbsp;
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="IssueInfoRadPageView">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl4" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl3" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="DetailRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="CopyRadPageView">
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </form>
</body>
</html>