<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerAnalysisV2.aspx.cs" Inherits="iWMS.Web.Graphlet.ContainerAnalysisV2.ContainerAnalysisV2" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TimesheetAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script> 
</head>
<body>
    <form id="form1" method="post" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>   
    <table>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>           
        <tr>
            <td> 
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>      
        <tr>
            <td><br />               
                    &nbsp;&nbsp;
                    <asp:Button ID="Compilebtn" class="white" runat="server" OnClick="Compilebtn_Click" Visible="true"
                        Text="Run" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                  
            </td>
        </tr>       
    </table>  
  
    </form>    
</body>
</html>
