<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KnowledgeBaseManagerKnowledgeBaseType.aspx.cs" Inherits="iWMS.Web.Adm.KnowledgeBaseManager.KnowledgeBaseManagerKnowledgeBaseType" %>

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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="KnowledgeBaseTypeTab" Text="Knowledge Base Type" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="KnowledgeBaseCategoryTab" Text="Knowledge Base Category" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="KnowledgeBaseTypeTabRadPageView">

                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" CausesValidation="false" OnClick="RefreshBtn_Click" UseSubmitBehavior="false" Text="Refresh" />
                            &nbsp;
                            <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white" OnClick="AddBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false"></asp:Button>

                        </td>
                    </tr>
                </table>
                <br />

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnUpdateCommand="ResultDG_UpdateCommand" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnNeedDataSource="ResultDG_NeedDataSource" OnEditCommand="ResultDG_EditCommand"
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
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" runat="server" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="icon">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>

                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
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

                            <telerik:GridTemplateColumn HeaderText="Account" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Account")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="AccountComBo" runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155"
                                        EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="AccountComBo_ItemsRequested"
                                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="AccountComBo_Load">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Item">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Item")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:RequiredFieldValidator ID="ItemReq" runat="server" ControlToValidate="ItemTxtBox"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <telerik:RadTextBox ID="ItemTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Item") %>'></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Description">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Description")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:RequiredFieldValidator ID="DescriptionReq" runat="server" ControlToValidate="DescriptionTxtBox"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <telerik:RadTextBox ID="DescriptionTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Remarks">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:RequiredFieldValidator ID="RemarksReq" runat="server" ControlToValidate="RemarksTxtBox"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <telerik:RadTextBox ID="RemarksTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>' TextMode="MultiLine" Width="400px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ReadOnly="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn HeaderText="Created On">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("CreatedOn")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Modified On">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn Display="false" DataField="StatusColourCode">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="KnowledgeBaseCategoryRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
