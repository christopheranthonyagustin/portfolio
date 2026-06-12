<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="CloneAccountCharacteristics.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.Account.CloneAccountCharacteristics" %>

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
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <base target="_self">
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            sender.setUrl("about:blank");
        }
    </script>
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
        <telerik:RadWindow runat="server" ID="CloneAccountRadWindow" VisibleOnPageLoad="true" Title="Clone Account"
            Width="400" Height="350" VisibleStatusbar="false" OnClientClose="OnClientClose">
            <ContentTemplate>
                <%--<table id="FormTable" class="TABLE" width="100%" runat="server">--%>
                <%--<tr>
            <td colspan="2">
                <asp:Label ID="frmLbl" CssClass="pagetitle" runat="server">From</asp:Label>
                <br />
            </td>
            <td style="width: 134px" width="134" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="toLbl" CssClass="pagetitle" runat="server">To</asp:Label>
                <br />
            </td>
        </tr>--%>
                <%--<tr>
            <td class="style1">
                <asp:Label ID="frmAccountLbl" runat="server">Account :</asp:Label>
            </td>
            <td class="style3">
                <telerik:RadDropDownList ID="frmAccountDDL" DropDownHeight="180px" TabIndex="1" Skin="WebBlue"
                    runat="server" Style="margin-left: 9px">
                </telerik:RadDropDownList>
            </td>
            <td class="style2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="toAccountLbl" runat="server">Account :</asp:Label>
            </td>
            <td width="40%">
                <telerik:RadDropDownList ID="toAccountDDL" DropDownHeight="180px" TabIndex="5" Skin="WebBlue"
                    runat="server">
                </telerik:RadDropDownList>
            </td>
        </tr>--%>




                <%--<tr>
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
                &nbsp;&nbsp;&nbsp; --%>


                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <br />
                <asp:Button ID="CopyBtn" class="white" runat="server" OnClick="CopyBtn_Click" Text=" Clone " OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /><br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" CssClass="errorLabel" runat="server"
                    Visible="False"></asp:Label>
                <br>
            </ContentTemplate>
        </telerik:RadWindow>
    </form>
</body>
</html>
