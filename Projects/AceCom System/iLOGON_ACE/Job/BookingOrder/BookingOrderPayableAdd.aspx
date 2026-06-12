<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderPayableAdd.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderPayableAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>Booking Order Payable Add</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
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

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>

    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" OnClick="ConfirmBtn_Click" Visible="True" Text="Confirm"
                        UseSubmitBehavior="false" />
                    <br />
                    <br />
                    <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="ctnrNoLbl" runat="server">ContainerNo</asp:Label>
                            <br />
                            <telerik:RadComboBox ID="ContainerNoList" runat="server" Skin="WebBlue" RenderMode="Lightweight" Filter="Contains" Width="155px">
                            </telerik:RadComboBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table" border="0" cellspacing="2" cellpadding="2" width="80%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <ContentTemplate>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                                OnItemDataBound="ResultDG_ItemDataBound" Width="80%">
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridTemplateColumn HeaderText="ChargeCode" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="ChargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="TaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="ChargeCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="DescrTxt" runat="server" Width="150px" Skin="WebBlue" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>'>
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="AmtTxt" runat="server" Width="140px" Skin="WebBlue"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="AmtTxtCompVal" runat="server" ControlToValidate="AmtTxt"
                                                    EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Vendor" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadComboBox ID="VendorCBB" runat="server" Width="140px" Skin="WebBlue" ExpandDirection="Up" Filter="Contains"
                                                    DataSource='<%# VendorDS%>' DataTextField="descr" DataValueField="item" DropDownAutoWidth="Enabled">
                                                </telerik:RadComboBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Bank" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadDropDownList ID="BankDDL" runat="server" Width="140px" Skin="WebBlue" ExpandDirection="Up"
                                                    DataSource='<%# BankListDS%>' DataTextField="descr" DataValueField="item">
                                                </telerik:RadDropDownList>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadDropDownList ID="CurrencyDDL" runat="server" Width="140px" Skin="WebBlue"
                                                    DataSource='<%# CurrencyDS%>' DataTextField="descr" DataValueField="item">
                                                </telerik:RadDropDownList>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="RemarksTxt" runat="server" Width="150px" Skin="WebBlue" TextMode="MultiLine">
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
