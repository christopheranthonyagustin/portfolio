<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveRegisterCost.aspx.cs" Inherits="iWMS.Web.MoveManagement.MoveRegister.MoveRegisterCost" %>

<!DOCTYPE html>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>MoveRegisterCost</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            
        
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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click" CausesValidation="false"
                                Visible="true" Text="Save" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="DelImgBtn" CssClass="white" runat="server" CausesValidation="false"
                                OnClick="DeleteBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp; &nbsp;
                        </td>

                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;                 
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="JBMaterialPanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="jbcostid" HeaderStyle-HorizontalAlign="Center"
                                        Display="false">
                                        <ItemTemplate>
                                            <asp:Label ID="JBCostIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                                        UniqueName="ChargeDescription" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label ID="chargeLbl" runat="server" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="QtyTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnQtyTextChanged" AutoPostBack="true"
                                                Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:0.0000}") %>'></asp:TextBox>
                                            <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="QtyTxt"
                                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                            <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="UnitRateTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnRateTextChanged" AutoPostBack="true"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:0.0000}") %>'></asp:TextBox>
                                            <asp:CompareValidator ID="UnitRateVal" runat="server" ControlToValidate="UnitRateTxt"
                                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                            <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="EstCost" HeaderStyle-HorizontalAlign="Center"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label ID="EstCostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "costamt", "{0:#,0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="ActCost" HeaderStyle-HorizontalAlign="Center"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label ID="FcAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt", "{0:#,0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="false" Display="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                        <ItemTemplate>
                                            <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="VendorName" HeaderStyle-HorizontalAlign="Center"
                                        UniqueName="VendorCode" AllowFiltering="true">
                                        <ItemTemplate>
                                            <telerik:RadComboBox ID="VendorCodeCombo" runat="server" DataSource='<%#VendorCodeDS%>' DataTextField="name" RenderMode="Lightweight" Skin="WebBlue"
                                                DataValueField="id" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VendorCodeDS,DataBinder.Eval(Container.DataItem, "vendorcode").ToString())%>'
                                                CausesValidation="false" Width="150px" DropDownWidth="150px" Filter="Contains"/>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="InvNumber" HeaderText="InvNumber" ItemStyle-Width="100px" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="InvNumberDDL" runat="server" DataTextField="invno" ExpandDirection="Up"
                                                DataValueField="id" DataSource='<%# InvNumberDS%>' RenderMode="Lightweight" Skin="WebBlue" Width="150px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(InvNumberDS,DataBinder.Eval(Container.DataItem, "drid").ToString())%>'
                                                DropDownWidth="150px">
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CostDate" HeaderText="CostDate <br/> TransNo" ItemStyle-Wrap="true" ItemStyle-Width="170px" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="CostDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                            </telerik:RadDatePicker>                                
                                            <br /><br />
                                            <telerik:RadTextBox runat="server" ID="TransNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "costsheetno") %>' Width="135px"
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" HeaderText="acid">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="False" DataField="jbid" SortExpression="jbid" HeaderText="jbid">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
                <%-- <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                    OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                <br />
                <br />--%>
                <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None" OnItemCommand="ResultDG1_ItemCommand"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnEditCommand="ResultDG1_EditCommand"
                    AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG1_NeedDataSource" OnUpdateCommand="ResultDG1_UpdateCommand">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id" EditMode="InPlace"
                        CommandItemDisplay="Top">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="30px">
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG1_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG1_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="sno" runat="server" Text='<%#Container.ItemIndex+1%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                                UniqueName="ChargeDescription" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadComboBox ID="chargetxt" runat="server" DataSource='<%#ChargedescrDS%>' DataTextField="descr" ExpandDirection="Up"
                                        DataValueField="code" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargedescrDS,DataBinder.Eval(Container.DataItem, "descr").ToString())%>'
                                        OnSelectedIndexChanged="chargetxt_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false" Width="150px" DropDownWidth="150px" Filter="Contains" RenderMode="Lightweight" Skin="WebBlue" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Charge Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="True"
                                UniqueName="descr" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:TextBox ID="chargedescrtxt" runat="server" Width="100%" TextMode="MultiLine"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>'></asp:TextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="UnitRate" HeaderStyle-HorizontalAlign="Center"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:TextBox ID="UnitRateTxt" runat="server" Width="60" AutoPostBack="true"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "standardunitcost", "{0:0.0000}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="UnitRateVal" runat="server" ControlToValidate="UnitRateTxt"
                                        EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Quantity" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" UniqueName="DefaultQty">
                                <ItemTemplate>
                                    <asp:TextBox ID="QuantityTxt" runat="server" Width="60" AutoPostBack="true"></asp:TextBox>
                                    <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="QuantityTxt"
                                        EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# taxTypeDS%>' DataTextField="Descr"
                                        DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeDS,DataBinder.Eval(Container.DataItem, "taxtypedescr").ToString())%>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="VendorName" HeaderStyle-HorizontalAlign="Center"
                                UniqueName="VendorCode" AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadComboBox ID="VendorCodeCombo" runat="server" DataSource='<%#PartnerDS%>' DataTextField="name" RenderMode="Lightweight" Skin="WebBlue"
                                        DataValueField="id" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PartnerDS,DataBinder.Eval(Container.DataItem, "vendorcode").ToString())%>'
                                        CausesValidation="false" Width="150px" DropDownWidth="150px" Filter="Contains" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="InvNumber" HeaderText="InvNumber" ItemStyle-Width="100px" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <telerik:RadDropDownList ID="InvNumberDDL" runat="server" DataTextField="invno" ExpandDirection="Up"
                                        DataValueField="id" DataSource='<%# InvNumberDS%>' Width="150px" RenderMode="Lightweight" Skin="WebBlue"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(InvNumberDS,DataBinder.Eval(Container.DataItem, "invno").ToString())%>'
                                        DropDownWidth="150px">
                                    </telerik:RadDropDownList>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="CostDate" HeaderText="CostDate <br/> TransNo" ItemStyle-Wrap="true" ItemStyle-Width="170px" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "costdate", "{0:dd/MMM/yyyy}")%>
                                            <br /> <br />
                                            <%# string.Format("{0:}",Eval("CostSheetNo")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="CostDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                            </telerik:RadDatePicker>
                                             <asp:RequiredFieldValidator ID="CostDatePickerReqVal" runat="server" ControlToValidate="CostDatePicker"
                                                    ErrorMessage="*" />                                
                                            <br /><br />
                                            <telerik:RadTextBox runat="server" ID="TransNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "costsheetno") %>'
                                                TextMode="SingleLine" Enabled="true" Width="135px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:TextBox ID="Remarkstxt" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="chid">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <br />
        <br />
    </form>
</body>
</html>

