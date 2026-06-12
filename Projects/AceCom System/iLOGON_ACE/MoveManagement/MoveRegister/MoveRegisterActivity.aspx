<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveRegisterActivity.aspx.cs" Inherits="iWMS.Web.MoveManagement.MoveRegister.MoveRegisterActivity" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>MoveRegisterActivity</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClick() {
                var Grid = $find("<%= ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length; i++) {
                    var row = MasterTable.get_dataItems()[i];
                    if (row.get_expanded() == false) {
                        row.set_expanded(true);
                    }
                    else
                        row.set_expanded(false);
                }
                var btn = document.getElementById(id);
                btn.disabled = true;
            }
        </script>
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
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table border="0" cellspacing="0" cellpadding="0">
                    <asp:Panel runat="server" ID="NewAtvt_Panel">
                        <tr>
                            <td>
                                <asp:Button ID="NewAtvtBtn" runat="server" Text="NewATVT" CssClass="white" OnClick="NewAtvtBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="CollapseExpandBtn" runat="server" Text="Show/Hide" CssClass="white" 
                                    OnClientClick="OnClientClick(this.id)" UseSubmitBehavior="false" />                      
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="DeleteAtvtBtn" runat="server" Text="DelATVT" CssClass="white" OnClick="DeleteAtvtBtn_Click" 
                                    CausesValidation="false" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                 <asp:Button ID="JobSheetBtn" runat="server" CssClass="blue" Text="JobSheet" OnClick="JobSheetBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CausesValidation="False"  />
                                &nbsp;
                            </td>
                            <td>
                                 <asp:Button ID="DeliveryNoteBtn" runat="server" CssClass="blue" Text="DeliveryNote" OnClick="DeliveryNoteBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False"  />
                                &nbsp;
                            </td>
                            <td class="pagetitle">
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                                    Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="AddAtvt_Panel">
                        <tr>
                            <td>
                                <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save &amp; Next" OnClick="SaveNextBtn_Click" 
                                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click" 
                                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="white" Text="Hide" OnClick="ClosePanelBtn_Click" 
                                    UseSubmitBehavior="false" CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemCommand="ResultDG_ItemCommand"
                    AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                     OnCancelCommand="ResultDG_CancelCommand">
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="AtvtHead"
                        TableLayout="Fixed" ItemStyle-Wrap="true" HeaderStyle-Wrap="true" AlternatingItemStyle-Wrap="true"
                        HierarchyLoadMode="Client" HeaderStyle-Width="45%">
                        <Columns>
                            <telerik:GridTemplateColumn HeaderStyle-Width="35px" ItemStyle-Width="35px" Reorderable="false"
                                UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="false"
                                UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="ldEdit" ImageUrl="../../image/pencil.gif" Width="15"
                                        Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                        OnClick="JBPerAtvt_Edit" CausesValidation="False"></asp:ImageButton>
                                    <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="JBPerAtvt_Copy"
                                        runat="server">
                                        <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                            title="Copy" runat="server" />
                                    </a>
                                    <a id="AddLbl" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="AddBtn_Click"
                                        runat="server">
                                        <img id="addImg" src="../../image/add.png" width="15" height="15" border="0" alt="Add PerHead"
                                            runat="server">
                                    </a>
                                    &nbsp;&nbsp;&nbsp;<asp:Label ID="DetailLbl" runat="server" />
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="JBPerAtvt_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete JBPerAtvt"
                                            title="Delete JBPerAtvt" runat="server" />
                                    </a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="40px" ItemStyle-Width="40px" Reorderable="false"
                                UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="300px" ItemStyle-Width="300px" SortExpression="id"
                                HeaderText="jbperatvtid" DataField="id" UniqueName="jbperatvtid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Activity" DataField="peratvtcodedescr" AllowFiltering="true"
                                ColumnGroupName="peratvtcodedescr" SortExpression="peratvtcodedescr" UniqueName="peratvtcodedescr"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="120px" />
                                <ItemStyle Wrap="true" Width="120px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Activity Remarks" DataField="atvtremarks" AllowFiltering="true"
                                ColumnGroupName="atvtremarks" SortExpression="atvtremarks" UniqueName="AtvtRemarks"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                                ColumnGroupName="status" SortExpression="status" UniqueName="status" Visible="false"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExpStartDate" DataField="frexpdate" AllowFiltering="true"
                                ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Category" DataField="cat" AllowFiltering="true"
                                ColumnGroupName="cat" SortExpression="cat" UniqueName="cat" Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FrAddr" DataField="frservicept" AllowFiltering="true"
                                ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toservicept" AllowFiltering="true"
                                ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                                Reorderable="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GoodsDescr" DataField="AtvtGoodsDescr" AllowFiltering="true"
                                ColumnGroupName="AtvtGoodsDescr" SortExpression="AtvtGoodsDescr" UniqueName="AtvtGoodsDescr"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="130px" />
                                <ItemStyle Wrap="true" Width="130px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                                ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true"
                                Display="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn HeaderText="ManRequired" DataField="ManRequired" AllowFiltering="true"
                                ColumnGroupName="ManRequired" SortExpression="ManRequired" UniqueName="ManRequired"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="130px" />
                                <ItemStyle Wrap="true" Width="130px" />
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn HeaderText="VehicleRequired" DataField="VehRequired" AllowFiltering="true"
                                ColumnGroupName="VehRequired" SortExpression="VehRequired" UniqueName="VehRequired"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="130px" />
                                <ItemStyle Wrap="true" Width="130px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                                ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                                ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                                ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                                Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                                ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                                ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                                ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                                Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <DetailTables>
                            <telerik:GridTableView DataKeyNames="JPDId" Name="AtvtDetl" Width="100%" SkinID="Telerik"
                                runat="server" EditMode="InPlace">
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="JPAId" MasterKeyField="id" />
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="1%" ItemStyle-Width="1%" Reorderable="false"
                                        UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="checkkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="3%">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                Width="16" Height="16" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DelRide"
                                                ImageUrl="../../image/bin.gif" Width="16" Height="16" AlternateText="Delete"
                                                CommandName="DetailDelete" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="DetailUpdate" ImageUrl="../../image/floppy.gif"
                                                Width="16" Height="16" AlternateText="Update" CommandName="DetailUpdate" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="DetailCancel" ImageUrl="../../image/arrow6.gif"
                                                Width="16" Height="16" AlternateText="Cancel" CommandName="DetailCancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                        HeaderStyle-Width="1%" ItemStyle-Width="1%">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn SortExpression="id" HeaderText="jbperhid" DataField="id"
                                        UniqueName="jbperhid" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="DateTime" HeaderText="DateTime" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy}")%>
                                            <br />
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "frexptime") %>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                             <%# DataBinder.Eval(Container.DataItem, "toacttime") %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="StartDatePicker" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "frexpdate")  %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <br />
                                            <asp:Label runat="server" ID="frtimelbl" Text="FrTime" />
                                            <telerik:RadDropDownList ID="FrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%#TimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TimeDS,DataBinder.Eval(Container.DataItem, "frexptime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="FrTimeDDLReqVal" runat="server"
                                                ControlToValidate="FrTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                            <asp:Label runat="server" ID="totimelbl" Text="ToTime" />
                                            <telerik:RadDropDownList ID="ToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%#TimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TimeDS,DataBinder.Eval(Container.DataItem, "toacttime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="ToTimeDDLReqVal" runat="server"
                                                ControlToValidate="ToTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn SortExpression="Type" UniqueName="Type" HeaderText="Type">
                                         <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Type") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="TypeDDL" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%#TypeDS%>' Skin="WebBlue" ExpandDirection="Up"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TypeDS,DataBinder.Eval(Container.DataItem, "Type").ToString())%>'>
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PerName" HeaderText="Name">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("PerName")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="NameTxt" Text='<%# DataBinder.Eval(Container.DataItem, "PerName") %>'
                                                TextMode="SingleLine" Enabled="false">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </telerik:GridTableView>
                        </DetailTables>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="JobSheetBtn" />
                <asp:PostBackTrigger ControlID="DeliveryNoteBtn" />
                <%--<asp:PostBackTrigger ControlID="SaveBtn" />--%>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>

