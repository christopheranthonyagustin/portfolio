<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MHAInterfacePO.aspx.cs" Inherits="iWMS.Web.Interface.MHAIncoming.MHAInterfacePO" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MHAInterfacePO</title>
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
                <telerik:GridBoundColumn DataField="PONumber" SortExpression="PONumber" HeaderText="PONumber"
                    UniqueName="PONumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ASNDate" SortExpression="ASNDate" HeaderText="ASNDate"
                    UniqueName="ASNDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ReferenceNo" SortExpression="ReferenceNo" HeaderText="ReferenceNo"
                    UniqueName="ReferenceNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TransactionCode" SortExpression="TransactionCode" HeaderText="TransactionCode"
                    UniqueName="TransactionCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SONumber" SortExpression="SONumber" HeaderText="SONumber"
                    UniqueName="SONumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierCode" SortExpression="SupplierCode" HeaderText="SupplierCode"
                    UniqueName="SupplierCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierName" SortExpression="SupplierName" HeaderText="SupplierName"
                    UniqueName="SupplierName" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierAddress1" SortExpression="SupplierAddress1" HeaderText="SupplierAddress1"
                    UniqueName="SupplierAddress1" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierAddress2" SortExpression="SupplierAddress2" HeaderText="SupplierAddress2"
                    UniqueName="SupplierAddress2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierZipCode" SortExpression="SupplierZipCode" HeaderText="SupplierZipCode"
                    UniqueName="SupplierZipCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierTelelphoneNo" SortExpression="SupplierTelelphoneNo" HeaderText="SupplierTelelphoneNo"
                    UniqueName="SupplierTelelphoneNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierTaxNo" SortExpression="SupplierTaxNo" HeaderText="SupplierTaxNo"
                    UniqueName="SupplierTaxNo" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplierEmailAddress" SortExpression="SupplierEmailAddress" HeaderText="SupplierEmailAddress"
                    UniqueName="SupplierEmailAddress" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ContainerDetails" SortExpression="ContainerDetails" HeaderText="ContainerDetails"
                    UniqueName="ContainerDetails" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ContainerSize" SortExpression="ContainerSize" HeaderText="ContainerSize"
                    UniqueName="ContainerSize" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="VesselDetails" SortExpression="VesselDetails" HeaderText="VesselDetails"
                    UniqueName="VesselDetails" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Remarks1" SortExpression="Remarks1" HeaderText="Remarks1"
                    UniqueName="Remarks1" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Remarks2" SortExpression="Remarks2" HeaderText="Remarks2"
                    UniqueName="Remarks2" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SealNumber" SortExpression="SealNumber" HeaderText="SealNumber"
                    UniqueName="SealNumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ETADate" SortExpression="ETADate" HeaderText="ETADate"
                    UniqueName="ETADate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
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
                <telerik:GridBoundColumn DataField="QuantityOrdered" SortExpression="QuantityOrdered" HeaderText="QuantityOrdered"
                    UniqueName="QuantityOrdered" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UOMCode" SortExpression="UOMCode" HeaderText="UOMCode"
                    UniqueName="UOMCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LotNumber" SortExpression="LotNumber" HeaderText="LotNumber"
                    UniqueName="LotNumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BatchNumber" SortExpression="BatchNumber" HeaderText="BatchNumber"
                    UniqueName="BatchNumber" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SubOwner" SortExpression="SubOwner" HeaderText="SubOwner"
                    UniqueName="SubOwner" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ExpiryDate" SortExpression="ExpiryDate" HeaderText="ExpiryDate"
                    UniqueName="ExpiryDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="POPrice" SortExpression="POPrice" HeaderText="POPrice"
                    UniqueName="POPrice" ItemStyle-Wrap="false" DataFormatString="{0:0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LineRemarks" SortExpression="LineRemarks" HeaderText="LineRemarks"
                    UniqueName="LineRemarks" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Sloc" SortExpression="Sloc" HeaderText="SLoc"
                    UniqueName="Sloc" ItemStyle-Wrap="false">
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
