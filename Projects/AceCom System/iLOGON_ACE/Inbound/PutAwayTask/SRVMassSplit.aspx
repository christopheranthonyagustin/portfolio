<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRVMassSplit.aspx.cs" Inherits="iWMS.Web.Inbound.PutAwayTask.SRVMassSplit" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>SRV-MassSplit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
	<base target="_self" />
	<meta http-equiv="Pragma" content="no-cache" />
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server"  CssClass="pagetitle" Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr>
            <br />
            <td align="left" valign="top">
                &nbsp;&nbsp;<telerik:RadButton ID="SaveBtn" runat="server" Text="  Save  " OnClick="SaveBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                &nbsp;&nbsp;<telerik:RadButton ID="CancelBtn" runat="server" Text=" Cancel " OnClick="CancelBtn_Click" CausesValidation="false"
                    Skin="WebBlue">
                </telerik:RadButton>
            </td>
            <td align="right">
                &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <div id="div1" style="width: 100%; height: 100%">
    &nbsp;<telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="86%"
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="false" 
        AllowSorting="true" Skin="Office2007" AllowAutomaticInserts="True">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <Scrolling UseStaticHeaders="true"/>
        </ClientSettings>    
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
            EditMode="InPlace" HierarchyLoadMode="Client">
            <Columns>
                <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id" 
                   Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="acid" DataField="acid" AllowFiltering="true" UniqueName="acid" 
                   Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="skugrpId" DataField="skugrpId" AllowFiltering="true" UniqueName="skugrpId" 
                   Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                    UniqueName="skucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Descr"
                    UniqueName="skudescr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM"
                    UniqueName="uom" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" HeaderStyle-Width="80">
                    <ItemTemplate>
                        <telerik:RadTextBox ID="qtyTxt" runat="server" Width="80" Skin="Sunset" BackColor="#ded7c6"
                            Text='<%# DataBinder.Eval(Container.DataItem, "expecteduomqty", "{0:#.##}") %>'></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="qtyReq" runat="server" CssClass="errorLabelBig" ErrorMessage="*" ControlToValidate="qtyTxt">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="qtyTxtCompVal" runat="server" ControlToValidate="qtyTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="INTEGER" />
                          <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                    ControlToValidate="qtyTxt" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="" HeaderStyle-HorizontalAlign="Center" UniqueName="lot4"
                    AllowFiltering="false" Display="false">
                    <ItemTemplate>
                        <telerik:RadTextBox ID="lot4Txt" runat="server" Width="150" Skin="WebBlue" 
                            Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="lot4Req" runat="server" ErrorMessage="*" ControlToValidate="lot4Txt"
                            Enabled="false"></asp:RequiredFieldValidator>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="SuggestLoc" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Left" AllowFiltering="false" Display = "true">
                    <ItemTemplate>
                        <telerik:RadTextBox ID="paloccodetxt" runat="server" Width="150" Skin="WebBlue"
                            Text='<%# DataBinder.Eval(Container.DataItem, "paloccode") %>'></telerik:RadTextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="PAlocType" HeaderStyle-HorizontalAlign="Center"
                    Display="false">
                    <ItemTemplate>
                        <asp:Label ID="paLocTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "paloctype") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>  
                <telerik:GridTemplateColumn HeaderText="PALocCode" HeaderStyle-HorizontalAlign="Center"
                    Display="false">
                    <ItemTemplate>
                        <asp:Label ID="paLocCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "paloccode") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Tuno1" HeaderStyle-HorizontalAlign="Center"
                    Display="false">
                    <ItemTemplate>
                        <asp:Label ID="tuno1Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn> 
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div>
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

