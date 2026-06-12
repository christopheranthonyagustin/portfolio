<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginLogSearch.aspx.cs" Inherits="iWMS.Web.Adm.LoginLog.LoginLogSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>LoginLogSearch</title>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            width: 60px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table width="20%" id="report" runat="server">
        <tr>
            <td class="style1">
                <telerik:RadButton Skin="WebBlue" ID="SearchBtn" runat="server" Text="Search" CssClass="detailbutton"
                    OnClick="SearchBtn_Click">
                </telerik:RadButton>
            </td>
            <td align="left" class="style1">              
                 <asp:ImageButton ID="excelImgBtn" runat="server" ImageUrl="../../Image/Excel.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                    ImageAlign="AbsMiddle" ToolTip="Export To Excel" OnClick="ExportExcel" />  
            </td>
        </tr>
    </table>
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    </form>
</body>
</html>
