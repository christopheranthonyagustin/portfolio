<%@ Page Language="c#" CodeBehind="ManpowerActivityPlanningDetail.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.ManpowerActivityPlanning.ManpowerActivityPlanningDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ManpowerActivityPlanningDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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

    <style type="text/css">
        html{
        overflow:hidden;
        }
    </style>
    <style type="text/css">  
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td  
        {  
            border-left: solid 1px gray !important;  
            border-bottom: solid 1px gray !important;
        }  
    </style>  

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="NewModuleTitle" align="right">
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;">

                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Manpower Activity Planning</asp:Label>
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
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
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
                                                        &nbsp;<asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadComboBox ID="AccountDDL" runat="server" Enabled="True" Filter="Contains" DataTextField="code"
                                                            DataValueField="acid" Width="150px" Skin="WebBlue">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="FromDateLbl" runat="server">FromDate</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="frDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="150px" AutoPostBack="true"
                                                            OnSelectedDateChanged="frDatePicker_OnDateSelectedChanged">
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="ToDateLbl" runat="server">ToDate</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadDatePicker ID="toDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy 23:59:59" Skin="Office2007" Width="150px"
                                                            sel>
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style1">
                                                        &nbsp;<asp:Label ID="JobNoLbl" runat="server">JobNumber</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadTextBox ID="JobNoTxt" runat="server" Width="150px">
                                                        </telerik:RadTextBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="AtvtCodeLbl" runat="server">Activity</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadComboBox ID="AtvtCodeDDL" runat="server" Filter="Contains" Enabled="True"
                                                            DataTextField="Descr" DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="ManpowerTypeLbl" runat="server">ManpowerType</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadComboBox ID="ManpowerTypeDDL" runat="server" Enabled="True" DataTextField="Descr" Filter="Contains"
                                                            DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                    <td class="style1">
                                                        <asp:Label ID="PerLbl" runat="server">Personnel</asp:Label>
                                                    </td>
                                                    <td class="style1">
                                                        <telerik:RadComboBox ID="PerDDL" runat="server" Enabled="True" DataTextField="Descr" Filter="Contains"
                                                            DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                       <%-- <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                                                            <img id="excelImg" border="0" alt="Export to Excel" src="../../Image/excel.gif" height="20"
                                                                runat="server"></a>--%>                                                        
                                                        <asp:Button ID="refreshBtn" CssClass="white" runat="server" OnClick="refreshBtn_Click" 
                                                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />  
                                                         &nbsp;
                                                        <asp:Button ID="auditBtn" CssClass="white" runat="server" OnClick="auditBtn_Click" 
                                                             Text="Audit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />  
                                                         &nbsp;
                                                        <asp:Button ID="ExportExcelLnk" CssClass="green" runat="server" OnClick="ExportExcel" Visible="true"  
                                                            Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export to Excel" />                                              
                                                    </td>
                                        </td>     
                                                                        
                                       <%-- <td>
                                            <telerik:RadButton Style="z-index: 0" ID="RadButton1" runat="server" Text="Refresh"
                                                OnClick="refreshBtn_Click" Skin="WebBlue">
                                            </telerik:RadButton>
                                            &nbsp;
                                            <telerik:RadButton Style="z-index: 0" ID="RadButton2" runat="server" Text="Audit" OnClick="auditBtn_Click"
                                                Skin="WebBlue">
                                            </telerik:RadButton>
                                        </td>--%>
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
    </div>
    <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="86%"
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        AllowPaging="false" AllowSorting="true" OnPreRender="ResultDG_PreRender" Skin="Office2007">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <%--Ticket #5654: SMPL : Enhancement to Manpower Activity Planning module (MAP) PT 70--%>
            <Scrolling AllowScroll="true" UseStaticHeaders="true"/>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="Master" TableLayout="Fixed"
            AlternatingItemStyle-Wrap="true">
            <Columns>
                <telerik:GridTemplateColumn HeaderStyle-Width="35px" ItemStyle-Width="35px" Reorderable="false"
                    UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="45px" ItemStyle-Width="45px">
                    <ItemStyle Wrap="True"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit"
                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                        <a id="A4" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="Remarks_Click"
                                    runat="server">
                                    <img id="Img7" src="../../image/remarks.png" width="15" height="15" border="0" alt="Add Remarks"
                                        title="Add Remarks" runat="server" /></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="45px" ItemStyle-Width="45px" HeaderText="Audit">
                    <ItemStyle Wrap="True"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="AuditCfmLbl" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderText="Assign">
                    <ItemStyle Wrap="True"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="CautionLbl" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                    ItemStyle-Width="40px">
                    <HeaderTemplate>
                        #
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="id"
                    SortExpression="id" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="250px" ItemStyle-Width="250px" DataField="jbid"
                    SortExpression="jbid" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="manpoweridcol"
                    SortExpression="manpoweridcol" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="300px" ItemStyle-Width="300px" DataField="piccode"
                    SortExpression="piccode" HeaderText="PIC/CS">
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="150px" ItemStyle-Width="150px" DataField="jobcol"
                    SortExpression="jobcol" HeaderText="JobNo | JobHr | Cust </br> Vsl | ETA | ETD | </br> ConnVsl | ConnETA | ConnETD"
                    UniqueName="job">
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="150px" ItemStyle-Width="150px" DataField="atvthrcol"
                    SortExpression="atvthrcol" HeaderText="AtvtHr"
                    UniqueName="atvthrcol">
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="150px" ItemStyle-Width="150px" DataField="activitycol"
                    SortExpression="activitycol" HeaderText="Activity | NoOfEqp | BSType </br> NoOfPkgs | GoodsVol | GoodsWt | GoodsDescr"
                    UniqueName="Activity">
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="atvtremarks"
                    SortExpression="atvtremarks" HeaderText="AtvtRemarks </br> Vendor | FumigationId ">
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="180px" ItemStyle-Width="180px" DataField="atvtaddr"
                    SortExpression="perheadaddr" HeaderText="Addr (From~To)" UniqueName="Address">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="atvtdate"
                    SortExpression="atvtdate" ReadOnly="True" HeaderText="AtvtExpDate(From~To)">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="manpowercol"
                    SortExpression="manpower" HeaderText="ManType |</br> ManRemarks |</br> Cert">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="PerEquip"
                    SortExpression="PerEquip" HeaderText="Personnel | Equipment">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="250px" ItemStyle-Width="250px" DataField="atvtfrexpdate"
                    SortExpression="atvtfrexpdate" ReadOnly="True" HeaderText="ActivityExpDate(From)"
                    DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="atvttoexpdate"
                    SortExpression="atvttoexpdate" ReadOnly="True" Display="false" HeaderText="ActivityExpDate(To)"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="perdInctStartEndtime"
                    SortExpression="perdInctStartEndtime" HeaderText="PerActTime">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="perdexpfrtotime"
                    SortExpression="perdexpfrtotime" HeaderText="PerPlannedTime">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="personnel"
                    SortExpression="personnel" HeaderText="Personnel" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="equipment"
                    SortExpression="equipment" HeaderText="Equipment" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="140px" ItemStyle-Width="140px" DataField="perdactfrtotime"
                    SortExpression="perdactfrtotime" HeaderText="PerBillableTime">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="150px" ItemStyle-Width="150px" DataField="jobcol"
                    SortExpression="jobcol" HeaderText="JobNo | JobHr | Cust </br> Vsl | ETA | ETD | </br> ConnVsl | ConnETA | ConnETD"
                    UniqueName="job1">
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ItemStyle Wrap="True"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="peratvtstatusdescr" Display="true" HeaderText="Status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="atvtaddrlong" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="auditstatus" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
