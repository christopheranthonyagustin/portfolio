<%@ Page language="c#" Codebehind="HSListDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.HS.HSListDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>HSListDetl</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body topmargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Tariff" Value="100" runat="server">
                </telerik:RadTab>               
            </Tabs>
        </telerik:RadTabStrip>
	    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" DefaultButton="UpdateBtn">
                <table cellSpacing="0" cellPadding="0" width="60%" border="0">
				<tr>
					<td align="left">
                        <br />
						<asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="white" onclick="UpdateBtn_Click" UseSubmitBehavior="false" ToolTip="Update" />
					</td>
				</tr>
				<tr>
					<td>
                        <br />
                        <iwms:iForm id="formCtl" runat="server"></iwms:iForm></td>
				</tr>
			</table>
			<asp:ValidationSummary style="Z-INDEX: 0" id="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
				DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TariffPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>			
	</form>
	</body>
</html>
