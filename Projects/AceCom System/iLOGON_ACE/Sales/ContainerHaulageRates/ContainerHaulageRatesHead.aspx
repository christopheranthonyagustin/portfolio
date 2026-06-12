<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHaulageRatesHead.aspx.cs" Inherits="iWMS.Web.Sales.ContainerHaulageRates.ContainerHaulageRatesHead" %>


<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ContainerHaulageRatesHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
    </style>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <table style="width:100% ; height:30px">
            <tr>
                <td class="style1">
                    <asp:Button ID="TnCBtn" runat="server" Text="T&C" ToolTip="T&C" OnClick="TnCBtn_Click" OnClientClick="disableBtn(this.id)"
                        UseSubmitBehavior="false" class="blue" />
                    <asp:Button ID="QuotationBtn" runat="server" Text="Quotation" ToolTip="Quotation" OnClick="QuotationBtn_Click" OnClientClick="disableBtn(this.id)"
                        UseSubmitBehavior="false" class="blue" />
                    <asp:Button ID="SendForApprovalBtn" runat="server" CssClass="LongLabelWhite" Text="Send for Approval"
                        OnClick="SendForApprovalBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <asp:Button ID="RejectBtn" runat="server" CssClass="white" Text="Reject"
                        OnClick="RejectBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <asp:Button ID="ApproveBtn" runat="server" CssClass="white" Text="Approve"
                        OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                     <asp:Button ID="SetAsInactiveBtn" runat="server" CssClass="LongLabelWhite" Text="Set as Inactive"
                        OnClick="SetAsInactiveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" AllowFilteringByColumn="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            GroupPanelPosition="Top" AllowSorting="true" EnableLinqExpressions="false">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ID="QuotationEdit" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Quotation Register"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ImgCancel" ImageUrl="../../image/bin.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete Quotation Register"
                                    OnClick="ImgCancel_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ImgCopy" ImageUrl="../../image/copy.png"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete Quotation Register"
                                    OnClick="ImgCopy_Click" CausesValidation="False"></asp:ImageButton>
                            <%--<asp:Label ID="CopyLbl" runat="server"></asp:Label>--%>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                    <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" />
                    <telerik:GridBoundColumn HeaderText="Acc" DataField="accode" AllowFiltering="true"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="code" AllowFiltering="true"
                        ColumnGroupName="code" SortExpression="code" UniqueName="code" Reorderable="true">
                    </telerik:GridBoundColumn>

                      <telerik:GridBoundColumn HeaderText="Default Quotation" DataField="defaultquotation" AllowFiltering="true"
                        ColumnGroupName="defaultquotation" SortExpression="defaultquotation" UniqueName="defaultquotation" Reorderable="true">
                    </telerik:GridBoundColumn>


                    <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                        ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="smancode" SortExpression="smancode" />
                    <telerik:GridBoundColumn HeaderText="SalesMan" DataField="smancodedescr" AllowFiltering="true"
                        ColumnGroupName="smancodedescr" SortExpression="smancodedescr" UniqueName="smancodedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ValidTillDate" DataField="validtilldate" AllowFiltering="true"
                        ColumnGroupName="validtilldate" SortExpression="validtilldate" UniqueName="validtilldate" DataFormatString="{0:dd/MMM/yyyy}"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Cny" DataField="currcode" AllowFiltering="false"
                        ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExchRate" DataField="exchrate" AllowFiltering="false"
                        ColumnGroupName="exchrate" SortExpression="exchrate" UniqueName="exchrate" Reorderable="true" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="D-S" DataField="DS" AllowFiltering="false" ColumnGroupName="DS"
                        SortExpression="DS" UniqueName="DS" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtRef1" DataField="exref1" AllowFiltering="true"
                        ColumnGroupName="exref1" SortExpression="exref1" UniqueName="exref1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtRef2" DataField="exref2" AllowFiltering="true"
                        ColumnGroupName="exref2" SortExpression="exref2" UniqueName="exref2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem" AllowFiltering="true"
                        ColumnGroupName="rem" SortExpression="rem" UniqueName="rem" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="smancode" SortExpression="smancode" />
                    <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />
                    <%--<telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

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
                                    <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="OK" />
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
</html>
