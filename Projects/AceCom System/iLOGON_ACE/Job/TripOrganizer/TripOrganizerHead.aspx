<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripOrganizerHead.aspx.cs" Inherits="iWMS.Web.Job.TripOrganizer.TripOrganizerHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripOrganizerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
   <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <style type="text/css">
        .style1 {
            width: 95%;
        }
    </style>
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>


        <table style="width: 100%; height: 30px">
            <tr>
                <td class="style1">
                    <asp:Button ID="AcceptBtn" class="white" runat="server" OnClick="AcceptBtn_Click" Text="Accept" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                    <asp:Button ID="RejectBtn" class="white" runat="server" OnClick="RejectBtn_Click" Text="Reject" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                    <asp:Button ID="AssignBtn" class="white" runat="server" OnClick="AssignBtn_Click" Text="Assign" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                    <asp:Button ID="UnassignBtn" class="white" runat="server" OnClick="UnassignBtn_Click" Text="Unassign" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                    <asp:Button ID="CompletedBtn" class="white" runat="server" OnClick="CompleteBtn_Click" Text="Complete" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="SMSBtn" CssClass="white" runat="server" OnClick="SMSBtn_Click" disable="true"
                            Text="SMS"/>
                   &nbsp;

                </td>
            </tr>
        </table>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
                CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                <Tabs>
                    <telerik:RadTab ID="TripTab" Text="Trip" Value="0" readonly="readonly" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="AttcTab" Text="Attc" Value="100" runat="server">
                    </telerik:RadTab>
                    </Tabs>
        </telerik:RadTabStrip>
        <asp:Label ID="JobLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" Height="90%" ID="TripRadPageView">
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged" OnItemCommand="ResultDG_ItemCommand">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ID="TripEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Trip Organizer"
                                        OnClick="TripEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" ID="AttcBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="AttcDetail"
                                            CommandName="AttcDetail"></asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="false" DataField="id" HeaderText="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="jbid" HeaderText="jbid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="jbctnrid" HeaderText="jbctnrid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true"
                        ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="number" AllowFiltering="true"
                        ColumnGroupName="number" SortExpression="number" UniqueName="JobNo" Reorderable="true"
                        ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="status" HeaderText="status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="usrdef02" HeaderText="usrdef02">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="OfferStatus" SortExpression="OfferStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="offerstatusdescr" SortExpression="offerstatusdescr" HeaderText="OfferStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true" ItemStyle-CssClass="break-word"
                        ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true"
                        HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="fraddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                TextMode="MultiLine" Enabled="true">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true" ItemStyle-CssClass="break-word"
                        ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true"
                        HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="toddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                TextMode="MultiLine" Enabled="true">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="billsizetypedescr" SortExpression="billsizetypedescr"
                        HeaderText="BillSizeType" ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="Vehicle">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AltVehNo" SortExpression="AltVehNo" HeaderText="Alt Vehicle">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustRef" SortExpression="CustRef" ItemStyle-Wrap="false"
                        HeaderText="CustRef">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" ItemStyle-Wrap="false"
                        HeaderText="ExpectedDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fracttime" SortExpression="fracttime" ItemStyle-Wrap="false"
                        HeaderText="FromTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toacttime" SortExpression="toacttime" ItemStyle-Wrap="false"
                        HeaderText="ToTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="driver" SortExpression="driver" ItemStyle-Wrap="false"
                        HeaderText="driver">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AltPerName" SortExpression="AltPerName" ItemStyle-Wrap="false"
                        HeaderText="AltPerName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AltPerMobileNo" SortExpression="AltPerMobileNo" ItemStyle-Wrap="false"
                        HeaderText="AltPerMobileNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OfferBy" SortExpression="OfferBy" ItemStyle-Wrap="false"
                        HeaderText="OfferBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                        HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
                    </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
                </telerik:RadMultiPage>        
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
                                <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
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
