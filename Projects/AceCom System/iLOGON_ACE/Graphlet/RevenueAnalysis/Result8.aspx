<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result8.aspx.cs" Inherits="iWMS.Web.Graphlet.RevenueAnalysis.Result8" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
 <head id="Head1" runat="server">
		<title>WhseGIAnalysis</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

        <script language="javascript" type="text/javascript">
	     function disableBtn(id) {
                var btn = document.getElementById(id);
                btn.disabled = true;
            }
        </script>
	</head>
<body>
   <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>            
            <td class="style2"  colspan="4">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">P & L By Account By Job - From Job Add Date </asp:Label>
                <asp:Label ID="frdateLbl" runat="server" class="graytitle"></asp:Label>
                <asp:Label ID="todLbl" runat="server" class="graytitle" Text="To " />
                <asp:Label ID="todateLbl" runat="server" class="graytitle"></asp:Label>
            </td>           
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="AccountLabel" runat="server" class="graytitle" Text="Account :" />
                <asp:Label ID="AccountLbl" class="graytitle" runat="server"></asp:Label>
            </td>
        </tr>        
        <tr>
             <td class="style2">
                <asp:Label ID="JbnoLbl" runat="server" CssClass="Graytitle">Job No :</asp:Label>
                <asp:Label ID="frjbnoLbl" runat="server" class="graytitle" Text="FromJobNo to :" />
                <asp:Label ID="FromJbNoLbl" runat="server" class="graytitle"></asp:Label>
                <asp:Label ID="tjbnoLbl" runat="server" class="graytitle" Text="ToJobNo :" />
                <asp:Label ID="ToJbNoLbl" runat="server" class="graytitle"></asp:Label>
            </td>            
        </tr>         
    </table>
    <asp:Button ID="excelBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
        ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
        <ClientSettings>
        <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <MasterTableView AllowMultiColumnSorting="true">        
            <Columns>  
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
