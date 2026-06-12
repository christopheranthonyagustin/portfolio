<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.EmptyLocation.Search" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>EmptyLocation</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">    
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table>
                     <tr>
                                <td>&nbsp;LocCat
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="LocCatList" Height="120px" Width="190px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedLocCatList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="LocCatListList_Transferred">
                                </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedLocCatList" Height="120px" Width="160px"
                                        Skin="WebBlue" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="CompileBtn" class="white" runat="server" OnClick="CompileBtn_Click" Text="Compile" 
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>           
        </tr>
    </table>
    </form>
</body>
</html>

