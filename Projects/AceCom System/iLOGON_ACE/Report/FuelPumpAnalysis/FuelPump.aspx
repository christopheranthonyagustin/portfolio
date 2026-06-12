<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FuelPump.aspx.cs" Inherits="iWMS.Web.Report.FuelPumpAnalysis.FuelPump" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>FuelPumpAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
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
                <iWMS:iForm ID="formCtl2" runat="server" ></iWMS:iForm>
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
                <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="Conditional">
                   <ContentTemplate>
                       &nbsp;&nbsp;
                        <asp:Button ID="Compilebtn" class="white" runat="server" OnClick="Compilebtn_Click" Visible="true"
                            Text="Run" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                   </ContentTemplate>
               </asp:UpdatePanel> 
            </td>
        </tr>       
    </table>  
   <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div class="busybiz">
                </div>
                <div>
                    <a class="loader"></a>
                    <a id="text">Processing</a>
                </div>
            </ProgressTemplate>
     </asp:UpdateProgress>   
    </form>    
</body>
</html>
