<%@ Page Language="c#" CodeBehind="PickInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.OrderPlan.PickInput" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PickInput</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">&nbsp;
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>&nbsp;Pick Detail&nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                <asp:Label ID="SkuCodeLbl" runat="server"></asp:Label>&nbsp;: &nbsp;
                <asp:Label ID="DescrLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="2" cellspacing="2" border="0">
                        <tr>
                            <td>
                                <asp:Label ID="IssueLbl" runat="server">Issue</asp:Label>#:<br>
                                <asp:TextBox ID="IsIdTxt" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>Line#:<br>
                                <asp:TextBox ID="LineNoTxt" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LocLbl" runat="server">Location</asp:Label>:
                            <asp:RequiredFieldValidator ID="LocReq" runat="server" ErrorMessage="*" ControlToValidate="LocCodeTxt"></asp:RequiredFieldValidator><br>
                                <asp:TextBox ID="LocCodeTxt" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Tu1Lbl" runat="server">TU#1</asp:Label>
                                :<br>
                                <asp:TextBox ID="Tu1Txt" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Tu2Lbl" runat="server">TU#2</asp:Label>
                                :<br>
                                <asp:TextBox ID="Tu2Txt" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LotLbl" runat="server">Lot</asp:Label>#:
                            <asp:CompareValidator ID="LotVal" runat="server" ErrorMessage="#" ControlToValidate="LotTxt"
                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                                <asp:TextBox ID="LotTxt" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="QtyLbl" runat="server">Qty</asp:Label>:
                            <asp:CompareValidator ID="QtyVal" runat="server" ErrorMessage="#" ControlToValidate="QtyTxt"
                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                                <asp:TextBox ID="QtyTxt" runat="server"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <%--   <asp:Button ID="SaveNextBtn" runat="server" Text="Save &amp; Next" CssClass="formbtn"
                    OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;
                        <asp:Button ID="SaveBtn" runat="server"
                        Text="Save &amp; Close" CssClass="formbtn" OnClick="SaveBtn_Click"></asp:Button>&nbsp;
          --%>
                            <asp:Button ID="SaveNextBtn" runat="server" Text="Save+Next" OnClick="SaveNextBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" 
                                UseSubmitBehavior="false"
                                CssClass="white" />&nbsp;
                            <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" 
                                UseSubmitBehavior="false"
                                CssClass="white" />&nbsp;
                          <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="white"></asp:Button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
