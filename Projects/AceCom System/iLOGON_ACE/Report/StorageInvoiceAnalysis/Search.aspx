<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.StorageInvoiceAnalysis.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <title>StorageInvoiceAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            width: 30%;
        }
        .style3
        {
            width: 6%;
        }
        .style5
        {
            width: 68px;
        }
        .style11
        {
            width: 360px;
        }
        .style12
        {
            width: 332px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
    <%--<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />--%>
     <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
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
    </telerik:RadAjaxLoadingPanel>
    <asp:Panel ID="Panel1" runat="server">
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td width="6%">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td width="94%">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="6%">
                &nbsp;
            </td>
            <td width="94%">
               <telerik:RadButton ID="compile_Click" runat="server" OnClick="CompileBtn_Click" Skin="WebBlue"
        Text="Compile" Style="top: 19px; left: -1px">
    </telerik:RadButton>
            &nbsp;<asp:Label ID="MessageLbl" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
  
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>  </form>
</body>
</html>
