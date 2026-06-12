<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BLRegisterCandidateSearch.aspx.cs" Inherits="iWMS.Web.Job.BLRegister.BLRegisterCandidateSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>BLRegister</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"> 
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

    
    <style type="text/css">
        .auto-style1 {
            width: 1193px;
        }
    </style>

    
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SearchImgBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td align="right" class="auto-style1">
                    <div class="pagetitle">
                        Step 1 of 3: Search Tank Order Candidates
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td valign="top">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>                         
                </td>
            </tr>
        </table>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
            CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
