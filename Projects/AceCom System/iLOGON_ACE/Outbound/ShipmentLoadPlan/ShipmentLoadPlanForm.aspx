<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentLoadPlanForm.aspx.cs" Inherits="iWMS.Web.Outbound.ShipmentLoadPlan.ShipmentLoadPlanForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Shipment Load Plan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
    <div>
         <iwms:iform id="formCtl" runat="server"></iwms:iform>
        <br />
          <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="Both" OnCancelCommand="ResultDG_CancelCommand"
            OnNeedDataSource="ResultDG_NeedDataSource" OnUpdateCommand="ResultDG_UpdateCommand" OnEditCommand="ResultDG_EditCommand" OnItemCommand="ResultDG_ItemCommand"
            OnItemDataBound="ResultDG_ItemDataBound" CellPadding="2" UseAccessibleHeader="True" Skin="Office2007" AllowPaging="True" OnDetailTableDataBind="ResultDG_DetailTableDataBind">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" EditMode="InPlace" CommandItemDisplay="Top" DataKeyNames="ctnrno">
                <CommandItemSettings ShowRefreshButton="false" /> 
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon" HeaderStyle-Width="50px">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ShipmentLPEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>                      
                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.CTNRNo")%>' onserverclick="Delete"
                            runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ShipmentLPUpdate" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ShipmentLPCancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                   </telerik:GridTemplateColumn>                                   
                   <telerik:GridTemplateColumn DataField="CTNRNo" SortExpression="CTNRNo" HeaderText="ContainerNo">                       
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CTNRNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="CTNRNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "CTNRNo") %>' 
                                Skin="Office2007">
                            </telerik:RadTextBox>        
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>                    
                    <telerik:GridTemplateColumn DataField="CTNRType" SortExpression="CTNRType" HeaderText="SizeType">
                         <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CTNRType")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="CTNRTypeDDL" runat="server" Skin="Office2007" 
                                        DropDownHeight="150px" DataSource='<%# CTNRTypeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CTNRTypeListDS,DataBinder.Eval(Container.DataItem, "CTNRType").ToString())%>'
                                        DataTextField="Descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains" CausesValidation="false">
                            </telerik:RadDropDownList> 
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="CTNRSealNo" SortExpression="CTNRSealNo" HeaderText="SealNo">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CTNRSealNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="CTNRSealNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "CTNRSealNo") %>' 
                                Skin="Office2007">
                            </telerik:RadTextBox>        
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn> 
                    <telerik:GridTemplateColumn DataField="GINO" SortExpression="GINO" HeaderText="GINO">
                         <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "GINO")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ReadOnly="true" ID="GINOTxt" Text='<%# DataBinder.Eval(Container.DataItem, "GINO") %>' 
                                Skin="Office2007">
                            </telerik:RadTextBox>        
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn> 
                    <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status" ReadOnly="true">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>                      
                </Columns>
                <DetailTables>
                            <telerik:GridTableView DataKeyNames="ctnrno" Name="ChildGrid" SkinID="Telerik" Width="100%">
                                <HeaderStyle Wrap="false" />
                                <ItemStyle Wrap="false" />
                                <AlternatingItemStyle Wrap="false" />
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="CTNRNo" MasterKeyField="ctnrno" />
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="PUNO" UniqueName="PUNO" SortExpression="PUNO" HeaderText="PUNO">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SKUCode" UniqueName="SKUCode" SortExpression="SKUCode" HeaderText="SKUCode">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Descr" UniqueName="Descr" SortExpression="Descr" HeaderText="SKUDescr">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="QTY" UniqueName="QTY" SortExpression="QTY" HeaderText="PackedUOMQTY">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UOM" UniqueName="UOM" SortExpression="UOM" HeaderText="UOM">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CTNRNo"  HeaderText="CTNRNo" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns> 
                            </telerik:GridTableView>
                        </DetailTables>
            </MasterTableView>
              <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </telerik:RadGrid> 
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </div>
    </form>
</body>
</html>
