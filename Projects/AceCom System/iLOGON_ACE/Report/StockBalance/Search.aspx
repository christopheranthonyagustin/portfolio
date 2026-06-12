<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.StockBalance.Search" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>StockBalanceAsAt</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .MyLoadingImage
        {
            position: absolute;
            top: 50%;
            margin-top: -30px;
            left: 50%;
            margin-left: -65px;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
      <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
<%--    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="compile_Click">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="1"
        MinDisplayTime="500" Transparency="40" BackColor="#f5f5f0">
        <div style="vertical-align: middle;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../../Image/loading-image.gif" Width="50"
                Height="50" AlternateText="loading" CssClass="MyLoadingImage"></asp:Image>
        </div>
    </telerik:RadAjaxLoadingPanel>--%>
    <asp:Panel ID="Panel1" runat="server" Width="500px">
    
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td valign="top" width="30%">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width: 20%">
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        </td>
         <td valign="top" width="70%">
                <table id="Table3" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" type="checkbox"
                                name="checkall">&nbsp;ALL
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                            <br>
                            <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" Width="511px" CellSpacing="4"
                                CellPadding="5">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
                  </td>
        </tr>
        </table>
    </asp:Panel>
    &nbsp;
    <telerik:RadButton ID="compile_Click" runat="server" OnClick="CompileBtn_Click" CssClass="detailbutton" Skin ="WebBlue" Text="Run">
    </telerik:RadButton>
  
    </form>
</body>
</html>
