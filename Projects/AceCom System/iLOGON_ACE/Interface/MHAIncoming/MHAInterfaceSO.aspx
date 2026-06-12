<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MHAInterfaceSO.aspx.cs" Inherits="iWMS.Web.Interface.MHAIncoming.MHAInterfaceSO" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MHAInterfaceSO</title>
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
                <telerik:GridBoundColumn DataField="Action" SortExpression="Action" HeaderText="Action"
                    UniqueName="Action" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Remarks" SortExpression="Remarks" HeaderText="Remarks"
                    UniqueName="Remarks" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                    UniqueName="statusdescr" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SiteCode" SortExpression="SiteCode" HeaderText="SiteCode"
                    UniqueName="SiteCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SrcNo" SortExpression="SrcNo" HeaderText="SrcNo"
                    UniqueName="SrcNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Src" SortExpression="Src" HeaderText="Src"
                    UniqueName="Src" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OwnerCode" SortExpression="OwnerCode" HeaderText="OwnerCode"
                    UniqueName="OwnerCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="WarehouseCode" SortExpression="WarehouseCode" HeaderText="WarehouseCode"
                    UniqueName="WarehouseCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OrderReference" SortExpression="OrderReference" HeaderText="OrderReference"
                    UniqueName="OrderReference" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TransactionCode" SortExpression="TransactionCode" HeaderText="TransactionCode"
                    UniqueName="TransactionCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CustomerCode" SortExpression="CustomerCode" HeaderText="CustomerCode"
                    UniqueName="CustomerCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CustomerName" SortExpression="CustomerName" HeaderText="CustomerName"
                    UniqueName="CustomerName" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastName" SortExpression="LastName" HeaderText="LastName"
                    UniqueName="LastName" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Addressno" SortExpression="Addressno" HeaderText="Addressno"
                    UniqueName="Addressno" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Address1" SortExpression="Address1" HeaderText="Address1"
                    UniqueName="Address1" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Address2" SortExpression="Address2" HeaderText="Address2"
                    UniqueName="Address2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Address3" SortExpression="Address3" HeaderText="Address3"
                    UniqueName="Address3" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ZipCode" SortExpression="ZipCode" HeaderText="ZipCode"
                    UniqueName="ZipCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CustomerEmail" SortExpression="CustomerEmail" HeaderText="CustomerEmail"
                    UniqueName="CustomerEmail" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CustomerPhoneNo" SortExpression="CustomerPhoneNo" HeaderText="CustomerPhoneNo"
                    UniqueName="CustomerPhoneNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DeliveryCity" SortExpression="DeliveryCity" HeaderText="DeliveryCity"
                    UniqueName="DeliveryCity" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DeliveryCountryCode" SortExpression="DeliveryCountryCode" HeaderText="DeliveryCountryCode"
                    UniqueName="DeliveryCountryCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DeliveryZone" SortExpression="DeliveryZone" HeaderText="DeliveryZone"
                    UniqueName="DeliveryZone" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DeliveryRoute" SortExpression="DeliveryRoute" HeaderText="DeliveryRoute"
                    UniqueName="DeliveryRoute" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DeliveryType" SortExpression="DeliveryType" HeaderText="DeliveryType"
                    UniqueName="DeliveryType" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OrderDate" SortExpression="OrderDate" HeaderText="OrderDate"
                    UniqueName="OrderDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DeliveryDate" SortExpression="DeliveryDate" HeaderText="DeliveryDate"
                    UniqueName="DeliveryDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="RequestedDeliveryDate" SortExpression="RequestedDeliveryDate" HeaderText="RequestedDeliveryDate"
                    UniqueName="RequestedDeliveryDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Remarks1" SortExpression="Remarks1" HeaderText="Remarks1"
                    UniqueName="Remarks1" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Remarks2" SortExpression="Remarks2" HeaderText="Remarks2"
                    UniqueName="Remarks2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LineNumber" SortExpression="LineNumber" HeaderText="LineNumber"
                    UniqueName="LineNumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OriginalLineNumber" SortExpression="OriginalLineNumber" HeaderText="OriginalLineNumber"
                    UniqueName="OriginalLineNumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ProductCode" SortExpression="ProductCode" HeaderText="ProductCode"
                    UniqueName="ProductCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LotNumber" SortExpression="LotNumber" HeaderText="LotNumber"
                    UniqueName="LotNumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BatchNo" SortExpression="BatchNo" HeaderText="BatchNo"
                    UniqueName="BatchNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SerialNo" SortExpression="SerialNo" HeaderText="SerialNo"
                    UniqueName="SerialNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ExpiryDate" SortExpression="ExpiryDate" HeaderText="ExpiryDate"
                    UniqueName="ExpiryDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SubOwner" SortExpression="SubOwner" HeaderText="SubOwner"
                    UniqueName="SubOwner" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SLOC" SortExpression="SLOC" HeaderText="SLOC"
                    UniqueName="SLOC" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ExcludeExpiryDate" SortExpression="ExcludeExpiryDate" HeaderText="ExcludeExpiryDate"
                    UniqueName="ExcludeExpiryDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LineRemarks" SortExpression="LineRemarks" HeaderText="LineRemarks"
                    UniqueName="LineRemarks" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ASNNumber" SortExpression="ASNNumber" HeaderText="ASNNumber"
                    UniqueName="ASNNumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PONumber" SortExpression="PONumber" HeaderText="PONumber"
                    UniqueName="PONumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LocationCode" SortExpression="LocationCode" HeaderText="LocationCode"
                    UniqueName="LocationCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="InventoryStatus" SortExpression="InventoryStatus" HeaderText="InventoryStatus"
                    UniqueName="InventoryStatus" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="QtyOrdered" SortExpression="QtyOrdered" HeaderText="QtyOrdered"
                    UniqueName="QtyOrdered" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UOMCode" SortExpression="UOMCode" HeaderText="UOMCode"
                    UniqueName="UOMCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UnitSalesPrice" SortExpression="UnitSalesPrice" HeaderText="UnitSalesPrice"
                    UniqueName="UnitSalesPrice" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OrderSource" SortExpression="OrderSource" HeaderText="OrderSource"
                    UniqueName="OrderSource" ItemStyle-Wrap="false">
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
