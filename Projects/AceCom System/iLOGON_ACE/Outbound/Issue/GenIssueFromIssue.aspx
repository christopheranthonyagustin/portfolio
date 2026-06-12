<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenIssueFromIssue.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.GenIssueFromIssue" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GenerateIssueFromReceipt</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>

    </telerik:RadCodeBlock>
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
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        <tr>
            <td>
                <telerik:RadButton ID="GenerateBtn" runat="server" OnClick="GenerateBtn_Click" Text="Generate"
                    Skin="WebBlue" SingleClick="true" SingleClickText="Processing...">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td style="height: 10px;">
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        EditMode="InPlace">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="ResultDG_Delete" runat="server">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                            title="Delete" runat="server" /></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="skucode" HeaderText="SKU">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "skucode")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="SKUTxt" Skin="Office2007" Width="150px" AutoPostBack="true"
                                        OnTextChanged="SKUTxt_TextChanged">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="SKUTxtReqVal" runat="server" ControlToValidate="SKUTxt"
                                        ErrorMessage="*" />
                                    <telerik:RadTextBox ID="SKUCodeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "skucode") %>' />
                                    <telerik:RadTextBox ID="SKUIDTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "skuid") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="skudescr" HeaderText="Description">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "skudescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="SKUDescrTxt" Skin="Office2007" Width="350px"
                                        ReadOnly="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="expectedqty" HeaderText="Qty">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "expectedqty", "{0:#,0.##}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007" Width="100px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:CompareValidator ID="QtyTxtZeroVal" runat="server" ControlToValidate="QtyTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="uom" HeaderText="UOM">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "uom")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="UOMList" runat="server" DefaultMessage="Select a UOM"
                                        DropDownHeight="150px" Skin="WebBlue" DataTextField="descr" DataValueField="uom">
                                    </telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator ID="UOMListReqVal" runat="server" ControlToValidate="UOMList"
                                        ErrorMessage="*" />
                                    <asp:TextBox ID="UOMTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "uom") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;">
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