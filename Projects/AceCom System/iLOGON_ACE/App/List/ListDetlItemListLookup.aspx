<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListDetlItemListLookup.aspx.cs" Inherits="iWMS.Web.App.List.ItemListLookup" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Item @ List Lookup</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Panel ID="AddPanel" runat="server" Visible="false">
                        &nbsp;
                        <asp:Button ID="SaveNextBtn" CssClass="white" runat="server" OnClick="SaveNextBtn_Click"
                            Text="Save &amp; Next" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        &nbsp;                               
                        <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"
                            Text="Save" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        &nbsp;                                
                        <asp:Button ID="ClosePanelBtn" CssClass="white" runat="server" OnClick="ClosePanelBtn_Click" CausesValidation="false"
                            Text="Hide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </asp:Panel>
                    <asp:Panel ID="UpdatePanel" runat="server" Visible="false">
                        &nbsp;&nbsp;<asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click"
                            OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Text="Update" />
                        <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                        <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                       <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    </asp:Panel>
                    <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td colspan="2" align="left">
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
