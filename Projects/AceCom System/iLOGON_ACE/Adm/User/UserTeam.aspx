<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTeam.aspx.cs" Inherits="iWMS.Web.Adm.User.UserTeam" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div id="div-datagrid" style="height: 100%">
            <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td style="padding-bottom: 8px; width: 700px">
                        <asp:Button ID="RemovBtn" class="white" runat="server" OnClick="RemovBtn_Click"
                            Text="Remove" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 5px; width: 700px">
                        <asp:Label ID="Label1" runat="server" Text="Assigned Teams" Font-Bold="true" Font-Size="Medium"/>
                    </td>
                    <td style="padding-bottom: 5px; padding-left: 15px;">

                        <asp:Label ID="Label2" runat="server" Text="Active Teams Not Assigned" Font-Bold="true" Font-Size="Medium"/>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="width: 680px">

                        <telerik:RadGrid ID="ResultDGAssigned" runat="server" AutoGenerateColumns="false" GridLines="None"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" 
                            AllowFilteringByColumn="false" OnNeedDataSource="ResultDGAssigned_NeedDataSource"  AllowMultipleRowSelection="true" OnItemDataBound="ResultDGAssigned_ItemDataBound" AllowMultiRowSelection="True">
                            <ClientSettings AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true" >
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                                 <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>

                                    <telerik:GridBoundColumn DataField="Code" SortExpression="Code" HeaderText="Code"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="Descr" SortExpression="Descr" HeaderText="Descr"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td valign="top" style="padding-left: 15px;width: 400px">

                        <telerik:RadGrid ID="ResultDGUnAssigned" runat="server" AutoGenerateColumns="false" GridLines="None"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" OnRowDrop="ResultDGAssigned_RowDrop"
                          UseAccessibleHeader="true"  AllowFilteringByColumn="false" OnNeedDataSource="ResultDGUnAssigned_NeedDataSource"  AllowMultiRowSelection="true" >
                               <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true" >
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" >
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Code" SortExpression="Code" HeaderText="Code"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="Descr" SortExpression="Descr" HeaderText="Descr"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        </div>
    </form>
</body>
</html>
