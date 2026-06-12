<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTransactionStatistics.aspx.cs"
    Inherits="iWMS.Web.Graphlet.General.UserTransactionStatistics" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>UserTransactionStatistics</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <%--<tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
		                <td width="100%">
		                    Account<br />
		                    <asp:DropDownList ID="AccountList" runat="server" BackColor="Yellow" />
		                </td>                                                               
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
		                <td width="100%">
		                    FromAddDate<br />
		                    <asp:TextBox id="FrmDateTxt" runat="server" style="Z-INDEX: 0" BackColor="Yellow" ></asp:TextBox>
							<asp:CalendarExtender ID="FrmDateCal" runat="server" Format="dd/MMM/yyyy" TargetControlID="FrmDateTxt" />
		                </td>                                                           
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
		                <td width="100%">
		                    ToAddDate<br />
		                    <asp:TextBox id="ToDateTxt" runat="server" style="Z-INDEX: 0" BackColor="Yellow" ></asp:TextBox>
							<asp:CalendarExtender ID="ToDateCal" runat="server" Format="dd/MMM/yyyy" TargetControlID="ToDateTxt" />
		                </td>                                                                 
                    </tr>
                </table>
            </td>
        </tr>--%>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="100%" colspan="4">
                            Source
                        </td>
                    </tr>
                    <tr>
                        <td width="15%">
                            <%--  <asp:ListBox ID="AvailSrcList" runat="server" Rows="6" SelectionMode="Multiple"
                                Width="100%" />--%>
                            <telerik:RadListBox runat="server" id="SrcList" height="120px" width="200px"
                                buttonsettings-areawidth="35px" allowtransfer="true" transfertoid="SelectedSrcList"
                                transfermode="Move" allowtransferduplicates="false" selectionmode="Multiple"
                                skin="Sunset" allowreorder="false" allowdelete="false" autopostbackontransfer="true"
                                ontransferred="SrcList_Transferred">                                
                            </telerik:radlistbox>
                        </td>
                        <td width="7%" align="center">
                            <br />
                            <br />
                            <%--<asp:Button ID="SelectBtn" runat="server" CssClass="detailbutton" OnClick="SelectBtn_Click"
                                Text=" >> " />--%>
                            <br />
                            <br />
                            <%--<asp:Button ID="RemoveBtn" runat="server" CssClass="detailbutton" OnClick="RemoveBtn_Click"
                                Text=" << " />--%>
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="15%">
                            <%--<asp:ListBox ID="SelectedSrcList" runat="server" Rows="6" SelectionMode="Multiple"
                                Width="90%" Style="background-color: Yellow;" />--%>
                            <telerik:radlistbox runat="server" id="SelectedSrcList" height="120px" width="200px"
                                skin="Sunset" buttonsettings-areawidth="35px" selectionmode="Multiple" allowreorder="false"
                                allowdelete="false" BackColor="Yellow">
                            </telerik:radlistbox>
                        </td>
                        <td width="73%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="100%">
                            Format<br />
                            <telerik:RadDropDownList ID="FormatList" runat="server" BackColor="Yellow" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5px">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="white"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
       // Instantiate our BusyBox object
       var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
