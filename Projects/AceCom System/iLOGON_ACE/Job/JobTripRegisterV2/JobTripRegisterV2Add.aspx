<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterV2Add.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegisterV2.JobTripRegisterV2Add" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title id="JTListTitle" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
       <%-- <table border="0" id="table2" runat="server">
            <tr id="TR1" runat="server" class="tab">
                <td>  <asp:LinkButton runat="server" id="resultlnk" Text ="Result" Font-Underline="false"
                     CausesValidation="false" OnClick="ResultLnk_Click"></asp:LinkButton></td>
              
                </tr>
          </table>--%>
   <br />
    <table id="JobTrip" runat="server">
        <tr>
            <td >
                <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" 
                        Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" /> 
                    &nbsp;
                <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" 
                        Text="Cancel" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />     
                           
            </td>            
        </tr>
    </table>
    <br />
    <br />
        
        <asp:UpdatePanel ID="SCPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>    
            </ContentTemplate>
        </asp:UpdatePanel>  
    </form>
</body>
</html>