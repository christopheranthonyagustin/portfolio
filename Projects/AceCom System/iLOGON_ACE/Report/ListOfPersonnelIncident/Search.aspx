<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.ListOfPersonnelIncident.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ListOfPersonnelIncident</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            height: 30px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="60%">
                    <tr>
                        <td width="15%">
                            Incident Type
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 400px" valign="top">
                            <telerik:RadListBox ID="PerIncidentType" runat="server" AllowDelete="false" 
                                AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false" 
                                AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px"                             
                                ontransferred="PerIncidentType_Transferred" SelectionMode="Multiple" Skin="Sunset" 
                                TransferMode="Move" TransferToID="selectedPerIncidentTypeList" Width="200px">
                            </telerik:RadListBox>
                        </td>
                        <td style="width: 400px" valign="top">
                            <telerik:RadListBox ID="selectedPerIncidentTypeList" runat="server" 
                                AllowDelete="false" AllowReorder="false" ButtonSettings-AreaWidth="35px" 
                                Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button Style="z-index: 0" ID="CompileBtn" runat="server" Text="Compile" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id)" 
                    UseSubmitBehavior="false" CssClass="white"></asp:Button>
                
                &nbsp;<br /><br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
