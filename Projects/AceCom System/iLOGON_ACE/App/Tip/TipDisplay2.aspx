<%@ Page language="c#" Codebehind="TipDisplay2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.Tip.TipDisplay2" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %> 

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>TipDisplay</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" method="post"  runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Panel ID="pHeader" runat="server" CssClass="cpHeader">
            <asp:Label ID="lblText" runat="server" />
        </asp:Panel>
        <asp:Panel ID="pBody" runat="server" CssClass="cpBody">
       <asp:Label id="tipTypeLbl" Runat="server" CssClass="pageTitle" Font-Bold="true" Font-Size="Large">iWMS</asp:Label>
			<br />
			<asp:TextBox style="FONT-SIZE: 12px; OVERFLOW: auto; align: justify" id="tipTxt" BorderWidth="0"
				BackColor="Transparent" Runat="server" CssClass="pageTitle" ReadOnly="True" Rows="10" Wrap="True"
				TextMode="MultiLine" Columns="40">i-Warehouse Management System - A total warehouse management solution.</asp:TextBox>
		    <br />
		    <asp:LinkButton id="lnkNext" runat="server" Font-Bold="True" ForeColor="Black" onclick="lnkNext_Click">Next Tip</asp:LinkButton>
        </asp:Panel>
        <ajx:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
        CollapseControlID="pHeader"
        ExpandControlID="pHeader"
        TargetControlID="pBody"
        Collapsed="false" 
        TextLabelID="lblText" 
        CollapsedText="Show Tips.." 
        ExpandedText="Hide Tips.." 
        CollapsedSize="0">
    </ajx:CollapsiblePanelExtender>
<br />
</ContentTemplate>
</asp:UpdatePanel>
</div>
   
    </form>
</body>
</html>
