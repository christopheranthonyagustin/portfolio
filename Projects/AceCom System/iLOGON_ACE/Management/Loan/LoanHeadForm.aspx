<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanHeadForm.aspx.cs" Inherits="iWMS.Web.Management.Loan.LoanHeadForm" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoanHeadForm</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    &nbsp;
    <telerik:RadButton ID="UpdateBtn" runat="server" OnClick="UpdateBtn_Click" Text="Update"
        Skin="WebBlue">
    </telerik:RadButton>
    <br />
    <br />
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    <br />
    <br />
    <telerik:RadButton ID="FinalizeBtn" runat="server" OnClick="FinalizeBtn_Click" Text="Finalize"
        Skin="WebBlue">
    </telerik:RadButton>
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnPreRender="ResultDG_PreRender" AllowPaging="false" AllowSorting="true" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        OnDetailTableDataBind="ResultDG_DetailTableDataBind" AllowAutomaticInserts="True"
        Width="200%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" EditMode="InPlace"
            Width="100%" Name="ParentGrid" AllowFilteringByColumn="true" HierarchyLoadMode="Client"
            CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="New Record">
            <CommandItemTemplate>
                <div style="padding: 5px 5px;">
                    &nbsp;&nbsp;
                    <asp:ImageButton runat="server" Visible="True" ID="LoanDetlAdd" ImageUrl="..\..\image\add.png"
                        BorderWidth="0" BackColor="Transparent" Width="11" Height="11" AlternateText="Edit Loan"
                        ToolTip="Add LoanDetail" OnClick="LoanDetlAdd_Click" CausesValidation="False">
                    </asp:ImageButton>&nbsp;
                    <asp:Label ID="Lbl1" runat="server" Text="New Record" Font-Names="Verdana" ForeColor="DarkBlue" />
                </div>
            </CommandItemTemplate>
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
                        <asp:ImageButton runat="server" Visible="True" ID="LoanEdit" ImageUrl="..\..\image\pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Loan"
                            ToolTip="Edit LoanDetail" OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                        <a id="lnkDelete" onclick="return confirm('Confirm delete?')" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                            runat="server" onserverclick="LoanDetail_Delete">
                            <img id="delImg" border="0" alt="Delete Container" src="..\..\image\bin.gif" width="15"
                                height="15" runat="server" /></a>
                    </ItemTemplate>
                    <ItemStyle Wrap="false" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="ID" DataField="id" AllowFiltering="true" ColumnGroupName="id"
                    SortExpression="id" UniqueName="id" Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SkuID" DataField="skuid" AllowFiltering="true"
                    ColumnGroupName="skuid" SortExpression="skuid" UniqueName="skuid" Reorderable="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="LotID" DataField="lotid" AllowFiltering="true"
                    ColumnGroupName="lotid" SortExpression="lotid" UniqueName="lotid" Reorderable="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="UOM" DataField="uom" AllowFiltering="true" ColumnGroupName="uom"
                    SortExpression="uom" UniqueName="uom" Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="LocCode" DataField="loccode" AllowFiltering="true"
                    ColumnGroupName="loccode" SortExpression="loccode" UniqueName="loccode" Reorderable="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Tuno1" DataField="tuno1" AllowFiltering="true"
                    ColumnGroupName="tuno1" SortExpression="tuno1" UniqueName="tuno1" Reorderable="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Tuno2" DataField="tuno2" AllowFiltering="true"
                    ColumnGroupName="tuno2" SortExpression="tuno2" UniqueName="tuno2" Reorderable="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="srcdtid" DataField="srcdtid" AllowFiltering="true"
                    SortExpression="srcdtid" UniqueName="srcdtid" Reorderable="true" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true"
                    ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                    ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" AllowFiltering="true" ColumnGroupName="qty"
                    SortExpression="qty" UniqueName="qty" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                    ColumnGroupName="status" SortExpression="status" UniqueName="status" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true"
                    ColumnGroupName="lot1" SortExpression="lot1" UniqueName="lot1" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true"
                    ColumnGroupName="lot2" SortExpression="lot2" UniqueName="lot2" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true"
                    ColumnGroupName="lot3" SortExpression="lot3" UniqueName="lot3" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true"
                    ColumnGroupName="lot4" SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true"
                    ColumnGroupName="lot5" SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true"
                    ColumnGroupName="lot6" SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true"
                    ColumnGroupName="lot7" SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true"
                    ColumnGroupName="lot8" SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true"
                    ColumnGroupName="lot9" SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true"
                    ColumnGroupName="lot10" SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true"
                    ColumnGroupName="lot11" SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true"
                    ColumnGroupName="lot12" SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                </telerik:GridBoundColumn>
            </Columns>
            <DetailTables>
                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                    Width="27%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="srcdtid" MasterKeyField="id" />
                    </ParentTableRelation>
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
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="LoanDetlEdit" ImageUrl="..\..\image\pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" OnClick="REEdit_Click"
                                    AlternateText="Edit Loan" ToolTip="Edit LoanDetail" CausesValidation="False">
                                </asp:ImageButton>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" ColumnGroupName="id"
                            SortExpression="id" UniqueName="id" Reorderable="true" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="srcdtid" DataField="srcdtid" AllowFiltering="true"
                            SortExpression="srcdtid" UniqueName="srcdtid" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SkuCode" DataField="skucode" AllowFiltering="true"
                            SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                            SortExpression="type" UniqueName="type" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" AllowFiltering="true" SortExpression="qty"
                            UniqueName="qty" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                            SortExpression="status" UniqueName="status" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SkuID" DataField="skuid" AllowFiltering="true"
                            ColumnGroupName="skuid" SortExpression="skuid" UniqueName="skuid" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LotID" DataField="lotid" AllowFiltering="true"
                            ColumnGroupName="lotid" SortExpression="lotid" UniqueName="lotid" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UOM" DataField="uom" AllowFiltering="true" ColumnGroupName="uom"
                            SortExpression="uom" UniqueName="uom" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LocCode" DataField="loccode" AllowFiltering="true"
                            ColumnGroupName="loccode" SortExpression="loccode" UniqueName="loccode" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Tuno1" DataField="tuno1" AllowFiltering="true"
                            ColumnGroupName="tuno1" SortExpression="tuno1" UniqueName="tuno1" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Tuno2" DataField="tuno2" AllowFiltering="true"
                            ColumnGroupName="tuno2" SortExpression="tuno2" UniqueName="tuno2" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <br />
    <br />
    &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
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
                        <td style="width: 2%;">
                        </td>
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
