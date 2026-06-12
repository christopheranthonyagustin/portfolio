<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerAnalysis37.aspx.cs" Inherits="iWMS.Web.Report.ContainerAnalysis.ContainerAnalysis37" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ContainerAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
         <asp:Label ID="lblProcessID" runat="server" Visible="False" />
        <br />
        <br />
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
        <Items>
            <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                Style="text-align: center; font-size: 15px; font-weight: bold;">
                <Items>
                    <telerik:RadPanelItem runat="server" Value="Panel">
                        <ItemTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" width="80%">
                            <tr style="height: 10px">
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="shipmentTypeLbl" runat="server" Text="ShipmentType" /><br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="shipmentTypeCombo" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                    </telerik:RadComboBox>
                                </td>
                                <td>
                                    <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                    <telerik:RadComboBox ID="account" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                      </telerik:RadComboBox>
                                </td>
                               <td>
                                    <asp:Label ID="alarm1Lbl" runat="server" Text="Alarm1" /><br />
                                   <telerik:RadDropDownList ID="alarm1Ddl" runat="server" Enabled="True" DataTextField="Descr"
                                      DataValueField="item" Width="150px" Skin="WebBlue">
                                   </telerik:RadDropDownList>
                               </td>
                                <td>
                                    <asp:Label ID="alarm2Lbl" runat="server" Text="Alarm2" /><br />
                                   <telerik:RadDropDownList ID="alarm2Ddl" runat="server" Enabled="True"  Width="150px" Skin="WebBlue">
                                   </telerik:RadDropDownList>
                               </td>
                                <td>
                                    <asp:Label ID="refreshIntervalLbl" runat="server" Text="RefreshInterval" /><br />
                                   <telerik:RadDropDownList ID="refreshIntervalDdl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                   </telerik:RadDropDownList>
                               </td>
                                <td>
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />              
                                     <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white"  OnClick="RunBtn_Click"/>
                                                                       
                                </td>
                            </tr>

                            </table>
                            <br />
                        </ItemTemplate>
                    </telerik:RadPanelItem>
                </Items>                                     
            </telerik:RadPanelItem>
        </Items>
        </telerik:RadPanelBar>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="Both"
             OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <ClientSettings Selecting-AllowRowSelect>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        </form>             
</body>
</html>
