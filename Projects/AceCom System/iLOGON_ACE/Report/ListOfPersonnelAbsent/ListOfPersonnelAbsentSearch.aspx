<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfPersonnelAbsentSearch.aspx.cs"
    Inherits="iWMS.Web.Report.ListOfPersonnelAbsent.ListOfPersonnelAbsentSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>List Of Personnel Absent </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td>
                        &nbsp;&nbsp;Dept
                    </td>
                    <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;&nbsp;<telerik:RadListBox runat="server" ID="AvailDeptList" Height="120px"
                                Width="200px" ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedDeptList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailDeptList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedDeptList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="WebBlue" AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td>
                        &nbsp;&nbsp;Type
                    </td>
                    <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;&nbsp;<telerik:RadListBox runat="server" ID="TypeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedTypeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                AutoPostBackOnTransfer="true" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                OnTransferred="TypeList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedTypeList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" width="30%">
                &nbsp;&nbsp;<iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;<telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server"
                    AutoPostBack="true" Skin="WebBlue" Text="Compile" OnClick="CompileBtn_Click"
                    >
                </telerik:RadButton>
                &nbsp;
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
