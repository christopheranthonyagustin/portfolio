<%@ Page Language="c#" CodeBehind="TripPlanningDetail.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TripPlanning.TripPlanningDetail" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
        $(".show_hide_Detail").hide();
        $(".show_hide_Header").show();
        $('.show_hide_Header').click(function() {
        $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Label Style="z-index: 0" ID="MessageLbl1" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:CheckBox ID="exclComp" runat="server" Checked="True" Text="ExclCompleted" />
                &nbsp;<asp:CheckBox ID="exclCanc" runat="server" Checked="True" Text="ExclCancelled" />
                &nbsp; &nbsp;
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td align="right">
                <div class="pagetitle">
                    <asp:Button ID="CompleteAllBtn" runat="server" BackColor="Red" CssClass="detailbutton"
                        Visible="false" Text="CompletedAll" OnClick="CompleteAllBtn_Click" ForeColor="White"
                        TabIndex="999"></asp:Button>
                </div>
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
        </asp:Panel>
    </div>
    <div class="show_hide_Detail">
        <table id="tbl2" border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td class="style1">
                    <asp:Label ID="TripType" runat="server">TripType</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="TripTypeList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="ctnrnolbl" runat="server">CtnrNo</asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="CtnrNoTxt" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:Label ID="VehNo" runat="server">VehicleNo</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="VehNoList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="Addr" runat="server">Addr</asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="AddrTxt" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Status" runat="server">Status</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="StatusList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="JobType" runat="server">JobType</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="JobTypeList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="ScheduleDate" runat="server">ScheduleDate</asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox runat="server" ID="SchDateTxt" Width="150px"></asp:TextBox>
                    <asp:CalendarExtender ID="SchDate_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="SchDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                        Format="dd/MMM/yyyy">
                    </asp:CalendarExtender>
                </td>
                <td class="style1">
                    <asp:Label ID="Route" runat="server">Route</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="RouteList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="CustRef" runat="server">CustRef1</asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="CustRefTxt" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td>
                </td>
                <td class="style1">
                    <br />
                    <asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="detailbutton"
                        Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </div>
    <div id="div-datagrid" style="height: 80%">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="ResultDG_Cancel"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        #
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Status" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="StatusList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# statusListDS%>' AutoPostBack="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "statusdescr")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="type" SortExpression="type" ReadOnly="True" HeaderText="Type">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="accode" SortExpression="accode" ReadOnly="True" HeaderText="Acc">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="jobtype" SortExpression="jobtype" ReadOnly="True" HeaderText="JbType">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ineta" SortExpression="ineta" ReadOnly="True" HeaderText="ETA"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="CtnrNo" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="CtnrNoTxt" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ctnrno")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="ctnrtype" SortExpression="ctnrtype" ReadOnly="True" HeaderText="Type">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" ReadOnly="True"
                    HeaderText="Seal">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="SchDate">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="FrexpdateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy}") %>'>
                        </asp:TextBox>
                        <asp:CalendarExtender ID="Frexpdate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="FrexpdateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                            Format="dd/MMM/yyyy">
                        </asp:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy}")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="SchTime" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="FrexptimeTxt" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "frexptime") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "frexptime")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="Wt" ReadOnly="True"
                    DataFormatString="{0:#,0.000}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="Vol"
                    ReadOnly="True" DataFormatString="{0:#,0.000}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="license" SortExpression="license" HeaderText="Descr"
                    ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Reason">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ReasonList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# ReasonListDS%>' AutoPostBack="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "reasondescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Remarks" ItemStyle-Wrap="false" ItemStyle-Width="100">
                    <EditItemTemplate>
                        <asp:TextBox ID="RemarksTxt" TextMode="MultiLine" runat="server" Width="180" Height="75"
                            Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="FrAddr" ItemStyle-Wrap="false" ItemStyle-Width="150">
                    <EditItemTemplate>
                        <asp:TextBox ID="FrAddrTxt" TextMode="MultiLine" runat="server" Width="280" Height="75"
                            Text='<%# DataBinder.Eval(Container.DataItem, "frAddr") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fraddr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="ToAddr" ItemStyle-Wrap="false" ItemStyle-Width="150">
                    <EditItemTemplate>
                        <asp:TextBox ID="ToAddrTxt" TextMode="MultiLine" runat="server" Width="280" Height="75"
                            Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "toaddr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="routedescr" SortExpression="routedescr" ReadOnly="True"
                    HeaderText="Route">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="VehNo" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="VehNoList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# VehNoListDS%>' AutoPostBack="False" OnPreRender="VehNoList_OnPreRender" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "vehnodescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Driver" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DriverList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# DriverListDS%>' AutoPostBack="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "driverdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AssignDriver" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="AssignDriverList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# AssignDriverListDS%>' AutoPostBack="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "pername") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="TrailerNo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="TrailerNoList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# TrailerNoListDS%>' AutoPostBack="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "trailerno") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="TrailerAddr" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TrailerAddrTxt" runat="server" Width="200" Value='<%# DataBinder.Eval(Container.DataItem, "traileraddr") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "traileraddr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="PickDropDate" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="TrailerDateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "trailerdate", "{0:dd/MMM/yyyy HH:mm:ss}") %>'>
                        </asp:TextBox>
                        <asp:CalendarExtender ID="TrailerDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="TrailerDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                            Format="dd/MMM/yyyy">
                        </asp:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "trailerdate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="jobno" SortExpression="jobno" ReadOnly="True" HeaderText="Job">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="GeoLat" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="GeoLatTxt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "trailergeolat") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "trailergeolat")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="GeoLng" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="GeoLngTxt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "trailergeolng") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "trailergeolng")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="FrSvcPt" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="FrSvcPtList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# FrSvcPtListDS%>' AutoPostBack="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "frserviceptdescr")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="ToSvcPt" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ToSvcPtList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# ToSvcPtListDS%>' AutoPostBack="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "toserviceptdescr")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="statuscolor" Visible="False"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
