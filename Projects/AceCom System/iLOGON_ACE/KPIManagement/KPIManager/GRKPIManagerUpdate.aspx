<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRKPIManagerUpdate.aspx.cs" Inherits="iWMS.Web.KPIManagement.KPIManager.GRKPIManagerUpdate" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView ID="formCtlSize" runat="server" Height="200px">
               <iWMS:iForm ID="formCtl" runat="server" />                        
                <table>
                    <tr>
                        <td>
                             <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" OnClick="ConfirmBtn_Click"
                               OnClientClick="disableBtn(this.id,false)" ToolTip="Confirm" CssClass="white" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>                
            </telerik:RadPageView>
        </telerik:RadMultiPage>         
    </form>    
</body>
</html>
