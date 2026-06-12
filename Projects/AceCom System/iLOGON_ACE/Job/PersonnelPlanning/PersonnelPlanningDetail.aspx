<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<%@ Page Language="c#" CodeBehind="PersonnelPlanningDetail.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.PersonnelPlanning.PersonnelPlanningDetail" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PersonnelPlanningDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
    <div id="div1">
        <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
                <td align="right">
                    <div class="pagetitle">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div align="center" id="div2">
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
        </asp:Panel>
    </div>
    <div class="show_hide_Detail" id="div3">
        <table id="tbl2" border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td class="style1">
                    <asp:Label ID="ShpTypeLbl" runat="server">ShipmentType</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="ShpTypeList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="PerdType" runat="server">PersonnelType</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="PerdTypeList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="perhNolbl" runat="server">Reference</asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="PerhNoTxt" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Addr" runat="server">Addr</asp:Label>
                </td>
                <td class="style1">
                    <br />
                    <asp:TextBox ID="AddrTxt" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
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
                    <asp:Label ID="CustRef" runat="server">CustRef</asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="CustRefTxt" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="style1">
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
                    <asp:CheckBox ID="exclComp" runat="server" Checked="True" Text="ExclCompleted" />
                </td>
                <td>
                </td>
                <td>
                    <asp:CheckBox ID="exclCanc" runat="server" Checked="True" Text="ExclCancelled" />
                </td>
                <td>
                </td>
                <td>
                    <asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                        Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </div>
    <div id="div-datagrid" width="85%">
        <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False"
            BorderStyle="None" CellPadding="2" UseAccessibleHeader="True" AllowSorting="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle Wrap="False"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm copy?')"
                            onserverclick="PersonnelDetail_Copy" runat="server">
                            <img id="Img1" src="..\..\image\copy.png" width="15" height="15" border="0" alt="Copy"
                                runat="server"></a>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        #
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="frexpdate" SortExpression="frexpdate" ReadOnly="True"
                    HeaderText="Date" DataFormatString="{0:dd/MMM}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="fracttime" SortExpression="fracttime" ReadOnly="True"
                    HeaderText="Time">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" ReadOnly="True"
                    HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="type" SortExpression="type" ReadOnly="True" HeaderText="Type">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="accode" SortExpression="accode" ReadOnly="True" HeaderText="Acc">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="permittype" SortExpression="permittype" ReadOnly="True"
                    HeaderText="TptType">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="perhNo" SortExpression="perhNo" ReadOnly="True" HeaderText="Ref">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="perhtype" SortExpression="perhtype" ReadOnly="True" HeaderText="RefType">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FrAddr" ReadOnly="True"
                    ItemStyle-Wrap="false" ItemStyle-Width="150">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddr" ReadOnly="True"
                    ItemStyle-Wrap="false" ItemStyle-Width="150">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="pername" SortExpression="pername" ReadOnly="True" HeaderText="AssignPersonnel">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="jobno" SortExpression="jobno" ReadOnly="True" HeaderText="Job">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <%-------------------%>
                <asp:BoundColumn DataField="jobtype" SortExpression="jobtype" ReadOnly="True" HeaderText="JbType">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ineta" SortExpression="ineta" ReadOnly="True" HeaderText="ETA"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="license" SortExpression="license" HeaderText="Descr"
                    ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks" ReadOnly="True"
                    ItemStyle-Wrap="false" ItemStyle-Width="150">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="frserviceptdescr" SortExpression="frserviceptdescr" ReadOnly="True"
                    HeaderText="FrSvcPt">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="toserviceptdescr" SortExpression="toserviceptdescr" ReadOnly="True"
                    HeaderText="ToSvcPt">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="statuscolor" Visible="False"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
