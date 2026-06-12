<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<%@ Page Language="c#" CodeBehind="TripPlanningDetail2.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TripPlanning.TripPlanningDetail2" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="style1">
                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                        ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td align="right">
                    <div class="NewModuleTitle">
                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Trip Planning V2</asp:Label>
                    </div>
                </td>
            </tr>
        </table>
        <div id="div1">
            <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>
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
        </div>
        <div align="center" id="div2">
            <asp:Label Style="z-index: 0" ID="MessageLbl1" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
            <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
                <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
                <asp:Label ID="lblProcessID" runat="server" Visible="False" />
            </asp:Panel>
        </div>
        <div id="div3" runat="server">
            <br />
            <table id="tbl2" border="0" cellspacing="1" cellpadding="1" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="AccountList" runat="server" Enabled="True" DataTextField="code"
                            DataValueField="acid" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td colspan="3"></td>
                    <td colspan="5" align="center">
                        <asp:Button ID="MassChangeResource" runat="server" CssClass="detailButton" OnClick="ChangeResourceBtn_Click"
                            Text="MassChangeResource" Visible="false" />&nbsp;&nbsp;
                    <asp:Button ID="MassChangeBtn" runat="server" Text="MassChangeSchedule" Visible="false"
                        CssClass="detailButton" OnClick="MassChangeBtn_Click"></asp:Button>&nbsp;&nbsp;
                    <asp:Button ID="ExcelBtn" runat="server" Text="Excel" Visible="false" CssClass="detailButton"
                        OnClick="ExcelBtn_Click"></asp:Button>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="ShpTypeLbl" runat="server">ShipmentType</asp:Label>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="ShpTypeList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ShpTypeList_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
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
                    <td>
                        <asp:Label ID="Addr" runat="server">Addr</asp:Label>
                    </td>
                    <td class="style1">
                        <br />
                        <asp:TextBox ID="AddrTxt" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <br />
                <tr>
                    <td style="padding-top: 15px">
                        <asp:Label ID="FromDate" runat="server">FromDate</asp:Label>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:TextBox runat="server" ID="FrDateTxt" Width="150px"></asp:TextBox>
                        <asp:CalendarExtender ID="FrDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="FrDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                            Format="dd/MMM/yyyy"></asp:CalendarExtender>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:Label ID="JobType" runat="server">JobType</asp:Label>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:DropDownList ID="JobTypeList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:Label ID="TptTypeLbl" runat="server">TptType</asp:Label>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:DropDownList ID="TptTypeList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:Label ID="TrailerNoLbl" runat="server">TrailerNo</asp:Label>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:DropDownList ID="TrailerNoList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="code" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:Label ID="CustRef" runat="server">CustRef</asp:Label>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:TextBox ID="CustRefTxt" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 15px">
                        <asp:Label ID="ToDate" runat="server">ToDate</asp:Label>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:TextBox runat="server" ID="ToDateTxt" Width="150px"></asp:TextBox>
                        <asp:CalendarExtender ID="ToDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="ToDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                            Format="dd/MMM/yyyy 23:59:59"></asp:CalendarExtender>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:Label ID="PICLbl" runat="server">PIC</asp:Label>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:DropDownList ID="PICList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:Label ID="Label1" runat="server">Vessel</asp:Label>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:TextBox runat="server" ID="VesselTxt" Width="150px"></asp:TextBox>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:Label ID="Label2" runat="server">Voyage</asp:Label>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:TextBox runat="server" ID="VoyageTxt" Width="150px"></asp:TextBox>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:Label ID="Label3" runat="server">JobNo</asp:Label>
                    </td>
                    <td style="padding-top: 15px">
                        <asp:TextBox ID="JobNoTxt" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1" style="padding-top: 15px">
                        <asp:Label ID="Route" runat="server">Route</asp:Label>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:DropDownList ID="RouteList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td></td>
                    <td style="padding-top: 15px">
                        <asp:CheckBox ID="leg1chkbox" runat="server" Text="Leg1Completed" />
                    </td>
                    <td></td>
                    <td style="padding-top: 15px">
                        <asp:CheckBox ID="exclComp" runat="server" Checked="True" Text="ExclCompleted" />
                    </td>
                    <td></td>
                    <td style="padding-top: 15px">
                        <asp:CheckBox ID="exclCanc" runat="server" Checked="True" Text="ExclCancelled" />
                    </td>
                    <td></td>
                    <td style="padding-top: 15px">
                        <asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                            Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 15px">
                        <asp:Label ID="Status" runat="server">Status</asp:Label>
                    </td>
                    <td class="style1" style="padding-top: 15px">
                        <asp:DropDownList ID="StatusList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <div id="div-datagrid" width="8%">
            <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False"
                BorderStyle="None" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn>
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                            <%-- <asp:Label ID="DetailLbl" runat="server"></asp:Label>--%>
                            <a id="Edit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                onserverclick="Edit_Click" runat="server">
                                <img id="A3" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                    runat="server"></a>
                            <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm copy?')"
                                onserverclick="CtnrTripDetail_Copy" runat="server">
                                <img id="Img1" src="..\..\image\copy.png" width="15" height="15" border="0" alt="Copy exact"
                                    runat="server"></a> <a id="A1" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onclick="return confirm('Confirm copy with reverse address?')" onserverclick="CtnrTripDetail_CopyRA"
                                        runat="server">
                                        <img id="Img2" src="..\..\image\copy.png" width="15" height="15" border="0" alt="Copy reverse address"
                                            runat="server"></a> <a id="A2" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onserverclick="CtnrTripDetail_Detour" runat="server">
                                                <img id="Img3" src="..\..\image\copy.png" width="15" height="15" border="0" alt="Detour"
                                                    runat="server"></a>
                            <asp:Label ID="DMWTLbl" runat="server"></asp:Label>
                            <asp:Label ID="ESNLbl" runat="server"></asp:Label>
                            <asp:Label ID="RedFlagLbl" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
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
                    <asp:BoundColumn DataField="fracttimedescr" SortExpression="fracttimedescr" ReadOnly="True"
                        HeaderText="Time">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" ReadOnly="True"
                        HeaderText="Status">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="type" SortExpression="type" ReadOnly="True" HeaderText="TripType">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="accode" SortExpression="accode" ReadOnly="True" HeaderText="Acc">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="exref1" SortExpression="exref1" ReadOnly="True" HeaderText="CustRef">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ctnrno" SortExpression="ctnrno" ReadOnly="True" HeaderText="EqpRef">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="jbcctnrsealno" SortExpression="jbcctnrsealno" ReadOnly="True"
                        HeaderText="Seal">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="tptercode" SortExpression="tptercode" ReadOnly="True"
                        HeaderText="OpCode">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ctnrtype" SortExpression="ctnrtype" ReadOnly="True" HeaderText="BillSizeType">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="bookingref" SortExpression="bookingref" ReadOnly="True"
                        HeaderText="BookingRef">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="FrSvcPtorFrAddr" SortExpression="FrSvcPtorFrAddr" HeaderText="FrAddr"
                        ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ToSvcPtorToAddr" SortExpression="ToSvcPtorToAddr" HeaderText="ToAddr"
                        ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="vehnodescr" SortExpression="vehnodescr" ReadOnly="True"
                        HeaderText="VehNo">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="trailerno" SortExpression="trailerno" ReadOnly="True"
                        HeaderText="TrailerNo">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="jobno" SortExpression="jobno" ReadOnly="True" HeaderText="Job">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="pername" SortExpression="pername" ReadOnly="True" HeaderText="AssignDriver">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="jobtype" SortExpression="jobtype" ReadOnly="True" HeaderText="JbType">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="permitno" SortExpression="permitno" ReadOnly="True" HeaderText="PermitNo">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="outvessel" SortExpression="outvessel" ReadOnly="True"
                        HeaderText="Vsl">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="outvoyage" SortExpression="outvoyage" ReadOnly="True"
                        HeaderText="Voy">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ineta" SortExpression="ineta" ReadOnly="True" HeaderText="ETA"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ttwt" SortExpression="ttwt" HeaderText="Wt" ReadOnly="True"
                        DataFormatString="{0:#,0.000}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ttvol" SortExpression="ttvol" HeaderText="Vol" ReadOnly="True"
                        DataFormatString="{0:#,0.000}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="jobdescr" SortExpression="jobdescr" HeaderText="Descr"
                        ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="reasondescr" SortExpression="reasondescr" HeaderText="Reason"
                        ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                        ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="routedescr" SortExpression="routedescr" ReadOnly="True"
                        HeaderText="Route">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="traileraddr" SortExpression="traileraddr" HeaderText="TrailerAddr"
                        ReadOnly="True" ItemStyle-Wrap="false" ItemStyle-Width="150">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="trailerdate" SortExpression="trailerdate" ReadOnly="True"
                        HeaderText="PickDropDate" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="trailergeolat" SortExpression="trailergeolat" ReadOnly="True"
                        HeaderText="GeoLat">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="trailergeolng" SortExpression="trailergeolng" ReadOnly="True"
                        HeaderText="GeoLng">
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
                    <asp:BoundColumn DataField="jbctpttype" SortExpression="jbctpttype" ReadOnly="True"
                        HeaderText="TptType">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="sindex" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="typedescr" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="esnstatus" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="jbceqptype" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="jbid" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="id" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="reasoncode" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="statuscolor" Visible="False"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
