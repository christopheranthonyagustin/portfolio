<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccountVessel.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CustomerAccountVessel" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CustomerAccountVessel</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
        <div id="div-datagrid" style="height: 400px;">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace"
                    CommandItemDisplay="Top">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AcVesselEdit"
                                    ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                    CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="DeleteAcVessel" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete AcVessel"
                                        align="absmiddle" runat="server"></a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="AcVesselUpdate" ImageUrl="../../image/floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="AcVesselCancel" ImageUrl="../../image/arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            HeaderText="S/N">
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="vesselcode">
                            <HeaderTemplate>
                                <asp:Label ID="lblVesselCode" runat="server" Text="VesselCode"></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                            <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "vesselcode")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="VesselCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "vesselcode") %>'
                                    TextMode="MultiLine" Rows="2" Width="80%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="vesselname">
                            <HeaderTemplate>
                                <asp:Label ID="lblVesselName" runat="server" Text="VesselName"></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                            <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "vesselname")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="VesselNameTxt" Text='<%# DataBinder.Eval(Container.DataItem, "vesselname") %>'
                                    TextMode="MultiLine" Rows="2" Width="80%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="vesselcountrycode">
                            <HeaderTemplate>
                                <asp:Label ID="lblVesselCountryCode" runat="server" Text="VesselCountryCode"></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                            <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "vesselcountrycode")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="VesselCountryCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "vesselcountrycode") %>'
                                    TextMode="MultiLine" Rows="2" Width="80%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="60px" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "statusdescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="Statusddl" DataSource='<%# AcVesselStatusDS%>' Enabled="false"
                                    Skin="WebBlue" DataTextField="descr" DataValueField="item" Width="90%" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(AcVesselStatusDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" ReadOnly="True">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
