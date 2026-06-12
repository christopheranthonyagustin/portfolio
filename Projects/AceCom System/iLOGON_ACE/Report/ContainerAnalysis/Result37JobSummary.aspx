<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result37JobSummary.aspx.cs" Inherits="iWMS.Web.Report.ContainerAnalysis.Result37" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ContainerAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
         <asp:Label ID="lblProcessID" runat="server" Visible="False" />
        <br />
        <br />
         <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007" CausesValidation="false"
            AutoPostBack="true" OnTabClick="RadTabStrip1_Click">
            <Tabs>
                 <telerik:RadTab Text="JobSummary" readonly="readonly" Value="0"  runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
         </telerik:RadTabStrip>
         <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
             <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
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
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />              
                                     <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white"  OnClick="RunBtn_Click"/>
                                       &nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:Button ID="ESNBtn" runat="server" Text="ESN"  CssClass="white"   OnClick="ESNBtn_Click"  ></asp:Button>
                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:Button ID="UndoBtn" runat="server" Text="Undo"  CssClass="white"   OnClick="UndoBtn_Click"  ></asp:Button>
                                    
                                                                       
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
             OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
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
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:Label ID="ESNLbl" runat="server"></asp:Label>
                                </ItemTemplate>
               </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
             </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView">
            </telerik:RadPageView>
         </telerik:RadMultiPage>
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        
    </form>             
</body>
</html>
