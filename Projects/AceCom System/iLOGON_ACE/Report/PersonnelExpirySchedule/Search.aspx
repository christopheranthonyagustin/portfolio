<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.PersonnelExpirySchedule.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PersonnelExpirySchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 36px;
        }
        .style2
        {
            height: 30px;
        }
        .style4
        {
            width: 6%;
        }
        .style5
        {
            width: 5.25%;
        }
    </style>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    
    <%--<%--<table id="table1">
             <tr>
                <td colspan="2" class="style1">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">
                            &nbsp;Format
                        </td>
                        <tr>
                        <td style="width: 300" valign="top">
                            <telerik:RadComboBox ID="output_ddl" runat="server" Skin="WebBlue" OnSelectedIndexChanged="outputddl_SelectedIndexChanged" AutoPostBack="true"/>
                        </td>
                        <td width="67%">
                            &nbsp;
                        </td>
                        </tr>--%>
                     
    <table > 
              <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    <asp:Panel ID="Listpnl" runat="server" Visible="false">
    <table id="table2" border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <%--Ticket #5988: BCC : Enhancement to Personnel Expiry Schedule - Selection UI Modified by XM 22/06/2016--%>
                   
                        <tr>
                        <td class="style3">
                            &nbsp;&nbsp;Department
                            <br />
                        </td>
                    </tr>
                       <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="AvailDeptList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedDeptList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailDeptList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedDeptList" Height="120px" Width="200px"
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
                <%--Ticket #5988: BCC : Enhancement to Personnel Expiry Schedule - Selection UI Modified by XM 22/06/2016--%>   
                    <tr>
                        <td class="style3">
                            &nbsp;&nbsp;Document Type
                            <br />
                        </td>
                    </tr>             
                     <tr>                        
                        <td style="width: 400px" valign="top">
                            &nbsp;<telerik:RadListBox runat="server" ID="AvailDocList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedDocList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailDocList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedDocList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>                    
                </table>  
                </td>
            </tr>          

         <%--Ticket #5988: BCC : Enhancement to Personnel Expiry Schedule - Selection UI Modified by XM 22/06/2016--%>
         <%--<td colspan="2" class="style1">
         <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="100%">
                    <asp:CheckBox ID="showallper_Chkbox" Checked="true" runat="server" />
                    &nbsp;Include Inactive Personnel&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td width="100%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100%">
                    <asp:CheckBox ID="showallperdoc_Chkbox" Checked="true" runat="server" />
                    &nbsp;Include Inactive Personnel Document&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td width="100%">
                    &nbsp;</td>
            </tr>
             </table>
            </td>
            </tr>
            <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                       
                        <tr>
                             <td>
                            &nbsp;NoOfMonths
                                 
                        </td>
                        
                        <td >
                            <br />
                            <telerik:RadTextBox ID="noofmonthtxt" Text="3" runat="server" /> 
                        </td>
                        <td width="100%">
                            &nbsp;
                        </td>
                        </tr>
                  </table> --%>      
            
         </table>
        <table > 
              <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <%--Ticket #5988: BCC : Enhancement to Personnel Expiry Schedule - Selection UI Modified by XM 22/06/2016--%>
        <table id="table3">
        <tr>
            <td valign="top" width="30%" class="style2" colspan="2">
                <%--<telerik:RadButton ID="CompileBtn" runat="server" Width="40" Text="Print" Skin="WebBlue" CssClass="detailbutton"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();" />--%>
                <asp:Button ID="RunBtn" runat="server" Text="Run" class="white" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
            </td>
        </tr>
       
        <tr>
            <td>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
                &nbsp;<br>
            </td>
        </tr>
    </table>
    </asp:Panel>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
