<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogDetl.aspx.cs" Inherits="iWMS.Web.Adm.User.UserLogDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>UserLogDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
            <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        body {
            overflow: hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <div id="div2" style="height: 92%">

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="pagetitle">&nbsp;</td>
                </tr>
                <tr>
                    <td width="70%" align="left">
                        <%--   <a id="a1" runat="server" onserverclick="ExportExcel">
                        <img id="img1" runat="server" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/Excel.png" />
                    </a>--%>                &nbsp;
                          <asp:Button ID="a1" runat="server" Text="Excel" ToolTip="Export to Excel" OnClick="ExportExcel"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="green" />
                    </td>
                </tr>
            </table>

            <br />
            <div>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    EnableLinqExpressions="false" Skin="Metro" AllowSorting="true"
                    AllowFilteringByColumn="true" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Scrolling AllowScroll="true" ScrollHeight="400px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString() %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="logoutdate" SortExpression="logoutdate" HeaderText="LogOutDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>




                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </form>
</body>
</html>
