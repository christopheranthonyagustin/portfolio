<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceEnquiryResult.aspx.cs"
    Inherits="iWMS.Web.Job.InvoiceEnquiry.InvoiceEnquiryResult" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MyInvoice</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
     body {
        background-color :#e0ecf8;
      }
     </style>
</head>
<body>
<table width="100%">
        <tr>
            <td>
                <%--<iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>--%>
                <a  href="InvoiceEnquirySearch.aspx" target="_self"> NewSearch</a>  &nbsp&nbsp
                <a  href="InvoiceEnquiryResult.aspx" target="_self"> Results</a>
            </td>
            <td class="ModuleTitle" align="right">
                <div class="rounded-box1" style="background-color: #336600; width: 80%">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="box-contents1" style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px;
                        font-size: 10pt; font-weight: bold; padding-top: 3px; left: 2px">
                        <asp:Label ID="MenuLbl" runat="server">My Invoice</asp:Label></div>
                </div>
            </td>
        </tr>
    </table>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    </div>
    <asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" Font-Bold="True" Visible="False"
				CssClass="errorLabel"></asp:Label>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound">
         <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
  
            <Columns>
            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center" ></ItemStyle>
                    <ItemTemplate>
                     <asp:button id="Job" runat="server" Text="Job" CssClass="formbtn" onclick="JobBtn_Click"></asp:button>
                    </ItemTemplate>
                     <ItemStyle Wrap="false"  /> 
                </telerik:GridTemplateColumn>
                
         <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" HeaderText="acid" />
                
                 <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                    ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn HeaderText="Billing Name" DataField="billname" AllowFiltering="true"
                    ColumnGroupName="billname" SortExpression="billname" UniqueName="billname" Reorderable="true">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="invno" AllowFiltering="true"
                    ColumnGroupName="invno" SortExpression="invno" UniqueName="invno" Reorderable="true">
                </telerik:GridBoundColumn>          
                
                <telerik:GridBoundColumn HeaderText="InvDate" DataField="invdate" AllowFiltering="true"
                    ColumnGroupName="invdate" SortExpression="invdate" UniqueName="invdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn> 

                <telerik:GridBoundColumn HeaderText="PayTerms" DataField="paytermsdescr" AllowFiltering="true"
                    ColumnGroupName="paytermsdescr" SortExpression="paytermsdescr" UniqueName="paytermsdescr" Reorderable="true">
                </telerik:GridBoundColumn> 
                
                <telerik:GridBoundColumn HeaderText="Currency" DataField="currcode" AllowFiltering="true"
                    ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                </telerik:GridBoundColumn> 
                
                <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="totinvamt" AllowFiltering="true"
                    ColumnGroupName="totinvamt" SortExpression="totinvamt" UniqueName="totinvamt" Reorderable="true" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign=Right>
                </telerik:GridBoundColumn> 
                
                  <telerik:GridBoundColumn HeaderText="Type" DataField="invtypedescr" AllowFiltering="true"
                    ColumnGroupName="invtypedescr" SortExpression="invtypedescr" UniqueName="invtypedescr" Reorderable="true">
                </telerik:GridBoundColumn> 
                </Columns>
          </MasterTableView>
    </telerik:RadGrid>
    </form>
    
</body>
</html>
