<%@ Page Language="c#" CodeBehind="PSAFEDITariff.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.PSAFEDI.PSAFEDITariff" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PSAFEDITariff</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Tariff" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
                <td align="left"></td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" PageSize="200" AllowPaging="true" AllowSorting="true"
                    AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    OnPageIndexChanged="ResultDG_PageIndexChanged" OnUpdateCommand="ResultDG_Update"
                    OnEditCommand="ResultDG_Edit">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="450px" SaveScrollPosition="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="tariffcode" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Tariff" DataField="tariffcode" ColumnGroupName="tariffcode"
                                SortExpression="tariffcode" UniqueName="tariffcode" Reorderable="true" ReadOnly="true" />
                            <telerik:GridBoundColumn HeaderText="TariffDescr" DataField="tariffdescription" ColumnGroupName="tariffdescription"
                                SortExpression="tariffdescription" UniqueName="tariffdescription" Reorderable="true"
                                ReadOnly="true" />
                            <telerik:GridBoundColumn HeaderText="Rate" DataField="rate" ColumnGroupName="rate"
                                SortExpression="rate" UniqueName="rate" Reorderable="true" ReadOnly="true" />
                            <telerik:GridBoundColumn HeaderText="UnitDescr" DataField="unitdescription" ColumnGroupName="unitdescription"
                                SortExpression="unitdescription" UniqueName="unitdescription" Reorderable="true"
                                ReadOnly="true" />
                            <telerik:GridTemplateColumn Reorderable="true" HeaderText="Charge" SortExpression="chargecodedescr">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "chargecodedescr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadMultiColumnComboBox ID="ChargeList" runat="server" DataTextField="descr" DataValueField="item"
                                        Skin="WebBlue" Width="150px" DropDownWidth="150px" DataSource='<%# chargeListDS%>'
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'>
                                    </telerik:RadMultiColumnComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="RecoverableType">
                                <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "recoverabletype")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList runat="server" ID="RecTypeDDL"
                                        Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RecTypeListDS,DataBinder.Eval(Container.DataItem, "RecoverableType").ToString())%>'
                                        DataSource='<%# RecTypeListDS%>' DataTextField="descr" DataValueField="item">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                                ReadOnly="true">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
