<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrYardPlanningDetail.aspx.cs"
    Inherits="iWMS.Web.Management.ContainerYardPlanning.CtnrYardPlanningDetail" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self">
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <table id="table1" width="100%" border="0">
        <tr>
            <td>
                Yard Planning Detail As At
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td>
                <telerik:RadButton ID="CloseBtn" runat="server" OnClick="CloseBtn_Click" Text=" Close "
                    Width="80px" Skin="WebBlue">
                </telerik:RadButton>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit"
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemCommand="ResultDG_ItemCommand"
        Width="100%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
            EditMode="InPlace" EnableHeaderContextMenu="true">
            <CommandItemSettings ShowAddNewRecordButton="false" />
            <Columns>
                <telerik:GridTemplateColumn >
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit PV Detail" ToolTip="Edit PV Detail"
                            CommandName="Edit" BackColor="Transparent" BorderWidth="0" CausesValidation="false">
                        </asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-ForeColor="Black">
                    <HeaderTemplate>
                        S/No
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center"/>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="src" SortExpression="src" HeaderText="src" Display="false"
                    UniqueName="src" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="Dock" UniqueName="Dock">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblstuffDate" runat="server" Text="Stuff/UnstuffDate" Width="100px"
                                        Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDock" runat="server" Text="Dock" Width="100px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "Stuff/UnstuffDate", "{0:dd/MMM/yyyy}")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "DockDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="stuffDatetxt" Skin="Office2007">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <telerik:RadDropDownList ID="DockDDL" runat="server" Width="100px" DropDownHeight="150px"
                                        Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(DockDS,DataBinder.Eval(Container.DataItem, "Dock").ToString())%>'
                                        DataSource='<%# DockDS%>' DataTextField="descr" DataValueField="item">
                                    </telerik:RadDropDownList>
                                    <asp:TextBox ID="DockTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "Dock") %>' />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="ContainerNo" HeaderText="ContainerNo">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblContainerNo" runat="server" Text="CtnrNo" Width="60px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSealNo" runat="server" Text="SealNo" Width="60px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="60px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ctnrno")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "ctnrsealno")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="CtnrNoTxt" ReadOnly="true" Skin="Office2007"
                                        Width="60px" Enabled="false">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="SealNoTxt" ReadOnly="true" Skin="Office2007"
                                        Width="60px" Enabled="false">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="Cjob" HeaderText="Cjob">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblTransNo" runat="server" Text="TransNo" Width="80px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblTransStatus" runat="server" Text="TransStatus" Width="80px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "TransNo")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "TransStatusDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="TransNoTxt" ReadOnly="true" Skin="Office2007"
                                        Width="100px" Enabled="false">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="TransStatusTxt" ReadOnly="true" Skin="Office2007"
                                        Width="100px" Enabled="false">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblgateIndate" runat="server" Text="GateInDate" Width="100px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblgateOutdate" runat="server" Text="GateOutDate" Width="100px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="150px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "GateIn", "{0:dd/MMM/yyyy HH:mm}")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "GateOut", "{0:dd/MMM/yyyy HH:mm}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadDateTimePicker runat="server" ID="gateIndate" Skin="Office2007" Rows="2"
                                        Width="170px" DateInput-DateFormat="dd/MMM/yyyy HH:mm" PopupDirection="TopRight">
                                    </telerik:RadDateTimePicker>
                                    <calendar>
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </calendar>
                                    <timeview interval="00:30:00" timeformat="HH:mm" />
                                    <asp:RequiredFieldValidator ID="gateIndateReqVal" runat="server" ControlToValidate="gateIndate"
                                        ErrorMessage="*" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <telerik:RadDateTimePicker runat="server" ID="gateOutdate" Skin="Office2007" Rows="2"
                                        Width="170px" DateInput-DateFormat="dd/MMM/yyyy HH:mm" PopupDirection="TopRight">
                                    </telerik:RadDateTimePicker>
                                    <calendar>
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </calendar>
                                    <timeview interval="00:30:00" timeformat="HH:mm" />
                                    <asp:RequiredFieldValidator ID="gateOutdateReqVal" runat="server" ControlToValidate="gateOutdate"
                                        ErrorMessage="*" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="Site" HeaderText="Site">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSite" runat="server" Text="Site" Width="100px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCargoType" runat="server" Text="CargoType" Width="100px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "Site")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "CargoType")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="SiteTxt" ReadOnly="true" Skin="Office2007" Width="100px"
                                        Enabled="false">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="CargoTypeTxt" ReadOnly="true" Skin="Office2007"
                                        Width="100px" Enabled="false">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="ctnrtype" HeaderText="ctnrtype">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblctnrtype" runat="server" Text="CtnrType" Width="100px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblBank" runat="server" Text="CtnrStatus" Width="100px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ctnrtype")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "CtnrStatusDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    <telerik:RadLabel runat="server" ID="ctnrtypeTxt" ReadOnly="true" Skin="Office2007"
                                        Width="80px" Enabled="false">
                                    </telerik:RadLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <telerik:RadDropDownList ID="CtnrStatusDDL" runat="server" Width="100px" DropDownHeight="150px"
                                        Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CtnrStatusDS,DataBinder.Eval(Container.DataItem, "CtnrStatus").ToString())%>'
                                        DataSource='<%# CtnrStatusDS%>' DataTextField="descr" DataValueField="item">
                                    </telerik:RadDropDownList>
                                    <asp:TextBox ID="CtnrStatusTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "CtnrStatus") %>' />
                                    <asp:RequiredFieldValidator ID="CtnrStatusReqVal" runat="server" ControlToValidate="CtnrStatusDDL"
                                        ErrorMessage="*" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblRemark" runat="server" Text="Remarks" Width="200px" Style="text-align: center"></asp:Label>
                                </td>
                            </tr>                            
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="280px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="280px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "Remarks")%>                       
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    <telerik:RadTextBox runat="server" ID="RemarkTxt" Skin="Office2007" Width="280px" TextMode="MultiLine" 
                                        Enabled="true"></telerik:RadTextBox>
                                </td>
                            </tr>                          
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <%--This is to be able to see and select CtnrStatusDDL in lowest row--%>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <%--end--%>
    </form>
</body>
</html>
