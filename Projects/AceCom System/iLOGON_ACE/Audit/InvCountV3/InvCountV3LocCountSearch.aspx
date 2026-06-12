<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3LocCountSearch.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3LocCountSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>InvCountV3LocCountSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked
                }
            }
        } 
    </script>
    <style type="text/css">
        .style1
        {
            width: 540px;
        }
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
    
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
           <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="LogCountSearch" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
            <asp:Panel ID="formCtlPanel" runat="server">
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr> 
        <tr>
            <td valign="top"><br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td style="width: 400px" valign="top"><br />
                LocCat
                <br />
                <telerik:RadListBox runat="server" ID="LocCatList" Height="120px" Width="190px"
                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedLocCatList"
                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                    OnTransferred="LocCatListList_Transferred">
                </telerik:RadListBox>
                <telerik:RadListBox runat="server" ID="SelectedLocCatList" Height="120px" Width="160px"
                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                    AllowDelete="false">
                </telerik:RadListBox>
            </td>
            <td width="38%">
            </td>
        </tr>
    </table>
    </asp:Panel>
    <br />
        <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ExportExcel" Visible="false" Text="Excel"
             UseSubmitBehavior="false" ToolTip="Export To Excel" />
        <br />
    <div id="div2" style="width: 100%; height: 100%">
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" 
        Skin="Office2007" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="true" 
        OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="500">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
              
                <telerik:GridTemplateColumn AllowFiltering="false">
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    <HeaderTemplate>
                        S/No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridBoundColumn DataField="icid" AllowFiltering="true" UniqueName="icid" 
                    Reorderable="true" Display="false" ReadOnly="True" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="locCat" SortExpression="locCat" HeaderText="LocCat"
                    UniqueName="locCat" Reorderable="true" ReadOnly="True" FilterControlWidth="20px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="LocCode"
                    UniqueName="loccode" Reorderable="true" ReadOnly="True" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="Pallet/BinId"
                    UniqueName="tuno1" Reorderable="true" ReadOnly="True" FilterControlWidth="60px" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="locCountCycle" SortExpression="locCountCycle" HeaderText="CountCycle"
                    UniqueName="locCountCycle" Reorderable="true" ReadOnly="True" FilterControlWidth="40px" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CountStatus" SortExpression="locCountStatus" HeaderText="CountStatus"
                    UniqueName="locCountStatus" Reorderable="true" ReadOnly="True" FilterControlWidth="70px" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="locCountLastDate" SortExpression="locCountLastDate" HeaderText="LastCountDate"  
                    UniqueName="locCountLastDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="True" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="locCountCycleInitDate" SortExpression="locCountCycleInitDate" HeaderText="CountInitDate"  
                    UniqueName="locCountCycleInitDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="True" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="locCountFlag" SortExpression="locCountFlag" HeaderText="CountFlag"
                    UniqueName="locCountFlag" Reorderable="true" ReadOnly="True" FilterControlWidth="20px" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="locCountCycleInitYear" SortExpression="locCountCycleInitYear" HeaderText="locCountCycleInitYear"
                    UniqueName="locCountCycleInitYear" Reorderable="true" ReadOnly="True" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EmptyLoc" SortExpression="EmptyLoc" HeaderText="EmptyLoc"
                    UniqueName="EmptyLoc" Reorderable="true" ReadOnly="True" FilterControlWidth="20px" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PrevInitLastCountDate" SortExpression="PrevInitLastCountDate" HeaderText="PrevInitLastCountDate"
                    UniqueName="PrevInitLastCountDate" Reorderable="true" ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy}" >
                </telerik:GridBoundColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>