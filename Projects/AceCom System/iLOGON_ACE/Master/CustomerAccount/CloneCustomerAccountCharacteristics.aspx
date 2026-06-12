<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CloneCustomerAccountCharacteristics.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CloneCustomerAccountCharacteristics" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Clone Account Characteristics</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta content="no-cache" http-equiv="Pragma">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <style type="text/css">
        .style1 {
            width: 133px;
        }

        .style2 {
            width: 163px;
        }

        .style3 {
            width: 516px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <br>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="CloneAccount" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table id="FormTable" class="TABLE" width="100%" runat="server">
            <tr>
                <td class="style1">
                    <asp:Label ID="frmAccountLbl" runat="server">&nbsp;&nbsp;&nbsp;CloneFromAccount</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <telerik:RadDropDownList ID="frmAccountDDL" DropDownHeight="180px" TabIndex="1" Skin="WebBlue"
                        runat="server" Style="margin-left: 9px">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <tr>
                        <td class="style1">
                            <asp:Label ID="toAccountLbl" runat="server">&nbsp;&nbsp;&nbsp;CloneToAccount</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <telerik:RadDropDownList ID="toAccountDDL" DropDownHeight="180px" TabIndex="1" Skin="WebBlue"
                                runat="server" Style="margin-left: 9px">
                            </telerik:RadDropDownList>
                        </td>
                    </tr>
                </td>
            </tr>
        </table>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;    
    <asp:Button ID="CopyBtn" class="white" runat="server" OnClick="CopyBtn_Click" Text=" Copy " OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" CssClass="errorLabel" runat="server"
            Visible="False"></asp:Label>
        <br>
    </form>
</body>
</html>
