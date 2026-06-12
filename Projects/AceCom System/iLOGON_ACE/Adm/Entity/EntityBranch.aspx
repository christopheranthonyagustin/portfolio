<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntityBranch.aspx.cs" Inherits="iWMS.Web.Adm.Entity.EntityBranch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Branch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        body {
            overflow: hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" />
        <br /><br /><br />
        <table>
            <tr>
                <td>
                    <telerik:RadListBox runat="server" ID="BranchList" Height="120px" Width="250px"
                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedBranchList"
                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                        Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                        OnTransferred="AvailBranchList_Transferred">
                    </telerik:RadListBox>
                    <telerik:RadListBox runat="server" ID="SelectedBranchList" Height="120px" Width="200px"
                        ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        Skin="WebBlue" AllowDelete="false">
                    </telerik:RadListBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
