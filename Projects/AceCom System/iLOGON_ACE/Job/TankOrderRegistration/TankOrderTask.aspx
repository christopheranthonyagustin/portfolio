<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderTask.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderTask" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TankOrderTask</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />

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
<body>
    <form id="form1" method="post" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <telerik:RadButton ID="GenerateBtn" runat="server" OnClick="GenerateDetailBtn_Click"
                    Text="Generate" Skin="WebBlue" SingleClick="true" SingleClickText="Processing...">
                </telerik:RadButton>
                &nbsp;
                <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png" Visible="false"
                    OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                    ToolTip="Delete" />
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
        AllowFilteringByColumn="false" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
        OnEditCommand="ResultDG_Edit" OnUpdateCommand="ResultDG_Update" OnItemCommand="ResultDG_ItemCommand">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
            EditMode="InPlace">
            <Columns>
                <telerik:GridTemplateColumn UniqueName="icon" Reorderable="false">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="70px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="70px" />
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="TaskDetail_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                title="Delete Detail" runat="server" /></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="serialno" AllowFiltering="false" HeaderText="S/N">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="30px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="30px" />
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        &nbsp;
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="taskcodedescr" HeaderText="Task">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "taskcodedescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="TaskList" runat="server" DefaultMessage="Select a Task"
                            DropDownHeight="150px" Skin="WebBlue" DataSource='<%# taskListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taskListDS,DataBinder.Eval(Container.DataItem, "taskcode").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList>
                        <asp:RequiredFieldValidator ID="TaskListReqVal" runat="server" ControlToValidate="TaskList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="100px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "statusdescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="StatusList" runat="server" DefaultMessage="Select a Status"
                            DropDownHeight="150px" Skin="WebBlue" DataSource='<%# statusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusListDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList>
                        <asp:RequiredFieldValidator ID="StatusListReqVal" runat="server" ControlToValidate="StatusList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="startdate" HeaderText="Date">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="130px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="130px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "startdate", "{0:dd/MMM/yyyy}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDatePicker ID="StartDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                            Skin="Office2007" PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "startdate") %>'>
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="startremarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "startremarks")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="StartRemTxt" Text='<%# DataBinder.Eval(Container.DataItem, "startremarks") %>' 
                            TextMode="MultiLine" Rows="2" Width="90%">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="statuscolour" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
