<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfCODPODSearch.aspx.cs"
    Inherits="iWMS.Web.Report.ListOfCODPOD.ListOfCODPODSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%--<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>--%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ListOfOutstandingCODPOD</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    
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

    <%--<script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>--%>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        
            </td>
         <%--   <td valign="top" width="70%">
                <p>
                    &nbsp;</p>
            </td>--%>
        </tr>
         <tr>
         <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">
                            &nbsp;ShipmentType
                        </td>
                        <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="ShipmentTypeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedShipmentTypeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="ShipmentTypeList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedShipmentTypeList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false" Style="background-color: Yellow;">
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
                        </tr>
                        <td class="style4">
                            &nbsp;TransportType
                        </td>
                    
                    <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="TrpTypeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedTrpTypeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="TrpTypeList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedTrpTypeList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                   </table>
                   </td>
                   </tr>         
        
        <tr>
            <td valign="top" width="30%">
               
                  <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                       
            </td>
        </tr>
        
          <tr>
            <td valign="top" width="70%">
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadButton ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton" Skin ="WebBlue"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></telerik:RadButton>
                  <%-- </asp:Button>&nbsp;<input
                        class="detailbutton" value="Reset" type="reset">--%>
                <br>
                <asp:Label Style="z-index: 0" ID="messageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
