<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="ShipmentInv.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Shipment.ShipmentInv" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DeclarationInv</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td align="left"><br />
                <asp:Button ID="CalculateBtn" CssClass="white" runat="server"  Visible="False"
                     OnClick="CalculateBtn_Click" Text="Calculate"  OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />             
                <asp:Button ID="SaveNextBtn" CssClass="white" runat="server" Visible="False" 
                    OnClick="SaveNextBtn_Click" Text="Save &amp; Next"  
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"  Visible="False"  
                    Text="Save" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Visible="false" Text="Update"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />               
                <asp:Button ID="BackButton" CssClass="white" runat="server" OnClick="BackButton_Click"  
                    Text="Hide" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />               
               
            </td>    
        </tr>
        <tr>
         <td align="center">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2"><br /><br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>       
        </table>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
            DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
    </form>
</body>
</html>
