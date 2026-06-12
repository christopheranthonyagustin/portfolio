<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccountConsignee.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CustomerAccountConsignee" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ServicePt</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

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
    
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
        AllowPaging="True" AllowSorting="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" 
        OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand" OnUpdateCommand="ResultDG_UpdateCommand"
        on GroupPanelPosition="Top">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace"
            CommandItemDisplay="Top">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px"></ItemStyle>
                    <HeaderStyle Wrap="false" Width="100px"></HeaderStyle>
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
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px"
                    HeaderText="S/N">
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn> 
                
                 <telerik:GridTemplateColumn UniqueName="Code" HeaderText="Code">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "code")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtCode" Text='<%# DataBinder.Eval(Container.DataItem, "code") %>'
                                Rows="2" Width="90%">
                            </telerik:RadTextBox>
                             <asp:RequiredFieldValidator ID="ChecktxtCodeReqVal" runat="server" ControlToValidate="txtCode"
                            ErrorMessage="*" ForeColor="Red"  />
                        </EditItemTemplate>
                    
                    </telerik:GridTemplateColumn>     
                  
                <telerik:GridTemplateColumn UniqueName="partnername" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Width="300px" HeaderStyle-Width="300px">
                     <HeaderTemplate>
                        <asp:Label ID="lblName" runat="server" Text="PartnerName"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="50px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "PARTNERCodeName")%>
                    </ItemTemplate>
                        <EditItemTemplate>
                                    <telerik:RadComboBox ID="partnernameCBB" runat="server" DefaultMessage="Select a Partner" Width="200px"
                                     Skin="Sunset" DropDownHeight="150px" DataSource='<%# partnerDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(partnerDS,DataBinder.Eval(Container.DataItem, "partnerid").ToString())%>'
                                        DataTextField="Descr" DataValueField="Item"  RenderMode="Lightweight" Filter="Contains" Enabled="false"
                                        AutoPostBack="true" CausesValidation="false" BackColor="#ded7c6" OnSelectedIndexChanged="partnernamecombo_SelectedIndexChanged">
                                    </telerik:RadComboBox>
                                 <asp:RequiredFieldValidator ID="TaskListReqVal" runat="server" ControlToValidate="partnernameCBB"
                            ErrorMessage="*" ForeColor="Red"  />
                   </EditItemTemplate>
                </telerik:GridTemplateColumn> 

                 <telerik:GridTemplateColumn UniqueName="Shelflife" HeaderText="Shelflife">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Shelflife")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtShelflife" Text='<%# DataBinder.Eval(Container.DataItem, "Shelflife") %>'
                                Rows="2" Width="90%">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="CheckShelflife" runat="server" ControlToValidate="txtShelflife"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>     

                <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList runat="server" ID="ddlStatus" DataSource='<%# AcConsigneeStatus%>'
                            Skin="WebBlue" DataTextField="descr" DataValueField="item" Width="90%" 
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(AcConsigneeStatus,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                        </telerik:RadDropDownList>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                 <telerik:GridBoundColumn HeaderText="" DataField="status" Display="false" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="" DataField="statuscolour" Display="false" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                 </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" ReadOnly="True">
                 </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                   DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                  </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" ReadOnly="True">
                  </telerik:GridBoundColumn> 
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
