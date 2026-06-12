<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkuImageUpload.aspx.cs" Inherits="iWMS.Web.Master.Sku.SkuImageUpload" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SkuImageUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
                AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
                <Tabs>
                    <telerik:RadTab Text="MassAttcUpload" Value="0" readonly="readonly" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm><br />
                    <asp:Button ID="uploadBtn" runat="server" Text="Upload" OnClick="uploadBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                    <%--<telerik:RadButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" Text="Upload" Skin="WebBlue">
    </telerik:RadButton>--%>
        </div>
        </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
