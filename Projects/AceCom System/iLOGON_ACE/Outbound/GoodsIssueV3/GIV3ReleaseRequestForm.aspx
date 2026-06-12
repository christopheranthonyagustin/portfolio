<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3ReleaseRequestForm.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3ReleaseRequestForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GIV3ReleaseRequestForm</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <telerik:RadWindow ID="RadWindow2" runat="server">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main Info" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="OrderLine" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MaininfRadPageView">
                <br />
            <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="white"
                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" OnClick="UpdateBtn_Click" />
                &nbsp;
                  <asp:Button ID="TCbtn" runat="server" Text="T&C" CssClass="white"
                      OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" OnClick="TCBtn_Click" ToolTip="T&C" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="450px" ID="OrderdetlsRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:Label ID="LClabel" runat="server" class="graytitle"></asp:Label>
    </form>
</body>
</html>
