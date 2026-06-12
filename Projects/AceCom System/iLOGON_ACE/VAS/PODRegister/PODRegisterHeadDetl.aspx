<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PODRegisterHeadDetl.aspx.cs"
    Inherits="iWMS.Web.VAS.PODRegister.PODRegisterHeadDetl" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>POD</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />

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

        function timedRefresh(timeoutPeriod) {
            redirectURL = location.href + "&firstpageload=N";
            setTimeout("window.location.href = redirectURL;", timeoutPeriod);
        }

    </script>

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

    <style type="text/css">
       RadPanelBar,
        .RadPanelBar div.rpSlide,
        .RadPanelBar ul.rpGroup,
        .RadPanelBar li.rpItem   /*, .RadPanelBar .rpTemplate*/
        {
            overflow: visible;            
        }

      div.RadPanelBar .rpLevel1 .rpItem
      {
         padding:0;
      }          

      * html .RadPanelBar .RadMenu ul.rmRootGroup
      {
         zoom: 1;
      }       

      div.RadMenu .rmRootGroup
      {
         border: 0;
      }         

      div.RadMenu .rmLink
      {
         float: none;
      }
        .NoOverflow,
        .NoOverflow .RadPanelBar,
        .NoOverflow .rpLevel1,
        .NoOverflow .rpExpanded,
        .NoOverflow .rpGroup,
        .NoOverflow .rpItem        /*, .RadPanelBar .rpTemplate*/
        {
            overflow: scroll !important;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td align="right">
                    <div class="NewModuleTitle">
                        <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">POD Register</asp:Label>
                    </div>
                </td>
            </tr>
        </table>
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
        <telerik:RadPanelBar runat="server"  ID="RadPanelBar1" Width="130%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;" Width="100%" >
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr style="height: 15px">
                                    </tr>
                                    <tr style="height: 30px">
                                        <td>
                                            &nbsp;<asp:Label ID="FromDate" runat="server">Date</asp:Label>
                                        </td>
                                        <td>                  
                                            <telerik:RadDatePicker ID="FrDateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="155">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            &nbsp;<asp:Label ID="DriverLbl" runat="server">Driver</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="DriverTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            &nbsp;<asp:Label ID="SyncStatusLbl" runat="server">SyncStatus</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDropDownList ID="SyncStatusDDL" runat="server" Enabled="True" DataTextField="descr"
                                                DataValueField="item" Width="150px" Skin="WebBlue">
                                            </telerik:RadDropDownList>
                                            <br />
                                        </td>
                                        <td rowspan="4" colspan="2">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <td valign="top">
                                                    &nbsp;<asp:Label ID="Label2" runat="server">DNNumber</asp:Label>
                                                </td>
                                                <td valign="top">
                                                    <telerik:RadTextBox ID="DNNumberTxt" Skin="WebBlue" runat="server" Width="150px" TextMode="MultiLine" Rows="7">
                                                    </telerik:RadTextBox>
                                                </td>
                                            </table>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr style="height: 30px">
                                        <td >
                                            &nbsp;<asp:Label ID="RecipientNamelbl" runat="server">RecipientName</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="RecipientNameTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="RecipientNRICLbl" runat="server">RecipientNRIC</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="RecipientNRICTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="DNStatusLbl" runat="server">DNStatus</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDropDownList ID="DNStatusDDL" runat="server" Enabled="True" DataTextField="descr"
                                                DataValueField="item" Width="150px" Skin="WebBlue">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr style="height: 30px">
                                        <td >
                                            &nbsp;<asp:Label ID="HandoverNameLbl" runat="server">HandoverName</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="HandoverNameTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            &nbsp;<asp:Label ID="TakeoverNameLbl" runat="server">TakeoverName</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="TakeoverNameTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="HOStatusLbl" runat="server">HOStatus</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDropDownList ID="HOStatusDDL" runat="server" Enabled="True" DataTextField="descr"
                                                DataValueField="item" Width="150px" Skin="WebBlue">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr style="height: 30px">
                                        <td >
                                            &nbsp;<asp:Label ID="STONolbl" runat="server">STONo</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="STONoTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="DOCNolbl" runat="server">DOCNo</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="DOCNoTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="HONumberlbl" runat="server">HONumber</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="HONumberTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr style="height: 30px">
                                        <td >
                                            &nbsp;<asp:Label ID="HandOverDateLbl" runat="server">HandOverDate</asp:Label>
                                        </td>
                                        <td>                  
                                            <telerik:RadDatePicker ID="HandOverDateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="155">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="ReasonCodelbl" runat="server">ReasonCode</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="ReasonCodeTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="AttemptDatelbl" runat="server">AttemptDate</asp:Label>
                                        </td>
                                        <td>                  
                                            <telerik:RadDatePicker ID="AttemptDateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="155">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td >
                                            &nbsp;<asp:Label ID="MONumberlbl" runat="server">MONumber</asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="MONumberTxt" Skin="WebBlue" runat="server" Width="150px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr style="height: 50px">
                                        <td>
                                            &nbsp;
                                            <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="NotSyncedchkbox" runat="server" Text="  NotSynced" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
            <ExpandAnimation Type="None" />
            <CollapseAnimation Type="None" />
        </telerik:RadPanelBar>
        <asp:Panel ID="finalisedPanel" runat="server">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>
                        <br />
                        &nbsp;<asp:Button ID="PrintPackingListBtn" class="blue" runat="server" OnClick="PrintPackingListBtn_Click" Text="Print"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                        &nbsp;
                        <asp:Button Width="110" ID="SelfCollectionBtn" class="white" runat="server" OnClick="SelfCollectionBtn_Click" Text="Self-Collection" 
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button Width="110" ID="UpdateAttemptBtn" CssClass="white" runat="server" OnClick="UpdateAttemptBtn_Click" Text="UpdateAttempt" 
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="EditBtn" class="white" runat="server" OnClick="EditBtn_Click" Text="Edit" 
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExcelBtn_Click" Text="Excel" 
                            OnClientClick="disableBtn(this.id); timedRefresh(2000)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <div id="div2" style="width: 100%; height: 100%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                Width="100%" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                AllowPaging="false" AllowSorting="true" Skin="Office2007" AllowAutomaticInserts="True">
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                    <Selecting AllowRowSelect="true"></Selecting>
                    <Scrolling UseStaticHeaders="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>                      
                        <telerik:GridBoundColumn DataField="dnnumber" SortExpression="dnnumber" HeaderText="DNNumber" UniqueName="dnnumber">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="mrzone" SortExpression="mrzone" HeaderText="MRZone" UniqueName="mrzone">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno" SortExpression="tuno" HeaderText="BoxNo" UniqueName="tuno">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="driver" SortExpression="drivername" HeaderText="DriverName" UniqueName="driver">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehicleNumber" UniqueName="vehno">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DNStatusdescr" SortExpression="DNStatusdescr" HeaderText="DNStatus" UniqueName="DNStatusdescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dept" SortExpression="dept" HeaderText="Department" UniqueName="dept">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="honumber" SortExpression="honumber" HeaderText="HandoverNumber" UniqueName="honumber">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="handovername" SortExpression="handovername" HeaderText="HandoverName" UniqueName="handovername">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="handoverdate" SortExpression="handoverdate" HeaderText="HandOverDate" UniqueName="handoverdate" 
                            DataFormatString="{0:dd/MMM/yyyy hh:mm}">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="HOStatusdescr" SortExpression="HOStatusdescr" HeaderText="HOStatus" UniqueName="HOStatusdescr">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="takeovername" SortExpression="takeovername" HeaderText="TakeoverName" UniqueName="takeovername">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="takeoverdate" SortExpression="takeoverdate" HeaderText="TakeOverDate" UniqueName="takeoverdate"
                            DataFormatString="{0:dd/MMM/yyyy hh:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="SyncDate" UniqueName="adddate"
                             DataFormatString="{0:dd/MMM/yyyy hh:mm}">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="SyncStatusdescr" SortExpression="SyncStatusdescr" HeaderText="SyncStatus"  UniqueName="SyncStatusdescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="recipientName" SortExpression="recipientName" HeaderText="RecipientName" UniqueName="recipientName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="recipientNRIC" SortExpression="recipientNRIC" HeaderText="RecipientNRIC" UniqueName="recipientNRIC">
                        </telerik:GridBoundColumn>                                                                 
                        <telerik:GridBoundColumn DataField="Reasoncode" SortExpression="Reasoncode" HeaderText="ReasonCode" UniqueName="Reasoncode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="attemptedDate" SortExpression="attemptedDate" HeaderText="AttemptedDate" UniqueName="attemptedDate" 
                            DataFormatString="{0:dd/MMM/yyyy hh:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="delvdate" SortExpression="delvdate" HeaderText="DeliverDate" UniqueName="delvdate" 
                            DataFormatString="{0:dd/MMM/yyyy hh:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ZoneIc" SortExpression="ZoneIc" HeaderText="ZoneIC" UniqueName="ZoneIc">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DNStatus" SortExpression="DNStatus" Display="false" UniqueName="DNStatus">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="spid" SortExpression="spid" HeaderText="spid" Display="false" UniqueName="spid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SyncStatus" SortExpression="SyncStatus" HeaderText="SyncStatus" Display="false" UniqueName="SyncStatus">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false" UniqueName="id">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
             </div>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
            </telerik:RadWindowManager>
            <%--Message popup area start--%>
            <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
            <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                BackgroundCssClass="MessageBoxPopupBackground">
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
