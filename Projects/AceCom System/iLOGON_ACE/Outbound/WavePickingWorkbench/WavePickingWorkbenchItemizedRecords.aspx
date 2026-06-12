<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WavePickingWorkbenchItemizedRecords.aspx.cs" Inherits="iWMS.Web.Outbound.WavePickingWorkbench.WavePickingWorkbenchItemizedRecords" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="ItemizedTitle" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="BuildWaveBtn" runat="server" CssClass="white" Text="Build Wave"
                        OnClick="BuildWaveBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="AssignPickerBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Picker"
                        OnClick="AssignPickerBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server" />
                </td>
                <td>
                    <asp:Label ID="AllOrdersChkLbl" runat="server" Font-Bold="true" Text="All Orders" ForeColor="Black"></asp:Label>
                    <br />
                    <asp:CheckBox ID="AllOrdersChk" runat="server" CssClass="BigCheckBox" Style="vertical-align: middle" Checked="true" />
                </td>

                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="AssignPickCartLbl" runat="server" Font-Bold="true" Text="Assign Pick Cart" ForeColor="Black"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="AssignPickCartChk" runat="server" CssClass="BigCheckBox" Style="vertical-align: middle" />

                </td>

                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="UnallocateBtn" runat="server" CssClass="white" Text="Unallocate"
                        OnClick="UnallocateBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="CloseWindowBtn" runat="server" CssClass="LongLabelWhite" Text="Close Window"
                        OnClick="CloseWindowBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
        <asp:UpdatePanel ID="ItemizedRecordsUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="false"
                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                    AllowPaging="true" AutoGenerateColumns="true" GridLines="None">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
