<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.TripAnalysisByDriverByBST.Search" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">

    <script src="../../js/CastleBusyBox.js" language="javascript" type="text/javascript"></script>

    <title>TripAnalysisByDriverByBillSizeType</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">

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
    <asp:UpdatePanel ID="UpdBody" runat="server">
    <ContentTemplate>
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>   
                        <td width="1%">
                        </td>                                    
                        <td>
                            <asp:Label ID="VehOpsLbl" runat="server">OpsUnitCode</asp:Label> <br />
                            <telerik:RadListBox runat="server" ID="EqpTypeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedEqpTypeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="EqpTypeList_Transferred">
                            </telerik:RadListBox>               
                            <telerik:RadListBox runat="server" ID="SelectedEqpTypeList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false" BackColor="Yellow">
                            </telerik:RadListBox>
                        </td>              
                    </tr>
                </table>
            </td>
        </tr>       
    </table>    
        <br />
    <table>
        <tr>
            <td> 
                <asp:UpdatePanel ID="UpdButton" runat="server">
                <ContentTemplate>
                    &nbsp;&nbsp;&nbsp;              
                    <asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Visible="true"
                            Text="Run" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                </div>
                <div id="LoaderPopup">
                    <a id="loader"></a>
                    <a id="text">We are processing your request ...</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
     </ContentTemplate>
     </asp:UpdatePanel>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
               // Instantiate our BusyBox object
               var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
