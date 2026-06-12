<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MassAttcUpload.aspx.cs" Inherits="iWMS.Web.Master.Container.MassAttcUpload" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>SkuImageUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        
    <telerik:RadButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" Text="Upload" Skin="WebBlue">
    </telerik:RadButton>
         
    </div>  
    </form>
</body>
</html>
