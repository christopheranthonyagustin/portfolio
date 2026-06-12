<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionChangeRequestHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionChangeRequest.DistributionChangeRequestHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ChangeRequest</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
   <script language="javascript" type="text/javascript">
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

    <script type="text/javascript">
        function OnClientItemBlurMenu(sender, args) {
            setTimeout(function () {
                sender.close(true);
            }, 200);
        }

        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="ApproveBtn" runat="server" CssClass="white" Text="Approve"
                    OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="RejectBtn" runat="server" CssClass="white" Text="Reject"
                    OnClick="RejectBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                  &nbsp;             
                <asp:Button ID="ChangeRequestBtn" runat="server" CssClass="LongLabelBlue" Text="Change Request"
                    OnClick="ChangeRequestBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                 &nbsp;
                 <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
                    OnClick="CloseBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                 <%--<asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                    OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />--%>

                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                        <td>
                            <asp:Button ID="ApproveConfirmBtn" Text="" Style="display: none;" OnClick="ApproveConfirmBtn_Click" runat="server" />
                        </td>
                        <td>
                              <asp:Button ID="RejectConfirmBtn" Text="" Style="display: none;" OnClick="RejectConfirmBtn_Click" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Id" UniqueName="Id" HeaderText="Id" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChangeRequestNo" UniqueName="ChangeRequestNo" SortExpression="ChangeRequestNo" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ChangeRequestNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequestDate" UniqueName="RequestDate" SortExpression="RequestDate"
                                HeaderText="ChangeRequestDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" SortExpression="BranchCode" AllowFiltering="false"
                                HeaderText="BranchCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DepartmentCode" UniqueName="DepartmentCode" SortExpression="DepartmentCode" AllowFiltering="false"
                                HeaderText="DepartmentCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Type" UniqueName="Type" SortExpression="Type" AllowFiltering="false"
                                HeaderText="Type" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="RequestorName" UniqueName="RequestorName" SortExpression="RequestorName" AllowFiltering="false"
                                HeaderText="RequestorName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" AllowFiltering="false"
                                HeaderText="CustomerName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequestedBy" UniqueName="RequestedBy" HeaderText="RequestedBy" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PIC" UniqueName="PIC" HeaderText="PIC" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotalMandays" UniqueName="TotalMandays" SortExpression="TotalMandays" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="TotalMandays">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DiscountMandays" UniqueName="DiscountMandays" SortExpression="DiscountMandays" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="DiscountMandays">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Notes">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChangeRequestStatusDescr" UniqueName="ChangeRequestStatusDescr" SortExpression="ChangeRequestStatusDescr" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ApprovedBy" UniqueName="ApprovedBy" SortExpression="ApprovedBy" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ApproveBy">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ApprovdeOn" UniqueName="ApprovdeOn" SortExpression="ApprovdeOn" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ApprovdeOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ApproveStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChangeRequestId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChangeRequestNo" Display="false">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn> 
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        // Instantiate our BusyBox object        
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBox.html");
    </script>

</body>
</html>
