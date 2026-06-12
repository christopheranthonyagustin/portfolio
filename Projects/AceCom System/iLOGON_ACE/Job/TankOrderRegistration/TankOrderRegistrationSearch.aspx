<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderRegistrationSearch.aspx.cs" Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderRegistrationSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>TankOrder Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SearchBtn">
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <br />
        <table width="20%" id="report" runat="server">
            &nbsp;
         <tr>
             <td>
                 <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                     OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
             </td>
             <td align="left" class="style1">
                 <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                     OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="green" />
             </td>
         </tr>
        </table>
        <br />
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False" />
    </form>
</body>
</html>
