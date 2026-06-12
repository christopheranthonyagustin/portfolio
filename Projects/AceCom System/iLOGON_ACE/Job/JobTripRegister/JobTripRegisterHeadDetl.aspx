<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterHeadDetl.aspx.cs"
    Inherits="iWMS.Web.Job.JobTripRegister.JobTripRegisterHeadDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title id="JTListTitle" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    
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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = true; // for checking the checkboxes
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = false; // for unchecking the checkboxes
                    }
                }
            }
        </script>
         <script type="text/javascript">
             function OnClientClose(sender, args) {
                 document.location.href = document.location.href;
             }
         </script>
    </telerik:RadCodeBlock>
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
        .break-word
        {
           max-width: 200px !important;
           white-space:normal;
           word-wrap:break-word
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <table border="0">
        <tr>
            <td>
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.png"
                        runat="server"></a>
            </td>
            <td>
                <telerik:RadButton ID="OpenBtn" runat="server" OnClick="OpenBtn_Click" Text="Open"
                    ButtonType="LinkButton">
                </telerik:RadButton>
                &nbsp;
            </td>
            <td>
                <telerik:RadButton ID="AssignBtn" runat="server" OnClick="AssignBtn_Click" Text="Assign"
                    ButtonType="LinkButton">
                </telerik:RadButton>
                &nbsp;
            </td>
            <td>
                <telerik:RadButton ID="CompletedBtn" runat="server" OnClick="CompletedBtn_Click"
                    Text="Completed" ButtonType="LinkButton">
                </telerik:RadButton>
                &nbsp;
            </td>
            <td>
                <telerik:RadButton ID="VoidBtn" runat="server" OnClick="VoidBtn_Click" Text="Void"
                    ToolTip="Void" ButtonType="LinkButton">
                </telerik:RadButton>
                &nbsp;
            </td>
            <td>
                <telerik:RadButton ID="CancelledBtn" runat="server" OnClick="CancelledBtn_Click"
                    Text="Cancelled" ButtonType="LinkButton">
                </telerik:RadButton>
                &nbsp;
            </td>
            <td>
               <telerik:RadButton ID="RefreshBtn" runat="server" CssClass="detailButton"
                    OnClick="RefreshBtn_Click" Text="Refresh" Skin="WebBlue"/>
                &nbsp;
            </td>
            <td>
               <telerik:RadButton ID="ChangeResourceBtn" runat="server" CssClass="detailButton"
                    OnClick="ChangeResourceBtn_Click" Text="ChangeResource" Skin="WebBlue"/>
                &nbsp;
            </td>
            <td>
               <telerik:RadButton ID="ChangeScheduleBtn" runat="server" CssClass="detailButton"
                    OnClick="ChangeScheduleBtn_Click" Text="ChangeSchedule" Skin="WebBlue"/>
                &nbsp;
            </td>
            <td>
               <asp:ImageButton runat="server" Visible="True" ID="MergeBtn" ImageUrl="../../image/Merge.png"
                BorderWidth="0" BackColor="Transparent" Width="87" Height="27" AlternateText="Confirm Submit Declaration?"
                OnClick="MergeBtn_Click" CausesValidation="False" ImageAlign="AbsMiddle" >
               </asp:ImageButton>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnPreRender="ResultDG_PreRender"
        OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting" AllowPaging="false" AllowSorting="true"
        Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
        OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" AllowAutomaticInserts="True"
        OnItemCommand="ResultDG_ItemCommand" OnCancelCommand="ResultDG_Cancel" Width="200%">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid"
            EditMode="InPlace" Width="100%" AllowFilteringByColumn="true" HierarchyLoadMode="Client">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-Width="70px" ItemStyle-Width="70px">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label id="completelbl">
                        </label>
                        &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PerHeadEdit"
                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                            CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" ID="AddBtn" ImageUrl="../../image/add.png" BorderWidth="0"
                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="AddDetail"
                            CommandName="AddDetail"></asp:ImageButton>
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
                <telerik:GridTemplateColumn HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderText="" UniqueName="Cautionicon" AllowFiltering="false">
                    <ItemStyle Wrap="True"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="CautionLbl" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="StartDateTime" Display="false" UniqueName="StartDateTime">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="frexpdateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy HH:mm}")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDateTimePicker ID="FrDateTimePicker" Width="170px" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "frexpdate")  %>'
                            DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        </telerik:RadDateTimePicker>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                    ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true"
                    ReadOnly="True" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="BillSizeType" HeaderStyle-Width="130px" ItemStyle-Width="130px" UniqueName="BillSizeType" 
                Datafield="BillSizeTypeDescr" Display="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="billsizetypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="billsizetypeList" runat="server" DataTextField="descr" DataValueField="item"
                            DataSource='<%# billsizetypeDS%>' AutoPostBack="true" Skin="WebBlue" Width="150px"
                            DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains">
                        </telerik:RadComboBox>
                        <asp:RequiredFieldValidator ID="CBBillSizeTypeReqVal" runat="server" ControlToValidate="billsizetypeList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn> 
                <%--added by HW on 10/Jan/2017 --%>              
                <telerik:GridTemplateColumn HeaderText="ActWt" DataField="ActWt" AllowFiltering="true" ItemStyle-CssClass="break-word"
                    ColumnGroupName="ActWt" SortExpression="ActWt" UniqueName="ActWt" Reorderable="true"
                    HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ActWt")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="ActWtTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ActWt") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                        <asp:CompareValidator ID="CompareValidator8" runat="server" Operator="DataTypeCheck"
                            Type="Double" ControlToValidate="ActWtTxt" ErrorMessage="#" />
                    </EditItemTemplate>                  
                </telerik:GridTemplateColumn> 
                
                <%--end--%>
                <telerik:GridTemplateColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true" ItemStyle-CssClass="break-word"
                    ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true"
                    HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="fraddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true"  ItemStyle-CssClass="break-word"
                    ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true"
                    HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="toddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Vehno" HeaderStyle-Width="130px" ItemStyle-Width="130px" UniqueName="VehNo" 
                Datafield= "vehno" Display="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="vehnoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "vehno")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="vehDDL" runat="server" DataTextField="item" DataValueField="item"
                            DataSource='<%# vehListDS%>' AutoPostBack="true" Skin="WebBlue" Width="150px"
                            DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                            OnSelectedIndexChanged="VehNoSelectedIndex_changed">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="AssignDriver" HeaderText="Driver" ItemStyle-CssClass="break-word" 
                Datafield="pername" Display="false"> 
                    <HeaderStyle Wrap="true" HorizontalAlign="Center" />
                    <ItemStyle Wrap="true" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="perLbl" Text='<%# DataBinder.Eval(Container.DataItem, "pername")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="perList" runat="server" DropDownHeight="150px" DataTextField="descr"
                            DataValueField="item" DataSource='<%# perListDS%>' Skin="WebBlue" Width="120px"
                            DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="TrailerNo" UniqueName="TrailerNo" HeaderStyle-Width="130px" ItemStyle-Width="130px" 
                Datafield="trailernodescr" Display="false" >
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "trailernodescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="TrailerDDL" DataTextField="Descr" DataValueField="Item"
                            DataSource='<%# TrailerListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerListDS,DataBinder.Eval(Container.DataItem, "trailerno").ToString()) %>'
                            runat="server" DropDownHeight="150px" RenderMode="Lightweight" Skin="WebBlue"
                            Width="120px" DropDownWidth="150px" CausesValidation="false" Filter="Contains">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Attendant" DataField="noofperdetl" AllowFiltering="false"
                    ColumnGroupName="noofperdetl" SortExpression="noofperdetl" UniqueName="noofperdetl"
                    ReadOnly="True" Reorderable="true" Display="false" >
                    <ItemStyle HorizontalAlign ="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="GoodsDescr" DataField="jobgoodsdescr" AllowFiltering="true"
                    ColumnGroupName="jobgoodsdescr" SortExpression="jobgoodsdescr" UniqueName="jobgoodsdescr"  ItemStyle-CssClass="break-word"
                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "jobgoodsdescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="jobgoodsdescrtxt" Text='<%# DataBinder.Eval(Container.DataItem, "jobgoodsdescr") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="SpecialInstruction" DataField="jobspecialinstruction"
                    AllowFiltering="true" ColumnGroupName="jobspecialinstruction" SortExpression="jobspecialinstruction"
                    UniqueName="jobspecialinstruction" Reorderable="true" HeaderStyle-Width="70px"  ItemStyle-CssClass="break-word"
                    ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "jobspecialinstruction")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="jobspecialinstructiontxt" Text='<%# DataBinder.Eval(Container.DataItem, "jobspecialinstruction") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="true"
                    ColumnGroupName="jbremarks" SortExpression="jbremarks" UniqueName="remarks"  ItemStyle-CssClass="break-word"
                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="jbremarkstxt" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="TptType" DataField="jbctpttypedescr" AllowFiltering="true"
                    ReadOnly="True" ColumnGroupName="jbctpttype" SortExpression="jbctpttype" UniqueName="jbctpttype"
                    Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="OrderBy" DataField="orderby" AllowFiltering="true"
                    ReadOnly="True" ColumnGroupName="orderby" SortExpression="orderby" UniqueName="orderby"
                    Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="CustRef1" DataField="exref1" AllowFiltering="true"
                    ColumnGroupName="exref1" SortExpression="exref1" UniqueName="exref1"  ItemStyle-CssClass="break-word"
                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "exref1")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="exref1txt" Text='<%# DataBinder.Eval(Container.DataItem, "exref1") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="EndDateTime" Display="false" UniqueName="EndDateTime">
                    <ItemTemplate>
                    <asp:Label runat="server" ID="toexpdateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "toexpdate", "{0:dd/MMM/yyyy HH:mm}")%>' />
                        
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDateTimePicker ID="ToDateTimePicker" Width="170px" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "toexpdate")  %>'
                            DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        </telerik:RadDateTimePicker>
                        <%--<asp:RequiredFieldValidator runat="server" ID="RFV4" ControlToValidate="ToDateTimePicker"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="TripOption" HeaderStyle-Width="130px" UniqueName="sector"
                    DataField="sector" ItemStyle-Width="130px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "sector")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="SectorDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                            DataValueField="Item" DataSource='<%# sectorDS%>' Skin="Sunset" Width="200px"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(sectorDS,DataBinder.Eval(Container.DataItem, "sector").ToString())%>'
                            DropDownWidth="150px">
                        </telerik:RadDropDownList>
                         <asp:RequiredFieldValidator ID="SectorDDLReqVal" runat="server" ControlToValidate="SectorDDL"
                          ErrorMessage="*"  ForeColor="Red"/>
                        <asp:TextBox ID="SectorTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "sector") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="WorkThruLunch" HeaderStyle-Width="130px" UniqueName="WorkThruLunchDescr"
                    DataField="WorkThruLunchDescr" ItemStyle-Width="130px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "WorkThruLunchDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="WorkThruLunghDDL" runat="server" DataTextField="Descr" ExpandDirection="Up"
                            DataValueField="Item" DataSource='<%# WorkThruLunghDS%>' Skin="WebBlue" Width="200px"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(WorkThruLunghDS,DataBinder.Eval(Container.DataItem, "WorkThruLunch").ToString())%>'
                            DropDownWidth="150px">
                        </telerik:RadDropDownList>
                        <asp:TextBox ID="WorkThruLunghTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "WorkThruLunch") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="SvcChitNo" DataField="svcchitno" AllowFiltering="true"
                    ColumnGroupName="svcchitno" SortExpression="svcchitno" UniqueName="svcchitno"
                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "svcchitno")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="SvcchitTxt" Text='<%# DataBinder.Eval(Container.DataItem, "svcchitno") %>'
                            Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                    ColumnGroupName="jobno" SortExpression="jobno" UniqueName="jobno" Reorderable="true"
                    HeaderStyle-Width="100px" ItemStyle-Width="100px" ReadOnly="True" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="JobType" DataField="jbcjobtypedescr" AllowFiltering="true"
                    ColumnGroupName="jbcjobtypedescr" SortExpression="jbcjobtypedescr" UniqueName="jbcjobtypedescr"
                    ReadOnly="True" Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" UniqueName="statusdescr" Display="false" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ShType" DataField="jbshtypedescr" AllowFiltering="true"
                    ColumnGroupName="jbshtype" SortExpression="jbshtype" UniqueName="jbshtype" Reorderable="true"
                    HeaderStyle-Width="100px" ItemStyle-Width="100px" ReadOnly="True" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Pic" DataField="piccodedescr" AllowFiltering="true"
                    ColumnGroupName="piccodedescr" SortExpression="piccodedescr" UniqueName="piccodedescr"
                    ReadOnly="True" Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <%-- For shtype --%>
                 <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" ColumnGroupName="frexpdate"
                        SortExpression="frexpdate" UniqueName="Date" Reorderable="true" Display="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="Time" DataField="fracttimedescr" ColumnGroupName="fracttimedescr"
                    SortExpression="fracttimedescr" UniqueName="Time" Reorderable="true" Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="Descr" DataField="jobdescr" AllowFiltering="false"
                    ColumnGroupName="jobdescr" SortExpression="jobdescr" UniqueName="Descr" Reorderable="true"
                    Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="NoOfPlt" DataField="noofplt" AllowFiltering="false"
                    DataFormatString="{0:#,0.##}" ColumnGroupName="noofplt" SortExpression="noofplt"
                    UniqueName="NoOfPlt" Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="NoOfPkg" DataField="noofpkg" AllowFiltering="false"
                    DataFormatString="{0:#,0.##}" ColumnGroupName="noofpkg" SortExpression="noofpkg"
                    UniqueName="NoOfPkg" Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="Wt" DataField="actwt" AllowFiltering="false"
                    ColumnGroupName="actwt" ItemStyle-HorizontalAlign="Center" SortExpression="actwt"
                    UniqueName="Wt" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                 </telerik:GridBoundColumn>
                 
                 <telerik:GridBoundColumn HeaderText="Wt" DataField="expwt" AllowFiltering="false"
                    ColumnGroupName="expwt" ItemStyle-HorizontalAlign="Center" SortExpression="expwt"
                    UniqueName="ExpWt" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="Vol" DataField="actvol" AllowFiltering="false"
                    ItemStyle-HorizontalAlign="Center" ColumnGroupName="actvol" SortExpression="actvol"
                    UniqueName="Vol" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="EqpRemarks" DataField="eqpremarks" AllowFiltering="false"
                    ColumnGroupName="eqpremarks" SortExpression="eqpremarks" UniqueName="EqpRemarks"
                    Reorderable="true" Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="ImportEdoAsn/UCI" DataField="inedoasn" AllowFiltering="false"
                    ColumnGroupName="inedoasn" SortExpression="inedoasn" UniqueName="inedoasn" Reorderable="true"
                    Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="ExportEsnAsn/UCI" DataField="outesnasn" AllowFiltering="false"
                    ColumnGroupName="outesnasn" SortExpression="outesnasn" UniqueName="outesnasn"
                    Reorderable="true" Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="Time" DataField="frexptime" ColumnGroupName="frexptime"
                    SortExpression="frexptime" UniqueName="StartTime" Reorderable="true" Display="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="Remarks2" DataField="remarks2" AllowFiltering="false"
                    ColumnGroupName="remarks2" SortExpression="remarks2" UniqueName="Remarks2" Reorderable="true"
                    Display="false">
                 </telerik:GridBoundColumn>
                <%-- <telerik:GridBoundColumn HeaderText="EqpType" DataField="eqptypedescr" AllowFiltering="true"
                    ColumnGroupName="eqptypedescr" SortExpression="eqptypedescr" UniqueName="eqptypedescr"
                    ReadOnly="True" Reorderable="true">
                </telerik:GridBoundColumn>--%>
                <telerik:GridBoundColumn DataField="jbcshtype" UniqueName="jbcshtype" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" ReadOnly="True"
                    ColumnGroupName="id" SortExpression="id" UniqueName="id" Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="JBCTptTypeIsImportant" UniqueName="JBCTptTypeIsImportant" Display="false">
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
                <%--<telerik:GridBoundColumn HeaderText="EqpType" DataField="jbceqptype" AllowFiltering="true"
                    ColumnGroupName="jbceqptype" SortExpression="jbceqptype" UniqueName="jbceqptype"
                    Reorderable="true">
                </telerik:GridBoundColumn>--%>
                <%--  <telerik:GridTemplateColumn HeaderText="SvcChitNo" DataField="svcchitno" AllowFiltering="true"
                    ColumnGroupName="svcchitno" SortExpression="svcchitno" UniqueName="svcchitno"
                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "SvcChitNo") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="svcchitnoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "SvcChitNo") %>'
                            Enabled="true"></asp:TextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>--%>
            </Columns>
            <DetailTables>
                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                    CommandItemDisplay="Top" Width="40%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true"
                    AllowAutomaticInserts="true">
                    <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />
                    <CommandItemSettings ShowRefreshButton="false" AddNewRecordText="Add Personnel" />
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="jbcttrid" MasterKeyField="id" />
                    </ParentTableRelation>
                    <Columns>                    
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                            HeaderStyle-Width="70px" ItemStyle-Width="70px">
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
                                    Width="15" Height="15" AlternateText="Update" CommandName="DetailUpdate" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="PackCancel" ImageUrl="../../image/arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="id" UniqueName="id" SortExpression="id" HeaderText="id" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbcttrid" UniqueName="jbcttrid" SortExpression="jbcttrid" HeaderText="jbcttrid"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="type" HeaderText="PersonnelType">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px"></ItemStyle>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "typedescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="pertypeList" runat="server" DropDownHeight="150px" DataTextField="descr"
                                    DataValueField="item" DataSource='<%# pertypeListDS%>' Skin="WebBlue" Width="120px"
                                    DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(pertypeListDS,DataBinder.Eval(Container.DataItem, "id").ToString()) %>'>
                                </telerik:RadComboBox>
                                <asp:TextBox ID="pertypeListTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "typedescr") %>' />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="pername" HeaderText="Name">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px"></ItemStyle>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "pername")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="manpowerList" runat="server" DropDownHeight="150px" DataTextField="name"
                                    DataValueField="id" DataSource='<%# manpowerListDS%>' Skin="WebBlue" Width="200px"
                                    DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(manpowerListDS,DataBinder.Eval(Container.DataItem, "id").ToString()) %>'>
                                </telerik:RadComboBox>
                                <asp:TextBox ID="pertypeNameListTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "pername") %>' />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="StartTime" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "fractdate", "{0:dd/MMM/yyyy HH:mm}")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDateTimePicker ID="InctStartDateTimePicker" Width="170px" runat="server"
                                    DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="BottomRight"
                                    AutoPostBackControl="both">
                                    <Calendar>
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                    <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                </telerik:RadDateTimePicker>
                                <%--<asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="InctStartDateTimePicker"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="toactdate" HeaderText="EndTime">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "toactdate", "{0:dd/MMM/yyyy HH:mm}")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDateTimePicker ID="InctEndDateTimePicker" Width="170px" runat="server"
                                    DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="BottomRight"
                                    AutoPostBackControl="both">
                                    <Calendar>
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                    <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                </telerik:RadDateTimePicker>
                                <%--<asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="InctEndDateTimePicker"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
    
     <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
            targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
            backgroundcssclass="MessageBoxPopupBackground">
        </ajaxtoolkit:modalpopupextender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
            border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
