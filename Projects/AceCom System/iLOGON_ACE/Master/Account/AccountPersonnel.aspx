<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountPersonnel.aspx.cs" Inherits="iWMS.Web.Master.Account.AccountPersonnel" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ServicePt</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
                <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png"
                    Visible="false" OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0" style="width: 30px; height:auto; margin-left: 10px; margin-top: 3px"
                    ImageAlign="AbsMiddle" ToolTip="Delete" />
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
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
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
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
                  
                <telerik:GridTemplateColumn UniqueName="ActionType">
                    <HeaderTemplate>
                        <asp:Label ID="lblName" runat="server" Text="ActionType"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" Width="200px" />
                    <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ActionType")%>
                    </ItemTemplate>
                    <EditItemTemplate>    
                         <asp:RequiredFieldValidator ID="actiontypeReqVal" runat="server" ControlToValidate="ddlActionType"
                            ErrorMessage="*" />                     
                        <telerik:RadDropDownList ID="ddlActionType" runat="server" DefaultMessage="Select a ActionType"
                            DropDownHeight="150px" Skin="WebBlue" DataSource='<%# actiontypeDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(actiontypeDS,DataBinder.Eval(Container.DataItem, "ActionType").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList> 
                         <%--<asp:TextBox ID="CodeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "ActionType") %>' BackColor="#ded7c6"/>--%>
                                                              
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn UniqueName="Cat">
                    <HeaderTemplate>
                        <asp:Label ID="lblCat" runat="server" Text="Cat"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" Width="150px" />
                    <ItemStyle HorizontalAlign="Left" Width="150px" Wrap="false" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "Cat")%>
                    </ItemTemplate>
                        <EditItemTemplate>
                       <telerik:RadDropDownList ID="ddlCat" runat="server" DefaultMessage="Select a Cat"
                            DropDownHeight="150px" Skin="WebBlue" DataSource='<%# cattypeDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(cattypeDS,DataBinder.Eval(Container.DataItem, "cat").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList>                  
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn UniqueName="pername">
                     <HeaderTemplate>
                        <asp:Label ID="lblName" runat="server" Text="Personnel"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" Width="50px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="50px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "pername")%>
                    </ItemTemplate>
                <EditItemTemplate>
                                    <telerik:RadComboBox ID="pernamecombo" runat="server" DefaultMessage="Select a Personnel"
                                     Skin="Sunset" DropDownHeight="150px" DataSource='<%# personnelDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(personnelDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'
                                        DataTextField="descr" DataValueField="item"  RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" BackColor="#ded7c6" >
                                    </telerik:RadComboBox>
                                 <asp:RequiredFieldValidator ID="TaskListReqVal" runat="server" ControlToValidate="pernamecombo"
                            ErrorMessage="*" />
                   </EditItemTemplate>
                </telerik:GridTemplateColumn> 
                <telerik:GridTemplateColumn UniqueName="ExpiryDate" HeaderText="ExpiryDate">
                    <HeaderTemplate>
                        <asp:Label ID="lblExpiryDate" runat="server" Text="ExpiryDate" Width="150px"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" Width="250px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="250px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ExpiryDate", "{0: dd/MMM/yyyy}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <%--<asp:RequiredFieldValidator ID="StartDateListReqVal" runat="server" ControlToValidate="ExpiryDate"
                            ErrorMessage="*" />--%>
                        <telerik:RadDatePicker ID="ExpiryDate" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-TimeFormat="HH:mm" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy"
                            PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ExpiryDate") %>'
                            Skin="Sunset" AutoPostBackControl="Both" BackColor="#ded7c6" DateInput-BackColor="#ded7c6">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                       </telerik:RadDatePicker>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn UniqueName="remarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="false" Width="250px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="250px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="txtRemarks" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'
                            TextMode="MultiLine" Rows="2" Width="90%">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status">
                    <HeaderStyle Wrap="false" Width="120px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="120px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList runat="server" ID="ddlStatus" DataSource='<%# AcPersonnelStatus%>'
                            Skin="WebBlue" DataTextField="descr" DataValueField="item" Width="90%" 
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(AcPersonnelStatus,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                        </telerik:RadDropDownList>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                
                 <telerik:GridBoundColumn HeaderText="" DataField="status" Display="false" Reorderable="true">
                </telerik:GridBoundColumn>
                               
                <telerik:GridBoundColumn HeaderText="" DataField="statuscolour" Display="false" Reorderable="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>