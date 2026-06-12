<%@ Page Language="c#" CodeBehind="Contact.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Account.Contact" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">
                    <%--<asp:Button ID="AddDetailBtn" runat="server" Text="New Line" Visible="False" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>--%>
                    <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Text="New Line" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
                    <%--<asp:Button ID="Generate" runat="server" Text="Generate" Visible="true" CssClass="detailButton"
                    OnClick="GenerateDetailBtn_Click"></asp:Button>--%>

                    <%--Commented out at 04/Dec/2017 for ticket 5968--%>
                    <%--<asp:Button ID="Generate" class="white" runat="server" OnClick="GenerateDetailBtn_Click" Text="Generate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />--%>

                    <%--<asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png"
                    Visible="false" OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0"
                    ImageAlign="AbsMiddle" ToolTip="Delete" />--%>
                    <br />
                    <asp:Button ID="DelImgBtn" class="white" runat="server" OnClick="DeleteAllBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
                </td>
                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>&nbsp;
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
                    CommandItemDisplay="Top" >
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
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            HeaderText="S/N">
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="type" HeaderText="Type">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "typedescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlType" DataSource='<%# AcTypeDS%>' Width="120px" DropDownHeight="150px" Skin="Sunset" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(AcTypeDS,DataBinder.Eval(Container.DataItem, "type").ToString())%>'>
                                </telerik:RadDropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlType" ErrorMessage="*" CssClass="errorLabelBig"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Salutation" UniqueName="salutation">
                            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                            <HeaderStyle Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "salutation")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="SalDDL" Width="120px" DropDownHeight="150px"
                                    Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SalutationDS,DataBinder.Eval(Container.DataItem, "salutation").ToString())%>'
                                    DataSource='<%# SalutationDS%>' DataTextField="descr" DataValueField="item">
                                </telerik:RadDropDownList>
                                <asp:TextBox ID="SalTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "salutation") %>' />
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
                        <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="120px" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "status")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlStatus" DataSource='<%# AcStatusDS%>'
                                    Skin="WebBlue" DataTextField="descr" DataValueField="item" Width="70%" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(AcStatusDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                                </telerik:RadDropDownList>
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
                        <telerik:GridBoundColumn HeaderText="" DataField="statuscolour" Display="false" Reorderable="true">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
