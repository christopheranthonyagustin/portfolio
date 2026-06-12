<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricationOrderQuotationAdd.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabricationOrderQuotation.FabricationOrderQuotationAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Fabrication Order Quotation Add</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="AddBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>