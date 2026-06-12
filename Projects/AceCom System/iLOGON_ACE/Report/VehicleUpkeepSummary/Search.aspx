<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.VehicleUpkeepSummary.Search" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VehicleUpkeepSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 429px;
        }
        .style2
        {
            width: 5%;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                               <td class="style2">
                                    &nbsp;&nbsp;VehicleUpkeepDateAsAt&nbsp;
                               </td>
                               <tr >
                                    <td class="style1" >                                    
                                         &nbsp;&nbsp;<telerik:RadDatePicker ID="VehUKDateTxt" Width="150px" runat="server" DateInput-DateFormat="dd/MMM/yyyy" 
                                         DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Skin="Sunset" DateInput-BackColor="#ded7c6" 
                                         DatePopupButton-BackColor="#ded7c6">
                                         <Calendar>
                                         <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                         </SpecialDays>
                                         </Calendar>
                                         </telerik:RadDatePicker>                 
                                    </td>
                                </tr>
           
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                 </tr>
           
                                
                                <td class="style2">
                                        &nbsp;&nbsp;UpkeepType
                                </td>
                                <tr>
                                    <td style="width: 500px" valign="top">
                                    &nbsp;&nbsp;<telerik:RadListBox runat="server" ID="UpKeepList" Height="160px" Width="250px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedUpKeepList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="UpKeepList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedUpKeepList" Height="160px" Width="250px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                    </telerik:RadListBox>
                                    </td>
                                </tr>
           
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>  
                                            
                                
                                <td class="style2">
                                    &nbsp;&nbsp;VehicleOpsUnit
                                </td>
                                <tr>
                                    <td style="width: 500px" valign="top">
                                    &nbsp;&nbsp;<telerik:RadListBox runat="server" ID="VehOpsUnitList" Height="160px" Width="250px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehOpsUnitList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="VehOpsUnitList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedVehOpsUnitList" Height="160px" Width="250px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                    </telerik:RadListBox>
                                    </td>
                                </tr>
                                <tr style="height: 5px">
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                </tr>
                            </table>
            </td>
        </tr>
        <tr>
            <td style="height:5px"></td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;<telerik:RadButton ID="CompileBtn" runat="server" CssClass="detailbutton" OnClick="CompileBtn_Click" Skin = "WebBlue"
                    Text="Compile" OnClientClick="return busyBox.Show();" />
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>
