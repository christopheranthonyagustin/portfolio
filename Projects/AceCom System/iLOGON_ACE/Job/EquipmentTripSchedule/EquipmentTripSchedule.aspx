<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentTripSchedule.aspx.cs" Inherits="iWMS.Web.Job.EquipmentTripSchedule.EquipmentTripSchedule" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>EquipmentTripSchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
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
        html{
        overflow:hidden;
        }
    </style>
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%"
        <tr>
            <td class="NewModuleTitle" align="right">
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;">
                <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Equipment Trip Schedule</asp:Label>
            </td>
        </tr>
    </table>
    <div>
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
                                    <tr style="height: 5px"></tr>
                                    <tr>
                                        <td class="style2">
                                            <table border="0" cellpadding="1" cellspacing="0" width="100%">
                                                <tr>
                                                    <td style="width: 500px" valign="top">
                                                        &nbsp;<asp:Label ID="AccountLbl" Width="50px" runat="server">Account</asp:Label>
                                                        <telerik:RadDropDownList ID="AccountDDL" runat="server" Enabled="True" DataTextField="code"
                                                            DataValueField="acid" Width="150px" Skin="WebBlue">
                                                        </telerik:RadDropDownList>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        &nbsp;<asp:Label ID="ShTypeLbl" Width="50px" runat="server">ShType</asp:Label>
                                                        <telerik:RadDropDownList ID="ShTypeDDL" runat="server" Enabled="True" Width="150px" Skin="WebBlue" 
                                                        AutoPostBack="true" OnSelectedIndexChanged="ShTypeDDL_SelectedIndexChanged" >
                                                        </telerik:RadDropDownList>
                                                        <br />
                                                        <br />
                                                        &nbsp;<asp:Label ID="Label1" Width="50px" runat="server">Date</asp:Label>
                                                        <telerik:RadDatePicker ID="frDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="150px">
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                        <br />
                                                        &nbsp;<asp:Label ID="Label2" Width="50px" runat="server"></asp:Label>
                                                        <telerik:RadDatePicker ID="toDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy 23:59:59" Skin="Office2007" Width="150px">
                                                            <Calendar>
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>

                                                    <td style="width: 400px" valign="top">
                                                        <asp:Label ID="TptTypeLbl" Width="50px" runat="server" Text="TptType" />
                                                        <telerik:RadListBox runat="server" ID="TptTypeBox" Height="120px" Width="185px" Skin="WebBlue"
                                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedTptTypeBox"
                                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                            AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true" OnTransferred="TptTypeBox_Transferred">
                                                        </telerik:RadListBox>
                                                        <telerik:RadListBox runat="server" ID="SelectedTptTypeBox" Height="120px" Width="150px" Skin="WebBlue"
                                                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                            AllowDelete="false">
                                                        </telerik:RadListBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp;&nbsp;<telerik:RadButton Style="z-index: 0" ID="refreshBtn" runat="server" Text="Refresh"
                                                        OnClick="RefreshBtn_Click" Skin="WebBlue">
                                                        </telerik:RadButton>
                                                    </td>
                                                </tr>
                                            </table>
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
    </div>
    <%--<div id="div3">
        <table>
            <tr>
                <td>
                    <telerik:RadButton Style="z-index: 0" ID="extendBtn" runat="server" Text="Extend" Skin="WebBlue">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </div>--%>
    <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
       <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" Width="100%" Height="86%" 
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        AllowPaging="false" AllowSorting="true" Skin="Office2007">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <Scrolling AllowScroll="true" UseStaticHeaders="true"/>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" Name="Master" >
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate> 
                            <asp:CheckBox ID="chkObjective" runat="server" />                           
                        </ItemTemplate>
                    <ItemStyle Wrap="false" />   
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
