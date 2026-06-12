<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.JobAnalysisByShipmentType.Search" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>JobAnalysisByShipmentType</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 36px;
        }
        .style4
        {
            width: 6.15%;
        }
        .style5
        {
            width: 5.25%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width: 20%">
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
            <td >
                <table id="shTable" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>                        
                        <td >
                            <br />
                            &nbsp;
                            ShipmentType<br />
                            &nbsp;
                            <telerik:RadListBox runat="server" ID="ShipmentTypeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedShipmentTypeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="ShipmentTypeList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedShipmentTypeList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false" BackColor="Yellow">
                            </telerik:RadListBox>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
            </tr>
            
            <tr>
            <td >
                <table id="OpsTable" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>                        
                        <td >
                            <br />
                            &nbsp;
                            Opsunitcode<br />
                            &nbsp;
                            <telerik:RadListBox runat="server" ID="OpsunitcodeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsunitcodeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="OpsunitcodeList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedOpsunitcodeList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false" BackColor="Yellow">
                            </telerik:RadListBox>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
            </tr>
            
            <tr>
                <td style="width: 20%">
                    <br />
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>  
    &nbsp;
    <telerik:RadButton ID="compile_Click" runat="server" OnClick="compile_ClickBtn" Skin="WebBlue"
        Text="Run" Style="top: 19px; left: -1px">
    </telerik:RadButton>
    </form>
</body>
</html>
