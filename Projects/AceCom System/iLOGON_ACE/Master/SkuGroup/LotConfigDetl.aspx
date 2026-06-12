<%@ Page Language="c#" CodeBehind="LotConfigDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.SkuGroup.LotConfigDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuGroupListDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <LINK href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
     <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br>
    <telerik:RadGrid ID="LotCfgDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="LotCfgDG_NeedDataSource"  Skin="Metro" OnItemDataBound="LotCfgDG_ItemDataBound"
        OnUpdateCommand="LotCfgDG_Update" OnEditCommand="LotCfgDG_Edit">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
             <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
            <Columns>
                 <telerik:GridTemplateColumn >
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="LotCfgEdit" ImageUrl="../../image/pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" BorderWidth="0" BackColor="Transparent"
                            CommandName="Edit"></asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" BorderWidth="0" BackColor="Transparent"
                            ID="LotCfgUpdate" ImageUrl="../../image/floppy.gif" Width="15" Height="15" AlternateText="Update"
                            CommandName="Update"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" BorderWidth="0" BackColor="Transparent"
                            ID="LotCfgCancel" ImageUrl="../../image/arrow6.gif" Width="15" Height="15" AlternateText="Cancel"
                            CommandName="Cancel" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn >
                
                 <telerik:GridBoundColumn DataField="lot" SortExpression="lot" UniqueName="lot" HeaderText="Lot" ReadOnly="True" >
                      
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type" ReadOnly="True" >
                      
                    </telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn HeaderText="Description"   >
                    <ItemTemplate>
                        <%# GetLotDescr( DataBinder.Eval(Container.DataItem, "lot") , DataBinder.Eval(Container.DataItem, "descr")) %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DescrList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# GetLotDS( DataBinder.Eval(Container.DataItem, "lot") ) %>'
                            SelectedIndex='<%# GetLotSelectedValue( DataBinder.Eval(Container.DataItem, "lot") , DataBinder.Eval(Container.DataItem, "descr")) %>' />
                        </EditItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn  HeaderText="Show(In)">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkShowInItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "showinbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkShowInEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "showinbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
               </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Req(In)">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkReqInItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "reqinbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkReqInEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "reqinbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                 </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="Show(Out)">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkShowOutItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "showoutbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkShowOutEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "showoutbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                 </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="Req(Out)">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkReqOutItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "reqoutbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkReqOutEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "reqoutbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                  
                <telerik:GridTemplateColumn HeaderText="POShow(In)">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPOShowInItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "poshowinbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPOShowInEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "poshowinbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                 </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn HeaderText="POReq(In)">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPOReqInItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "poreqinbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPOReqInEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "poreqinbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
               </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="PickShow">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPickShowItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "pickshowbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPickShowEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "pickshowbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="PickReq">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPickReqItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "pickreqbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPickReqEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "pickreqbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="PackShow">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPackShowItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "packshowbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPackShowEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "packshowbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="PackReq">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPackReqItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "packreqbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPackReqEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "packreqbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="IsUnique">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkIsUniqueItem" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "isuniquebool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkIsUniqueEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "isuniquebool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                 </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ListCode">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ListCodeList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# listCodeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(listCodeListDS,DataBinder.Eval(Container.DataItem, "listcode").ToString())%>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "listcode")%>
                    </ItemTemplate>
                  </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="Function">
                    <EditItemTemplate>
                        <asp:DropDownList ID="FunctionList" Enabled="True" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# functionListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(functionListDS,DataBinder.Eval(Container.DataItem, "function").ToString())%>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "functiondesr")%>
                    </ItemTemplate>
              </telerik:GridTemplateColumn>
              
                <telerik:GridTemplateColumn HeaderText="Mask">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "mask")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="MaskTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "mask")%>'></asp:TextBox>
                    </EditItemTemplate>
                   </telerik:GridTemplateColumn>
                   
                <telerik:GridTemplateColumn HeaderText="IsUniqueByPass">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "isuniquebypass")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="uniquebypassTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "isuniquebypass")%>'></asp:TextBox>
                    </EditItemTemplate>
                 </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn HeaderText="Ignore Ownership Transfer">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkOwnership" Enabled="False" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "ownershiptransferbool")) %>'
                            runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkOwnershipEdit" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "ownershiptransferbool")) %>'
                            runat="server" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="ReadOnly">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ReadOnlyDDL" DataTextField="descr" DataValueField="item"
                            runat="server" DataSource='<%# ReadOnlyListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ReadOnlyListDS,DataBinder.Eval(Container.DataItem, "ReadOnly").ToString())%>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ReadOnlyDescr")%>
                    </ItemTemplate>
              </telerik:GridTemplateColumn>
                 <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" >
                      
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" ReadOnly="True">
                      
                    </telerik:GridBoundColumn>
                        
                     <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" >
                      
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" ReadOnly="True" >
                      
                    </telerik:GridBoundColumn>
             
            </Columns>
         <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
