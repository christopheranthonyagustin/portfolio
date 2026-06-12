<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceJobEnquiryResult.aspx.cs" Inherits="iWMS.Web.Job.InvoiceEnquiry.InvoiceJobEnquiryResult" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MyInvoice</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
  <form id="form1" runat="server">
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
  
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    </div>
      <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="false" AllowFilteringByColumn="false" EnableLinqExpressions="false"
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
            
            <telerik:GridTemplateColumn>
                <HeaderTemplate>Image</HeaderTemplate>
                <ItemTemplate><asp:Label ID="ImageLbl" Runat="server"></asp:Label></ItemTemplate>
                          
            </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn Display="False" DataField="srctype" SortExpression="srctype" HeaderText="srctype" />
                <telerik:GridBoundColumn   DataField="srcno" SortExpression="srcno" HeaderText="srcno" />
                <telerik:GridBoundColumn Display="False" DataField="imagefile" SortExpression="imagefile" HeaderText="imagefile" />
                  <telerik:GridBoundColumn  DataField="imagename" SortExpression="imagename" HeaderText="imagename" />
               <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />
               <telerik:GridBoundColumn Display="False" DataField="imagetype" SortExpression="imagetype" HeaderText="imagetype" />
                </Columns>
          </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
