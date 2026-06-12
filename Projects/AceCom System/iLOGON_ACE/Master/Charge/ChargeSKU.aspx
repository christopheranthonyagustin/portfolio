<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargeSKU.aspx.cs" Inherits="iWMS.Web.Master.Charge.ChargeSKU" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>

    </telerik:RadCodeBlock>
    <style type="text/css">
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
    </style>

    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnEditCommand="ResultDG_Edit"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
            OnUpdateCommand="ResultDG_Update">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="550px" />
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id"
                EditMode="InPlace" CommandItemDisplay="Top">
                <CommandItemSettings ShowRefreshButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="true" ID="Edit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ResultDG_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    title="Delete" runat="server" visible="true" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>&nbsp; &nbsp; 
                                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            <asp:TextBox ID="Id" runat="server" Visible="false" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="ChargeId" HeaderText="ChargeId" ReadOnly="true" Display="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ChargeId")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="SKU" HeaderText="SKU" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "SKUCode")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadMultiColumnComboBox ID="SKUCombo" runat="server"
                                Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                DataTextField="Descr" DataValueField="Code" Width="150px" DropDownWidth="100px"
                                Text='<%# DataBinder.Eval(Container.DataItem, "SKUcode") %>'>
                            </telerik:RadMultiColumnComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="UOM" HeaderText="UOM"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "UOMDescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="UOMDDL" runat="server" ExpandDirection="Down" Skin="WebBlue"
                                DataValueField="item" DataTextField="descr" DataSource='<%# UOMDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UOMDS,DataBinder.Eval(Container.DataItem, "UOMDescr").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EffectiveDate" UniqueName="EffectiveDate">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="EffectiveDateLbl" Text='<%#  string.Format("{0:dd/MMM/yyyy}",Eval("EffectiveDate"))%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="EffectiveDateDP" runat="server" Width="170px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "EffectiveDate") %>'
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy">
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="EffectiveReqVal" runat="server" ControlToValidate="EffectiveDateDP"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="UnitRate" HeaderText="UnitRate">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "UnitRate")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="UnitRate" Text='<%# Eval("UnitRate") %>' Skin="Office2007" Width="100px">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="UnitRateReqVal" runat="server" ControlToValidate="UnitRate"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Currency" HeaderText="Currency"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CurrCode")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="CurrencyDDL" runat="server" ExpandDirection="Down" Skin="WebBlue"
                                DataValueField="item" DataTextField="descr" DataSource='<%# CurrencyDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrencyDS,DataBinder.Eval(Container.DataItem, "CurrCode").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Taxtype" HeaderText="TaxType"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "TaxTypeDescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="TaxTypeDDL" runat="server" ExpandDirection="Down" Skin="WebBlue"
                                DataValueField="item" DataTextField="descr" DataSource='<%# TaxTypeDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UOMDS,DataBinder.Eval(Container.DataItem, "TaxType").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Rem1")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="Remarks" Text='<%# Eval("Remarks") %>' Skin="Office2007" TextMode="MultiLine" Width="100px">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" UniqueName="adddate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" UniqueName="adduser"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" UniqueName="editdate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" UniqueName="edituser"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>
