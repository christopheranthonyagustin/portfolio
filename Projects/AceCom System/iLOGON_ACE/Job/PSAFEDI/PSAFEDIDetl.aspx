<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSAFEDIDetl.aspx.cs" Inherits="iWMS.Web.Job.PSAFEDI.PSAFEDIDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PSAFEDIDetail</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="false" OnEditCommand="ResultDG_Edit" 
            AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnUpdateCommand="ResultDG_Update">
          <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="True" />
            <%--<Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="450px" SaveScrollPosition="true" />--%>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />                
                <Columns>                
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="Editbutton" ImageUrl="..\..\image\pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
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
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                        ColumnGroupName="jobno" SortExpression="jobno" UniqueName="jobno" Reorderable="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ContainerNumber" DataField="containernumber"
                        AllowFiltering="true" ColumnGroupName="containernumber" SortExpression="containernumber"
                        UniqueName="containernumber" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Tariff" DataField="tariffdescription" AllowFiltering="true"
                        ColumnGroupName="tariffdescription" SortExpression="tariffdescription" UniqueName="tariffdescription"
                        Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="billableunit" AllowFiltering="false" ShowFilterIcon="false" ItemStyle-HorizontalAlign="Right"
                        ColumnGroupName="billableunit" SortExpression="billableunit" UniqueName="billableunit"
                        Reorderable="true" ReadOnly="true" >                                      
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rate" DataField="rate" AllowFiltering="false" ShowFilterIcon="false" ItemStyle-HorizontalAlign="Right"
                        ColumnGroupName="rate" SortExpression="rate" UniqueName="rate" Reorderable="true"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Unit" DataField="unitdescription" AllowFiltering="false" ShowFilterIcon="false" 
                        ColumnGroupName="unitdescription" SortExpression="unitdescription" UniqueName="unitdescription"
                        Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Amount" DataField="amount" AllowFiltering="false" ShowFilterIcon="false" ItemStyle-HorizontalAlign="Right"
                        ColumnGroupName="amount" SortExpression="amount" UniqueName="amount" Reorderable="true"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>       
                     <%--<telerik:GridBoundColumn HeaderText="Recover" DataField="RecoverableDescr" AllowFiltering="true"
                        ColumnGroupName="RecoverableDescr" SortExpression="RecoverableDescr" UniqueName="RecoverableDescr" Reorderable="true" ReadOnly="true" >
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridTemplateColumn Reorderable="true" HeaderText="RecoverType">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "RecoverableTypeDescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="RecTypeDescrDDL" Enabled="True" DataTextField="Descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RecTypeDescrListDS,DataBinder.Eval(Container.DataItem, "RecoverableType").ToString())%>'
                            runat="server" DataSource='<%# RecTypeDescrListDS%>' Width="300px" AutoPostBack="True" />
                    </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                     <telerik:GridBoundColumn HeaderText="RecoverRem" DataField="RecoverableRemarks" AllowFiltering="true"
                        ColumnGroupName="RecoverableRemarks" SortExpression="RecoverableRemarks" UniqueName="RecoverableRemarks" Reorderable="true"  >
                    </telerik:GridBoundColumn>   
                    <telerik:GridBoundColumn HeaderText="Vessel" DataField="fullvesselname" AllowFiltering="true"
                        ColumnGroupName="fullvesselname" SortExpression="fullvesselname" UniqueName="fullvesselname"
                        Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VoyOut" DataField="fulloutvoynumber" AllowFiltering="true"
                        ColumnGroupName="fulloutvoynumber" SortExpression="fulloutvoynumber" UniqueName="fulloutvoynumber"
                        Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VoyIn" DataField="fullinvoynumber" AllowFiltering="true"
                        ColumnGroupName="fullinvoynumber" SortExpression="fullinvoynumber" UniqueName="fullinvoynumber"
                        Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Descr" DataField="descriptionline1" AllowFiltering="true"
                        ColumnGroupName="descriptionline1" SortExpression="descriptionline1" UniqueName="descriptionline1"
                        Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" ReadOnly="true"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="jobno" SortExpression="jobno"
                        HeaderText="jobno" ReadOnly="true" />
                </Columns>
            </MasterTableView>
          
        </telerik:RadGrid>
 
    </form>
</body>
</html>
