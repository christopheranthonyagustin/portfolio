<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PostDrToArBatch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.PostDrToArBatch.PostDrToArBatch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="HEAD1" runat="server">
    <title>BatchPostingofInvoicetoAR@Rx1A</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
            .style1
            {
                height: 20px;
            }
        </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td valign="top" width="30%">
                    <table id="Table2">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Button ID="CompileBtn" runat="server" Text="Post" OnClick="CompileBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" CssClass="Blue" OnClientClicking="Confirmation" />
                    &nbsp;
                        <asp:Button ID="ResetBtn" runat="server" Text="Reset" OnClick="ResetBtn_Click"
                            OnClientClick="disableBtn(this.id,true)" CssClass="Blue" />
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                    </td>
                <td>  
                    <asp:Button ID="ConfirmPost" Text="" Style="display: none;" OnClick="ConfirmPostBtn_Click" runat="server" />
                </td>
                
            </tr>
        </table>
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
        <script type="text/javascript">
            // Instantiate our BusyBox object
            var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
        </script>
    </form>
</body>
</html>
