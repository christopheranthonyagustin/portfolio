<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockRegisterSearch.aspx.cs" Inherits="iWMS.Web.Outbound.BlockRegister.BlockRegisterSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<heads>
    <title>Block Register</title>
  <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

</heads>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="5" cellpadding="1" width="100%">
        <tr>
            <td>
                <asp:Panel ID="BtnPanel" runat="server">
                    <asp:ImageButton ID="NewSearchBtn" runat="server" ImageUrl="../../Image/NewSearch.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="NewSearchBtn_Click" />
                    <br />                    
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="SearchPanel" runat="server" Visible="False">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td>
                                <asp:ImageButton ID="SearchBtn" runat="server" ImageUrl="../../Image/Search.png" 
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                    ImageAlign="AbsMiddle" OnClick="SearchBtn_Click" />
                                &nbsp;                                
                                <asp:ImageButton ID="HideSearchBtn" runat="server" ImageUrl="../../Image/Hide.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="HideSearchBtn_Click" />
                                <br />
                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>                       
                    </table>
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td colspan="3">
                <asp:Label ID="AjIdLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ItemTemplate>
                        <%--<iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>--%>   
                        <asp:Label ID="DetailLbl" runat="server" />                   
                        <asp:Label ID="DeletLbl" runat="server" />
                        <asp:Label ID="holdLbl" runat="server" />
                        <asp:Label ID="releaseLbl" runat="server" />
                        <asp:Label ID="IHCfmLbl" runat="server"></asp:Label>
                         <asp:Label ID="CloseLbl" runat="server"></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn Display="false" DataField="acid">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="ihId">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Inv.Hold#">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sitecode" SortExpression="sitecode" HeaderText="Site">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="releaseApproveqty" SortExpression="releaseApproveqty" HeaderText="ReleaseApproveQty">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="BatchNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Sloc">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ihreasondescr" SortExpression="ihreasondescr"
                    HeaderText="ReleaseReason">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="holduntildate" SortExpression="holduntildate"
                    HeaderText="HoldUntil">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                </telerik:GridBoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </MasterTableView>
    </telerik:RadGrid>
     <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    </form>
</body>
</html>
