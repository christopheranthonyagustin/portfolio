<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimesheetAnalysis.aspx.cs" Inherits="iWMS.Web.Graphlet.TimesheetAnalysis.TimesheetAnalysis" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TimesheetAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" method="post" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>  
    
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Format" Value="0" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <br /><br />
    <asp:Label ID ="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label>
         
    <table>
        <tr style="height:10px">
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl13" runat="server" Visible="false"></iWMS:iForm>
            </td>
        </tr>   
        <tr>
            <td align="left">
                &nbsp; &nbsp;<asp:Label ID="DeptLbl" runat="server" Text="Department"></asp:Label><br />
                &nbsp;&nbsp;<telerik:RadListBox ID="DeptList" runat="server" AllowDelete="false"
                    AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false"
                    AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px"
                    OnTransferred="IssueTypeList_Transferred" SelectionMode="Multiple"
                    Skin="Sunset" TransferMode="Move" TransferToID="SelectedDeptList"
                    Width="200px">
                </telerik:RadListBox>
                <telerik:RadListBox ID="SelectedDeptList" runat="server"
                    AllowDelete="false" AllowReorder="false" ButtonSettings-AreaWidth="35px"
                    Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px">
                </telerik:RadListBox>
                <br />
            </td>
        </tr>
         <tr>
            <td align="left">
                &nbsp; &nbsp;<asp:Label ID="TypeLbl" runat="server" Text="Type"></asp:Label><br />
                &nbsp;&nbsp;<telerik:RadListBox ID="TypeList" runat="server" AllowDelete="false"
                    AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false"
                    AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px"
                    OnTransferred="TypeList_Transferred" SelectionMode="Multiple"
                    Skin="Sunset" TransferMode="Move" TransferToID="SelectedTypeList"
                    Width="200px">
                </telerik:RadListBox>
                <telerik:RadListBox ID="SelectedTypeList" runat="server"
                    AllowDelete="false" AllowReorder="false" ButtonSettings-AreaWidth="35px"
                    Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px">
                </telerik:RadListBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl2" runat="server" ></iWMS:iForm>
            </td>
        </tr>   
        <tr>
            <td> 
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
                <asp:Label ID="Message1" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>      
        <tr>
            <td><br />               
                    &nbsp;&nbsp;
                    <asp:Button ID="Compilebtn" class="white" runat="server" OnClick="Compilebtn_Click" Visible="true"
                        Text="Run" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                  
            </td>
        </tr>       
    </table>  
  
    </form>    
</body>
</html>
