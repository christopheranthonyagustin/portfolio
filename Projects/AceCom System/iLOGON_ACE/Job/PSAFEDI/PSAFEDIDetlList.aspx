<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page MaintainScrollPositionOnPostback="true" Language="c#" CodeBehind="PSAFEDIDetlList.aspx.cs"
    AutoEventWireup="True" Inherits="iWMS.Web.Job.PSAFEDI.PSAFEDIDetlList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PSAFEDIDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" type="text/javascript">
        function CheckAllDataGridCheckBoxes(aspCheckBoxID, checkVal) {
            re = new RegExp(':' + aspCheckBoxID + '$')  //generated control name starts with a colon
            for (i = 0; i < Form1.elements.length; i++) {
                elm = document.forms[0].elements[i]
                if (elm.type == 'checkbox') {
                    if (re.test(elm.name))
                        elm.checked = checkVal
                }
            }
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
           <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="LineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <tr>
            <td>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" AllowSorting="True"
                    AllowFilteringByColumn="True" EnableLinqExpressions="False" AllowPaging="True"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    GroupPanelPosition="Top">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id">
                                <ItemStyle Width="100px"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="PSAFEDIId">
                                <ItemStyle Width="100px"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="Jbid">
                                <ItemStyle Width="100px"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Number">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="processdate" SortExpression="processdate" HeaderText="ProcessDate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="billnumber" SortExpression="billnumber" HeaderText="BillNumber">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="billdate" SortExpression="billdate" HeaderText="BillDate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="containernumber" SortExpression="containernumber"
                                HeaderText="ContainerNo">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tariffcode" SortExpression="tariffcode" HeaderText="Tariff">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tariffdescription" SortExpression="tariffdescription"
                                HeaderText="TariffDescr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Amount" SortExpression="Amount" HeaderText="Amount" DataFormatString = "{0:N4}"
                            ItemStyle-Wrap="False">
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fullvesselname" SortExpression="fullvesselname"
                                HeaderText="Vessel">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fulloutvoynumber" SortExpression="fulloutvoynumber"
                                HeaderText="VoyOut">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fullinvoynumber" SortExpression="fullinvoynumber"
                                HeaderText="VoyIn">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="descriptionline1" SortExpression="descriptionline1"
                                HeaderText="Description">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="chargecode" SortExpression="chargecode" HeaderText="ChargeCode">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="ChargeDescr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" HeaderText="Add Date" SortExpression="adddate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" HeaderText="Add User" SortExpression="adduser">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" HeaderText="Edit Date" SortExpression="editdate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" HeaderText="Edit User" SortExpression="edituser">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
    </form>
</body>
</html>
