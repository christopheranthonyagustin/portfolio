<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="CashBookForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CashBookRV.CashBookForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CashBookRV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
    function confirmation() {
        var answer = confirm("Existing records will be removed to generate default records. Confirm to proceed?")
        if (answer) {
            busyBox.Show();
            return true;
        } else {
            return false;
        }
    }
    </script>
        <style type="text/css">
            .style1 {
                width: 953px;
            }

            .style2 {
                height: 62px;
            }
        </style>
    </head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Detail" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <br />
                <%--<telerik:RadButton style="Z-INDEX: 0" id="UpdateBtn" runat="server" Text="Update" Visible="False" 
             CssClass="detailButton" onclick="UpdateBtn_Click" Skin="WebBlue"></telerik:RadButton>--%>
                <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                    Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
               <%--<telerik:RadButton style="Z-INDEX: 0" id="RefreshBtn" runat="server" Text="Refresh" 
                   CssClass="detailButton" onclick="RefreshBtn_Click" Skin="WebBlue"></telerik:RadButton>--%>
                <asp:Button ID="RefreshsBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                    Text="Refresh" />
                <br />
                <br>
                <iWMS:iForm id="formCtl" runat="server"></iWMS:iForm>
                <br />
                <br />
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="DetailRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
            EnableClientScript="true" runat="server" ID="valSummary" CssClass="RedText" />
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
			<script "text/javascript"  language="JavaScript1.2">
			    // Instantiate our BusyBox object
			    var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
			</script>
		</form>
	</body>
</html>

	
	