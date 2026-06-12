<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.TripIncentiveByDriver.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trip Incentive By Driver</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1 {
            width: 30%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdButton" runat="server" >
            <ContentTemplate>
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td valign="top" class="style1">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <br />
                                                    &nbsp;
                                                    ShipmentType
                                                    <br />
                                                    &nbsp;
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

                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                            <tr>
                                                <td>
                                                    <br />
                                                    <br />
                                                    &nbsp;
                                                    Grade<br />
                                                    &nbsp;                                                              
                                                    <telerik:RadListBox runat="server" ID="PersGradeList" Height="120px" Width="200px"
                                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPersGradeList"
                                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                        OnTransferred="PersGradeList_Transferred">
                                                    </telerik:RadListBox>
                                                    <telerik:RadListBox runat="server" ID="SelectedPersGradeList" Height="120px" Width="200px"
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
                                    <td><br />
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <table>
            <tr>
                <td>&nbsp;
                    <asp:Button ID="SearchBtn" runat="server" Text="Run" OnClick="CompileBtn_Click" CausesValidation="false" 
                        CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
