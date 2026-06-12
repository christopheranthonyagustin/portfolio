<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSAFEDIForm.aspx.cs" Inherits="iWMS.Web.Job.PSAFEDI.PSAFEDIForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PSAFEDIForm</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
  <%--  to hid the page scroll bar--%>

 <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>

    </telerik:RadCodeBlock> 

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <%--<telerik:RadTab Text="Line" Value="100" runat="server">
            </telerik:RadTab>--%>
            <telerik:RadTab Text="Log" Value="100" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
        <%--// Added by HW on 20/Oct/2016 for Ticket #4655--%>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly ="true">
        <telerik:RadPageView runat="server" Height="400px" ID="MainRadPageView">        
        <table cellspacing="2" cellpadding="2" width="100%" border="0">            
            <tr>
                <td>
                    <br />
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
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
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="false" OnEditCommand="ResultDG_Edit" 
                        AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnUpdateCommand="ResultDG_Update">
                       <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                       <Selecting AllowRowSelect="True" />
                         <%--<Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="450px" SaveScrollPosition="true" />--%>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" EditMode="InPlace">
                        <CommandItemSettings ShowRefreshButton="false" />
                            <Columns>
                                 <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                 <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                     <ItemTemplate>
                                     <asp:ImageButton runat="server" Visible="True" ID="Editbutton" ImageUrl="../../image/pencil.gif"
                                     Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                     </ItemTemplate> 
                                <EditItemTemplate>
                                     <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                     Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                     <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
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
                                <telerik:GridBoundColumn AllowFiltering="true" ColumnGroupName="jobno" 
                                    DataField="jobno" HeaderText="JobNo" Reorderable="true" 
                                    SortExpression="jobno" UniqueName="jobno">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" 
                                    ColumnGroupName="containernumber" DataField="containernumber" 
                                    HeaderText="ContainerNumber" ReadOnly="true" Reorderable="true" 
                                    SortExpression="containernumber" UniqueName="containernumber">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" 
                                    ColumnGroupName="tariffdescription" DataField="tariffdescription" 
                                    HeaderText="Tariff" ReadOnly="true" Reorderable="true" 
                                    SortExpression="tariffdescription" UniqueName="tariffdescription">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="false" ColumnGroupName="billableunit" 
                                    DataField="billableunit" HeaderText="Qty" ItemStyle-HorizontalAlign="Right" 
                                    ReadOnly="true" Reorderable="true" ShowFilterIcon="false" 
                                    SortExpression="billableunit" UniqueName="billableunit">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="false" ColumnGroupName="rate" 
                                    DataField="rate" HeaderText="Rate" ItemStyle-HorizontalAlign="Right" 
                                    ReadOnly="true" Reorderable="true" ShowFilterIcon="false" SortExpression="rate" 
                                    UniqueName="rate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="false" 
                                    ColumnGroupName="unitdescription" DataField="unitdescription" HeaderText="Unit" 
                                    ReadOnly="true" Reorderable="true" ShowFilterIcon="false" 
                                    SortExpression="unitdescription" UniqueName="unitdescription">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="false" ColumnGroupName="amount" 
                                    DataField="amount" HeaderText="Amount" ItemStyle-HorizontalAlign="Right" 
                                    ReadOnly="true" Reorderable="true" ShowFilterIcon="false" 
                                    SortExpression="amount" UniqueName="amount">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn HeaderText="Recover" DataField="RecoverableDescr" AllowFiltering="true"
                                ColumnGroupName="RecoverableDescr" SortExpression="RecoverableDescr" UniqueName="RecoverableDescr" Reorderable="true" ReadOnly="true" >
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridTemplateColumn HeaderText="RecoverType" Reorderable="true">
                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "RecoverableTypeDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                <telerik:RadDropDownList ID="RecTypeDescrDDL" Enabled="True" DataTextField="Descr" DataValueField="item" Skin="WebBlue" 
                                     SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RecTypeDescrListDS,DataBinder.Eval(Container.DataItem, "RecoverableType").ToString())%>'
                                     runat="server" DataSource='<%# RecTypeDescrListDS%>' AutoPostBack="True">
                                </telerik:RadDropDownList> 
                                  <%--  <asp:RequiredFieldValidator ID="RecTypeDescrReqVal" runat="server" ControlToValidate="RecTypeDescrDDL"
                                        ErrorMessage="*" />     --%>                                                                                                             
                                </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" 
                                    ColumnGroupName="RecoverableRemarks" DataField="RecoverableRemarks" 
                                    HeaderText="RecoverRem" Reorderable="true" SortExpression="RecoverableRemarks" 
                                    UniqueName="RecoverableRemarks">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" ColumnGroupName="fullvesselname" 
                                    DataField="fullvesselname" HeaderText="Vessel" ReadOnly="true" 
                                    Reorderable="true" SortExpression="fullvesselname" UniqueName="fullvesselname">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" 
                                    ColumnGroupName="fulloutvoynumber" DataField="fulloutvoynumber" 
                                    HeaderText="VoyOut" ReadOnly="true" Reorderable="true" 
                                    SortExpression="fulloutvoynumber" UniqueName="fulloutvoynumber">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" 
                                    ColumnGroupName="fullinvoynumber" DataField="fullinvoynumber" 
                                    HeaderText="VoyIn" ReadOnly="true" Reorderable="true" 
                                    SortExpression="fullinvoynumber" UniqueName="fullinvoynumber">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" 
                                    ColumnGroupName="descriptionline1" DataField="descriptionline1" 
                                    HeaderText="Descr" ReadOnly="true" Reorderable="true" 
                                    SortExpression="descriptionline1" UniqueName="descriptionline1">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" ColumnGroupName="adddate" 
                                    DataField="adddate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" 
                                    HeaderText="AddDate" ReadOnly="true" Reorderable="true" 
                                    SortExpression="adddate" UniqueName="adddate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" ColumnGroupName="adduser" 
                                    DataField="adduser" HeaderText="AddUser" ReadOnly="true" Reorderable="true" 
                                    SortExpression="adduser" UniqueName="adduser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" ColumnGroupName="editdate" 
                                    DataField="editdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" 
                                    HeaderText="EditDate" ReadOnly="true" Reorderable="true" 
                                    SortExpression="editdate" UniqueName="editdate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AllowFiltering="true" ColumnGroupName="edituser" 
                                    DataField="edituser" HeaderText="EditUser" ReadOnly="true" Reorderable="true" 
                                    SortExpression="edituser" UniqueName="edituser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jobno" Display="False" HeaderText="jobno" 
                                    ReadOnly="true" SortExpression="jobno" />
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid> <%--end Ticket #4655--%>
                </td>
            </tr>
    </table>        
        <%--<%--<telerik:RadPageView runat="server" Height="370px" ID="LineRadPageView">
        </telerik:RadPageView>--%>        
     </telerik:RadPageView>     
     <telerik:RadPageView runat="server" Height="480px" ID="LogRadPageView"> 
     </telerik:RadPageView>
 </telerik:RadMultiPage>  
  </form>
</body>
</html>
