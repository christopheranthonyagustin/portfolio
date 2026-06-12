<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaxTypeMatrixForm.aspx.cs" Inherits="iWMS.Web.Accounting.TaxType.TaxTypeMatrixForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TaxTypeMatrixForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<script type="text/javascript">
    function selectAll(id) {
        var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
        var row = masterTable.get_dataItems();
        if (id.checked == true) {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = true; // for checking the checkboxes
            }
        }
        else {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = false; // for unchecking the checkboxes
            }
        }
    }
</script>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Visible="false" Text="New"
            CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enable="false" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true" OnItemCommand="ResultDG_ItemCommand"
                            AllowFilteringByColumn="false" Skin="Metro" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit"
                            OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" CommandItemDisplay="Top" DataKeyNames="id" EditMode="InPlace">
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
                                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" ValidationGroup="reqvalgrp"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Entity" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "EntCode")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadMultiColumnComboBox ID="EntityCombo" runat="server" RenderMode="Lightweight" CausesValidation="false" Skin="Sunset" BackColor="#ded7c6"
                                                DataSource='<%# EntityDS%>' Filter="Contains" OnSelectedIndexChanged="EntityCombo_SelectedIndexChanged" AutoPostBack="true"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "EntCode") %>' DataTextField="Descr" DataValueField="Item">
                                            </telerik:RadMultiColumnComboBox>
                                            <asp:RequiredFieldValidator ID="EntityListReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="EntityCombo" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="TaxType" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Type")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TypeTxt" Skin="Sunset"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "Type") %>'>
                                            </telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="TypeTxtReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="TypeTxt" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Description" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Descr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="DescriptionTxt" Skin="Sunset"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "Descr") %>'>
                                            </telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="DescriptionTxtReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="DescriptionTxt" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="SalesTaxGLAccount" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "SalesTaxGLAccDescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadMultiColumnComboBox ID="SalesTaxGLAccountComBo" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="150px" DropDownWidth="150px" DataSource='<%# SalesTaxGLAccountDS%>'
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "SalesTaxGLAccDescr") %>'>
                                            </telerik:RadMultiColumnComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="SalesTaxRate" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "SalesTaxRate")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="SalesTaxRateTxt" Skin="WebBlue"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "SalesTaxRate") %>'>
                                            </telerik:RadTextBox>
                                            <asp:CompareValidator ID="SalesTaxRateTxtCompVal" runat="server" ControlToValidate="SalesTaxRateTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn SortExpression="SalesTaxRelevant" UniqueName="SalesTaxRelevant" HeaderText="SalesTaxRelevant">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "SalesTaxRelevant") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="SalesTaxRelevantDDL" runat="server" Skin="Office2007" DataSource='<%# SalesTaxRelevantDS %>' DataTextField="descr" DataValueField="item"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SalesTaxRelevantDS,DataBinder.Eval(Container.DataItem, "SalesTaxRelevant").ToString())%>'>
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="PurchaseTaxGLAccount" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "PurchaseTaxGLAccDescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadMultiColumnComboBox ID="PurchaseTaxGLAccountComBo" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="150px" DropDownWidth="150px" DataSource='<%# PurchaseTaxGLAccountDS%>'
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "PurchaseTaxGLAccDescr") %>'>
                                            </telerik:RadMultiColumnComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="PurchaseTaxRate" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "PurchaseTaxRate")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="PurchaseTaxRateTxt" Skin="WebBlue"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "PurchaseTaxRate") %>'>
                                            </telerik:RadTextBox>
                                            <asp:CompareValidator ID="PurchaseTaxRateTxtCompVal" runat="server" ControlToValidate="PurchaseTaxRateTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn SortExpression="PurchaseTaxRelevant" UniqueName="PurchaseTaxRelevant" HeaderText="PurchaseTaxRelevant">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "PurchaseTaxRelevant") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="PurchaseTaxRelevantDDL" runat="server" Skin="Office2007" DataSource='<%# PurchaseTaxRelevantDS %>' DataTextField="descr" DataValueField="item"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PurchaseTaxRelevantDS,DataBinder.Eval(Container.DataItem, "PurchaseTaxRelevant").ToString())%>'>
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn SortExpression="StatusDescr" UniqueName="StatusDescr" HeaderText="Status">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "StatusDescr") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="StatusDDL" runat="server" Skin="Office2007" DataSource='<%# StatusDS %>' DataTextField="Descr" DataValueField="Item"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndexWithDefault(StatusDS,DefaultDS,DataBinder.Eval(Container.DataItem, "Status").ToString(),Mode)%>'>
                                            </telerik:RadDropDownList>
                                             <asp:Label ID="TaxTypeLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "StatusDescr") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="false" AllowFiltering="false"
                                        HeaderText="ModifiedOn" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EntId" UniqueName="EntId" HeaderText="EntId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="status" UniqueName="status" HeaderText="status" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
