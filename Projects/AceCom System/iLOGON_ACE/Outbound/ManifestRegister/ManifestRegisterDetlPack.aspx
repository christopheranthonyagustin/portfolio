<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManifestRegisterDetlPack.aspx.cs" Inherits="iWMS.Web.Outbound.ManifestRegister.ManifestRegisterDetlPack" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ManifestRegisterDetlPack</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>

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
    <table border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="mrNoLbl" runat="server" CssClass="pagetitle"></asp:Label>&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Button ID="PackBtn" class="white" runat="server" OnClick="PackBtn_Click" Text="Pack"  
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                &nbsp;&nbsp;<asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel"  
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
            </td>
        </tr>
        <tr>
            <td style="height: 10px">
            </td>
        </tr>
        <tr>
            <td>
                <div class="NewModuleTitle">
                    Scan Count : <asp:Label Style="z-index: 0" ID="CntLabel" runat="server" labelclass="NewModuleTitle"></asp:Label>
                </div>
            </td>
        </tr>  
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="SIVNo" UniqueName="id">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="serializedSIV" SortExpression="serializedSIV" HeaderText="serializedSIV" UniqueName="serializedSIV" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKUCode" UniqueName="skucode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Descr" UniqueName="skudescr">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="QtyToPack" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" HeaderStyle-Width="100">
                    <ItemTemplate>
                        <telerik:RadTextBox ID="QtyToPackTxt" runat="server" Width="100" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "availableqty", "{0:0.00#}") %>'></telerik:RadTextBox>
                        <asp:CompareValidator ID="QtyToPackTxtCompVal" runat="server" ControlToValidate="QtyToPackTxt" EnableClientScript="True" 
                            CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        <asp:CompareValidator ID="QtyCompVal" runat="server" ControlToValidate="QtyToPackTxt" EnableClientScript="True" ValueToCompare='0'
                            CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#" Operator="GreaterThan" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="skupackqty" SortExpression="skupackqty" HeaderText="Qty" UniqueName="skupackqty" DataFormatString="{0:0.00#}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="availableqty" SortExpression="availableqty" HeaderText="AvailableQty" UniqueName="availableqty" DataFormatString="{0:0.00#}">
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
