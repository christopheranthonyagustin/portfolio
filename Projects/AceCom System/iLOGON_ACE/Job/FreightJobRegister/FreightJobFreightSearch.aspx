<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobFreightSearch.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobFreightSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Freight Order Freight Search</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SearchBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table width="100%">
        <tr>
            <td width="2%">
                &nbsp;
            </td>
            <td width="10%">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>&nbsp;
            </td>
            <td align="left">
                    <asp:ImageButton ID="SearchBtn" runat="server" ImageUrl="../../Image/Search.png" 
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                        ImageAlign="AbsMiddle" OnClick="SearchBtn_Click" />
            </td>
        </tr>
    </table>
    <br /><br />      
    <telerik:RadGrid id="ResultDG" runat="server" autogeneratecolumns="false" gridlines="None"
        allowpaging="false" allowsorting="true" OnItemCommand="ResultRadGrid_ItemCommand"
        OnNeedDataSource="ResultDG_NeedDataSource" allowfilteringbycolumn="true" skin="Office2007" onitemdatabound="ResultDG_ItemDataBound">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="tankno">
            <Columns>
                <telerik:GridButtonColumn ButtonType="LinkButton" CommandName="tankno" HeaderText="ContainerNo"
                        UniqueName="tankno" DataTextField="tankno">
                </telerik:GridButtonColumn> 
                <telerik:GridBoundColumn HeaderText="Date" DataField="arrivaldate" AllowFiltering="false">                  
                </telerik:GridBoundColumn>            
                <telerik:GridBoundColumn HeaderText="ContainerCapacity" DataField="TankCapacity" AllowFiltering="false">
                </telerik:GridBoundColumn>                               
                <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="false">                  
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Depot" DataField="depot" AllowFiltering="false">
                </telerik:GridBoundColumn>                               
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>   
    </form>
</body>
</html>
