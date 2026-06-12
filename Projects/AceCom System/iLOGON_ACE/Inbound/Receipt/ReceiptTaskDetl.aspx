<%@ Page Language="c#" CodeBehind="ReceiptTaskDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.Receipt.ReceiptTaskDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>ReceiptTaskDetl</title>
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
                    <asp:Button ID="AddDetailBtn" runat="server" Text="New Line" Visible="False" CssClass="detailButton"
                        OnClick="AddDetailBtn_Click"></asp:Button>
                    <br />
                    <asp:Button ID="DelImgBtn" runat="server" Text="Delete" OnClick="DeleteAllBtn_Click"
                        CssClass="white" UseSubmitBehavior="false" />
                </td>
                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>

        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            OnEditCommand="ResultDG_Edit" GroupPanelPosition="Top" OnUpdateCommand="ResultDG_UpdateCommand"
            OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace"
                CommandItemDisplay="Top">
                <RowIndicatorColumn Visible="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn Created="True">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
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
                    <telerik:GridTemplateColumn UniqueName="taskcodedescr" HeaderText="Task">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="50px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taskcodedescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="TaskList" runat="server" DefaultMessage="Select a Task"
                                DropDownHeight="150px" Skin="Sunset" DataSource='<%# taskListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taskListDS,DataBinder.Eval(Container.DataItem, "taskcode").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="TaskListReqVal" runat="server" ControlToValidate="TaskList"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartDate" runat="server" Text="Start Date" Width="150px" Style="text-align: center"></asp:Label>
                            <br />
                            <asp:Label ID="lblEndDate" runat="server" Text="End Date" Width="150px" Style="text-align: center"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startdate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "enddate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="StartDateListReqVal" runat="server" ControlToValidate="StartDatePicker"
                                ErrorMessage="*" />
                            <telerik:RadDateTimePicker ID="StartDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                                DateInput-TimeFormat="HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss"
                                PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "startdate") %>'
                                DateInput-Skin="Sunset" DateInput-BackColor="Yellow">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDateTimePicker>
                            <br />
                            <asp:RequiredFieldValidator ID="EndDateListReqVal" runat="server" ControlToValidate="EndDatePicker"
                                ErrorMessage="*" />
                            <telerik:RadDateTimePicker ID="EndDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                                DateInput-TimeFormat="HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" Skin="Office2007"
                                PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "enddate") %>'
                                DateInput-Skin="Sunset" DateInput-BackColor="Yellow">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDateTimePicker>
                            <br />
                            <asp:CompareValidator ID="ComVal" runat="server" ControlToValidate="StartDatePicker" ControlToCompare="EndDatePicker" Operator="LessThanEqual"
                                EnableClientScript="true" Type="String" ErrorMessage="StartDate should be eailer than EndDate" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Status" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartStatus" runat="server" Text="Start Status"></asp:Label>
                            <br />
                            <asp:Label ID="lblEndStatus" runat="server" Text="End Status"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startstatusdescr")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "endstatusdescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="StartStatusList" runat="server" DefaultMessage="Select a Start Status"
                                DropDownHeight="150px" DataSource='<%# startstatusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(startstatusListDS,DataBinder.Eval(Container.DataItem, "startstatus").ToString())%>'
                                DataTextField="descr" DataValueField="item" Skin="Sunset">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="StartStatusListReqVal" runat="server" ControlToValidate="StartStatusList"
                                ErrorMessage="*" />
                            <br />
                            <telerik:RadDropDownList ID="EndStatusList" runat="server" DefaultMessage="Select a End Status"
                                DropDownHeight="150px" DataSource='<%# endstatusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(endstatusListDS,DataBinder.Eval(Container.DataItem, "endstatus").ToString())%>'
                                DataTextField="descr" DataValueField="item" Skin="Sunset">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="EndStatusListReqVal" runat="server" ControlToValidate="EndStatusList"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="startreason">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartReason" runat="server" Text="Start Reason"></asp:Label>
                            <br />
                            <asp:Label ID="lblEndReason" runat="server" Text="End Reason"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startreason")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "endreason")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtStartReason" Text='<%# DataBinder.Eval(Container.DataItem, "startreason") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                            <br />
                            <telerik:RadTextBox runat="server" ID="txtEndReason" Text='<%# DataBinder.Eval(Container.DataItem, "endreason") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="startremark">
                        <HeaderTemplate>
                            <asp:Label ID="txtStartRemarks" runat="server" Text="Start Remarks" DataField="startstatusremarks"></asp:Label>
                            <br />
                            <asp:Label ID="txtEndRemarks" runat="server" Text="End Remarks" DataField="startstatusremarks"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startremarks")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "endremarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtStartRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "startremarks") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                            <br />
                            <telerik:RadTextBox runat="server" ID="txtEndRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "endremarks") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="resource" HeaderText="Resource">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "resource")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtresource" Text='<%# DataBinder.Eval(Container.DataItem, "resource") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
