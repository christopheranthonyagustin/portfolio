<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelServicePt.aspx.cs" Inherits="iWMS.Web.Master.Personnel.PersonnelServicePt" %>
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
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png"
                    Visible="false" OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0" style="width: 30px; height: auto; margin-bottom:3px;margin-left: 5px"
                    ImageAlign="AbsMiddle" ToolTip="Delete" />
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
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
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ActionType")%>
                    </ItemTemplate>
                    <EditItemTemplate>                     
                        <telerik:RadDropDownList ID="ddlActionType" runat="server" DefaultMessage="Select a ActionType"
                            DropDownHeight="150px" Skin="WebBlue" DataSource='<%# actiontypeDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(actiontypeDS,DataBinder.Eval(Container.DataItem, "ActionType").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList>                                    
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn UniqueName="Cat">
                    <HeaderTemplate>
                        <asp:Label ID="lblCat" runat="server" Text="Cat"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="150px" />
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
                <telerik:GridTemplateColumn UniqueName="ServicePt" HeaderText="ServicePt">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="50px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ServicePt")%>
                    </ItemTemplate>
                <EditItemTemplate>
                                    <telerik:RadComboBox ID="ServicePt" runat="server" DefaultMessage="Select a Charge"
                                     Skin="Sunset" DropDownHeight="150px" DataSource='<%# servicePtDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(servicePtDS,DataBinder.Eval(Container.DataItem, "ServicePt").ToString())%>'
                                        DataTextField="descr" DataValueField="item"  RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" BackColor="#ded7c6" >
                                    </telerik:RadComboBox>
                                   <asp:TextBox ID="ChargeCodeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "ServicePt") %>' BackColor="#ded7c6"/>
                                 <asp:RequiredFieldValidator ID="TaskListReqVal" runat="server" ControlToValidate="ServicePt"
                            ErrorMessage="*" />
                   </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="ExpiryDate" HeaderText="ExpiryDate">
                    <HeaderTemplate>
                        <asp:Label ID="lblExpiryDate" runat="server" Text="ExpiryDate" Width="150px" Style="text-align: center"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ExpiryDate", "{0: dd/MMM/yyyy}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="StartDateListReqVal" runat="server" ControlToValidate="ExpiryDate"
                            ErrorMessage="*" />
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
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
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
                
               <%-- <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "status")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="txtStatus" Text='<%# DataBinder.Eval(Container.DataItem, "status") %>'
                            TextMode="MultiLine" Rows="2" Width="90%">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>--%>
                
                
                <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="120px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="120px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList runat="server" ID="ddlStatus" DataSource='<%# PerServicePtStatus%>'
                            Skin="WebBlue" DataTextField="descr" DataValueField="item" Width="90%" 
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerServicePtStatus,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
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
