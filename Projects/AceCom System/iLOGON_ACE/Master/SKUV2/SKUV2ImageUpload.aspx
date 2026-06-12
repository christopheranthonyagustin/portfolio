<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2ImageUpload.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2ImageUpload" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SKUV2ImageUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
  <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="MassAttcUpload" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <div>
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm><br />
            <asp:Button ID="uploadBtn" runat="server" Text="Upload" OnClick="uploadBtn_Click"
                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
        </div>
    </form>
</body>
</html>

