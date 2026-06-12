<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MassAttcAllByOneUpload.aspx.cs"
    Inherits="iWMS.Web.Master.Container.MassAttcAllByOneUpload" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>SkuImage</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

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
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Mass Attach File</asp:Label>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td>
                <asp:Panel ID="FileUploadPanel" runat="server">
                    <table border="0" cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td colspan="2">  
                                <asp:Button ID="ImageSubmit" CssClass="white" runat="server" OnClick="ImageSubmit_ServerClick" 
                                    Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                 <br />
                                 <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label>
                                    Image Name</label>
                                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
                                    <telerik:RadTextBox ID="ImageName" Skin="WebBlue" runat="server" Width="155px" EmptyMessage="Enter Imagename">
                                    </telerik:RadTextBox>
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </telerik:RadAjaxPanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label>
                                    Type</label>
                                <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server">
                                    <telerik:RadDropDownList ID="Type" Skin="WebBlue" runat="server" Width="155px">
                                    </telerik:RadDropDownList>
                                </telerik:RadAjaxPanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <label>
                                    File</label>
                                <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" Width="400px">
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" Width="155px" MultipleFileSelection="Automatic"
                                        Skin="WebBlue" MaxFileInputsCount="1" />
                                </telerik:RadAjaxPanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
