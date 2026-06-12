<%@ Page Language="c#" CodeBehind="UomConfig.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku.UomConfig" %>
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
                <asp:Button ID="AddBtn" runat="server" Text="New" CssClass="white" OnClick="AddBtn_Click"   OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false">
                </asp:Button>&nbsp;
                <asp:Button  ID="BackButton" runat="server" CssClass="white"
                    Text="Back" Visible="True" CausesValidation="False" OnClick="BackButton_Click"   OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false">
                </asp:Button>&nbsp;
                
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
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">

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
            <telerik:GridTemplateColumn >
                    <HeaderTemplate>
                        Site
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "sitedescr") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                       <asp:DropDownList ID="SiteList" DataMember="" DataTextField="Descr" DataValueField="Item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(siteDS,DataBinder.Eval(Container.DataItem, "sitecode").ToString())%>'
                            DataSource='<%# siteDS%>' runat="server" />
                        <asp:RequiredFieldValidator ID="SiteListReq" ControlToValidate="SiteList" runat="server"
                            EnableClientScript="True" ErrorMessage="*"></asp:RequiredFieldValidator>
                     
                        </EditItemTemplate>
             </telerik:GridTemplateColumn>
              <telerik:GridTemplateColumn >
                    <HeaderTemplate>
                         UOM
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="uom" runat="server" Text='<%# uom%>'>
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
             </telerik:GridTemplateColumn>
             
                     <telerik:GridTemplateColumn DataField="pfloccode" SortExpression="pfloccode"  UniqueName="pfloccode" HeaderText="PF.Loc"   >
                  <ItemTemplate>
                       <%# DataBinder.Eval(Container.DataItem, "pfloccode") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                   <asp:TextBox ID="PFTxt" runat="server" Width="80" Text=' <%# DataBinder.Eval(Container.DataItem, "pfloccode") %>'></asp:TextBox>
              
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn >
                    <HeaderTemplate>
                         MinimumQty
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "minqty") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                       <asp:TextBox ID="MinQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "minqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="MinQtyVal" runat="server" ControlToValidate="MinQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                 
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
             </telerik:GridTemplateColumn>

              <telerik:GridTemplateColumn >
                    <HeaderTemplate>
                        MaximumQty
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "maxqty") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                       <asp:TextBox ID="MaxQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "maxqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="MaxQtyVal" runat="server" ControlToValidate="MaxQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
             <asp:RequiredFieldValidator ID="MaxQtyReq" ControlToValidate="SiteList" runat="server"
                            EnableClientScript="True" ErrorMessage="*"></asp:RequiredFieldValidator>
                     
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
             </telerik:GridTemplateColumn>
             
             <telerik:GridTemplateColumn >
                    <HeaderTemplate>
                          Reorder Qty
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "reorderqty") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                       <asp:TextBox ID="ReorderQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "reorderqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="ReorderQtyVal" runat="server" ControlToValidate="ReorderQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                   
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
             </telerik:GridTemplateColumn>
              <telerik:GridTemplateColumn >
                    <HeaderTemplate>
                          Max.Allc. Qty
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "maxallcqty") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                     <asp:TextBox ID="MaxAllcQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "maxallcqty") %>'>
                        </asp:TextBox>
                        <asp:CompareValidator ID="MaxAllcQtyVal" runat="server" ControlToValidate="MaxAllcQtyTxt"
                            EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
              
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
             </telerik:GridTemplateColumn>
              <telerik:GridTemplateColumn DataField="overmaxflag" SortExpression="overmaxflag" UniqueName="overmaxflag" HeaderText="Over Max">
                    <ItemTemplate>
                       
                        <%# DataBinder.Eval(Container.DataItem, "overmaxflag")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkOverMaxEdit"    runat="server" />
                    </EditItemTemplate>                     
                        <ItemStyle Wrap="False"></ItemStyle>
             </telerik:GridTemplateColumn>
            
                    <telerik:GridTemplateColumn DataField="rem1" SortExpression="rem1"  UniqueName="rem1" HeaderText="Remark"   >
                  <ItemTemplate>
                       <%# DataBinder.Eval(Container.DataItem, "rem1") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                   <asp:TextBox ID="RemTxt" runat="server" Width="80"  Text=' <%# DataBinder.Eval(Container.DataItem, "rem1") %>'></asp:TextBox>
                        
                        <asp:CompareValidator ID="RemVal" runat="server" ControlToValidate="RemTxt" EnableClientScript="True"
                            ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <asp:CompareValidator ID="RemZeroVal" runat="server" ControlToValidate="RemTxt" EnableClientScript="True"
                            ErrorMessage="#" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
              
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  ReadOnly="true">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"    ReadOnly="true">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  ReadOnly="true">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"    ReadOnly="true">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
        
               
            
              
               
         
              
              
            </Columns>
      <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
        </telerik:RadGrid></div>
    </form>
</body>
</html>
