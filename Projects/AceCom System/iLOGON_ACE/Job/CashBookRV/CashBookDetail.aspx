<%@ Page Language="c#" CodeBehind="CashBookDetail.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.CashBookRV.CashBookDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CashBookRV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="AddBtn">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="DescrLbl" runat="server"></asp:Label>
                    </div>
                    <br />
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="NewLine" OnClick="AddBtn_Click"></asp:Button>
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                <asp:Label ID="QtyLbl" runat="server" Visible="false" />
                    <asp:Label ID="RateLbl" runat="server" Visible="false" />
                    <asp:Label ID="FcAmtLbl" runat="server" Visible="false" />
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <%-- <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="ResultDG_Cancel"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>--%>
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="false"
                AllowFilteringByColumn="true" ShowStatusBar="true" ShowFooter="true" Skin="Metro"
                OnItemDataBound="ResultDG_ItemDataBound" OnEditCommand="ResultDG_Edit">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                    <Columns>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif" DescriptionUrl='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                    Width="15" Height="15" AlternateText="Edit" OnClick="ResultDG_Edit" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="ResultDG_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                        runat="server"></a>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>--%>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormHeaderTextFormat="Charge">
                            <HeaderTemplate>
                                Charge<br />
                                Description
                            </HeaderTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ChargeList" Enabled="True" DataTextField="Descr" DataValueField="id"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(chargeListDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                    runat="server" DataSource='<%# chargeListDS%>' OnSelectedIndexChanged="ChargeList_SelectedIndexChanged"
                                    Width="300px" AutoPostBack="True" />
                                <asp:TextBox ID="DescrTxt" runat="server" Width="300" Value='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>' />
                                <asp:HiddenField ID="ChargeCodeTxt" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "chargedescr2") %><br />
                                <%# DataBinder.Eval(Container.DataItem, "chargedescr") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="CtnrNo<br/>JobNo" ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:TextBox ID="ContainerTxt" runat="server" OnTextChanged="ContainerTxt_TextChanged"
                                    AutoPostBack="true" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>' /><br />
                                <asp:TextBox ID="JobTxt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "srcno") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "ctnrno")%><br />
                                <%# DataBinder.Eval(Container.DataItem, "srcno")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="EqpNo<br/>Personnel" ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:DropDownList ID="EqList" Enabled="True" DataTextField="Descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EqListDS,DataBinder.Eval(Container.DataItem, "vehno").ToString())%>'
                                    runat="server" DataSource='<%# EqListDS%>' OnSelectedIndexChanged="EquipmentNo_SelectedIndexChanged"
                                    Width="150px" AutoPostBack="True" />
                                <br />
                                <asp:DropDownList ID="PerList" Enabled="True" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerListDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'
                                    runat="server" DataSource='<%# PerListDS%>' Width="150px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "vehno") %><br />
                                <%# DataBinder.Eval(Container.DataItem, "name") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Vendor<br/>VendorName" ItemStyle-HorizontalAlign="Right">
                            <EditItemTemplate>
                                <asp:DropDownList ID="VDList" Enabled="True" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VDListDS,DataBinder.Eval(Container.DataItem, "vdid").ToString())%>'
                                    runat="server" DataSource='<%# VDListDS%>' OnSelectedIndexChanged="VdList_SelectedIndexChanged"
                                    AutoPostBack="true" Width="150px" />
                                <asp:TextBox ID="VdNameTxt" runat="server" Width="150" Value='<%# DataBinder.Eval(Container.DataItem, "vdname") %>' />
                                <asp:HiddenField ID="VdCodeTxt" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "vdcode") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "vdname")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Invoice<br/>InvoiceDate" ItemStyle-HorizontalAlign="Right">
                            <EditItemTemplate>
                                <div style="position: relative">
                                    <asp:TextBox ID="Exref1Txt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "exref1") %>' /><br />
                                    <asp:TextBox runat="server" Width="100px" ID="ExDate1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:CalendarExtender ID="ExDate1Txt_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="ExDate1Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                        Format="dd/MMM/yyyy"></asp:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="ExDate1Req" runat="server" ErrorMessage="*" ControlToValidate="ExDate1Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "exref1")%><br />
                                <%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Qty<br/>Rate($)" ItemStyle-HorizontalAlign="Right">
                            <EditItemTemplate>
                                <asp:TextBox ID="Qty1Txt" runat="server" Width="80" OnTextChanged="QtyRate_TextChanged"
                                    AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "qty") %>' /><asp:RequiredFieldValidator
                                        ID="Qty1TxtReqVal" runat="server" ControlToValidate="Qty1Txt" ErrorMessage="*" /><asp:CompareValidator
                                            ID="Qty1TxtCompVal" runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True"
                                            ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="Qty1TxtZeroVal"
                                                runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True" ErrorMessage="#"
                                                Operator="GreaterThanEqual" ValueToCompare="0" />
                                <asp:TextBox ID="RateTxt" runat="server" Width="80" OnTextChanged="QtyRate_TextChanged"
                                    AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' /><asp:RequiredFieldValidator
                                        ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt" ErrorMessage="*" /><asp:CompareValidator
                                            ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt" EnableClientScript="True"
                                            ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="RateTxtZeroVal"
                                                runat="server" ControlToValidate="RateTxt" EnableClientScript="True" ErrorMessage="#"
                                                Operator="GreaterThanEqual" ValueToCompare="0" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}") %><br />
                                <asp:Label ID="QtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}") %>'
                                    Visible="false" />
                                <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>
                                <asp:Label ID="RateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'
                                    Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="FcAmt<br/>LcAmt" ItemStyle-HorizontalAlign="Right">
                            <EditItemTemplate>
                                <asp:TextBox ID="FcAmtTxt" runat="server" Width="80" OnTextChanged="FCAmt_TextChanged"
                                    AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "fcamt") %>' /><asp:RequiredFieldValidator
                                        ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                            ID="FcAmtTxtCompVal" runat="server" ControlToValidate="FcAmtTxt" EnableClientScript="True"
                                            ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="FcAmtTxtZeroVal"
                                                runat="server" ControlToValidate="FcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                                Operator="GreaterThanEqual" ValueToCompare="0" />
                                <asp:TextBox ID="LcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "lcamt") %>' /><asp:RequiredFieldValidator
                                    ID="LcAmtTxtReqVal" runat="server" ControlToValidate="LcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="LcAmtTxtCompVal" runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="LcAmtTxtZeroVal"
                                            runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "fcamt", "{0:#,0.00}") %><br />
                                <asp:Label ID="FcAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcamt", "{0:#,0.00}") %>'
                                    Visible="false" />
                                <%# DataBinder.Eval(Container.DataItem, "lcamt", "{0:#,0.00}") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Tax Type" ItemStyle-Wrap='false'>
                            <EditItemTemplate>
                                <%--OnSelectedIndexChanged="TaxType_SelectedIndexChanged" AutoPostBack="true"--%>
                                <asp:DropDownList ID="TaxTypeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                    OnSelectedIndexChanged="QtyRate_TextChanged" AutoPostBack="true" runat="server"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                    DataSource='<%# taxTypeListDS%>' />
                                <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                    ErrorMessage="*" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="TaxFcAmt<br/>TaxLcAmt" ItemStyle-HorizontalAlign="Right">
                            <EditItemTemplate>
                                <asp:TextBox ID="TaxFcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "taxfcamt") %>' /><asp:RequiredFieldValidator
                                    ID="TaxFcAmtTxtReqVal" runat="server" ControlToValidate="TaxFcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="TaxFcAmtTxtCompVal" runat="server" ControlToValidate="TaxFcAmtTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="TaxFcAmtTxtZeroVal"
                                            runat="server" ControlToValidate="TaxFcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
                                <asp:TextBox ID="TaxLcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "taxlcamt") %>' /><asp:RequiredFieldValidator
                                    ID="TaxLcAmtTxtReqVal" runat="server" ControlToValidate="TaxLcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="TaxLcAmtTxtCompVal" runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="TaxLcAmtTxtZeroVal"
                                            runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "taxfcamt", "{0:#,0.00}") %><br />
                                <%# DataBinder.Eval(Container.DataItem, "taxlcamt", "{0:#,0.00}") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Remark1" ItemStyle-Width="200px">
                            <EditItemTemplate>
                                <asp:TextBox ID="Rem1Txt" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'
                                    TextMode="MultiLine" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "rem1") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Remark2" ItemStyle-Width="200px">
                            <EditItemTemplate>
                                <asp:TextBox ID="Rem2Txt" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "rem2") %>'
                                    TextMode="MultiLine" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "rem2") %>
                                <asp:Label ID="Rem2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rem2") %>'
                                    Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True"
                            HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True"
                            HeaderText="Add User">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True"
                            HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True"
                            HeaderText="Edit User">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
