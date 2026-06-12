<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MHAInterfaceProductMaster.aspx.cs" Inherits="iWMS.Web.Interface.MHAIncoming.MHAInterfaceProductMaster" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MHAInterfaceProductMaster</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
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
    <form id="form1" runat="server" defaultbutton="SearchBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td>
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ReProcessBtn" class="white" runat="server" OnClick="ReProcessBtn_Click" Text="ReProcess" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        Width="100%" Height="86%" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        AllowPaging="false" AllowSorting="true" Skin="Office2007" AllowFilteringByColumn="true">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <Scrolling UseStaticHeaders="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:Label ID="LogLbl" runat="server" BackColor="Transparent"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="FileName" SortExpression="FileName" HeaderText="FileName"
                    UniqueName="FileName" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Type" SortExpression="Type" HeaderText="Type"
                    UniqueName="Type" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ActualIndicator" SortExpression="ActualIndicator" HeaderText="ActualIndicator"
                    UniqueName="ActualIndicator" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                    UniqueName="statusdescr" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="owner_code" SortExpression="owner_code" HeaderText="OwnerCode"
                    UniqueName="owner_code" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_code" SortExpression="prod_code" HeaderText="ProductCode"
                    UniqueName="prod_code" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="name1" SortExpression="name1" HeaderText="Name1"
                    UniqueName="name1" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="name2" SortExpression="name2" HeaderText="Name2"
                    UniqueName="name2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                    UniqueName="remarks" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_status" SortExpression="prod_status" HeaderText="ProductStatus"
                    UniqueName="prod_status" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EAN" SortExpression="EAN" HeaderText="EAN"
                    UniqueName="EAN" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_group" SortExpression="prod_group" HeaderText="ProductGroup"
                    UniqueName="prod_group" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_group_desc" SortExpression="prod_group_desc" HeaderText="ProductGroupDesc"
                    UniqueName="prod_group_desc" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_sub_group" SortExpression="prod_sub_group" HeaderText="ProductSubGroup"
                    UniqueName="prod_sub_group" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_sub_group_desc" SortExpression="prod_sub_group_desc" HeaderText="ProductSubGroupDesc"
                    UniqueName="prod_sub_group_desc" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_cat" SortExpression="prod_cat" HeaderText="ProductCat"
                    UniqueName="prod_cat" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_cat_desc" SortExpression="prod_cat_desc" HeaderText="ProductCatDesc"
                    UniqueName="prod_cat_desc" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_cat2" SortExpression="prod_cat2" HeaderText="ProductCat2"
                    UniqueName="prod_cat2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_cat_desc2" SortExpression="prod_cat_desc2" HeaderText="ProductCatDesc2"
                    UniqueName="prod_cat_desc2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_class" SortExpression="prod_class" HeaderText="ProductClass"
                    UniqueName="prod_class" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prod_class_desc" SortExpression="prod_class_desc" HeaderText="ProductClassDesc"
                    UniqueName="prod_class_desc" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="storage_type" SortExpression="storage_type" HeaderText="StorageType"
                    UniqueName="storage_type" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="storage_type2" SortExpression="storage_type2" HeaderText="StorageType2"
                    UniqueName="storage_type2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loose_uom" SortExpression="loose_uom" HeaderText="LooseUOM"
                    UniqueName="loose_uom" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="whole_uom" SortExpression="whole_uom" HeaderText="WholeUOM"
                    UniqueName="whole_uom" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pallet_uom" SortExpression="pallet_uom" HeaderText="PalletUOM"
                    UniqueName="pallet_uom" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pallet_qty" SortExpression="pallet_qty" HeaderText="PalletQty"
                    UniqueName="pallet_qty" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="whole_qty" SortExpression="whole_qty" HeaderText="WholeQty"
                    UniqueName="whole_qty" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol"
                    UniqueName="vol" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="wt" SortExpression="wt" HeaderText="Wt"
                    UniqueName="wt" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="min_days_to_rcv" SortExpression="min_days_to_rcv" HeaderText="MinDaysToRcv"
                    UniqueName="min_days_to_rcv" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="min_days_to_ship" SortExpression="min_days_to_ship" HeaderText="MinDaysToShip"
                    UniqueName="min_days_to_ship" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="expiry_date" SortExpression="expiry_date" HeaderText="ExpiryDate"
                    UniqueName="expiry_date" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot_no" SortExpression="lot_no" HeaderText="LotNo"
                    UniqueName="lot_no" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="serial_no" SortExpression="serial_no" HeaderText="SerialNo"
                    UniqueName="serial_no" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="production_date" SortExpression="production_date" HeaderText="ProductionDate"
                    UniqueName="production_date" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="batch_no" SortExpression="batch_no" HeaderText="BatchNo"
                    UniqueName="batch_no" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Sub_owner" SortExpression="Sub_owner" HeaderText="SubOwner"
                    UniqueName="Sub_owner" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SLOC" SortExpression="SLOC" HeaderText="SLOC"
                    UniqueName="SLOC" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="non_std_wt" SortExpression="non_std_wt" HeaderText="NonStdWt"
                    UniqueName="non_std_wt" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="bonded" SortExpression="bonded" HeaderText="Bonded"
                    UniqueName="bonded" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="allocation_type" SortExpression="allocation_type" HeaderText="AllocationType"
                    UniqueName="allocation_type" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="brand" SortExpression="brand" HeaderText="Brand"
                    UniqueName="brand" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="size" SortExpression="size" HeaderText="Size"
                    UniqueName="size" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inactive" SortExpression="Inactive" HeaderText="Inactive"
                    UniqueName="Inactive" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>               
                <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                    Display="true" UniqueName="AddUser" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FileId" SortExpression="FileId" HeaderText="FileId"
                    UniqueName="FileId" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="processid" SortExpression="processid" HeaderText="processid"
                    UniqueName="processid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                    UniqueName="Status" Display="false">
                </telerik:GridBoundColumn>    
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
        targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
        backgroundcssclass="MessageBoxPopupBackground">
    </ajaxtoolkit:modalpopupextender>
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
