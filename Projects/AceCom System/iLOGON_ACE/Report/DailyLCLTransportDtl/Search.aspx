<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.DailyLCLTransportDtl.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>DailyLCLTransport</title>
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
              <table border="0">  
                    <tr>
                        <td class="style5">
                            Equipment Type
                        </td>                            
                    </tr>                            
                        <tr>
                            <td style="width: 700px" valign="top">
                                <telerik:RadListBox runat="server" ID="AvailEqrList" Height="120px" Width="250px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedEqrList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="AvailEqrList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedEqrList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    Skin="WebBlue" AllowDelete="false">
                                </telerik:RadListBox>
                                <br />
                                <br />
                                <br />
                            </td>
                       </tr>                                
                </table> 
             </td>                      
         </tr> 
         <tr>           
              <td>
                <table border="0">
                    <td class="style5">
                        Job Type
                    </td>                                               
                    <tr>
                        <td style="width: 700px" valign="top">
                            <telerik:RadListBox runat="server" ID="AvailJobList" Height="120px" Width="250px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedJobList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailJobList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedJobList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="WebBlue" AllowDelete="false">
                            </telerik:RadListBox>
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>                                
                </table>               
            </td>
        </tr>
        <tr>
            <td>
                 <telerik:RadButton ID="CompileBtn" runat="server" OnClick="CompileBtn_Click" Skin="WebBlue" Text="Run" Style="top: 19px; left: -1px">
                 </telerik:RadButton>
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
