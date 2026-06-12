<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptRegisterV2MassSplit.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptRegisterV2.ReceiptRegisterV2MassSplit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>ReceiptRegisterV2-MassSplit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
	<base target="_self" />
	<meta http-equiv="Pragma" content="no-cache" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
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
                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    <ItemTemplate>
                        <telerik:RadTextBox ID="qtyTxt" runat="server" Width="150" Skin="Sunset" BackColor="#ded7c6"
                            Text='<%# DataBinder.Eval(Container.DataItem, "expecteduomqty", "{0:#.##}") %>'></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="qtyReq" runat="server" ErrorMessage="*" ControlToValidate="qtyTxt">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="qtyTxtCompVal" runat="server" ControlToValidate="qtyTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Tuno1" HeaderStyle-HorizontalAlign="Center"
                    AllowFiltering="false">
                    <ItemTemplate>
                        <telerik:RadTextBox ID="tuno1Txt" runat="server" Width="150" Skin="WebBlue"
                            Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>'></telerik:RadTextBox>
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
                <telerik:GridTemplateColumn HeaderText="PALoc" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Left" AllowFiltering="false" Display = "false">
                    <ItemTemplate>
                        <asp:Label ID="paloccodeLbl" runat="server" Width="50" Text='<%# DataBinder.Eval(Container.DataItem, "paloccode") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                    
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    </form>
</body>
</html>
