<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSManpowerSchedulingWorkbenchForm.aspx.cs" Inherits="iWMS.Web.Job.TMSManpowerSchedulingWorkbench.TMSManpowerSchedulingWorkbenchForm" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMS Manpower Scheduling Workbench Update</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style>
        .DropZone1 {
            width: 180px;
            height: 120px;
            background-color: #F2F2F2;
            border-color: #CCCCCC;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 50px;
            position: relative;
        }
    </style>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }
        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel runat="server" ID="UpdatePanel">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CloseBtn" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close" CausesValidation="false"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td style="padding-right:15px"></td>
                        <td>
                            <asp:Panel ID="FileUploadPanel" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" Text="Image Name"></asp:Label>
                                        </td>
                                        <td style="padding-right:2px"></td>
                                        <td>
                                            <telerik:RadTextBox ID="ImageNameTxtBox" runat="server"></telerik:RadTextBox>
                                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label runat="server" Text="File"></asp:Label> </td>
                                        <td style="padding-right:2px"></td>
                                        <td>
                                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                                DropZones=".DropZone1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="padding-right:2px"></td>
                                        <td>
                                            <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Text="Upload"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                     <tr>
                                        <td>
                                            <div class="DropZone1">
                                                <p>
                                                    <br /><br />
                                                    Drop Files Here
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                                BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                                BorderWidth="1px" RepeatDirection="Vertical">
                                                <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                                <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                                                <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Label ID="ImageLbl" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="ImageTypeSizeLbl" runat="server"></asp:Label>
                                                            </td>
                                                            <td>&nbsp;
                                                                <asp:LinkButton ID="ImageDeleteLinkBtn" runat="server" CausesValidation="false" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                    OnClick="ImageDeleteLinkBtn_Click" ForeColor="Red" Font-Size="Medium" Font-Underline="false" Font-Bold="true">X
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                                            </asp:DataList>
                                            <br />
                                            <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                &nbsp;
                <asp:Button ID="AddPersonnelBtn" class="LongLabelWhite" runat="server" OnClick="AddPersonnelBtn_Click" Text="Add Personnel" CausesValidation="false"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDGJBPerDetlAdd" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                    AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDGJBPerDetlAdd_NeedDataSource" Width="70%">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="Personnel" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadComboBox ID="PersonnelCombo" runat="server" Width="140px" Skin="WebBlue" DataValueField="Item" DataTextField="Descr"
                                        DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" Filter="Contains" AllowCustomText="false"
                                        DataSource='<%# PersonnelDS%>'>
                                    </telerik:RadComboBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Vocation" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadDropDownList ID="VocationDDL" runat="server" Skin="WebBlue" DataSource='<%# VocationDS %>' DataTextField="descr" DataValueField="item" Width="140px">
                                    </telerik:RadDropDownList>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <telerik:RadGrid ID="ResultDGJBPerDetl" runat="server" AutoGenerateColumns="false"
                    OnNeedDataSource="ResultDGJBPerDetl_NeedDataSource" AllowSorting="true" Skin="Metro" Width="70%">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="true" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Delete"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete"
                                        OnClick="DeleteJBPerDetl_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Personnel" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadComboBox ID="PersonnelCombo" runat="server" Width="140px" Skin="WebBlue" DataValueField="Item" DataTextField="Descr"
                                        DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" Filter="Contains" AllowCustomText="false"
                                        DataSource='<%# PersonnelDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PersonnelDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'>
                                    </telerik:RadComboBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Vocation" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadDropDownList ID="VocationDDL" runat="server" Skin="WebBlue" DataSource='<%# VocationDS %>' DataTextField="descr" DataValueField="item" Width="140px"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VocationDS,DataBinder.Eval(Container.DataItem, "pervocation").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ID" Display="false">
                                <ItemTemplate>
                                    <asp:Label ID="IdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Id") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <telerik:RadGrid ID="TripInfoResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                    AllowPaging="false" Skin="Metro" OnNeedDataSource="TripInfoResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBTripId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridBoundColumn UniqueName="ShipmentType" HeaderText="ShipmentType" DataField="ShipmentTypeDescr"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="TransportType" HeaderText="TransportType" DataField="TptTypeDescr"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="JobType" HeaderText="JobType" DataField="JobTypeDescr"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="BillSizeType" HeaderText="BillSizeType" DataField="BillSizeTypeDescr"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="FrExpDate" HeaderText="Date" DataField="FrExpDate" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Vehicle" HeaderText="Vehicle" DataField="VehNo"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Driver" HeaderText="Driver" DataField="Name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="FromAddress" HeaderText="FromAddress" DataField="FrAddr"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ToAddress" HeaderText="ToAddress" DataField="ToAddr"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="UpdateBtn" />
                <asp:PostBackTrigger ControlID="CloseBtn" />
                <asp:PostBackTrigger ControlID="AddPersonnelBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
