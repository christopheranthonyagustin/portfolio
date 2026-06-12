<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanAdd.aspx.cs" Inherits="iWMS.Web.Outbound.Loan.LoanAdd" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>LoanHeadAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                     UseSubmitBehavior="false" CssClass="white" />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </div>
    </form>
</body>
</html>
