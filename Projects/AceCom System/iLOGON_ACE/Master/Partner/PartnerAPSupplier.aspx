<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerAPSupplier.aspx.cs" Inherits="iWMS.Web.Master.Partner.PartnerAPSupplier" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PartnerAPSupplier</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Panel runat="server" ID="Panelbtn">
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                    OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" style="margin-bottom:15px" />
                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel" Visible="false"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  CausesValidation="false" />
                </asp:Panel>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                 <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New" CausesValidation="false"
                    OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" style="margin-bottom:15px" />
             
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="GLDetailEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Entity" DataField="EntityCode" UniqueName="EntityCode" 
                                AllowFiltering="true" ReadOnly="True" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="Supplier Code <br/> Address">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("SupplierCode"), Eval("TPNAddrCode")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="APControlAccount <br/> Currency">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("GLAccDescr"), Eval("CurrCode")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="Credit Limit <br/> Credit Limit Type">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("creditlimit"), Eval("creditlimittype")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="Payment Term <br/> Status">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("paymentterms"), Eval("statusdescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate <br/> AddUser">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss} <br/> {1}", Eval("adddate"), Eval("adduser")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="EditDate <br/> EditUser">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss} <br/> {1}", Eval("editdate"), Eval("edituser")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                         </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
