<%@ Page Language="c#" CodeBehind="CrDrDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CrDrNote.CrDrDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CrDrDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

    <%--// Add by HW at 5/Oct/2016--%>
    <style type="text/css">
        .break-word {
            width: 500px !important;
            white-space: normal;
        }
    </style>
    <style type="text/css">
        .break-word1 {
            width: 250px !important;
            white-space: normal;
        }
    </style>
    <%--//end--%>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1"></telerik:RadScriptManager>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="DescrLbl" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    &nbsp;<br />
                    <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                        Text="NewLine" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br>
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="ResultDG_Cancel"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                    Skin="Metro" AllowFilteringByColumn="false" GridLines="None">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" EditMode="InPlace" Width="100%">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="ResultDG_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                            runat="server"></a>
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
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="No" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:Label ID="lblInvoiceNo" runat="server" Text="InvoiceNo"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobNo" runat="server" Text="JobNo"></asp:Label>
                                </HeaderTemplate>
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "invno")%>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "srcno")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="InvoiceNoCombo" runat="server" AutoPostBack="true" CausesValidation="false" Skin="WebBlue" AllowCustomText="false"
                                        RenderMode="Lightweight" MarkFirstMatch="true" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol"
                                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" DataTextField="Descr" DataValueField="Item"
                                        OnItemsRequested="InvoiceNoCombo_ItemsRequested" OnLoad="InvoiceNoCombo_Load" OnSelectedIndexChanged="InvoiceNoCombo_SelectedIndexChanged"
                                        EmptyMessage="Enter an invoice">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox ID="JobNoTxt" runat="server" Enabled="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Charge">
                                <HeaderStyle Wrap="True" HorizontalAlign="Center" Width="800px" />
                                <ItemStyle Wrap="True" HorizontalAlign="Left" CssClass="break-word"></ItemStyle>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="ChargeList" runat="server" defaultmessage="Select a Charge"
                                        dropdownheight="150px" Skin="WebBlue" DataSource='<%#chargeListDS%>'
                                        DataTextField="descr" DataValueField="id" OnSelectedIndexChanged="Chargeddl_Changed" RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" Width="200">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox ID="ChargeDescrTxt" runat="server" Width="300" Height="100" TextMode="MultiLine" value='<%# DataBinder.Eval(Container.DataItem, "cdchargedescr") %>' />
                                    <asp:Label ID="ChargeLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "chargeid") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="chargecodeLbl" runat="server" Visible="true" CssClass="break-word" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                    <asp:Label ID="ChargeLblDesc" runat="server" Visible="true" CssClass="break-word" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "cdchargedescr") %>' />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Qty1Txt" runat="server" Width="90" AutoPostBack="true" OnTextChanged="Qty1Txt_TextChanged" />
                                    <asp:RequiredFieldValidator ID="Qty1TxtReqVal" runat="server" ControlToValidate="Qty1Txt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="Qty1TxtCompVal" runat="server" ControlToValidate="Qty1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:Label ID="Qty1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "billingqty") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billingqty", "{0:#,0.0000}") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Rate" ItemStyle-HorizontalAlign="Right">
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Rate1Txt" runat="server" Width="90" AutoPostBack="true" Skin="WebBlue" OnTextChanged="Qty1Txt_TextChanged" />
                                    <asp:RequiredFieldValidator
                                        ID="Rate1TxttReqVal" runat="server" ControlToValidate="Rate1Txt" ErrorMessage="*" />
                                    <asp:CompareValidator
                                        ID="Rate1TxtCompVal" runat="server" ControlToValidate="Rate1Txt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="Rate1TxtZeroVal"
                                        runat="server" ControlToValidate="Rate1Txt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />
                                    <asp:Label ID="Rate1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="UOM">
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="UomList" Enabled="True" DataTextField="Descr" DataValueField="item" Skin="WebBlue"
                                        runat="server" DataSource='<%# uomListDS%>' />
                                    <asp:Label ID="UomLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "billinguom") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billinguom")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Total" ItemStyle-HorizontalAlign="Right">
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="InvAmtTxt" runat="server" Width="80" Enabled="false" Skin="WebBlue" />
                                    <asp:RequiredFieldValidator
                                        ID="InvAmtTxtReqVal" runat="server" ControlToValidate="InvAmtTxt" ErrorMessage="*" />
                                    <asp:CompareValidator
                                        ID="InvAmtTxtCompVal" runat="server" ControlToValidate="InvAmtTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:Label ID="InvAmtLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "billingamt") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billingamt", "{0:#,0.00}")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="EquipmentNumber">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="eqpnolist" runat="server"
                                        dropdownheight="150px" Skin="WebBlue" DataSource='<%# EqpnoListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EqpnoListDS,DataBinder.Eval(Container.DataItem, "CDDeqpno").ToString())%>'
                                        DataTextField="descr" DataValueField="vehno" OnDataBound="EqpnoComboBox_DataBound" OnSelectedIndexChanged="eqpnocmb_Changed" RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" Width="200">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CDDeqpno")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ArGlCode">
                                <HeaderStyle Wrap="True" HorizontalAlign="Center" Width="500px" />
                                <ItemStyle Wrap="True" HorizontalAlign="Left" CssClass="break-word"></ItemStyle>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="ARGLCodeList" runat="server"
                                        dropdownheight="150px" Skin="WebBlue" DataSource='<%# ArGlCodeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ArGlCodeListDS,DataBinder.Eval(Container.DataItem, "arglcode").ToString())%>'
                                        DataTextField="Descr" DataValueField="Item" OnDataBound="ArGlCodeComboBox_DataBound" OnSelectedIndexChanged="arglcodecmb_Changed" RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" Width="200">
                                    </telerik:RadComboBox>
                                     <asp:RequiredFieldValidator ID="ARGLCodeReqVal" runat="server" ControlToValidate="ARGLCodeList"
                                        ErrorMessage="*" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ARGLCodeList" runat="server" Visible="true" CssClass="break-word1" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "argldescr") %>' />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Tax Type">
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="TaxTypeList" Enabled="True" DataTextField="Descr" DataValueField="Item" Skin="WebBlue"
                                        runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                        DataSource='<%# taxTypeListDS%>' />
                                    <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                        ErrorMessage="*" />
                                    <asp:Label ID="TaxTypeLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Remarks">
                                <HeaderStyle Wrap="True" HorizontalAlign="Center" Width="500px" />
                                <ItemStyle Wrap="True" HorizontalAlign="Left" CssClass="break-word"></ItemStyle>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Rem1Txt" runat="server" Width='600' Height='70' TextMode="MultiLine" Skin="WebBlue"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Rem1Txt" runat="server" Visible="true" CssClass="break-word1" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True"
                                HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True"
                                HeaderText="AddUser">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True"
                                HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True"
                                HeaderText="EditUser">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
