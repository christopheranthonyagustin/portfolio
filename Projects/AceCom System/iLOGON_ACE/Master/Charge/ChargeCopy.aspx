<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargeCopy.aspx.cs" Inherits="iWMS.Web.Master.Charge.ChargeCopy" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy Charge</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta content="no-cache" http-equiv="Pragma">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self">
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }
        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" class="TABLE" runat="server" width="90%">
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmLbl" runat="server" CssClass="pagetitle">From</asp:Label>
                </td>
                <td style="width: 110px"></td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px" bgcolor="yellow">
                    <asp:Label ID="toLbl" runat="server" CssClass="pagetitle">To</asp:Label>
                </td>
                <td style="width: 200px"></td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmCodeLbl" runat="server">Code</asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="frmCodeTxt" Width="160px" Skin="Office2007" TabIndex="2" AutoPostBack="True" MaxLength="50"
                        Font-Bold="True" OnTextChanged="frmCodeTxt_TextChanged">
                    </telerik:RadTextBox>
                    <asp:Label ID="frmVerifyLbl" runat="server" ForeColor="Red" Visible="False">* Code not Found *</asp:Label>
                </td>
                <td style="width: 140px"></td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toCodeLbl" runat="server">Code</asp:Label><br />
                    <asp:Label ID="toVerifyLbl" runat="server"></asp:Label>
                    <telerik:RadTextBox runat="server" ID="toCodeTxt" Skin="Office2007" TabIndex="6" AutoPostBack="True" MaxLength="50"
                        OnTextChanged="toCodeTxt_TextChanged">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmDescrLbl" runat="server">Description</asp:Label><br />
                    <telerik:RadTextBox ID="frmDescrTxt" TabIndex="3" runat="server" MaxLength="1000" TextMode="MultiLine"
                        Width="160px" ReadOnly="True" Font-Bold="True" Height="100px">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 140px"></td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toDescrLbl" runat="server">Description</asp:Label><br />
                    <telerik:RadTextBox ID="toDescrTxt" TabIndex="8" runat="server" MaxLength="1000" TextMode="MultiLine" Width="160px" Height="100px">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 140px"></td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmGroupLbl" runat="server">Group</asp:Label><br />
                   <telerik:RadDropDownList ID="frmGroupDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                           OnSelectedIndexChanged="frmGroupDDL_SelectedIndexChanged" AutoPostBack="True">
                    </telerik:RadDropDownList>
                </td>
                <td style="width: 140px">
                    <asp:Label ID="frmTypeLbl" runat="server">Type</asp:Label><br />
                   <telerik:RadDropDownList ID="frmTypeDDl" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                        OnSelectedIndexChanged="frmTypeDDL_SelectedIndexChanged" AutoPostBack="True" ReadOnly="True">
                    </telerik:RadDropDownList>
                </td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toGroupLbl" runat="server">Group</asp:Label><br />
                    <telerik:RadDropDownList ID="GroupDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                         AutoPostBack="True">
                    </telerik:RadDropDownList>
                     
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toTypeLbl" runat="server">Type</asp:Label><br />
                    <telerik:RadDropDownList ID="toTypeDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                         AutoPostBack="True">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmTaxTypeLbl" runat="server">TaxType</asp:Label><br />
                   <telerik:RadDropDownList ID="frmTaxTypeDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                        OnSelectedIndexChanged="fromTaxTypeDDL_SelectedIndexChanged" AutoPostBack="True" ReadOnly="True">
                    </telerik:RadDropDownList>
                </td>
                <td style="width: 140px"></td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toTaxTypeLbl" runat="server">TaxType</asp:Label><br />
                    <telerik:RadDropDownList ID="toTaxTypeDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                         AutoPostBack="True">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 140px"></td>
                <td style="width: 140px"></td>
                <td style="width: 140px"></td>
                <td style="width: 140px">
                    <asp:Button ID="CopyBtn" runat="server" Visible="false" CssClass="white" Text="Copy"
                        OnClick="CopyBtn_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>