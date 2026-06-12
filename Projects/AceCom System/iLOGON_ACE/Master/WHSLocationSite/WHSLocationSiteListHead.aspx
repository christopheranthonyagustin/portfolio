<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSLocationSiteListHead.aspx.cs" Inherits="iWMS.Web.Master.WHSLocationSite.WHSLocationSiteListHead" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>WHSLocationSiteListHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <table style="width: 100%; height: 30px">
            <tr>
                <td class="style1">
                    <asp:Button ID="GenPUNOBtn" CssClass="LONGLABELGREEN" runat="server" OnClick="GenPUNOBtn_Click" Text="Generate PUNO"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
               <asp:Button ID="GenTUNO1Btn" CssClass="LONGLABELGREEN" runat="server" OnClick="GenTUNO1Btn_Click" Text="Generate TUNO1"
                   OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="GenTUNO1lblBtn" CssClass="LONGLABELGREEN" runat="server" OnClick="GenTUNO1lblBtn_Click" Text="Generate TUNO1 Label"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.code")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="Site_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Site"
                                    runat="server"></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="code" SortExpression="Code" HeaderText="Site"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="countrycodedescr" SortExpression="countrycodedescr" HeaderText="Country"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="contact" SortExpression="contact" HeaderText="Contact"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tel" SortExpression="tel" HeaderText="Phone"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="email" SortExpression="email" HeaderText="Email"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="storagerate" SortExpression="storagerate" HeaderText="StorageRate"
                        ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="storagecurrcode" SortExpression="storagecurrcode" HeaderText="StorageCurrency"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="storagefreedays" SortExpression="storagefreedays" HeaderText="StorageFreeDays"
                        ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwtprefix" SortExpression="lwtprefix" HeaderText="Tobacco Prefix"
                        ItemStyle-Wrap="false" UniqueName="lwtprefix">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwtseries" SortExpression="lwtseries" HeaderText="Tobacco Series"
                        ItemStyle-Wrap="false" UniqueName="lwtseries">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwtsno" SortExpression="lwtsno" HeaderText="Tobacco SNo"
                        ItemStyle-Wrap="false" UniqueName="lwtsno">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwlseries" SortExpression="lwlseries" HeaderText="Liquor Series"
                        ItemStyle-Wrap="false" UniqueName="lwlseries">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwlsno" SortExpression="lwlsno" HeaderText="Liquor SNo"
                        ItemStyle-Wrap="false" UniqueName="lwlsno">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwzprefix" SortExpression="lwzprefix" HeaderText="ZGST Prefix"
                        ItemStyle-Wrap="false" UniqueName="lwzprefix">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwzseries" SortExpression="lwzseries" HeaderText="ZGST Series"
                        ItemStyle-Wrap="false" UniqueName="lwzseries">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lwzsno" SortExpression="lwzsno" HeaderText="ZGST SNo"
                        ItemStyle-Wrap="false" UniqueName="lwzsno">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tu1prefix" SortExpression="tu1prefix" HeaderText="TU1Prefix"
                        ItemStyle-Wrap="false" UniqueName="tu1prefix">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tu1numdigit" SortExpression="tu1numdigit" HeaderText="TU1SnoLength"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="false" UniqueName="tu1numdigit">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tu1numvalue" SortExpression="tu1numvalue" HeaderText="TU1NextSno"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="false" UniqueName="tu1numvalue">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tu2prefix" SortExpression="tu2prefix" HeaderText="TU2Prefix"
                        ItemStyle-Wrap="false" UniqueName="tu2prefix">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tu2numdigit" SortExpression="tu2numdigit" HeaderText="TU2SnoLength"
                        ItemStyle-Wrap="false" UniqueName="tu2numdigit">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tu2numvalue" SortExpression="tu2numvalue" HeaderText="TU2NextSno"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="false" UniqueName="tu2numvalue">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PUNOPrefix" SortExpression="PUNOPrefix" HeaderText="PUNOPrefix"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PUNONumDigit" SortExpression="PUNONumDigit" HeaderText="PUNOSerialNoLength"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PUNONumValue" SortExpression="PUNONumValue" HeaderText="PUNONextSerialNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="postalcode" SortExpression="postalcode" HeaderText="PostalCode"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
