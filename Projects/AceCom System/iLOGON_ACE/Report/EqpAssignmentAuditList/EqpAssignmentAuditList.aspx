<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EqpAssignmentAuditList.aspx.cs"
    Inherits="iWMS.Web.Report.EqpAssignmentAuditList.EqpAssignmentAuditList" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <title>EquipmentAssignmentAuditList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            height: 30px;
        }
        </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2" class="style1">
                <table>
                    <tr>
                        <td>
                            &nbsp;EquipmentNo&nbsp;&nbsp;
                            <br />
                            &nbsp;<telerik:RadComboBox ID="eqNoDDL" runat="server" Skin="Sunset" BackColor="#ded7c6" Enabled="True"
                                DataTextField="Descr" DataValueField="item" Width="550px" AutoPostBack="true" RenderMode = "Lightweight" 
                                filter = "Contains" CausesValidation="false" AllowCustomText="false" DropDownWidth="550px" />
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%">
                <p>
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;<telerik:RadButton ID="CompileBtn" runat="server" Skin="WebBlue" Text="Compile" CssClass="detailbutton"
                    OnClick="CompileBtn_Click"></telerik:RadButton><br>
                &nbsp;&nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
