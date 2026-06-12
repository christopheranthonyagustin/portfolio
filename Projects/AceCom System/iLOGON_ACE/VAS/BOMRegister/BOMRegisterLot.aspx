<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BOMRegisterLot.aspx.cs"
    Inherits="iWMS.Web.VAS.BOMRegister.BOMRegisterLot" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>BOMRegisterLot</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../js/row.js"></script>

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
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        AllowPaging="True" AllowSorting="true" Skin="Office2007" OnItemCommand="ResultDG_ItemCommand">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
            EditMode="InPlace" HierarchyLoadMode="Client">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                    HeaderStyle-Width="30px" ItemStyle-Width="30px">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BOMDetlEdit"
                            ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                            CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="BOMLotUpdate" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="BOMLotUpdate" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="BOMDetlCancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="BOMDetlCancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id"
                    Display="false" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="bomlotid" AllowFiltering="true" Reorderable="true"
                    Display="false">
                    <ItemTemplate>
                        <asp:Label ID="bomlotidLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "bomlotid") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="bhid" DataField="bhid" AllowFiltering="true"
                    UniqueName="bhid" Display="false" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="skuid" DataField="skuid" AllowFiltering="true"
                    UniqueName="skuid" Display="false" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="acid" DataField="acid" AllowFiltering="true"
                    UniqueName="acid" Display="false" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="Master" DataField="MasterQty" UniqueName="MasterQty"
                    Reorderable="true">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "MasterQty")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <asp:CompareValidator ID="MasterQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="MasterQtyDetlTxt" Operator="DataTypeCheck"
                            Type="Integer"></asp:CompareValidator>
                        <telerik:RadTextBox runat="server" ID="MasterQtyDetlTxt" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "MasterQty") %>'
                            Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Original" DataField="qty" UniqueName="qty"
                    Reorderable="true">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "qty")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CompareValidator ID="QtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="QtyDetlTxt" Operator="DataTypeCheck"
                            Type="Integer"></asp:CompareValidator>
                        <telerik:RadTextBox runat="server" ID="QtyDetlTxt" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "Qty") %>'
                            Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Expanded" DataField="ExpandedQty" UniqueName="ExpandedQty"
                    Reorderable="true">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ExpandedQty")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                           <asp:CompareValidator ID="RecExpandedQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="ExpandedQtyTxt" Operator="DataTypeCheck"
                            Type="Integer"></asp:CompareValidator>
                        <telerik:RadTextBox runat="server" ID="ExpandedQtyTxt" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "ExpandedQty") %>'
                            Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Rotation" DataField="RotationQty" UniqueName="RotationQty"
                    Reorderable="true">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "RotationQty")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:CompareValidator ID="RecRotationQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="RotationQtyTxt" Operator="DataTypeCheck"
                            Type="Integer"></asp:CompareValidator>
                        <telerik:RadTextBox runat="server" ID="RotationQtyTxt" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "RotationQty") %>'
                            Enabled="true" ReadOnly="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="OutManual" DataField="outqty" UniqueName="outqty"
                    Reorderable="true">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "outqty")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:CompareValidator ID="RecOutQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="outqtyDetlTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <telerik:RadTextBox runat="server" ID="outqtyDetlTxt" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "outqty") %>'
                            Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="InRequest" DataField="inqty" UniqueName="inqty"
                    Reorderable="true" Display="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "inqty")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CompareValidator ID="RecInQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="inqtyDetlTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <telerik:RadTextBox runat="server" ID="inqtyDetlTxt" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "inqty") %>'
                            Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="ExpandedRemarks" DataField="ExpandedRem1"
                    UniqueName="RotationQty" Reorderable="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ExpandedRem1")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="ExpandedRem1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "ExpandedRem1") %>'
                            TextMode="MultiLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1"
                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" Reorderable="true"
                    ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2"
                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" Reorderable="true"
                    ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3"
                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" Reorderable="true"
                    ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4"
                    ItemStyle-Wrap="false" Reorderable="true" ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5"
                    ItemStyle-Wrap="false" Reorderable="true" ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6"
                    ItemStyle-Wrap="false" Reorderable="true" ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot7" HeaderText="Lot7" SortExpression="lot7"
                    ItemStyle-Wrap="false" Reorderable="true" ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot9" HeaderText="Lot9" SortExpression="lot9"
                    ItemStyle-Wrap="false" Reorderable="true" ReadOnly="true">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>             
                <telerik:GridBoundColumn DataField="BLstatusdescr" SortExpression="BLstatusdescr" HeaderText="Status"
                    UniqueName="blstatusdescr" Reorderable="true" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                    UniqueName="status" Display="false" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="blstatuscolour" DataField="blstatuscolour" AllowFiltering="true"
                    UniqueName="blstatuscolour" Display="false" ReadOnly="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
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
