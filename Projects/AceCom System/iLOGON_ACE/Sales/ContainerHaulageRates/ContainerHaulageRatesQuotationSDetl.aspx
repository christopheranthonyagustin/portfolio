<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHaulageRatesQuotationSDetl.aspx.cs" Inherits="iWMS.Web.Sales.ContainerHaulageRates.ContainerHaulageRatesQuotationSDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Haulage Rate</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white"
                        OnClick="AddBtn_Click"></asp:Button>
                    &nbsp;
                    <asp:Label ID="DescrLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    <br />
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            AllowSorting="true" OnEditCommand="ResultDG_EditCommand" OnCancelCommand="ResultDG_CancelCommand" OnUpdateCommand="ResultDG_UpdateCommand">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="EditImgBtn" ImageUrl="..\..\image\pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="InkDelete_ServerClick"
                                runat="server">
                                <img id="DeleteImgBtn" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete UOM"
                                    runat="server"></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" ID="UpdateImgBtn" ImageUrl="..\..\image\floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" ID="CancelImgBtn" ImageUrl="..\..\image\arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderText="S/N">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Zone">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "zonecode")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="ZoneDDL" DataTextField="Descr" DataValueField="Item" Skin="WebBlue"
                                runat="server" DataSource='<%# ZoneListDS%>' Width="155" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ZoneListDS,DataBinder.Eval(Container.DataItem, "zonecode").ToString())%>' />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="QtyTxt" runat="server" Width="155" Skin="WebBlue" Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#0}") %>' />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Rate" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Rate", "{0:#,0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="RateTxt" runat="server" Width="155" Skin="WebBlue" Value='<%# DataBinder.Eval(Container.DataItem, "Rate", "{0:#0}") %>' />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" ReadOnly="True" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" ReadOnly="True" HeaderText="Add User"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" ReadOnly="True" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" ReadOnly="True" HeaderText="Edit User"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="QUDTId" UniqueName="QUDTId" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
