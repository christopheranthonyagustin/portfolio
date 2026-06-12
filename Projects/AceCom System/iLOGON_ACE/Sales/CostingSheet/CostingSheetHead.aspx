<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetHead.aspx.cs"
    Inherits="iWMS.Web.Sales.CostingSheet.CostingSheetHead" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CostingSheetHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td align="left">
                    <asp:Button ID="ApproveBtn" runat="server" Text="Approve" OnClick="Approve_RadButtonClicked" Visible="false"
                        OnClientClick="return confirm('Confirm to approve selected CostingSheet?')" ToolTip="Approve Costing Sheet" CssClass="white"></asp:Button>
                    &nbsp;
                    <asp:Button ID="RejectBtn" runat="server" Text="Reject" OnClick="RejectBtn_Click" Visible="false"
                        OnClientClick="return confirm('Confirm to reject selected CostingSheet?')" CssClass="white"></asp:Button>
                    &nbsp;
                    <asp:Button ID="InactiveBtn" runat="server" Text="Inactive" OnClick="InactiveBtn_Click" Visible="false"
                        OnClientClick="return confirm('Confirm to be Inactive selected CostingSheet?')" CssClass="white"></asp:Button>
                    &nbsp;
                    <asp:Button ID="SOABtn" runat="server" Text="SOA" OnClick="SOA_RadButtonClicked" ToolTip="Approve Costing Sheet" CssClass="blue"></asp:Button>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" AllowFilteringByColumn="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            GroupPanelPosition="Top" AllowSorting="true">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
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
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="JobEdit" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Costing Sheet"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton ID="Copybtn" runat="server" Visible="True" ImageUrl="../../image/copy.png" ToolTip="Copy"
                                Width="15" Height="15" AlternateText="Copy" BackColor="Transparent" OnClick="Copybtn_Click"
                                BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp;  
                                <asp:ImageButton ID="PrintCostingsheetbtn" runat="server" Visible="True" ImageUrl="../../image/print.gif" ToolTip="Print Costing Sheet"
                                    Width="15" Height="15" AlternateText="Print Costing Sheet" BackColor="Transparent" OnClick="PrintCostingsheetbtn_Click"
                                    OnClientClick="return confirm('Print Costing Sheet?');"
                                    BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp;                                                               
                                <asp:ImageButton ID="ExcelCostingsheetbtn" runat="server" Visible="True" ImageUrl="../../image/excel.gif" ToolTip="Excel Costing Sheet"
                                    Width="15" Height="15" AlternateText="Excel Costing Sheet" BackColor="Transparent" OnClick="ExcelCostingsheetbtn_Click"
                                    OnClientClick="return confirm('Print Costing Sheet?');"
                                    BorderWidth="0"></asp:ImageButton>
                             <asp:ImageButton ID="Deletebtn" runat="server" Visible="False" ImageUrl="../../image/deletealllines.png" ToolTip="DeleteAllLines"
                                    Width="15" Height="15" AlternateText="DeleteAllLines" BackColor="Transparent" OnClick="Deletebtn_Click"
                                    OnClientClick="return confirm('Delete all costing sheet lines that have not been generated into invoice?');"
                                    BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp; 
                                <asp:ImageButton ID="Confirmbtn" runat="server" Visible="False" ImageUrl="../../image/finalize.gif" ToolTip="Confirm"
                                    Width="15" Height="15" AlternateText="Confirm" BackColor="Transparent" OnClick="Confirmbtn_Click"
                                    OnClientClick="return confirm('Proceed to Confirm Costing Sheet?');"
                                    BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp;                     
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
                    <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                        ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POL" DataField="poldescr" AllowFiltering="true"
                        ColumnGroupName="poldescr" SortExpression="poldescr" UniqueName="poldescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POD" DataField="poddescr" AllowFiltering="true"
                        ColumnGroupName="poddescr" SortExpression="poddescr" UniqueName="poddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Commodity" DataField="CommodityDescr" AllowFiltering="true"
                        ColumnGroupName="CommodityDescr" SortExpression="CommodityDescr" UniqueName="CommodityDescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DG" DataField="commodityclass" AllowFiltering="true"
                        ColumnGroupName="commodityclass" SortExpression="commodityclass" UniqueName="commodityclass"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="MaxUnits" DataField="totalqty" AllowFiltering="false"
                        ColumnGroupName="totalqty" SortExpression="totalqty" UniqueName="totalqty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnitsLeft" DataField="UnitsLeft" AllowFiltering="false"
                        ColumnGroupName="UnitsLeft" SortExpression="UnitsLeft" UniqueName="UnitsLeft" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ValidTillDate" DataField="validtilldate" AllowFiltering="true"
                        ColumnGroupName="validtilldate" SortExpression="validtilldate" UniqueName="validtilldate"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="smancode" SortExpression="smancode" />
                    <telerik:GridBoundColumn HeaderText="SalesMan" DataField="smancodedescr" AllowFiltering="true"
                        ColumnGroupName="smancodedescr" SortExpression="smancodedescr" UniqueName="smancodedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CUR" DataField="currcode" AllowFiltering="true"
                        ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="D-S" DataField="DS" AllowFiltering="true" ColumnGroupName="DS"
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
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
