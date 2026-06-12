<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveryServiceSummary.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveryService.DailyDeliveryServiceSummary" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyDeliveryServiceSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

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

        .CircleImg {
            width: 18px;
            height: 18px;
            border: 2px solid #999999;
            background: #ffffff;
            border-radius: 70%;
        }

        .SummaryContainer {
            box-sizing: border-box;
            width: 50% !important;
            height: 115px;
            background-color: #ECECEC;
            border-radius: 7px;
            border: 1px solid #ECECEC;
            padding: 5px;
        }

        .EachSummaryDiv {
            border: 1px #ccc solid;
            width: 22.2%;
            margin: 5px;
            background-color: #d1d4da;
            border-radius: 7px;
            padding-left: 5px;
            padding-top: 5px;
            float: left;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
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
                    <br />
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </asp:Panel>
                </td>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <br />
                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="SummaryPanel" runat="server">
            <div class="SummaryContainer">
                &nbsp;<asp:Label ID="OverallStatusLbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                <br />
                <div class="EachSummaryDiv">
                    <asp:Label ID="AllLbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <div id="AllDiv" class="CircleImg" runat="server"></div>
                            </td>
                            <td style="padding-left: 15px;">
                                <asp:Label runat="server" ID="AllCountLbl" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="EachSummaryDiv">
                    <asp:Label ID="InProgressLbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <div id="InProgressDiv" class="CircleImg" runat="server"></div>
                            </td>
                            <td style="padding-left: 15px;">
                                <asp:Label runat="server" ID="InProgresCountLbl" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="EachSummaryDiv">
                    <asp:Label ID="CompletedLbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <div id="CompletedDiv" class="CircleImg" runat="server"></div>
                            </td>
                            <td style="padding-left: 15px;">
                                <asp:Label runat="server" ID="CompletedCountLbl" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="EachSummaryDiv">
                    <asp:Label ID="FailedLbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <div id="FailedDiv" class="CircleImg" runat="server"></div>
                            </td>
                            <td style="padding-left: 15px;">
                                <asp:Label runat="server" ID="FailedCountLbl" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <br />
        <asp:Label ID="DriverLiveStatusLbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    AllowSorting="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="SummaryGrid" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c" HeaderStyle-Font-Bold="true">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
