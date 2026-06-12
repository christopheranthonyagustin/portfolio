<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page language="c#" Codebehind="CashCardDetlForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CashCardDetl.CashCardDetlForm" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>CashCardDetl</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<SCRIPT src="../../js/row.js" type="text/javascript"></SCRIPT>
		<script src="../../js/CastleBusyBox.js" language="javascript"></script>	
		<script type="text/javascript">
        <!--
            function confirmation() {
                var answer = confirm("Existing records will be removed to generate default records. Confirm to proceed?")
                if (answer) {
                    busyBox.Show();
                    return true;
                } else {
                return false;
                }
            }
        //-->
        </script>
	    <style type="text/css">
            .style1
            {
                width: 953px;
            }
            .style2
            {
                height: 112px;
            }
        </style>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" onload='displayRow("table1");'>
		<form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table id="table1" width="100%" border="0" runat="server" cellSpacing="3" cellPadding="3">
				<tr>
					<td class="style1"> 
					    <input id="tab1" class="TabTitle" value="Main" 
					        style="WIDTH:100px; CURSOR:pointer; height: 25px;"
					        onclick='clickRow(1, "table1");' runat="server" /></td>
					<td align="right">
						                        &nbsp;
                        <asp:Button id="BackButton" CausesValidation="False" runat="server" CssClass="detailButton"
							Visible="True" Text="< Search Results" Width="113px" onclick="BackButton_Click"></asp:Button>&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2" style="BORDER-TOP: #c0c0c0 1px solid" class="style2">
												<br />&nbsp;<asp:Button style="Z-INDEX: 0" id="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton" onclick="UpdateBtn_Click"></asp:Button>
					<br /><BR>
						<iwms:iForm id="formCtl" runat="server"></iwms:iForm>
					    <br />
                        <br />
					</td>
				</tr>
			</table>
			<asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
				EnableClientScript="true" runat="server" ID="valSummary" CssClass="RedText" />
			<iframe id="BusyBoxIFrame" ondrop="return false;" frameBorder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
			<script "text/javascript"  language="JavaScript1.2">
			    // Instantiate our BusyBox object
			    var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
			</script>
		</form>
	</body>
</html>
