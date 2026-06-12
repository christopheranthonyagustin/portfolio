<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterMenu.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegister.JobTripRegisterMenu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>JobTrip Register</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"> 
    <style type="text/css">
        .style1
        {
            width: 700px;
        }
    </style>
</head>
<%--<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #d5d5d5 1px solid;">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td >
               <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"> <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs><br />
                <a onclick="document.getElementById('tb1').value=1;">
                    <iWMS:Tabs ID="MenuTabs2" runat="server"></iWMS:Tabs>
                </a>
            </td>
             <td class="NewModuleTitle" align="right" valign="bottom">           
                <asp:Label ID="JobTripLbl" runat="server">JobTrip Register</asp:Label>
            </td>                  
        </tr>     
        <tr >
            
        </tr>         
    </table>  
    </form>
</body>
</html>--%>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr valign="bottom">
            <td class="style1">
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                    ID="MenuTabs" runat="server"></iWMS:Tabs>
                </a>
            </td>
          
            <td class="NewModuleTitle" align="right" valign="bottom">

                  
                        <asp:Label ID="MenuLbl" runat="server">Job Trip Register V1</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <a onclick="document.getElementById('tb1').value=1;">
                    <iWMS:Tabs ID="MenuTabs2" runat="server"></iWMS:Tabs>
                </a>
            </td>            
        </tr>
    </table>
    </form>
</body>
</html>