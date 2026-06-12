<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobCost.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobCost" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TransportCost</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
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

    </script>
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

        .ItemStyle {
            width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%" id="btntable" runat="server">
            <tr>
                <td align="left">
                    <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <telerik:RadButton ID="ConversionBtn" runat="server" Text="Conversion From CS" OnClick="ConversionBtn_Click"
                        Skin="WebBlue">
                    </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="ConvEORBtn" runat="server" Text="Conversion From EOR" OnClick="ConvEORBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="AdditionalCostsBtn" runat="server" Text="Additional Costs"
                    OnClick="AdditionalCostsBtn_Click" Skin="WebBlue">
                </telerik:RadButton>
                    &nbsp;
                    <asp:Button ID="DelImgBtn" cssclass="white" runat="server" OnClick="DeleteBtn_Click"
                        Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; &nbsp;
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <div id="div3" style="height: 100%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnPageIndexChanged="ResultDG_PageIndexChanged" OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="id" SortExpression= "id" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="drid" SortExpression="drid" HeaderText="DRID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="jbid" SortExpression="jbid" HeaderText="jbid">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="jbchargeid" HeaderStyle-HorizontalAlign="Center"
                            Display="false">
                            <ItemTemplate>
                                <asp:Label ID="chargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Chargeid") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="qudtid" HeaderStyle-HorizontalAlign="Center"
                            Display="false">
                            <ItemTemplate>
                                <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qudtid") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Vendor" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="VendorLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "vendorcode") %>'></asp:Label>
                                <asp:Label ID="VendorIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vendorid") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                            UniqueName="ChargeDescription" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="chargecodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                <asp:Label ID="chargeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="QtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false" Display="false">
                            <ItemTemplate>
                                <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="RateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="UnitRateCurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitratecurrcode") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Estimate/Actual Cost" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="EstCostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "costAmt", "{0:#,0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="ActualCost" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="txtActCost" runat="server" Width="100" ReadOnly="true" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt", "{0:#,0.00}") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="ExchRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ExchRate", "{0:#,0.0000}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="ActualCost(SGD)" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="ActCostSGDLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="SupplierInvoiceNo" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="txtSupInvno" runat="server" Width="150" Text='<%# DataBinder.Eval(Container.DataItem, "costsheetno") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%-- UniqueName="billaccode" DataField="billacid"--%>
                        <telerik:GridTemplateColumn HeaderText="InvoiceNo"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <telerik:RadComboBox ID="InvNoList" runat="server" AutoPostBack="false" Skin="WebBlue"
                                    Width="180px" DropDownWidth="180px" CausesValidation="false" Filter="Contains" OnSelectedIndexChanged="InvNoList_SelectedIndexChanged"
                                    RenderMode="Lightweight">
                                </telerik:RadComboBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="qudtid" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="AddUser" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="adduserLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "adduser") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AddDate" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="adddateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "adddate","{0:dd/MMM/yyyy HH:mm:ss}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" HeaderStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" HeaderStyle-HorizontalAlign="Center"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" UniqueName="Eordtid" Display="false"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="EordtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "eordtid") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
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
        <%--Message popup area end--%>
    </form>
</body>
</html>
