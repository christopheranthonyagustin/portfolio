<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcSiteLoc.aspx.cs" Inherits="iWMS.Web.Master.Account.UomConfig" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PickDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="BackButton" runat="server" CssClass="white"
                        Text="Back" Visible="True" CausesValidation="False" OnClick="BackButton_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                <asp:Button ID="AddBtn" runat="server" Text="NewLine" CssClass="white" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="SkuPackLbl" runat="server" CssClass="pagetitle" Visible="False"></asp:Label>
                    <asp:Label ID="UOMConfigLbl" runat="server" CssClass="pagetitle" Visible="False">UOM Config</asp:Label>
                    <asp:Label ID="DescrLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel">

                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace" Name="AcSiteLocGrid">

                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">

                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="UomCfgEdit" ImageUrl="..\..\image\pencil.gif"
                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="UomConfig_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete UOM Config"
                                        runat="server"></a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="ImageButton1" ImageUrl="..\..\image\floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="ImageButton2" ImageUrl="..\..\image\arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                Zone
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "zonedescr") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList ID="ZoneList" DataMember="" DataTextField="Descr" DataValueField="Item" Skin="WebBlue"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ZoneDS,DataBinder.Eval(Container.DataItem, "zone").ToString())%>'
                                    DataSource='<%# ZoneDS%>' runat="server" ValidationGroup="First" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                Category
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "categorydescr") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList ID="CatList" DataMember="" DataTextField="Descr" DataValueField="Item" Skin="WebBlue"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CatDS,DataBinder.Eval(Container.DataItem, "category").ToString())%>'
                                    DataSource='<%# CatDS%>' runat="server" />
                                <itemstyle wrap="False"></itemstyle>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="location" SortExpression="location" UniqueName="AcSiteLocation" HeaderText="Location">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "location") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="LocTxt" runat="server" Width="80" Text=' <%# DataBinder.Eval(Container.DataItem, "location") %>' Skin="WebBlue"></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="fromloccode" SortExpression="fromloccode" UniqueName="AcSitefromloccode" HeaderText="From Location">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "fromloccode") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="FrLocTxt" runat="server" Width="80" Text=' <%# DataBinder.Eval(Container.DataItem, "fromloccode") %>' Skin="WebBlue"></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="toloccode" SortExpression="toloccode" UniqueName="AcSitetoloccode" HeaderText="To Location">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "toloccode") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="ToLocTxt" runat="server" Width="80" Text=' <%# DataBinder.Eval(Container.DataItem, "toloccode") %>' Skin="WebBlue"></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="fromaisle" SortExpression="fromaisle" UniqueName="AcSitefromaisle" HeaderText="From Aisle">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "fromaisle") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="FrAisleTxt" runat="server" Width="80" Text=' <%# DataBinder.Eval(Container.DataItem, "fromaisle") %>' Skin="WebBlue"></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="toaisle" SortExpression="toaisle" UniqueName="AcSitetoaisle" HeaderText="To Aisle">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "toaisle") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="ToAisleTxt" runat="server" Width="80" Text=' <%# DataBinder.Eval(Container.DataItem, "toaisle") %>' Skin="WebBlue"></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                Area
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "area") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="areaTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "area") %>' Skin="WebBlue">
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="MaxareaVal" runat="server" ControlToValidate="areaTxt"
                                    EnableClientScript="true" ErrorMessage="*" ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                Volume 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "vol") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="VolTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "vol") %>' Skin="WebBlue">
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="MaxVolVal" runat="server" ControlToValidate="VolTxt"
                                    EnableClientScript="true" ErrorMessage="*" ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                Qty
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "qty") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="QtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "qty") %>' Skin="WebBlue">
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="QtyTxt"
                                    EnableClientScript="true" ErrorMessage="*" ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                UOM
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "uomdescr") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList ID="UOMList" DataMember="" DataTextField="Descr" DataValueField="Item" Skin="WebBlue"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UOMDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'
                                    DataSource='<%# UOMDS%>' runat="server" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="remarks" SortExpression="remarks" UniqueName="remarks" HeaderText="Remarks">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "remarks") %>
                            </ItemTemplate>
                            <EditItemTemplate>

                                <telerik:RadTextBox ID="RemTxt" runat="server" Width="80" Text=' <%# DataBinder.Eval(Container.DataItem, "remarks") %>' Skin="WebBlue"></telerik:RadTextBox>

                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor" Display="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
