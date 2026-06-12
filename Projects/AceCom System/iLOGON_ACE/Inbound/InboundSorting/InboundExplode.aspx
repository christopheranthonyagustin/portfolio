<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundExplode.aspx.cs" Inherits="iWMS.Web.Inbound.InboundSorting.InboundExplode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Explode TUNO1 @ Inbound Sorting</title>
    <link rel="icon" sizes="190x130" href="../Image/URLLogo.png" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <telerik:RadCodeBlock runat="server">
        <script language="javascript" type="text/javascript">
            function ModalPopupClose() {
                parent.document.location.href = "../InboundSorting/InboundSortingExplode.aspx?FrontendSource=ExplodeTUNO1&RCSDTID=" + <%= "'" + ViewState["RCSDTID"].ToString() + "'" %> + "&ExplodeTUCount=" + <%= "'" + ViewState["ExplodeTUCount"].ToString() + "'" %>+"&RECEIPTID=" + <%= "'" + ViewState["RECEIPTID"].ToString() + "'" %> +"&RcId=" +<%="'"+ViewState["RcId"].ToString() + "'" %> ;
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <table style="padding-left: 40px">
                    <tr>
                        <td>
                            <asp:Label Text="Number of TUNO" runat="server"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="NumberoflinesTxt" runat="server" Skin="Sunset" Width="170" Height="40" CausesValidation="false" BackColor="#ded7c6" Font-Size="Large"></telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label Text="Generate TUNO" runat="server"></asp:Label>
                            <br />
                            <asp:CheckBox ID="chkObjective" runat="server" Enabled="true" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <table style="padding-left: 40px">
            <tr>
                <td>
                    <asp:Button ID="ExplodeBtn" runat="server" Text="Explode" CssClass="white"
                        OnClick="ExplodeBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
