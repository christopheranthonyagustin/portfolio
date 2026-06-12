<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePointHead.aspx.cs" Inherits="iWMS.Web.Master.ServicePoint.ServicePointHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ServicePointHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
      
        #SwapBtn {
            margin-left: 1200px;
        }
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }

        .RadMenu {
            z-index: 600 !important; /*For Bootstrap Modal Popup crashed with Radmenu Position*/
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SearchResultsID" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                        <telerik:RadPageView runat="server" Height="0px" ID="HeaderRadPageView">
                             <table cellspacing="2" cellspacing="2">
                                <tr>
                                    <td>
                                        <br />
                                        <asp:Button ID="ChangeCodeBtn" CssClass="LongLabelWhite" runat="server" OnClick="ChangeCodeBtn_Click" Text="Change Code"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                                    </td>
                                    <td>
                                        <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <br />
                                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%"
                                            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged"
                                            OnItemDataBound="ResultDG_ItemDataBound">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                <Selecting AllowRowSelect="True" />
                                                <Scrolling AllowScroll="True" ScrollHeight="500px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                            <ItemStyle Wrap="false"></ItemStyle>
                                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" AllowFilteringByColumn="false">
                                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                <Columns>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                                        <HeaderTemplate>
                                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false" HeaderStyle-Width="60px" ItemStyle-Width="60px">
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" ID="ServicePtEdit" ImageUrl="../../image/pencil.gif"
                                                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit ServicePt"
                                                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                                onserverclick="ldDelete_Click" runat="server">
                                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete ListDetl" title="Delete ListDetl"
                                                                    runat="server" /></a>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="code" SortExpression="code" HeaderText="Code" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="ExternalCode_ERP" SortExpression="ExternalCode_ERP" HeaderText="ERP Code" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="ExternalCode_FMS" SortExpression="ExternalCode_FMS" HeaderText="FMS Code" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Addr" SortExpression="Addr" HeaderText="Address" HeaderStyle-Width="200px" ItemStyle-Width="200px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="addr1" SortExpression="addr1" HeaderText="Address#1" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="addr2" SortExpression="addr2" HeaderText="Address#2" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="addr3" SortExpression="addr3" HeaderText="Address#3" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="addr4" SortExpression="addr4" HeaderText="Address#4" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="zipcode" SortExpression="zipcode" HeaderText="Postal Code" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="citycode" SortExpression="citycode" HeaderText="City" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="countrycode" SortExpression="countrycode" HeaderText="Country" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CtnrDepotVendorCode" SortExpression="CtnrDepotVendorCode" HeaderText="DHCVendorCode" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CtnrDepotChargeCode" SortExpression="CtnrDepotChargeCode" HeaderText="DHCChargeCode" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CtnrDepotAmount" SortExpression="CtnrDepotAmount" HeaderText="DHCAmount" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CtnrDepotBankCode" SortExpression="CtnrDepotBankCode" HeaderText="DHCBankCode" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CMSVendorCode" SortExpression="CMSVendorCode" HeaderText="CMSVendorCode" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CMSChargeCode" SortExpression="CMSChargeCode" HeaderText="CMSChargeCode" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CMSAmount" SortExpression="CMSAmount" HeaderText="CMSAmount" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CMSBankCode" SortExpression="CMSBankCode" HeaderText="CMSBankCode" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn Display="False" DataField="StatusColourCode" />
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
