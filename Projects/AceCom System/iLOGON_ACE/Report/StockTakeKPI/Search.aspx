<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.StockTakeKPI.Search" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Stock Take KPI Report</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">   
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" type="text/javascript" src="../../js/checkbox.js"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
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
                </table>
            </td>
            
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:Button ID="RunBtn" runat="server" Text="Run" class="white" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>                
                <br>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
    </table>  

    </form>
</body>
</html>

