<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobGeodis.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobGeodis" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Geodis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
        /*Main menu*/
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 2px 7px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .WrappingItem {
            white-space: normal;
        }

            .WrappingItem:hover {
                color: black !important;
                background-color: white !important;
                font-weight: bold !important;
            }
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true" Width="100%">
                        <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                            OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                        <br />
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label runat="server"  Font-Bold="true" Font-Size="Larger" ForeColor="Indigo" Text="Interface Log"></asp:Label>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Scrolling AllowScroll="True" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="true" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id"
                                    HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="exref2" SortExpression="ReferenceNo" HeaderText="WayBillNo"
                                            Display="true" UniqueName="ReferenceNo" ItemStyle-Wrap="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="ReferenceNo"
                                            Display="true" UniqueName="exref1" ItemStyle-Wrap="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="remarks" SortExpression="SystemRemarks" HeaderText="SystemRemarks"
                                            Display="true" UniqueName="SystemRemarks" ItemStyle-Wrap="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rem1" SortExpression="Remarks" HeaderText="Remarks"
                                            Display="true" UniqueName="Remarks" ItemStyle-Wrap="false">
                                        </telerik:GridBoundColumn>
                                       
                                        <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                                            Display="true" UniqueName="AddUser" ItemStyle-Wrap="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser"
                                            Display="true" UniqueName="EditUser" ItemStyle-Wrap="false" Visible="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Id" SortExpression="Id" HeaderText="Id"
                                            Display="false" UniqueName="Id" ItemStyle-Wrap="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StatusColourCode" SortExpression="StatusColourCode" HeaderText="StatusColourCode"
                                            Display="false" UniqueName="StatusColourCode" ItemStyle-Wrap="false">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
    </form>
</html>
