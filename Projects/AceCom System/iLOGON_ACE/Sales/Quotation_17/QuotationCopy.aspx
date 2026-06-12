<%@ Page Language="c#" CodeBehind="QuotationCopy.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Sales.Quotation_17.QuotationCopy" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head runat="server">
    <title>QuotationCopy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
    <meta content="no-cache" http-equiv="Pragma">


    <style type="text/css">
        .style1 {
            width: 36px;
        }

        .style4 {
            width: 6.15%;
        }

        .style5 {
            width: 5.25%;
        }
    </style>
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

        <%--<span class="pagetitle">&nbsp;Copy Quotation<br />
			</span>--%>
        <br />
        <table cellspacing="2" cellpadding="2">
            <tr>
                <%--<td noWrap><%--<asp:label id="QuCopyLbl" Runat="server">Copy from Quotation#</asp:label>--%>
                <td colspan="2" class="style1">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td class="style5">&nbsp;CopyFromQuotationNo
                    </td>
                <tr>
                    <td valign="top">
                        <telerik:RadTextBox ID="QuCodeTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="QuCodeTxt_TextChanged"></telerik:RadTextBox>&nbsp;</td>
                </tr>
        </table>
        </td>	
				</tr>
				<tr>
                    <td colspan="2" class="style1">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <td class="style5">&nbsp;CopyToAccount
                            </td>
                            <tr>
                                <td valign="top">
                                    <telerik:RadDropDownList ID="toAccountDDL" TabIndex="5" runat="server"></telerik:RadDropDownList>
                                </td>
                            </tr>
                        </table>	
                    </td>
                </tr>
        <%--<td><asp:label id="toAccLbl" Runat="server" >Copy to Account</asp:label></td>
				    <td>: <asp:dropdownlist id="toAccountDDL" tabIndex="5" Runat="server"></asp:dropdownlist></td>--%>

        <tr>
            <td>
                <br>
                <br />
                <asp:CheckBox ID="detailChkBox" runat="server" Text="IncludeQuotationLines" Checked="true"></asp:CheckBox>
                <br />
            </td>

        </tr>
        <tr>
            <td>
                <br>
                <br />
                <asp:CheckBox ID="NoOfRevChkBox" runat="server" Text="NewRevision" OnCheckedChanged="NoOfRevChkBox_CheckChanged" AutoPostBack="true"></asp:CheckBox>
                <br />
                <br />
                <br />
            </td>
            <td valign="top"></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
            <%--    <telerik:RadButton ID="CopyBtn" RenderMode="Lightweight" runat="server" Text=" Copy " Enabled="False" CssClass="detailbutton" Skin="WebBlue" OnClick="CopyBtn_Click"></telerik:RadButton>--%>
                             <asp:Button ID="CopyBtn" runat="server" Text="Copy" OnClick="CopyBtn_Click" Enabled="False"
                                         CssClass="white" ToolTip="Copy"  />
            </td>
        </tr>
        </table>
			&nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
