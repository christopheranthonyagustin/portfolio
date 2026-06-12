<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Graphlet.InventoryAnalysis.Search" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>InventoryAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/NewBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/style.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <br />
        <br />
        <asp:Button ID="ViewBtn" CssClass="white" runat="server" OnClick="Reconcile_Click" Text="Run" CausesValidation="false"
            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
        <br />
        <asp:Panel ID="Panel_47" runat="server" Visible="true">
            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl47" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                        <asp:Label ID="AccountLbl47" runat="server" Text="Account"></asp:Label><br />
                        &nbsp;
                        <telerik:RadListBox runat="server" ID="AccountList47" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccountList47"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="AccountList47_Transferred">
                        </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedAccountList47" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            Skin="WebBlue" AllowDelete="false">
                        </telerik:RadListBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="MessageLbl" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        &nbsp;<asp:Label ID="Label2" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label3" Text="1. Closing balance is computed using the formula (Opening + Incoming - Outgoing stocks)" Font-Size="15px" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label1" Text="2. If a Closing balance does not tie with its subsequent Opening balance, please review inventory move <br />transactions that split an existing TUNO1 into one or more new TUNO1 within the month." Font-Size="15px" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label4" Text="3. You can use (029) Move Records @ Stock Query V2 to review and trace such transactions." Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdErrLbl" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                        <asp:Label ID="Label7" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                            Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtlPPGSB" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl59" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl61" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl67" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                    <td>
                        <asp:Label ID="MessageLbl1" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;
                    <asp:Button ID="RetrieveBtn1" class="white" runat="server" OnClick="ReterieveBtn1_Click" Text="WMSInventory" Width="98px"
                        UseSubmitBehavior="false" Visible="false" OnClientClick="disableBtn(this.id)" />

                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx"
                        Skin="Outlook">
                        <Localization Select="Select File 1" />
                    </telerik:RadAsyncUpload>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload2" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx"
                        Skin="Outlook">
                        <Localization Select="Select File 2" />
                    </telerik:RadAsyncUpload>
                </td>

            </tr>
            <tr>
                <td width="200px">
                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                    <asp:CheckBox ID="IncludeLot4Chk" runat="server" Text="Include Lot 4" />
                    <br />
                    <br />
                    &nbsp;<asp:Label ID="Label5" Text="Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label6" Text="Excel Column Name: ColumnA-SKUCode; ColumnB-Description; ColumnC-BatchNo; ColumnD-Qty" Font-Size="15px" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                    <asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Compile" />
                    &nbsp;
                    <asp:Button ID="ResetBtn" CssClass="white" runat="server" OnClick="ResetBtn_Click" Text="Reset" />
                </td>
            </tr>
        </table>
        <asp:DropDownList ID="excelssDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="excelssDDL_SelectedIndexChanged"
            Visible="false" />
        <asp:DropDownList ID="oracleExcelDDl" runat="server" Visible="false" />
        <br />
        <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
            ForeColor="#ff0000"></asp:Label><br />
        <br />
        <table width="100%" id="report" runat="server">
            <tr>
                <td align="right">
                    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="excelImg" border="0" alt="Export to Excel" align="right" src="../../Image/Excel.png"
                            runat="server" visible="false"/>
                    </a>
                </td>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
