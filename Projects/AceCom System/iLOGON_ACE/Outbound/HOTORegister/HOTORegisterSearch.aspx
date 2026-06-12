<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOTORegisterSearch.aspx.cs"
    Inherits="iWMS.Web.Outbound.HOTORegister.HOTORegisterSearch" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>HOTORegisterSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
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
    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="BtnPanel" runat="server">
                    &nbsp;
                     <asp:Button ID="NewSearchBtn" class="white" runat="server" Visible="true" OnClick="NewSearchBtn_Click" Text="NewSearch"
                        UseSubmitBehavior="false" /> 
                    &nbsp;&nbsp;
                    <asp:Button ID="PrintBtn" class="blue" runat="server" OnClick="PrintBtn_Click" Text="Print"
                        UseSubmitBehavior="false" /> 
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="newPanel" runat="server" Visible="False">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td>
                                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                                 UseSubmitBehavior="false" />
                                &nbsp;&nbsp;
                               <asp:Button ID="HideSearchBtn" class="white" runat="server" OnClick="HideSearchBtn_Click" Text="Hide"
                                 UseSubmitBehavior="false" />  
                                <br />
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
    <div id="div2" style="width: 100%; height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowSorting="true"
            Skin="Office2007" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound"
            OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderStyle-Width="15px" ItemStyle-Width="15px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                            <a id="lnkDelete" onclick="return confirm('Confirm Cancel?')" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                runat="server" onserverclick="HOTORegister_Cancel">
                            <img id="delImg" border="0" alt="Cancel HOTO" src="..\..\image\bin.gif" width="15"
                                height="15" runat="server"></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="number" HeaderText="Number" SortExpression="number"
                        UniqueName="number" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" HeaderText="Type" SortExpression="type"
                        UniqueName="type" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="hocnt" HeaderText="Count" SortExpression="hocnt"
                        UniqueName="hocnt" ItemStyle-Wrap="false" AllowFiltering ="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HandOverDate" HeaderText="HandOverDate" SortExpression="HandOverDate"
                        UniqueName="HandOverDate" DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HandOverName" HeaderText="HandOverName" SortExpression="HandOverName"
                        UniqueName="HandOverName" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TakeOverName" HeaderText="TakeOverName" SortExpression="TakeOverName"
                        UniqueName="TakeOverName" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TakeOverDept" HeaderText="TakeOverDept" SortExpression="TakeOverDept"
                        UniqueName="TakeOverDept" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TakeOverDate" HeaderText="TakeOverDate" SortExpression="TakeOverDate"
                        UniqueName="TakeOverDate" DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Rem1" HeaderText="Rem1" SortExpression="Rem1"
                        UniqueName="Rem1" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" HeaderText="Status" SortExpression="status"
                        ItemStyle-Wrap="false" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" Display="false"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
        targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
        backgroundcssclass="MessageBoxPopupBackground">
    </ajaxtoolkit:modalpopupextender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
