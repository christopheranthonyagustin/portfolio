<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceEnquirySearch.aspx.cs" Inherits="iWMS.Web.Job.InvoiceEnquiry.InvoiceEnquirySearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >

<html>
<head runat="server">
    <title>MyInvoice</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
            <td >
                <%--<iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>--%>
                <a  href="InvoiceEnquirySearch.aspx" target="_self">NewSearch</a> &nbsp&nbsp
                <a  href="InvoiceEnquiryResult.aspx" target="_self">Results</a>
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
    
    <br />
    <br />
<div  >
  <form class="navbar-form " role="search" method=post runat=server>
  <div class="form-group">
   
 <iwms:iForm id="formCtl" runat="server"></iwms:iForm>
 
  </div>
			&nbsp<asp:button id="SearchBtn" runat="server" Text="Search" CssClass="formbtn" onclick="SearchBtn_Click"></asp:button><br><BR />
</form>
</div>
 <asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" Font-Bold="True" Visible="False"
				CssClass="errorLabel"></asp:Label>
  
</body>
</html>
