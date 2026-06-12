<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoringOrderList.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.StoringOrderList" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>Storing Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self">
        <meta http-equiv="Pragma" content="no-cache">
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
</head>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="form1" runat="server" method="post">
     <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td width="40%">
           
                <telerik:RadButton ID="PrintBtn" runat="server" OnClick="PrintBtn_OnClick" Text="Print" Skin="WebBlue"
                    SingleClick="true" SingleClickText="Processing...">
                </telerik:RadButton>
                
            </td>
        </tr>
    </table>   
    
    </form>
</body>
</html>
