<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DWOPGRQueue.aspx.cs" Inherits="iWMS.Web.WarehouseManagement.DailyWarehouseOpsPlanning.DWOPGRQueue" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Daily Warehouse Operations Planning GRQueue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" >
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

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
                width:30px; height:20px;
                float:right;
            }            
    </style>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>               
                <telerik:RadTab Id="GRQueueTab" Text="GRQueue" Value="0" runat="server">
                </telerik:RadTab> 
                <telerik:RadTab Id="GIQueueTab" Text="GIQueue" Value="50" runat="server">
                </telerik:RadTab>  
                <telerik:RadTab Id="LogTab" Text="Log" Value="100" runat="server">
                </telerik:RadTab>              
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" > 
             <telerik:RadPageView runat="server" ID="QueueRadPageView" Height="700px">
                  <table border="0" cellpadding="2" cellspacing="2" runat="server">
                <tr>
                     <td>
                        <br />
                        <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                    </td>                    
                     <td>
                        <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                        </asp:Label>
                        <br />
                        <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="120"
                            DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                            OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                     <td>
                        <br />
                        <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                    </td>
                   <td>
                       <br /><br /> 
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                   </td>
                    <td>
                        <br />
                        <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>                      
                        <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        &nbsp; 
                        <asp:Button ID="TodayBtn" class="white" runat="server" OnClick="TodayBtn_Click"
                            Text="Today" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;                                               
                        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel"  OnClick="ExcelBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="AssignBtn" runat="server" CssClass="white" Text="Assign" OnClick="AssignBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
                         &nbsp;
                        <asp:Button ID="UnassignBtn" runat="server" CssClass="white" Text="Unassign" OnClick="UnassignBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                         <asp:CheckBox ID="LesserInfoChk" runat="server" CssClass="BigCheckBox" style="vertical-align: middle"  AutoPostBack="true"/>
                        <asp:Label ID="LesserInfoChkLbl" runat="server" Font-Bold="true" Text="LessInfo" ForeColor="Black"></asp:Label>
                    </td>   
                </tr>
            </table>        
        <br />
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                    OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" 
                    OnColumnCreated="ResultDG_ColumnCreated" OnGridExporting="ResultDG_GridExporting"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                    AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                    ItemStyle-Wrap="true" GridLines="Both" Width="100%" Height="90%">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder" >
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="90%" TableLayout="Fixed" >
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" 
                                HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" CssClass="BigCheckBox"/>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" CssClass="BigCheckBox"/>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
            </asp:UpdatePanel>   
             </telerik:RadPageView>   
             <telerik:RadPageView runat="server" ID="GIQueueRadPageView" Height="700px" />  
             <telerik:RadPageView runat="server" ID="LogRadPageView" Height="700px" />            
         </telerik:RadMultiPage>           
      </form>
</body>
</html>
