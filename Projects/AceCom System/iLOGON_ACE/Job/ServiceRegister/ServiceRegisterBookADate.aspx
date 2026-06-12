<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterBookADate.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterBookADate" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ServiceRegisterBookADate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    &nbsp;
                    <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CssClass="white" OnClick="RefreshBtn_Click" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                </tr>
                <tr>
                <td style="vertical-align:top">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td style="width:5px">
                </td>
                <td>
                    Resource
                    <br />
                    <telerik:RadListBox runat="server" ID="ResourceList" Height="120px" Width="190px"
                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedResourceList"
                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                        OnTransferred="ResourceList_Transferred">
                    </telerik:RadListBox>
                    <telerik:RadListBox runat="server" ID="SelectedResourceList" Height="120px" Width="160px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false">
                    </telerik:RadListBox>
                </td>
                <td style="width:10px">
                </td>
                <td style="vertical-align:top">
                    <br />
                    <br />
                    <asp:LinkButton class="btn btn-info btn-xs" runat="server" ID="PrevBtn" OnClick="PrevBtn_Click">
                        <asp:PlaceHolder runat="server">
                            <span class="glyphicon glyphicon-triangle-left"></span>
                        </asp:PlaceHolder>
                    </asp:LinkButton>
                </td>
                <td style="width:4px">
                </td>
                <td style="vertical-align:top">
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
                <td style="vertical-align:top">
                    <br />
                    <br />
                    <asp:LinkButton class="btn btn-info btn-xs" runat="server" ID="NextBtn" OnClick="NextBtn_Click">
                        <asp:PlaceHolder runat="server">
                            <span class="glyphicon glyphicon-triangle-right"></span>
                        </asp:PlaceHolder>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
        <br />
        <div id="div-radgrid">
            <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" AllowPaging="false" AllowSorting="true" 
                OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" EnableViewState="false" AllowFilteringByColumn="false">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true">        
                    <Columns>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
