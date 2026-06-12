<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.JbAccPnL.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>JbAccPnL</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>   
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }
        .style3 {
            width: 12px;
        }
        .style4 {
            width: 93px;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
           <%-- <td width="70%" align="right">
                <a id="a1" runat="server" onserverclick="ExportExcel">
                    <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server" />
                </a>
            </td>--%>
        </tr>
        <tr class="graytitle">            
            <td colspan="5">                
                    <asp:Label ID="TitleLbl" runat="server"></asp:Label>              
               <%-- <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">P & L By Account By Job</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>--%>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style4">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>  
            <td class="style3">:
                </td>       
            <td >
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style4">
                JobNo
            </td>
            <td class="style3">:
                </td>
            <td colspan="2">
                <asp:Label ID="JobNoLbl" runat="server"></asp:Label>
            </td>
        </tr>
         <tr>
                <td>
                    <asp:ImageButton ID="a1" runat="server" ImageUrl="../../Image/Excel.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
                        ImageAlign="AbsMiddle" ToolTip="Export To Excel" OnClick="ExportExcel" />
                </td>
            </tr>
    </table>    
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"  >
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobNo"
            Name="ParentGrid"  ItemStyle-Wrap="true" HeaderStyle-Wrap="true" AlternatingItemStyle-Wrap="true" >
             <PagerStyle Mode="NextPrevNumericAndAdvanced" />                    
            <Columns>               
                <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                    UniqueName="jobno" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Account" DataField="Account" ItemStyle-Width="250px" HeaderStyle-Width="250px" 
                    UniqueName="Account" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id"
                    Display="false" ItemStyle-Width="100px" HeaderStyle-Width="500px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Left" HeaderText="ChargeCode"
                    DataField="chargecode" AllowFiltering="true" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Left" ItemStyle-CssClass="breakWord"
                    ItemStyle-Width="500px" HeaderStyle-Width="500px" HeaderStyle-Wrap="true" HeaderText="ChargeDescr"
                    DataField="chargedescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="SalesAmt"
                    ItemStyle-Width="100px" DataField="salesamt" AllowFiltering="true" Aggregate="sum"
                    FooterText="SalesAmtTotal:  " UniqueName="salesamt">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="CostsAmt"
                    DataField="costamt" AllowFiltering="true" Aggregate="sum" FooterText="CostAmtTotal:  ">
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="P&LAmt"
                    DataField="PnLAmt" AllowFiltering="true" Aggregate="sum" FooterText="P&LAmtTotal:  ">
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridCalculatedColumn HeaderStyle-HorizontalAlign="Right" HeaderText="Margin%"
                   DataFields="PnLAmt, salesamt " Expression="iif({1} = 0, 0,{0}/{1})*100"
                    DataFormatString="{0:N2}">
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridCalculatedColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
