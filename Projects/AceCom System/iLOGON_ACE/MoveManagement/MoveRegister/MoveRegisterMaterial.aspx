<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveRegisterMaterial.aspx.cs" Inherits="iWMS.Web.MoveManagement.MoveRegister.MoveRegisterMaterial" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Book-a-BusAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG2.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel ID="pannelid" runat="server">
        <ContentTemplate>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <asp:Panel ID="InsertPanel" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                                    OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="PopToGIBtn" runat="server" CssClass="white" Text="PopToGI" OnClick="PopToGIBtn_Click"
                                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                                &nbsp;
                            </td>
                        </tr>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="Update_Panel">
                        <tr>
                            <td>
                                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text=" Update " OnClick="UpdateBtn_Click"
                                    OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="white" Text="Hide" OnClick="ClosePanelBtn_Click"
                                    UseSubmitBehavior="false" CausesValidation="False" OnClientClick="disableBtn(this.id, false)" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                <br />
                        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                            AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" OnDetailTableDataBind="ResultDG2_DetailTableDataBind">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="AtvtHead"
                                TableLayout="Fixed" ItemStyle-Wrap="true" HeaderStyle-Wrap="true" AlternatingItemStyle-Wrap="true"
                                HierarchyLoadMode="Client" HeaderStyle-Width="45%">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="35px" ItemStyle-Width="35px" Reorderable="false"
                                        UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="35px" ItemStyle-Width="35px" Reorderable="false"
                                        UniqueName="icon" AllowFiltering="false">
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="JbperAtvt_Delete" runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete JBPerAtvt"
                                                    title="Delete JBPerAtvt" runat="server" />
                                            </a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="40px" ItemStyle-Width="40px" Reorderable="false"
                                        UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderStyle-Width="300px" ItemStyle-Width="300px" SortExpression="id"
                                        HeaderText="jbperatvtid" DataField="id" UniqueName="jbperatvtid" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Activity" DataField="peratvtcodedescr" AllowFiltering="true"
                                        ColumnGroupName="peratvtcodedescr" SortExpression="peratvtcodedescr" UniqueName="peratvtcodedescr"
                                        Reorderable="true">
                                        <HeaderStyle Wrap="true" Width="120px" />
                                        <ItemStyle Wrap="true" Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Activity Remarks" DataField="atvtremarks" AllowFiltering="true"
                                        ColumnGroupName="atvtremarks" SortExpression="atvtremarks" UniqueName="AtvtRemarks"
                                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                                        ColumnGroupName="status" SortExpression="status" UniqueName="status" Visible="false"
                                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExpStartDate" DataField="frexpdate" AllowFiltering="true"
                                        ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                        HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Category" DataField="cat" AllowFiltering="true"
                                        ColumnGroupName="cat" SortExpression="cat" UniqueName="cat" Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="FrAddr" DataField="frservicept" AllowFiltering="true"
                                        ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" Display="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toservicept" AllowFiltering="true"
                                        ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                                        Reorderable="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="GoodsDescr" DataField="AtvtGoodsDescr" AllowFiltering="true"
                                        ColumnGroupName="AtvtGoodsDescr" SortExpression="AtvtGoodsDescr" UniqueName="AtvtGoodsDescr"
                                        Reorderable="true">
                                        <HeaderStyle Wrap="true" Width="130px" />
                                        <ItemStyle Wrap="true" Width="130px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                                        ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true"
                                        Display="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ManRequired" DataField="ManRequired" AllowFiltering="true"
                                        ColumnGroupName="ManRequired" SortExpression="ManRequired" UniqueName="ManRequired"
                                        Reorderable="true">
                                        <HeaderStyle Wrap="true" Width="130px" />
                                        <ItemStyle Wrap="true" Width="130px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="VehicleRequired" DataField="VehRequired" AllowFiltering="true"
                                        ColumnGroupName="VehRequired" SortExpression="VehRequired" UniqueName="VehRequired"
                                        Reorderable="true">
                                        <HeaderStyle Wrap="true" Width="130px" />
                                        <ItemStyle Wrap="true" Width="130px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                                        ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                                        ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <DetailTables>
                                    <telerik:GridTableView DataKeyNames="id" Name="Material" Width="100%" SkinID="Telerik"
                                        runat="server" EditMode="InPlace">
                                        <ParentTableRelation>
                                            <telerik:GridRelationFields DetailKeyField="JBPerAtvtId" MasterKeyField="id" />
                                        </ParentTableRelation>
                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="1%" ItemStyle-Width="1%" Reorderable="false"
                                                UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="checkkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="TradePartnerEdit"
                                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0" CausesValidation="False"></asp:ImageButton>

                                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                        runat="server" onserverclick="Material_Delete">
                                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                                            title="Delete Detail" runat="server" /></a>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="33px">
                                                <HeaderTemplate>
                                                    S/N
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%#Container.ItemIndex+1%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="jbid" SortExpression="type" HeaderText="Material"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="skudescr" SortExpression="category" HeaderText="Description"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Quantity"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ISNumber" SortExpression="ISNumber" HeaderText="ISNumber"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </telerik:GridTableView>
                                </DetailTables>

                            </MasterTableView>
                        </telerik:RadGrid>
                <br />
                <br />
                <table>
                    <tr>
                        <td valign="top">
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false">
                                            <HeaderTemplate>
                                                S/N
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="sno" runat="server" Text='<%#Container.ItemIndex+1%>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Equipment/Material" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <telerik:RadDropDownList ID="MaterialDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                    DataValueField="id" DataSource='<%# EquipmentDS%>' Skin="WebBlue" Width="400px"
                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EquipmentDS,DataBinder.Eval(Container.DataItem, "descr").ToString())%>'
                                                    DropDownWidth="140px">
                                                </telerik:RadDropDownList>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Quantity" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="QtyTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="UnitsTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                                    EnableClientScript="True" ErrorMessage="Please enter number value!" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <%--Show Message popup area Start--%>
                <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                    TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk"
                    BackgroundCssClass="MessageBoxPopupBackground">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
                    DefaultButton="btnOk">
                    <div class="popupHeader" style="width: 420px;">
                        <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
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
                                            <asp:Button ID="btnOk" CssClass="white" runat="server" Text="OK" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
                <%--Show Message popup area End--%>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
            </ContentTemplate>
             <Triggers>
                <asp:PostBackTrigger ControlID="PopToGIBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
