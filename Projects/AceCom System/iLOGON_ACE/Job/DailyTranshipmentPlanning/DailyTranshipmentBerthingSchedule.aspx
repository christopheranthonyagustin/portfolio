<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTranshipmentBerthingSchedule.aspx.cs"
    Inherits="iWMS.Web.Job.DailyTranshipmentPlanning.DailyTranshipmentBerthingSchedule" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TranshipmentBerthingHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script src="../../js/Script.js" type="text/javascript"></script>
    
    <script type="text/javascript">

        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });

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

    <style type="text/css">
        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

        .btn1:hover {
                background: #6885ca;
            }

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            top: -1px;
            float: right;
            right: 1px;
        }

        html {
            overflow: hidden;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <asp:Label Style="z-index: 0" ID="Label2" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
    

        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label ID="frdatelbl" runat="server" Text="Date"></asp:Label>
                    <br />
                    <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label ID="WorkShiftlbl" runat="server">WorkShift</asp:Label><br />
                    <telerik:RadDropDownList ID="WorkShiftDDL" runat="server" Skin="Sunset" Enabled="True"
                        DataValueField="item" DataTextField="Descr">
                    </telerik:RadDropDownList>
        
                    &nbsp;

                    <asp:Button ID="AssignBtn" runat="server" Text="Assign" class="white" OnClick="AssignBtn_Click"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />

                    &nbsp;

                    <asp:Button ID="UnassignBtn" runat="server" Text="Unassign" class="white" OnClick="UnassignBtn_Click"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />

                    &nbsp;

                    <asp:Button ID="AutoAssignBtn" class="LongLabelWhite" runat="server" OnClick="AutoAssignBtn_Click"
                        Text="Auto &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assign&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                    &nbsp;

                    <asp:Button ID="CloseBtn" runat="server" Text="Close" class="white" OnClick="CloseBtn_Click"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <br /><br />

        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="false" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td class="style2">
                                            <table border="0" cellpadding="1" cellspacing="0" width="100%">
                                                <tr>
                                                    <td class="style1">
                                                        &nbsp;<asp:Label ID="JobNoLbl" runat="server">Vessel</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="vessel" runat="server" Width="150px">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="AtvtCodeLbl" runat="server">Voyage</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="voyage" runat="server" Enabled="True" DataTextField="Descr"
                                                            DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="CtnrLbl" runat="server">ContainerNo</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="CtnrTxt" runat="server" Enabled="True" DataTextField="Descr"
                                                            DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="TrailerNoLbl" runat="server">TrailerNo</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="TrailerNoTxt" runat="server" Enabled="True" DataTextField="Descr"
                                                            DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="FromETALbl" runat="server">FromETA</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="fromETA" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="150px">                                                        
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="ToETALbl" runat="server">ToETA</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="toETA" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="150px">
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                </tr>
                                                <tr>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <telerik:RadButton Style="z-index: 0" ID="refreshBtn" runat="server" Text="Refresh"
                                                OnClick="refreshBtn_Click" Skin="WebBlue">
                                            </telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                                </td> </tr> </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
            <ExpandAnimation Type="None" />
            <CollapseAnimation Type="None" />
        </telerik:RadPanelBar>

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
         OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand" OnEditCommand="ResultDG_Edit"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnUpdateCommand="ResultDG_Update"
            OnItemDataBound="ResultDG_ItemDataBound" Height="80%">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ParentGrid" EditMode="InPlace" HierarchyLoadMode="Client" TableLayout="Fixed">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                <%--Ticket #5929: SMPL : Enhancement to Job Register - [BerthingSchedule]--%>
                <%--Pencil Icon--%>

                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PerHeadEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Detail"
                                ImageUrl="../../image/snotrack.gif" Width="15" Height="15" AlternateText="Detail"
                                CommandName="Detail" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <%--End of Pencil Icon--%>
                
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                
                    <%--Ticket #5929: SMPL : Enhancement to Job Register - [BerthingSchedule] PT 2
                    Added By JL, 7th June 2016--%>
                    <telerik:GridTemplateColumn DataField="outvessel" SortExpression="outvessel" HeaderText="Vessel"
                    ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="vslLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "outvessel")%>'></asp:Label> 
                    </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="false" runat="server" ID="vesselTxt" Text='<%# DataBinder.Eval(Container.DataItem, "outvessel") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>            
                
                    <telerik:GridTemplateColumn DataField="outvoyage" SortExpression="outvoyage" HeaderText="Voyage"
                        ItemStyle-Wrap="false">
                         <ItemTemplate>
                        <asp:Label ID="voyageLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "outvoyage")%>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="voyageTxt" Text='<%# DataBinder.Eval(Container.DataItem, "outvoyage") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="BerthNo" SortExpression="BerthNo" HeaderText="BerthNo"
                        ItemStyle-Wrap="false">
                         <ItemTemplate>
                        <asp:Label ID="BerthNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BerthNo")%>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="BerthNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "BerthNo") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <telerik:GridTemplateColumn DataField="ineta" SortExpression="ineta" HeaderText="ETA"
                       ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="inetaLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ineta", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="InEtaTimePicker"  Width="165px" runat="server" 
                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                AutoPostBackControl="both">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                                <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <%--<telerik:GridTemplateColumn DataField="outetd" SortExpression="outetd" HeaderText="ETD" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="etdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "outetd", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="OutEtaTimePicker"  Width="165px" runat="server" 
                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight"
                                AutoPostBackControl="both">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                                <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>--%>
                
                    <telerik:GridTemplateColumn DataField="noofjob" SortExpression="noofjob" HeaderText="NoOfContainers"
                        ItemStyle-Wrap="false">
                         <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "noofjob")%>
                    </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Enabled="false" Width="110px" runat="server" ID="noofjobTxt" Text='<%# DataBinder.Eval(Container.DataItem, "noofjob") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <telerik:GridBoundColumn DataField="AssignStatusColor" UniqueName="AssignStatusColor" Display="false">
                    </telerik:GridBoundColumn>
                
                </Columns>          
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
