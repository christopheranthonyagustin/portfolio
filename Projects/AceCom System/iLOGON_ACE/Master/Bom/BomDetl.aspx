<%@ Page Language="c#" CodeBehind="BomDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Bom.BomDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>BomDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/row.js" type="text/javascript"></script>
    
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>

    </telerik:RadCodeBlock>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <%--<asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red" />--%>
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="BOMSKU" Value="0" readonly="readonly" runat="server">
            
            </telerik:RadTab>
            <%--<telerik:RadTab Text="CHILDSKU" Value="100" runat="server">
            </telerik:RadTab>--%>
        </Tabs>
    </telerik:RadTabStrip>
     <br>
    <table>
        <tr>
            <td>
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
     <br>     
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <table cellspacing="1" width="100%" border="0" runat="server">
                <tr>
                    <td>                        
                        <telerik:RadButton ID="UpdateBtn" runat="server" CssClass="detailButton" Text="Update"
                            Skin="WebBlue" OnClick="UpdateBtn_Click">
                        </telerik:RadButton>                        
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>  
                    <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" 
                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" EditMode="InPlace">
                                <CommandItemSettings ShowRefreshButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                                Width="15" Height="15" AlternateText="Edit B.O.M Detail" CommandName="Edit" BackColor="Transparent" 
                                                BorderWidth="0"></asp:ImageButton>
                                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="ResultDG_Delete" runat="server">
                                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Receipt Detail"
                                                    title="Delete" runat="server" /></a>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn>
                                        <HeaderTemplate>
                                            No
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="childskuid" Display="False">
                                    </telerik:GridBoundColumn>                                  
                                    <telerik:GridTemplateColumn UniqueName="cskucode" HeaderText="SKU" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "cskucode")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="skutext" Skin="Office2007" Rows="2" Width="150px" AutoPostBack="true" OnTextChanged="SKUCodeText_Changed">
                                            </telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="skubomtext" runat="server" ControlToValidate="skutext"
                                                ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                   
                                    <telerik:GridTemplateColumn UniqueName="cskudescr" HeaderText="Description" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "cskudescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="descrtext" Enabled="false" Skin="Office2007" Rows="2" Width="150px">
                                            </telerik:RadTextBox>                                          
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                    
                                    <telerik:GridTemplateColumn UniqueName="childbomqty" HeaderText="ChildBOMQty" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "childbomqty")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="childbomtext" Skin="Office2007" Rows="2" Width="150px">
                                            </telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="ChildBOMQtytext" runat="server" ControlToValidate="childbomtext"
                                                ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                    
                                    <telerik:GridTemplateColumn UniqueName="childbomuomdescr" HeaderText="ChildBOMUOM" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "childbomuomdescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList runat="server" ID="childbomUOMDDL" DropDownHeight="150px" Skin="WebBlue">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="childbomuomtxt" runat="server" ControlToValidate="childbomUOMDDL" ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                    
                                    <telerik:GridTemplateColumn UniqueName="skubomtypedescr" HeaderText="ChildBOMType">
                                        <HeaderStyle Wrap="false" HorizontalAlign="left" />
                                        <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "skubomtypedescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList runat="server" ID="childbomtypeDDL" DropDownHeight="150px" Skin="WebBlue" 
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChildbomtypeDS,DataBinder.Eval(Container.DataItem, "type").ToString())%>'
                                                DataSource='<%# ChildbomtypeDS%>' DataTextField="descr" DataValueField="item">
                                            </telerik:RadDropDownList>                                            
                                        </EditItemTemplate>
                                     </telerik:GridTemplateColumn>                                                                        
                                     <telerik:GridTemplateColumn UniqueName="rem1" HeaderText="Remark" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "rem1")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="Remarktext" Skin="Office2007" Rows="2" Width="150px">
                                            </telerik:RadTextBox>                                           
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                   
                                    <telerik:GridBoundColumn DataField="sb_adddate" SortExpression="sb_adddate" HeaderText="AddDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="sb_adduser" SortExpression="sb_adduser" HeaderText="AddUser">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="sb_editdate" SortExpression="sb_editdate" HeaderText="EditDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="sb_edituser" SortExpression="sb_edituser" HeaderText="EditUser">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages">
                                </PagerStyle>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
<%--       <telerik:RadPageView runat="server" Height="700px" ID="AttributesRadPageView">
            <table cellspacing="0" border="0" width="100%">
                <tr>
                    <td align="left"> 
                    <br>                      
                        <telerik:RadButton ID="AddDetailBtn" runat="server" Visible="False" Text="NewLine"
                            CssClass="detailButton" Skin="WebBlue" OnClick="AddDetailBtn_Click">
                        </telerik:RadButton>                              
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <asp:Panel ID="AddPanel" runat="server" Visible="False">
                            <table border="0" cellspacing="1" cellpadding="1" width="100%">
                                <tr>
                                    <td>
                                        <telerik:RadButton ID="SaveNextBtn" runat="server" CssClass="detailButton" OnClick="SaveNextBtn_Click"
                                            Text="Save &amp; Next" Skin="WebBlue">
                                        </telerik:RadButton>
                                        &nbsp;
                                        <telerik:RadButton ID="SaveBtn" runat="server" CssClass="detailButton" OnClick="SaveBtn_Click"
                                            Text=" Save " Skin="WebBlue">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="ClosePanelBtn" runat="server" CausesValidation="False" CssClass="detailButton"
                                            OnClick="ClosePanelBtn_Click" Text="- Hide" Skin="WebBlue">
                                        </telerik:RadButton>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />                        
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
--%>    </telerik:RadMultiPage>
    </form>
</body>
</html>
