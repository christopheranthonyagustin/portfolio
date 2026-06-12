<%@ Page Language="c#" CodeBehind="TransportTaskDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterLD.TransportTaskDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportTaskDetl</title>
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

    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>

    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <%--<div style="height: 95%; overflow-y: hidden" id="div-datagrid">--%>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">
                    <asp:Button ID="AddDetailBtn" runat="server" Text="New Line" Visible="False" CssClass="detailButton"
                        OnClick="AddDetailBtn_Click"></asp:Button>
                    &nbsp;
                <asp:Button ID="GenerateBtn" runat="server" CssClass="white" Visible="true" Text="Generate" OnClick="GenerateDetailBtn_Click" OnClientClick="disableBtn(this.id,false)"/>
                    &nbsp;  
                <asp:Button ID="DelImageBtn" runat="server" CssClass="white" Text="Delete" OnClick="DeleteAllBtn_Click" OnClientClick="return confirm('Confirm to delete the selected Container(s)?')" Visible="true" />
                     &nbsp;
                </td>
                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" GridLines="None" AllowSorting="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand" OnUpdateCommand="ResultDG_UpdateCommand"
            GroupPanelPosition="Top">
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="7" DataKeyNames="id" EditMode="InPlace"
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
                    <%--       <telerik:GridBoundColumn HeaderText="Task" DataField="taskcodedescr" AllowFiltering="true"
                    ColumnGroupName="taskcodedescr" SortExpression="taskcodedescr" UniqueName="taskcodedescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>--%>
                    <telerik:GridTemplateColumn UniqueName="taskcodedescr" HeaderText="Task">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="50px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taskcodedescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>                   
                            <telerik:RadComboBox ID="TaskList" runat="server" DefaultMessage="Select a Task"
                                DropDownHeight="150px" Skin="Sunset" DataSource='<%# taskListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taskListDS,DataBinder.Eval(Container.DataItem, "taskcode").ToString())%>'
                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                CausesValidation="false">
                            </telerik:RadComboBox>  
                            <asp:TextBox ID="TaskListReqVal" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "taskcodedescr") %>' />                          
                            <%-- <asp:RequiredFieldValidator ID="TaskListReqVal" runat="server" ControlToValidate="TaskList"
                            ErrorMessage="*" />--%>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--           <telerik:GridDateTimeColumn HeaderText="Start Date" DataField="startdate" AllowFiltering="true"
                    ColumnGroupName="startdate" SortExpression="startdate" UniqueName="startdate"
                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridDateTimeColumn>--%>
                    <%-- <telerik:GridDateTimeColumn HeaderText="End Date" DataField="enddate" AllowFiltering="true"
                    ColumnGroupName="enddate" SortExpression="enddate" UniqueName="enddate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy hh:mm:ss tt}">
                </telerik:GridDateTimeColumn>--%>
                    <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date">
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblStartDate" runat="server" Text="StartDate" Width="150px" Style="text-align: center" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEndDate" runat="server" Text="EndDate" Width="150px" Style="text-align: center" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startdate", "{0: dd/MMM/yyyy HH:mm}")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "enddate", "{0: dd/MMM/yyyy HH:mm}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="StartDateListReqVal" runat="server" ControlToValidate="StartDatePicker"
                                ErrorMessage="*" />
                            <telerik:RadDateTimePicker ID="StartDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                DateInput-TimeFormat="HH:mm" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm"
                                PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "startdate") %>'
                                Skin="Office2007" AutoPostBackControl="Both" OnSelectedDateChanged="StartDatePicker_OnDateSelectedChanged"
                                DateInput-BackColor="Yellow">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDateTimePicker>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EndDatePicker"
                                ErrorMessage="*" />
                            <telerik:RadDateTimePicker ID="EndDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                DateInput-TimeFormat="HH:mm" TimeView-TimeFormat="HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "enddate") %>' DateInput-Skin="Sunset"
                                DateInput-BackColor="Yellow">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--               <telerik:GridBoundColumn HeaderText="Start Status" DataField="startstatusdescr" AllowFiltering="true"
                    ColumnGroupName="startstatusdescr" SortExpression="startstatusdescr" UniqueName="startstatusdescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                --%>
                    <%-- <telerik:GridBoundColumn HeaderText="End Status" DataField="endstatusdescr" AllowFiltering="true"
                    ColumnGroupName="endstatusdescr" SortExpression="endstatusdescr" UniqueName="endstatusdescr"
                    Reorderable="true">--%>
                    <telerik:GridTemplateColumn UniqueName="Status" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartStatus" runat="server" Text="StartStatus"></asp:Label>
                            <br />
                            <asp:Label ID="lblEndStatus" runat="server" Text="EndStatus"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startstatus")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "endstatus")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="StartStatusList" runat="server" DropDownHeight="150px"
                                Skin="Sunset" DataSource='<%# startstatusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(startstatusListDS,DataBinder.Eval(Container.DataItem, "startstatus").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                            <%-- <asp:RequiredFieldValidator ID="StartStatusListReqVal" runat="server" ControlToValidate="StartStatusList"
                            ErrorMessage="*" />--%>
                            <br />
                            <telerik:RadDropDownList ID="EndStatusList" runat="server" DropDownHeight="150px"
                                Skin="Sunset" DataSource='<%# endstatusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(endstatusListDS,DataBinder.Eval(Container.DataItem, "endstatus").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                            <%--   <asp:RequiredFieldValidator ID="EndStatusListReqVal" runat="server" ControlToValidate="EndStatusList"
                            ErrorMessage="*" />--%>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--         <telerik:GridBoundColumn HeaderText="Start Reason" DataField="startreason" AllowFiltering="true"
                    ColumnGroupName="startreason" SortExpression="startreason" UniqueName="startreason"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn HeaderText="End Reason" DataField="endreason" AllowFiltering="true"
                    ColumnGroupName="endreason" SortExpression="endreason" UniqueName="endreason"
                    Reorderable="true">
                </telerik:GridBoundColumn>--%>
                    <telerik:GridTemplateColumn UniqueName="startreason">
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblStartReason" runat="server" Text="StartReason" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEndReason" runat="server" Text="EndReason" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startreason")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "endreason")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadTextBox runat="server" ID="txtStartReason" Text='<%# DataBinder.Eval(Container.DataItem, "startreason") %>'
                                            TextMode="MultiLine" Rows="2" Width="90%">
                                        </telerik:RadTextBox>
                                        <tr>
                                            <td>
                                                <telerik:RadTextBox runat="server" ID="txtEndReason" Text='<%# DataBinder.Eval(Container.DataItem, "endreason") %>'
                                                    TextMode="MultiLine" Rows="2" Width="90%">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                            </table>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--      
                <telerik:GridBoundColumn HeaderText="Start Remarks" DataField="startremarks" AllowFiltering="true"
                    ColumnGroupName="startremarks" SortExpression="startremarks" UniqueName="startremarks"
                    Reorderable="true">
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="End Remarks" DataField="endremarks" AllowFiltering="true"
                    ColumnGroupName="endremarks" SortExpression="endremarks" UniqueName="endremarks"
                    Reorderable="true">
                </telerik:GridBoundColumn>--%>
                    <telerik:GridTemplateColumn UniqueName="startremark">
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="txtStartRemarks" runat="server" Text="StartRemarks" DataField="startstatusremarks" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="txtEndRemarks" runat="server" Text="EndRemarks" DataField="endstatusremarks" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startremarks")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "endremarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadTextBox runat="server" ID="txtStartRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "startremarks") %>'
                                            TextMode="MultiLine" Rows="2" Width="90%">
                                        </telerik:RadTextBox>
                                    </td>
                                    <tr>
                                        <td>
                                            <telerik:RadTextBox runat="server" ID="txtEndRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "endremarks") %>'
                                                TextMode="MultiLine" Rows="2" Width="90%">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                            </table>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--             
                <telerik:GridBoundColumn HeaderText="Vendor" DataField="vendorname" AllowFiltering="true"
                    ColumnGroupName="vendorname" SortExpression="vendorname" UniqueName="vendorname"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                --%>
                    <telerik:GridTemplateColumn UniqueName="vendorname" HeaderText="Vendor">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "vendorname")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="Vendor" runat="server" DropDownHeight="150px" Skin="Sunset"
                                DataSource='<%# vendorlistDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vendorlistDS,DataBinder.Eval(Container.DataItem, "vendorid").ToString())%>'
                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                CausesValidation="false">
                            </telerik:RadComboBox>
                            <%--<asp:TextBox ID="VdNameTxt" runat="server" Width="150" d Value='<%# DataBinder.Eval(Container.DataItem, "vdname") %>' /> --%>                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%-- <telerik:GridBoundColumn HeaderText="Resource" DataField="resource" AllowFiltering="true"
                    ColumnGroupName="resource" SortExpression="resource" UniqueName="resource" Reorderable="true">
                </telerik:GridBoundColumn>--%>
                    <telerik:GridTemplateColumn UniqueName="VendorDocNo" HeaderText="VendorDocNo">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "VendorDocNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtvendordoc" Text='<%# DataBinder.Eval(Container.DataItem, "VendorDocNo") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--      <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>--%>
                    <telerik:GridTemplateColumn UniqueName="statusdescr" HeaderText="Status">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Status")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="Status" runat="server" DropDownHeight="150px" Skin="Sunset"
                                DataSource='<%# statusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusListDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="" DataField="statuscolour" Display="false" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />--%>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
