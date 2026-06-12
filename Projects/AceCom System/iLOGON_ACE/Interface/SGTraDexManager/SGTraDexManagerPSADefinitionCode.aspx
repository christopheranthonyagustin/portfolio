<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SGTraDexManagerPSADefinitionCode.aspx.cs" Inherits="iWMS.Web.Interface.SGTraDexManager.SGTraDexManagerPSADefinitionCode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SGTraDexManager</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>


    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="PSADefinitionCodeRadPageView">
               
                <table cellpadding="2" cellspacing="2">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>

                <div id="div-datagrid">
                 <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" AllowSorting="true" AllowFilteringByColumn="false" ClientSettings-AllowColumnsReorder="true" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemCommand="ResultDG_ItemCommand" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound">
                      <GroupingSettings CaseSensitive="false" />
                   <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>

                    <MasterTableView AllowMultiColumnSorting="true" PageSize="1000" CommandItemDisplay="Top" DataKeyNames="PSADefinitionCode" EditMode="InPlace">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>

                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="BillofMaterialEdit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BillofMaterialDelete"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="Delete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="S/No" HeaderText="S/No" ReadOnly="true">
                            </telerik:GridBoundColumn>

                              <telerik:GridTemplateColumn HeaderText="PSA Definition Code">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PSADefinitionCode")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="PSADefinitionCodeTxt" runat="server" Skin="WebBlue" ReadOnly="true" Text='<%# DataBinder.Eval(Container.DataItem, "PSADefinitionCode") %>'></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                          
                            <telerik:GridTemplateColumn HeaderText="PSA Definition Name">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PSADefinitionName")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="PSADefinitionNameTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "PSADefinitionName") %>'></telerik:RadTextBox>
                                      <asp:RequiredFieldValidator ControlToValidate="PSADefinitionNameTxtBox" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                   
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PSADefinitionAddress" HeaderText="PSA Definition Address" Display="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PSADefinitionAddress") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="PSADefinitionAddressTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PSADefinitionAddress") %>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="PSADefinitionAddressTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />

                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                              <telerik:GridTemplateColumn UniqueName="LinkedServicePoint" HeaderText="Linked Service Point">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "LinkedServicePoint") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="LinkedServicePointComBo" Text='<%# DataBinder.Eval(Container.DataItem, "LinkedServicePoint") %>' runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155"
                                        EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="ItemComBo_ItemsRequested"
                                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="ItemComBo_Load">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
