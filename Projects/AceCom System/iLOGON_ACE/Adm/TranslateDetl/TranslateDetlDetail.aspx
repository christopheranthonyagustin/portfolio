<%@ Page Language="c#" CodeBehind="TranslateDetlDetail.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.TranslateDetl.TranslateDetlDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Translate Detail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/sub_global.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <div class="pagetitle"></div>
                        </td>
                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            &nbsp; &nbsp;
                        </td>
                    </tr>
                </table>
                <br>
                <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None"
                        AutoGenerateColumns="False" BorderStyle="None" OnCancelCommand="ResultDG_Cancel" OnEditCommand="ResultDG_Edit"
                        CellPadding="2" DataKeyField="code" OnUpdateCommand="ResultDG_Update" OnDeleteCommand="ResultDG_Delete" OnItemDataBound="ResultDG_ItemDataBound" Skin="Metro"
                        AllowSorting="True" UseAccessibleHeader="True"
                        PageSize="16">
                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem"></ItemStyle>
                        <MasterTableView AllowMultiColumnSorting="true" EditMode="InPlace" PageSize="50" DataKeyNames="code" HierarchyLoadMode="Client" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <Columns>
                                <telerik:GridTemplateColumn>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif" Width="15"
                                            Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                        <%--<asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>--%>
                                        <asp:ImageButton runat="server" Visible="True" ID="Delete" ImageUrl="..\..\image\bin.gif" Width="15"
                                            Height="15" AlternateText="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm delete?');" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>

                                        <%--<a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.code")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="TranslateDetlDelete" runat="server">                                   
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete translateDetl"
                                runat="server">
                                </a>  --%>
                                        <asp:Label ID="DetailLbl1" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent" BorderWidth="0"
                                            CausesValidation="False"></asp:ImageButton>
                                    </EditItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="type" SortExpression="type" ReadOnly="True" HeaderText="Type">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="code" SortExpression="code" ReadOnly="True" HeaderText="Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" HeaderText="Status" SortExpression="status">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderText="Add Date"
                                    SortExpression="adddate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" HeaderText="Add User"
                                    SortExpression="adduser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderText="Edit Date"
                                    SortExpression="editdate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" HeaderText="Edit User"
                                    SortExpression="edituser">
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn DataField="label" HeaderText="Label" SortExpression="label">
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="LabelTxt" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "label") %>'></telerik:RadTextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="label" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "label")%>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>


                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
                <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
