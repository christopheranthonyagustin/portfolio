<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyUpdate.aspx.cs" Inherits="iWMS.Web.Currency.CurrencyUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="BtnReadXMLNode" runat="server" Text="Read XML Node" 
        onclick="BtnReadXMLNode_Click" />   
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>        
    </div>
    </form>
</body>
</html>
