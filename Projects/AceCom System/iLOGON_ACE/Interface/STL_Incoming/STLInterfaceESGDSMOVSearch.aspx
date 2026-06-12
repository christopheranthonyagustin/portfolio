<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STLInterfaceESGDSMOVSearch.aspx.cs"
    Inherits="iWMS.Web.Interface.STL_Incoming.STLInterfaceESGDSMOVSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>STLInterfaceESGDSMOVSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td>
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="true" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged"
        Width="100%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" 
            EditMode="InPlace" EnableHeaderContextMenu="true">
            <CommandItemSettings ShowAddNewRecordButton="false" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                        <asp:Label ID="SerialNoLbl" runat="server" BackColor="Transparent"></asp:Label>
                        <asp:Label ID="LogLbl" runat="server" BackColor="Transparent"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="FileName" SortExpression="FileName" HeaderText="FileName"
                    Display="true" UniqueName="FileName" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Type" SortExpression="Type" HeaderText="Type"
                    Display="true" UniqueName="Type" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SeqNo" SortExpression="SeqNo" HeaderText="SequenceNo"
                    Display="true" UniqueName="SeqNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="GRCount" SortExpression="GRCount" HeaderText="GR/TotalGR"
                    Display="true" UniqueName="GRCount" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="GICount" SortExpression="GICount" HeaderText="GI/TotalGI"
                    Display="true" UniqueName="GICount" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="GTCount" SortExpression="GTCount" HeaderText="GT/TotalGT"
                    Display="true" UniqueName="GTCount" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NoOfRecord" SortExpression="NoOfRecord" HeaderText="NoOfRec"
                    Display="true" UniqueName="NoOfRecord" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                    Display="true" UniqueName="statusdescr" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                    Display="true" UniqueName="AddUser" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser"
                    Display="true" UniqueName="EditUser" ItemStyle-Wrap="false" Visible="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
