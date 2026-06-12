<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptShipmentBOMExplode.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.ReceiptShipmentBOMExplode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ReceiptBOMExplode</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
	<base target="_self" />
	<meta http-equiv="Pragma" content="no-cache" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" /> <br /> <br /> 
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="TitleLbl" runat="server" CssClass="BoldText" />  
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="50%" runat="server" align="center">
            <tr>
                <td style="height: 10px;"></td>
            </tr>            
            <tr>
                <td style="height: 10px;"></td>
            </tr>
            <tr>
                <td align="center">
                    <div id="div-datagrid">
                        <telerik:RadGrid ID="ResultDG" runat="server" UseAccessibleHeader="True" BorderStyle="Solid" 
                            PageSize="8" CellPadding="2" GridLines="Both" AutoGenerateColumns="False" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <ExportSettings ExportOnlyData="true" IgnorePaging="true">
                            </ExportSettings>
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="skuid">
                            <Columns>
                                <telerik:GridTemplateColumn> 
                                    <ItemTemplate>
                                        <asp:Label ID="ImgIdLbl" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container,"DataItem.cskuimageid")%>' />
						                <asp:Image ID="SkuImg" runat="server" ImageAlign="Top" />
					                </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="cskucode" HeaderText="SKU">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cskudescr" HeaderText="Description">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ttlchildbomqty" HeaderText="TotalQty" DataFormatString="{0:N2}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="childbomuom" HeaderText="UOM">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                            </Columns>
                           </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="height: 10px;"></td>
            </tr>
            <tr>
                <td align="center">
                    <telerik:RadButton ID="Populate_Btn" runat="server" OnClick="Populate_Btn_Click" Text=" OK "
                      CssClass="detailButton" Skin="WebBlue">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
