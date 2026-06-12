<%@ Page Language="c#" CodeBehind="ManpowerPersonnelAllocate.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.ManpowerActivityPlanning.ManpowerPersonnelAllocate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ManpowerPersonnelPlanning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

    <script type="text/javascript">
        //function selectAll(invoker) {
        //    var inputElements = document.getElementsByTagName('input');
        //    for (var i = 0; i < inputElements.length; i++) {
        //        var myElement = inputElements[i];
        //        if (myElement.type === "checkbox") {
        //            myElement.checked = invoker.checked;
        //        }
        //        else {
        //            myElement.checked = invoker.UnChecked

        //        }
        //    }
        //}

    </script>

    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>

</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table width="100%">
            <tr>
                <td class="ModuleTitle" align="right">
                    <asp:Label ID="Label1" Style="color: Black; font-size: medium; font-weight: bold; padding-right: 25px;" runat="server">Manpower Personnel Planning</asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Atvtlbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="OpenBtn" runat="server" Text="Open" Visible="true"
                    CssClass="detailButton" OnClick="OpenBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="AssignBtn" runat="server" Text="Assign" Visible="true" CssClass="detailButton"
                        OnClick="AssignBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="CompletedBtn" runat="server" Text="Completed" Visible="true"
                        CssClass="detailButton" OnClick="CompletedBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="VoidBtn" runat="server" Text="Void" Visible="true" CssClass="detailButton"
                        OnClick="VoidBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="CancelledBtn" runat="server" Text="Cancelled" Visible="true"
                        CssClass="detailButton" OnClick="CancelledBtn_Click" Width="100px"></asp:Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="CloseBtn" runat="Server" CssClass="detailButton" OnClick="CloseBtn_Click"
                    CausesValidation="false" Width="100px" Text="Close" />
                    &nbsp;<asp:Button ID="MassChangeBtn" runat="server" Text="Mass Change" Visible="true"
                        CssClass="detailButton" OnClick="MassChangeBtn_Click" Width="100px"></asp:Button>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Masschangepnl" runat="server" Visible="false">
            <table>
                <tr>
                    <td>
                        <br />
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <br />
                        &nbsp;<asp:Button Style="z-index: 0" ID="ChangeBtn" runat="server" Text="ProceedToChange"
                            Visible="true" CssClass="detailButton" OnClick="ChangeBtn_Click" CausesValidation="true"></asp:Button>
                        <asp:Button Style="z-index: 0" ID="Cancel" runat="server" CssClass="detailButton"
                            Visible="True" Text="Cancel" OnClick="CancelBtn_Click" CausesValidation="false"></asp:Button>
                        &nbsp;&nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
                            CssClass="errorLabel"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" AllowMultiRowSelection="true"
            Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnPreRender="ResultDG_PreRender"
            OnItemCommand="ResultDG_ItemCommand" OnCancelCommand="ResultDG_Cancel" Width="150%">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid"
                HierarchyLoadMode="Client" EditMode="InPlace" Width="100%">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn"  >
                             
                            </telerik:GridClientSelectColumn>
                            <%--     <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                  <asp:CheckBox ID="cbSelectAll" runat="server"  AutoPostBack="true" CausesValidation="false" OnCheckedChanged="chkboxSelectAll_CheckedChanged"   />
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderStyle-Width="70px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PackEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        runat="server" onserverclick="PerDetlDetail_Delete">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Charge"
                                            title="Delete Charge" runat="server" /></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="PackUpdate" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="PackCancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-ForeColor="Black">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false">
                            </telerik:GridBoundColumn>
                            <%--<telerik:GridTemplateColumn HeaderText="Personnel">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "pername")  %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="perDDL" DataMember="" DataTextField="name" DataValueField="perid"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(perListDS,DataBinder.Eval(Container.DataItem, "perid").ToString()) %>'
                                    DataSource='<%# perListDS%>' runat="server" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>--%>
                            <telerik:GridTemplateColumn UniqueName="pername" HeaderText="Personnel">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "pername")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="perList" runat="server" DropDownHeight="150px" Skin="WebBlue"
                                        DataTextField="name" DataValueField="perid" RenderMode="Lightweight" Filter="Contains"
                                        DataSource='<%# perListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(perListDS,DataBinder.Eval(Container.DataItem, "perid").ToString()) %>'>
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="perList2" runat="server" Visible="false" DropDownHeight="150px"
                                        Skin="WebBlue" DataTextField="name" DataValueField="perid" RenderMode="Lightweight"
                                        Filter="Contains">
                                    </telerik:RadComboBox>
                                    <asp:TextBox ID="PersonnelTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "pername") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Vehno" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "vehdescr")  %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <%--<asp:DropDownList ID="vehDDL" DataMember="" DataTextField="descr" DataValueField="vehno"
                                    DataSource='<%# vehListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "vehno").ToString()) %>'
                                    runat="server" Width="150px" />--%>
                                    <telerik:RadComboBox ID="vehList" runat="server" Width="350px" DropDownHeight="150px"
                                        Skin="WebBlue" DataTextField="descr" DataValueField="vehno" RenderMode="Lightweight"
                                        Filter="Contains" DataSource='<%# vehListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "vehno").ToString()) %>'>
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <telerik:GridBoundColumn HeaderText="ExpDate" DataField="frexpdate" AllowFiltering="true"
                    ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="ActStartDate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "inctstartdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="InctStartDateTimePicker" Width="100%" runat="server"
                                        SelectedDate='<%# DataBinder.Eval(Container.DataItem, "inctstartdate")  %>' DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                        Skin="Office2007" PopupDirection="TopRight" OnSelectedDateChanged="InctStartCalTime_OnDateSelectedChanged"
                                        AutoPostBackControl="both">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="InctStartDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ActEndDate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "inctenddate", "{0:dd/MMM/yyyy HH:mm}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="InctEndDateTimePicker" Width="100%" runat="server"
                                        SelectedDate='<%# DataBinder.Eval(Container.DataItem, "inctenddate")  %>' DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                        Skin="Office2007" PopupDirection="TopRight" OnSelectedDateChanged="InctEndCalTime_OnDateSelectedChanged"
                                        AutoPostBackControl="both">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="InctEndDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="PerBillableStartDate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fractdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="FrDateTimePicker" Width="100%" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "fractdate")  %>'
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV3" ControlToValidate="FrDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="PerBillableEndDate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "toactdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="ToDateTimePicker" Width="100%" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "toactdate")  %>'
                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV4" ControlToValidate="ToDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="PerPlanStartDate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="FrPlanDateTimePicker" Width="100%" runat="server"
                                        SelectedDate='<%# DataBinder.Eval(Container.DataItem, "frexpdate")  %>' DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                        Skin="Office2007" PopupDirection="TopRight" OnSelectedDateChanged="PerPlanStartDate_OnDateSelectedChanged"
                                        AutoPostBackControl="both">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV5" ControlToValidate="FrPlanDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <%--<asp:CompareValidator ID="cmpVal1" ControlToCompare="FrPlanDateTimePicker" ControlToValidate="ToDateTimePicker" Type="String"
                                Operator="GreaterThanEqual" ErrorMessage="*"
                                runat="server"></asp:CompareValidator>--%>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="PerPlanEndDate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "toexpdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="ToPlanDateTimePicker" Width="100%" runat="server"
                                        SelectedDate='<%# DataBinder.Eval(Container.DataItem, "toexpdate")  %>' DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                        Skin="Office2007" PopupDirection="TopRight" OnSelectedDateChanged="PerPlanEndDate_OnDateSelectedChanged"
                                        AutoPostBackControl="both">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator runat="server" ID="RFV6" ControlToValidate="ToPlanDateTimePicker"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="TotHours" DataField="tothours" AllowFiltering="true"
                                Display="false" ColumnGroupName="tothours" SortExpression="tothours" UniqueName="tothours"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Remarks">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "rem1")  %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="remTxt" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Status">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "statusdescr")  %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="statusTxt" Text='<%# DataBinder.Eval(Container.DataItem, "statusdescr") %>'
                                        Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PerHeadEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" ID="AddBtn" ImageUrl="../../image/add.png" BorderWidth="0"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="Add" OnClick="AddBtn_Click"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="ParentUpdate" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="ParentCancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Reference" DataField="perhno" AllowFiltering="true"
                        ColumnGroupName="perhno" SortExpression="perhno" UniqueName="perhno" Reorderable="true"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="perhtypedescr" AllowFiltering="true"
                        ColumnGroupName="perhtypedescr" SortExpression="perhtypedescr" UniqueName="perhtypedescr"
                        Reorderable="true" HeaderStyle-Width="100px" ItemStyle-Width="100px" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="perhtype" AllowFiltering="true"
                        ColumnGroupName="perhtyped" SortExpression="perhtype" UniqueName="perhtype" Reorderable="true"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AtvtExpDate" DataField="atvtfrexpdate" AllowFiltering="true"
                        ColumnGroupName="atvtfrexpdate" SortExpression="atvtfrexpdate" UniqueName="atvtfrexpdate"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}" HeaderStyle-Width="100px"
                        ItemStyle-Width="100px" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" AllowFiltering="true" ColumnGroupName="qty"
                        SortExpression="qty" UniqueName="qty" Reorderable="true" DataFormatString="{0:N0}"
                        HeaderStyle-Width="70px" ItemStyle-Width="70px" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="SvcChitNo" DataField="svcchitno" AllowFiltering="true"
                        ColumnGroupName="svcchitno" SortExpression="svcchitno" UniqueName="svcchitno"
                        Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "SvcChitNo") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="svcchitnoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "SvcChitNo") %>'
                                Enabled="true"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="" DataField="dummyfield" HeaderStyle-Width="5000px"
                        ItemStyle-Width="5000px" AllowFiltering="true" ReadOnly="True">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground" Y="200">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
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
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="OK" />
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
