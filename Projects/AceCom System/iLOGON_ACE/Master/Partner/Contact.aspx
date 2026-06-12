<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="iWMS.Web.Master.Partner.Contact" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Contact</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

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
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">

                    <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Text="New Line" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />

                    <br />
                    <asp:Button ID="DelImgBtn" class="white" runat="server" OnClick="DeleteAllBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
                    &nbsp;
                    <asp:Button ID="ApplyToBtn" runat="server" CssClass="LongLabelWhite"
                                OnClick="ApplyToBtn_Click" Text="ApplyTo" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelToBtn" runat="server" CssClass="LongLabelWhite"
                                OnClick="CancelToBtn_Click" Text="CancelTo" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>

                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>&nbsp;
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
        <br />
        <div id="grid" style="width: 1500px;">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
                AllowPaging="True" AllowSorting="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand" OnUpdateCommand="ResultDG_UpdateCommand"
                GroupPanelPosition="Top" OnItemCreated="ResultDG_ItemCreated">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace"
                    CommandItemDisplay="Top">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                                <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                    Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                    CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="TaskDetail_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                        title="Delete Detail" runat="server" /></a>
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
                        <telerik:GridTemplateColumn UniqueName="type" HeaderText="Type">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "type")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlType" DataSource='<%# PartnerTypeDS%>' Width="120px" DropDownHeight="150px" Skin="Sunset" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PartnerTypeDS,DataBinder.Eval(Container.DataItem, "type").ToString())%>'>
                                </telerik:RadDropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlType" ErrorMessage="*" CssClass="errorLabelBig"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="name">
                            <HeaderTemplate>
                                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle Wrap="false" Width="200px" />
                            <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "name")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="txtName" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>'
                                    TextMode="MultiLine" Rows="2" Width="90%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="EmailAddress">
                            <HeaderTemplate>
                                <asp:Label ID="lblemail" runat="server" Text="EmailAddress"></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle Wrap="false" Width="200px" />
                            <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "EmailAddress")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="txtemail" Text='<%# DataBinder.Eval(Container.DataItem, "EmailAddress") %>'
                                    TextMode="MultiLine" Rows="2" Width="90%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="telno">
                            <HeaderTemplate>
                                <asp:Label ID="lblSalutation" runat="server" Text="Telno"></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle Wrap="false" Width="200px" />
                            <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "telno")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="txtTelno" Text='<%# DataBinder.Eval(Container.DataItem, "telno") %>'
                                    TextMode="MultiLine" Rows="2" Width="90%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="mobileno" HeaderText="Mobileno">
                            <HeaderStyle Wrap="false" />
                            <ItemStyle Wrap="False" HorizontalAlign="Left" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "mobileno")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="txtMobileno" Text='<%# DataBinder.Eval(Container.DataItem, "mobileno") %>'
                                    TextMode="MultiLine" Rows="2" Width="90%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="remarks" HeaderText="Remarks">
                            <HeaderStyle Wrap="false" />
                            <ItemStyle Wrap="False" HorizontalAlign="Left" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="txtRemarks" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'
                                    TextMode="MultiLine" Rows="2" Width="100%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="120px" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "status")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlStatus" DataSource='<%# PartnerStatusDS%>'
                                    Skin="WebBlue" DataTextField="descr" DataValueField="item" Width="70%" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PartnerStatusDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="statuscolour" Display="false" Reorderable="true">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
