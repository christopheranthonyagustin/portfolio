<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostInvToOCI.aspx.cs" Inherits="iWMS.Web.Job.PostInvToOCI.PostInvToOCI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="HEAD1" runat="server">
    <title>BatchPostingofInvtoOCI</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <style type="text/css">
        .style1 {
            height: 20px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td valign="top">
                    <table id="Table2" border="0">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="CompileBtn" class="white" runat="server" OnClick="CompileBtn_Click" Text="Post"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true" ToolTip="Search" />

                    <asp:Button ID="ResetBtn" class="white" runat="server" OnClick="ResetBtn_Click" Text="Reset"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true" ToolTip="Reset" /><br />

                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>

                    <br />
                    <br />
                    <asp:Button ID="ExcelBtn" class="green" runat="server" OnClick="DownloadExcelBtn_Click" Text="Excel"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />

                    <asp:Button ID="XMLBtn" class="white" runat="server" OnClick="DownloadXMLBtn_Click" Text="XML"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To XML" />
                    <br />
                    <br />
                    <asp:Label ID="Label5" Text="Please use XML format to import invoice into OCI." Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" AllowPaging="true"
                        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                            Name="ParentGrid">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
            scrolling="no"></iframe>

        <script type="text/javascript" language="JavaScript1.2">
            // Instantiate our BusyBox object
            var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
        </script>

    </form>
</body>
</html>
