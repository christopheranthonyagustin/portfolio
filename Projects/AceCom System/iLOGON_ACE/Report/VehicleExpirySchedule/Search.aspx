<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.VehicleExpirySchedule.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>EquipmentExpirySchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        #Listpnl {
            padding-left: 20px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding-left: 22px;">
            <tr>
                <td>Format
                    <br />
                    <telerik:RadComboBox ID="output_ddl" runat="server" Width="155px" Skin="WebBlue" AllowCustomText="false" RenderMode="Lightweight" Filter="Contains" OnSelectedIndexChanged="output_ddl_SelectedIndexChanged" AutoPostBack="true">
                    </telerik:RadComboBox>
                </td>
                <td width="67%">&nbsp;
                </td>
            </tr>
        </table>

        <asp:Panel ID="Listpnl" runat="server" Visible="false">
            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2" class="style1">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td>VehOpsUnit 
                                    <br />
                                    <telerik:RadListBox runat="server" ID="AvailOpsList" Height="150px" Width="230px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="AvailOpsList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedOpsList" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        Skin="Sunset" AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td>Document Type
                                    <br />
                                    <telerik:RadListBox runat="server" ID="AvailDocList" Height="150px" Width="230px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedDocList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="AvailDocList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedDocList" Height="150px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="vehstatuscol" runat="server" colspan="2" visible="false">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td>Vehicle Status
                       <br />
                                    <telerik:RadListBox runat="server" ID="AvailVehStatusList" Height="150px" Width="230px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectVehStatusList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="AvailVehStatusList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectVehStatusList" Height="150px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style1">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="style5">&nbsp;NoOfMonths
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100">
                                    <telerik:RadTextBox ID="noofmonthtxt" Text="3" runat="server" />
                                </td>
                                <td width="100%">&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <br />
                        <asp:Button ID="CompileBtn" class="white" runat="server" OnClick="CompileBtn_Click"
                            Text="Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="70%" class="style2" colspan="2">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                    </td>
                    <td>&nbsp;<br />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>

</body>
</html>
