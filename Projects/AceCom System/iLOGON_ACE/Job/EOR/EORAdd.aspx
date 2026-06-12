<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EORAdd.aspx.cs" Inherits="iWMS.Web.Job.EOR.EORAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>EORAdd</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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


</head>

<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007" CausesValidation="false"
            AutoPostBack="true">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Task" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table cellspacing="2" cellpadding="2" width="100%" border="0">
                    <tr>
                        <td>
                            <asp:Button ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click" Visible="true"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                            <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="addBtn_Click" Visible="false"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <telerik:RadButton ID="ConvfromVQBtn" runat="server" Text="Conversion From VQ" Skin="WebBlue" OnClick="ConvfromVQBtn_Click"></telerik:RadButton>
                            Total Approved Amount: SGD 
                            <asp:Label ID="AmtLbl" runat="server"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" OnPreRender="ResultDG_PreRender"
                                AllowFilteringByColumn="false" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
                                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top"
                                    EditMode="InPlace">
                                    <CommandItemSettings ShowRefreshButton="false" />
                                    <Columns>
                                        <telerik:GridTemplateColumn UniqueName="icon">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
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

                                         <telerik:GridTemplateColumn UniqueName="vendorid" HeaderText="Vendor" Visible="false">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "vendor")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <%--<asp:RequiredFieldValidator ID="TypeReqVal" runat="server" ErrorMessage="*" ControlToValidate="VendorList" ForeColor="Red"></asp:RequiredFieldValidator><br>--%>
                                                <telerik:RadComboBox ID="VendorList" runat="server" DefaultMessage="Select a Vendor"
                                                    DropDownHeight="150px" Skin="Sunset" DataSource='<%# VendorListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(chargeListDS,DataBinder.Eval(Container.DataItem, "vendorid").ToString())%>'
                                                    DataTextField="descr" DataValueField="item"  RenderMode="Lightweight" Filter="Contains" Width="250px"
                                                    AutoPostBack="true" CausesValidation="false">
                                                </telerik:RadComboBox>
                                                <asp:TextBox ID="VendorCodeTxt" Visible="false" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "vendor") %>' />
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
                                                    DataTextField="descr2" DataValueField="id" OnSelectedIndexChanged="ChargeList_SelectedIndexChanged" RenderMode="Lightweight" Filter="Contains" Width="250px"
                                                    AutoPostBack="true" CausesValidation="false">
                                                </telerik:RadComboBox>
                                                <asp:TextBox ID="ChargeCodeTxt" Visible="false" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>' />
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
                                                <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007" Width="100px" AutoPostBack="true" OnTextChanged="QtyTxt_OnTextChanged">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                <asp:CompareValidator ID="QtyTxtZeroVal" runat="server" ControlToValidate="QtyTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="unitrate" HeaderText="UnitRate">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="100px" AutoPostBack="true" OnTextChanged="RateTxt_OnTextChanged">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                <asp:CompareValidator ID="RateTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="currcode" HeaderText="Currency">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "currcode")  %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="CurrencyList" runat="server" DefaultMessage="Select a Currency" AutoPostBack="true"
                                                    Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(currencyListDS,"currcode")%>'
                                                    DataSource='<%# currencyListDS%>' DataTextField="descr" DataValueField="item" OnSelectedIndexChanged="CurrencyCode_SelectedIndexChanged">
                                                </telerik:RadDropDownList>
                                                <asp:RequiredFieldValidator ID="CurrencyReqVal" runat="server" ControlToValidate="CurrencyList"
                                                    ErrorMessage="*" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="exchrate" HeaderText="ExchRate" Display="true">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="ExchRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}")%>'></asp:Label>

                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="ExchRateTxt" Skin="Office2007" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}")%>'>
                                                </telerik:RadTextBox>
                                                <asp:CompareValidator ID="ExchRateTxtCompVal" runat="server" ControlToValidate="ExchRateTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />                                                
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="fcamt" HeaderText="Amount">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "fcamt", "{0:#,0.00}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="FcAmtTxt" Skin="Office2007" Width="100px" Enabled="false">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt"
                                                    ErrorMessage="*" />
                                                <asp:CompareValidator ID="FcAmtTxtCompVal" runat="server" ControlToValidate="FcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                <asp:CompareValidator ID="FcAmtTxtZeroVal" runat="server" ControlToValidate="FcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="apprvamt" HeaderText="ApprovedAmount">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="ApprAmtLbl" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, "apprvamt","{0:#,0.00}")%>'></asp:Label>

                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="ApprvAmtTxt" Skin="Office2007" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "apprvamt","{0:#,0.00}")%>'>
                                                </telerik:RadTextBox>
                                                <asp:CompareValidator ID="ApprvAmtTxtCompVal" runat="server" ControlToValidate="ApprvAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                <asp:CompareValidator ID="ApprvAmtTxtZeroVal" runat="server" ControlToValidate="ApprvAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
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
                                                <asp:CompareValidator ID="LcAmtTxtZeroVal" runat="server" ControlToValidate="LcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
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
                                        <telerik:GridTemplateColumn HeaderText="NextJobNo">
                                            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "srcno")  %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="SrcTxt" Text='<%# DataBinder.Eval(Container.DataItem, "srcno") %>'></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="taxfcamt" HeaderText="TaxFcAmt" Display="false">
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
                                                <asp:CompareValidator ID="TaxFcAmtTxtZeroVal" runat="server" ControlToValidate="TaxFcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
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
                                                <asp:CompareValidator ID="TaxLcAmtTxtZeroVal" runat="server" ControlToValidate="TaxLcAmtTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Remarks">
                                            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "rem1")  %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="RemTxt" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
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
            <telerik:RadPageView runat="server" Height="450px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="450px" ID="TaskRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="480px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <%--Message popup area end--%>
    </form>
</body>
</html>
