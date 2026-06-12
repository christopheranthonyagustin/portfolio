<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PickingCartMasterForm.aspx.cs" Inherits="iWMS.Web.Outbound.PickingCartMaster.PickingCartMasterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>PickingCartMasterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" 
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                 <telerik:RadTab Text="Log" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="30%" ID="HeaderRadPageView">
                <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" ToolTip="Save"
                    Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="800px" ID="PickingCartLogRadPageView" />
        </telerik:RadMultiPage>
        <telerik:RadTabStrip runat="server" ID="ToteBinRadTabStrip" MultiPageID="ToteBinRadTabStripRadMultiPage"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Tote Bin" Value="0" runat="server" Selected="True">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        
        <telerik:RadMultiPage runat="server" ID="ToteBinRadTabStripRadMultiPage" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="150%" ID="ToteBinRadPageView">
                <br />
                <asp:Button ID="RemoveBtn" CssClass="white" runat="server" OnClick="RemoveBtn_Click" ToolTip="Remove"
                    Text="Remove" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_UpdateCommand" OnEditCommand="ResultDG_EditCommand" OnCancelCommand="ResultDG_CancelCommand" OnItemCommand="ResultDG_ItemCommand">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="totebinid" CommandItemDisplay="Top" AllowFilteringByColumn="true"
                        EditMode="InPlace">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                   <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="true" ID="ToteBinMasterDelete" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="ToteBinMasterDelete_Click" OnClientClick="return confirm('Confirm Delete?')" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                     <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                     <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                </EditItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                           </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn AllowFiltering="false">
                            <HeaderTemplate>
                                S/No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn SortExpression="ToteBinNo" UniqueName="ToteBinNo" HeaderText="Tote Bin No" AllowFiltering="true" DataField="ToteBinNo">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "ToteBinNo") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                  <telerik:RadComboBox ID="ToteBinNoCombo" runat="server" AutoPostBack="true" CausesValidation="false" Skin="WebBlue" AllowCustomText="false"
                                        RenderMode="Lightweight" MarkFirstMatch="true" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol"
                                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" DataTextField="Descr" DataValueField="Item"
                                        OnItemsRequested="ToteBinNoCombo_ItemsRequested" OnLoad="ToteBinNoCombo_Load" OnSelectedIndexChanged="ToteBinNoCombo_SelectedIndexChanged">
                                    </telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="ToteBinNoReqVal" runat="server" ControlToValidate="ToteBinNoCombo"
                                                ErrorMessage="*" />
                                 </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn SortExpression="ToteBinType" UniqueName="ToteBinType" HeaderText="Tote Bin Type"  AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "ToteBinType") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn SortExpression="IssueNo" UniqueName="IssueNo" HeaderText="Issue No" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "IssueNo") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="IssueNoLbl" runat="server" Visible="true" Text='<%# DataBinder.Eval(Container.DataItem, "IssueNo") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn SortExpression="OrderNo" UniqueName="OrderNo" HeaderText="Order No" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "OrderNo") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="OrderNoLbl" runat="server" Visible="true" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNo") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            
                            <telerik:GridTemplateColumn SortExpression="ToteBinNotes" UniqueName="ToteBinNotes" HeaderText="Tote Bin Notes" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "ToteBinNotes") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn SortExpression="ToteBinStaus" UniqueName="ToteBinStatus" HeaderText="Tote Bin Status" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "ToteBinStatusDescr") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn SortExpression="AddDate" UniqueName="AddDate" HeaderText="Add Date" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "AddDate","{0:dd/MMM/yyyy HH:mm:ss}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                      <asp:Label ID="AddDateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AddDate","{0:dd/MMM/yyyy HH:mm:ss}") %>'></asp:Label>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn SortExpression="adduser" UniqueName="adduser" HeaderText="Add User" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "adduser") %>
                                </ItemTemplate>
                               <EditItemTemplate>
                                      <asp:Label ID="AddUserLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "adduser") %>'></asp:Label>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn SortExpression="EditDate" UniqueName="EditDate" HeaderText="Edit Date" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "EditDate","{0:dd/MMM/yyyy HH:mm:ss}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                      <asp:Label ID="EditDateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EditDate","{0:dd/MMM/yyyy HH:mm:ss}") %>'></asp:Label>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn SortExpression="edituser" UniqueName="edituser" HeaderText="Edit User" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "edituser") %>
                                </ItemTemplate>
                               <EditItemTemplate>
                                      <asp:Label ID="EditUserLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "edituser") %>'></asp:Label>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="ToteBinStatus" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ToteBinStatusColourCode" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
