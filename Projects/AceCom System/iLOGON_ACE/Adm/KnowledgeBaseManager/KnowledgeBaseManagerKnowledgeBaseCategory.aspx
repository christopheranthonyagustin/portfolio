<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KnowledgeBaseManagerKnowledgeBaseCategory.aspx.cs" Inherits="iWMS.Web.Adm.KnowledgeBaseManager.KnowledgeBaseManagerKnowledgeBaseCategory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CssClass="white" OnClick="RefreshBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false"></asp:Button>
                    &nbsp;
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="true"
                    Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                    <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false"></asp:Button>
                    &nbsp;
                <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="true"
                    Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                     &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                &nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="true"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnEditCommand="ResultDG_EditCommand" OnUpdateCommand="ResultDG_UpdateCommand"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            AllowPaging="true" Skin="Metro">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530" FrozenColumnsCount="1" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>

                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ResultDG_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    title="Delete" runat="server" />
                            </a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" ID="ResultDG_UpdateCommand" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="code" HeaderText="Code" ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderText="Item">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Item")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="ItemReq" runat="server" ControlToValidate="ItemTxtBox"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <telerik:RadTextBox ID="ItemTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Item") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Description">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Descr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="DescriptionReq" runat="server" ControlToValidate="DescriptionTxtBox"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <telerik:RadTextBox ID="DescriptionTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Descr") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridTemplateColumn HeaderText="Created On">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("CreatedOn")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Modified On">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>

                    <telerik:GridBoundColumn Display="false" DataField="StatusColour">
                    </telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </form>

</body>
</html>
