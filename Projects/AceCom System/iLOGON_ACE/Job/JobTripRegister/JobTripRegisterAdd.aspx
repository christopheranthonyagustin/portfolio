<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterAdd.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegister.JobTripRegisterAdd" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>JobTripRegisterHeadDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
   <br />
    <table id="JobTrip" runat="server">
        <tr>
            <td >
                <telerik:RadButton Skin="WebBlue" ID="AddBtn" runat="server" Text="Add" CssClass="detailbutton"
                    OnClick="AddBtn_Click">
                </telerik:RadButton>
            </td>            
        </tr>
    </table>
    <br />
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>    
    </form>
</body>
</html>