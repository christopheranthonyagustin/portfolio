<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceJobEnquiry.aspx.cs" Inherits="iWMS.Web.Job.InvoiceEnquiry.InvoiceEnquiryJob" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MyInvoice</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    
 <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td>
                <%--<iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>--%>
                <%--<asp:LinkButton id="resultLBtn" runat="server" Text="Results" OnClick="resultLBtn_Click" />--%>
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
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>
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
                     <asp:button id="Job" runat="server" Text="Img" CssClass="formbtn" onclick="ImgBtn_Click"></asp:button>
                    </ItemTemplate>
                     <ItemStyle Wrap="false"  /> 
                </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn HeaderText="SrcNo" DataField="srcnumber" AllowFiltering="true"
                    ColumnGroupName="srcnumber" SortExpression="srcnumber" UniqueName="srcnumber" Reorderable="true">
                </telerik:GridBoundColumn> 
            <telerik:GridBoundColumn HeaderText="SrcType" DataField="srctype" AllowFiltering="true"
                    ColumnGroupName="srctype" SortExpression="srctype" UniqueName="srctype" Reorderable="true">
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                    ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true">
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="ExpectedDate" DataField="expdate" AllowFiltering="true"
                    ColumnGroupName="expdate" SortExpression="expdate" UniqueName="expdate" Reorderable="true">
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="CustomerReference" DataField="custref" AllowFiltering="true"
                    ColumnGroupName="custref" SortExpression="custref" UniqueName="custref" Reorderable="true">
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                    ColumnGroupName="status" SortExpression="status" UniqueName="status" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="srcid" DataField="srcid" SortExpression="srcid" UniqueName="srcid" Display=false>
                </telerik:GridBoundColumn> 
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
