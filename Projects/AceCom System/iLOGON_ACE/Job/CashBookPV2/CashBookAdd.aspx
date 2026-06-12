<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookAdd.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV2.CashBookAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Payment Register V2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <base target="_self" />

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
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

</head>

<body>
    <form id="form1" runat="server" method="post">
        <%--<telerik:RadScriptManager runat="server" ID="RadScriptManager1" />--%>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false"
            AutoPostBack="true">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID='Upload' Text="Upload" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <%--Add by WW 11/Jul/2016_Ticket #5794: SMPL: Enhancement to Payment Register V2_pt.35 Add 2 tab (Main and Log)--%>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table cellspacing="2" cellpadding="2" width="100%" border="0">
                    <tr>
                        <td>
                            <asp:Button ID="addBtn" runat="server" Text="Add" Visible="true"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white"
                                OnClick="addBtn_Click"></asp:Button>
                            &nbsp;
                               <asp:Button ID="PrintPVBtn" runat="server" Text="PV"
                                   OnClientClick="disableBtn(this.id,true)" Visible="false" UseSubmitBehavior="false" CssClass="blue"
                                   OnClick="PrintPVBtn_Click"></asp:Button>
                            &nbsp;
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 5px;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="GenerateBtn" runat="server" Text="Generate" Visible="true" UseSubmitBehavior="false" CssClass="white"
                                OnClick="GenerateBtn_Click" OnClientClick="disableBtn(this.id)"></asp:Button>
                            <asp:Button ID="splitchargeBtn" runat="server" Text="SplitCharge" Visible="true"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white"
                                OnClick="splitchargeBtn_Click"></asp:Button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" OnPreRender="ResultDG_PreRender" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand" GroupPanelPosition="Top">
                                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top" Name="CBAdd"
                                    EditMode="InPlace">
                                    <CommandItemSettings ShowRefreshButton="false" />
                                    <Columns>
                                        <telerik:GridTemplateColumn UniqueName="icon">

                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                                <asp:ImageButton runat="server" Visible="true" ID="PVCopyBtn" ImageUrl="../../image/Copy.png"
                                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                                    OnClick="PVCopyBtn_Click" OnClientClick="return confirm('Confirm Copy?')" CausesValidation="False"></asp:ImageButton>
                                                <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                    onserverclick="ResultDG_Delete" runat="server">
                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                        title="Delete" runat="server" /></a>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="chargecode" HeaderText="Charge">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "chargecode")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="ChargeList" runat="server" DefaultMessage="Select a Charge"
                                                    DropDownHeight="150px" Skin="WebBlue" DataSource='<%# chargeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(chargeListDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                                    DataTextField="descr" DataValueField="item" OnSelectedIndexChanged="ChargeList_SelectedIndexChanged" RenderMode="Lightweight" Filter="Contains"
                                                    AutoPostBack="true" CausesValidation="false">
                                                </telerik:RadComboBox>
                                                <asp:TextBox ID="ChargeCodeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>' />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="chargedescr" HeaderText="Description">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="ChargeDescrTxt" Skin="Office2007" TextMode="MultiLine"
                                                    Rows="2" Width="150px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="qty" HeaderText="Qty">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007" Width="100px" AutoPostBack="true"
                                                    OnTextChanged="QtyRate_TextChanged">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="unitrate" HeaderText="UnitRate">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="100px" AutoPostBack="true"
                                                    OnTextChanged="QtyRate_TextChanged">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                <asp:CompareValidator ID="RateTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="discountamt" HeaderText="DiscountAmt">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "discountamt", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="DiscountAmtTxt" Skin="Office2007" Width="100px" AutoPostBack="true"
                                                    OnTextChanged="DiscountAmt_TextChanged">
                                                </telerik:RadTextBox>
                                                <asp:CompareValidator ID="DiscountAmtTxtCompVal" runat="server" ControlToValidate="DiscountAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                <asp:CompareValidator ID="DiscountAmtTxtZeroVal" runat="server" ControlToValidate="DiscountAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="Discount1" HeaderText="Discount1">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Discount1", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="Discount1Txt" Skin="Office2007" Width="100px">
                                                </telerik:RadTextBox>
                                                <asp:CompareValidator ID="Discount1TxtCompVal" runat="server" ControlToValidate="Discount1Txt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                <asp:CompareValidator ID="Discount1TxtZeroVal" runat="server" ControlToValidate="Discount1Txt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="fcamt" HeaderText="Amount">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "fcamt", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="FcAmtTxt" Skin="Office2007" Width="100px" Enabled="false"
                                                    AutoPostBack="true" OnTextChanged="FCAmt_TextChanged">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt"
                                                    ErrorMessage="*" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="lcamt" HeaderText="LcAmt" Display="false">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "lcamt", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="LcAmtTxt" Skin="Office2007" Width="100px">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="LcAmtTxtReqVal" runat="server" ControlToValidate="LcAmtTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="LcAmtTxtCompVal" runat="server" ControlToValidate="LcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="taxtypedescr" HeaderText="TaxType">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# RetTaxTypeDescr(Eval("taxtype").ToString())%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="TaxTypeList" runat="server" DefaultMessage="Select a TaxType"
                                                    Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                                    DataSource='<%# taxTypeListDS%>' DataTextField="descr" DataValueField="item"
                                                    OnSelectedIndexChanged="TaxType_SelectedIndexChanged" AutoPostBack="true">
                                                </telerik:RadDropDownList>
                                                <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                                    ErrorMessage="*" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="taxfcamt" HeaderText="TaxAmt">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "taxfcamt", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="TaxFcAmtTxt" Skin="Office2007" Width="100px">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="TaxFcAmtTxtReqVal" runat="server" ControlToValidate="TaxFcAmtTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="TaxFcAmtTxtCompVal" runat="server" ControlToValidate="TaxFcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="JobNo" UniqueName="srcno">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "srcno")  %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="JobNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "srcno") %>'></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="taxlcamt" HeaderText="TaxLcAmt" Display="false">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "taxlcamt", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="TaxLcAmtTxt" Skin="Office2007" Width="100px">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="TaxLcAmtTxtReqVal" runat="server" ControlToValidate="TaxLcAmtTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="TaxLcAmtTxtCompVal" runat="server" ControlToValidate="TaxLcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="exref2" HeaderText="EORNo" Display="false">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "exref2")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="EORNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "exref2") %>'></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="CtnrNo" UniqueName="ctnrno">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "ctnrno")  %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="CtnrNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>' AutoPostBack="true" OnTextChanged="CtnrNoTxt_onTextChanged"></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="CtnrNo" UniqueName="existsctnrno" Visible="false">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="existsCtnrNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>' AutoPostBack="true" OnTextChanged="CtnrNoTxt_onTextChanged" ReadOnly ="true"></telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="existsequipmentno" HeaderText="EqpNo" Visible="false">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox ID="existsVehNoTxt" runat="server"  Value='<%# DataBinder.Eval(Container.DataItem, "vehno") %>' readonly="true"/>
                                            </ItemTemplate>                                        
                                        </telerik:GridTemplateColumn>

                                          <telerik:GridTemplateColumn UniqueName="equipmentno" HeaderText="EqpNo">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "vehno")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="vehnoDDL" runat="server" DefaultMessage="Select a Equipment"
                                                    DropDownHeight="150px" Skin="WebBlue" DataSource='<%# vehicleDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehicleDS,DataBinder.Eval(Container.DataItem, "vehno").ToString())%>'
                                                    DataTextField="descr" DataValueField="item" OnSelectedIndexChanged="vehnoDDL_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false">
                                                </telerik:RadDropDownList>
                                                <asp:TextBox ID="VehNoTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "vehno") %>' />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="Personnel" HeaderText="Personnel" >
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "name")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="perDDL" runat="server" DefaultMessage="Select a Personnel"
                                                    DropDownHeight="150px" Skin="WebBlue" DataSource='<%# personnelDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(personnelDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'
                                                    DataTextField="descr" DataValueField="item">
                                                </telerik:RadDropDownList>
                                                <asp:TextBox ID="perTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "perid") %>' />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="existsPersonnel" HeaderText="Personnel" Visible="false">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                               <asp:TextBox ID="existsperTxt" runat="server"  Value='<%# DataBinder.Eval(Container.DataItem, "name") %>' readonly="true" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Remarks1">
                                            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "rem1")  %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="Rem1Txt" Skin="Office2007" TextMode="MultiLine"
                                                    Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'
                                                    Rows="3" Width="170px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Remarks2">
                                            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "rem2")  %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="Rem2Txt" Skin="Office2007" TextMode="MultiLine"
                                                    Text='<%# DataBinder.Eval(Container.DataItem, "rem2") %>'
                                                    Rows="3" Width="170px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="RecoverableType">
                                            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "recoverabletype")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList runat="server" ID="RecTypeDDL"
                                                    Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RecTypeListDS,DataBinder.Eval(Container.DataItem, "RecoverableType").ToString())%>'
                                                    DataSource='<%# RecTypeListDS%>' DataTextField="descr" DataValueField="item">
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="RecoverableRemarks">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "recoverableremarks")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="RecRemTxt" Text='<%# DataBinder.Eval(Container.DataItem, "recoverableremarks") %>'></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="VendorDocNo">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "CBDExRef1")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="ExRef1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "CBDExRef1") %>'></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="VendorDocDate">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "ExDate1", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDatePicker ID="ExDate1DatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true" Skin="Sunset">
                                                </telerik:RadDatePicker>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                            ItemStyle-Wrap="false" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                            HeaderText="EditUser" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
                <%--Message popup area start--%>
                <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                    TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                    BackgroundCssClass="MessageBoxPopupBackground">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
                    DefaultButton="btnOk">
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
                                    <td style="width: 2%;"></td>
                                    <td style="text-align: left; vertical-align: top; width: 87%;">
                                        <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                            <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; vertical-align: top;" colspan="3">
                                        <div style="margin-right: 0px; float: right; width: auto;">
                                            <asp:Button ID="btnOk" runat="server" Text="OK" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="480px" ID="UploadRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="480px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <%--Message popup area end--%>
    </form>
</body>
</html>
