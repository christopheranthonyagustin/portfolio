<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result41.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsReceiveAnalysis.Result41" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Goods Receive Analysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
     <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="GrayTitle">
                <td >
                    <asp:Label ID="lblComapanyName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>Goods Receive Analysis&nbsp;-&nbsp;&nbsp;
                    <asp:Label ID="lblFormat" runat="server"></asp:Label>
                    &nbsp; From&nbsp;
                     <asp:Label ID="lblfrdate" runat="server"></asp:Label>
                    &nbsp; TO&nbsp;
                         <asp:Label ID="lbltodate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>Account :
                       <asp:Label ID="lblAccount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="excelImg" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" AllowPaging="false">
                        <ExportSettings OpenInNewWindow="true" />
                        <MasterTableView AutoGenerateColumns="true" ShowHeader="false">
                            <ItemTemplate>
                             <h2 style="font-size:20px;" > Summary</h2>
                                <telerik:RadGrid ID="SubResultDG" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                                    OnNeedDataSource="SubResultDG_NeedDataSource" OnItemDataBound="SubResultDG_ItemDataBound">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false" Font-Bold="true" Font-Size="Large" Height ="75px"></ItemStyle>
                            <HeaderStyle Wrap="false" Font-Bold="true" ></HeaderStyle>
                                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                                    <MasterTableView AutoGenerateColumns="true" >
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <h2 style="font-size:20px;"> Failure Records</h2>
                                <telerik:RadGrid ID="SubResultDG2" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                                    OnNeedDataSource="SubResultDG2_NeedDataSource" OnItemDataBound="SubResultDG2_ItemDataBound">
                                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                                    <MasterTableView AutoGenerateColumns="true">
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <br />
                            </ItemTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>