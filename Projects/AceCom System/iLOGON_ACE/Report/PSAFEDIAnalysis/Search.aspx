<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.PSAFEDIAnalysis.Search" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>PSAFEDIAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Format" Value="0" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <br /><br />
    <asp:Label ID ="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label>
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top">
                <table width="50%" border="0">
                    <tr>
                        <td width="50%">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                             
                    <tr>
                        <td>
                        <br />&nbsp;    
                            <asp:Button ID="CompileBtn" class="white" runat="server" OnClick="CompileBtn_Click"
                                Text="Run" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false"  />
                            &nbsp;
                            
                            <br />
                            &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
