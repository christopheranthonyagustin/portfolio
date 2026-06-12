<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockRegisterDetail.aspx.cs"
    Inherits="iWMS.Web.Outbound.BlockRegister.BlockRegisterDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Block Register Detail</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <base target="_self">
        <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />

        <script src="../../js/CastleBusyBox.js" language="javascript"></script>

        <script src="../../js/sub_global.js" type="text/javascript"></script>

        <script src="../../js/sub_menu.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr>
            <td>
                <asp:Panel ID="BtnPanel" runat="server">
                    <telerik:RadButton ID="NewSearchBtn" runat="server" OnClick="NewSearchBtn_Click"
                        Text="NewSearch" Skin="WebBlue">
                    </telerik:RadButton>
                    &nbsp;&nbsp;
                    <telerik:RadButton ID="SaveBtn" runat="server" Text="    Save     " CssClass="detailButton"
                        Skin="WebBlue" OnClick="SaveBtn_Click" CausesValidation="false">
                    </telerik:RadButton>
                    &nbsp;&nbsp;
                    <telerik:RadButton ID="CancelBtn" runat="server" Text="    Cancel    " CssClass="detailButton"
                        Skin="WebBlue" OnClick="CancelBtn_Click">
                    </telerik:RadButton>
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
                                <telerik:RadButton ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="   Search   "
                                    Skin="WebBlue">
                                </telerik:RadButton>
                                &nbsp;&nbsp;
                                <telerik:RadButton ID="HideSearchBtn" runat="server" OnClick="HideSearchBtn_Click"
                                    Text="HideSearch" Skin="WebBlue">
                                </telerik:RadButton>
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
    <div id="div-datagrid">
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
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%--<asp:CheckBox ID="SelectCB" runat="server" />
                        </ItemTemplate>--%>
                            <%-- <ItemTemplate>--%>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="id" SortExpression="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="zonedescr" SortExpression="zonedescr" HeaderText="Zone">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TuNo1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TuNo2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="onhandqty" SortExpression="onhandqty" HeaderText="OnHand">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="allocatedqty" SortExpression="allocatedqty" HeaderText="Allocated">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pickedqty" SortExpression="pickedqty" HeaderText="Picked">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="heldqty" SortExpression="heldqty" HeaderText="Held">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="availqty" SortExpression="availqty" HeaderText="Available">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="ReceiveDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot1" SortExpression="lot1" HeaderText="Lot1"
                        DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot7" SortExpression="lot7" HeaderText="Lot7">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot3" SortExpression="lot3" HeaderText="Lot3"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot8" SortExpression="lot8" HeaderText="Lot8">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot9" HeaderText="Lot9">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot10" HeaderText="Lot10">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot11" HeaderText="Lot11">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot12" HeaderText="Lot12">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot13" HeaderText="Lot13">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot14" HeaderText="Lot14">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot15" HeaderText="Lot15">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot16" HeaderText="Lot16">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot17" HeaderText="Lot17">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot18" HeaderText="Lot18">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot19" HeaderText="Lot19">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot20" HeaderText="Lot20">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot21" HeaderText="Lot21">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot22" HeaderText="Lot22">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot23" HeaderText="Lot23">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot24" HeaderText="Lot24">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot25" HeaderText="Lot25">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot26" HeaderText="Lot26">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot27" HeaderText="Lot27">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot28" HeaderText="Lot28">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot29" HeaderText="Lot29">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot30" HeaderText="Lot30">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot31" HeaderText="Lot31">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot32" HeaderText="Lot32">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot33" HeaderText="Lot33">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot34" HeaderText="Lot34">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot35" HeaderText="Lot35">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot36" HeaderText="Lot36">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot37" HeaderText="Lot37">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot38" HeaderText="Lot38">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot39" HeaderText="Lot39">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot40" HeaderText="Lot40">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot41" HeaderText="Lot41">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot42" HeaderText="Lot42">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot43" HeaderText="Lot43">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot44" HeaderText="Lot44">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot45" HeaderText="Lot45">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot46" HeaderText="Lot46">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot47" HeaderText="Lot47">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot48" HeaderText="Lot48">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot49" HeaderText="Lot49">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot50" HeaderText="Lot50">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot51" HeaderText="Lot51">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot52" HeaderText="Lot52">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot53" HeaderText="Lot53">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot54" HeaderText="Lot54">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot55" HeaderText="Lot55">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot56" HeaderText="Lot56">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot57" HeaderText="Lot57">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot58" HeaderText="Lot58">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot59" HeaderText="Lot59">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="lot60" HeaderText="Lot60">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid></div>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    </form>
</body>
</html>
