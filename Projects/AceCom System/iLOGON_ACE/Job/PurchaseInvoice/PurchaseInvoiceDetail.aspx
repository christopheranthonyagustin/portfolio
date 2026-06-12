<%@ Page Language="c#" CodeBehind="PurchaseInvoiceDetail.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.PurchaseInvoice.PurchaseInvoiceDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>

<head id="Head1" runat="server">
    <title>PurchaseInvoiceDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
   <LINK href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
   <script type="text/javascript" src="../../js/row.js"></script>
    
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
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
 
     <asp:ScriptManager ID="ScriptManager1" runat="server" />
   <div id="div2" style="height: 92%">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                    <asp:Label ID="QtyLbl" runat="server" Visible="false" />
                    <asp:Label ID="RateLbl" runat="server" Visible="false" />
                    <asp:Label ID="FcAmtLbl" runat="server" Visible="false" /></div>
            </td>
        </tr>
        <tr>
            <td>
              <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png"
                Width="30" Height="30" Visible="false" OnClick="DeleteAllBtn_Click" BackColor="Transparent"
                BorderWidth="0" ImageAlign="AbsMiddle" ToolTip="Delete Selected Container(s)" />
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid" style="height: 395px;">
       <div id="div3" style="height: 80%">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
         <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="false" 
            AllowFilteringByColumn="true" ShowStatusBar="true" Skin="Metro"
            OnEditCommand="ResultDG_Edit"
            OnDetailTableDataBind="ResultDG_DetailTableDataBind">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid"
            HierarchyLoadMode="Client">
                <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn EditFormHeaderTextFormat="number">
                        <HeaderTemplate>
                            ReferenceNo
                        </HeaderTemplate>
                        <EditItemTemplate>    
                        <%# DataBinder.Eval(Container.DataItem, "number") %>                     
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "number") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat=" Invoice">
                        <HeaderTemplate>
                            Invoice
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <div style="position: relative">
                                <asp:TextBox ID="Exref1Txt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "exref1") %>' /><br />
                                <%--<asp:TextBox runat="server" Width="100px" ID="ExDate1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}") %>'>
                            </asp:TextBox>
                            <asp:CalendarExtender ID="ExDate1Txt_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="ExDate1Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                Format="dd/MMM/yyyy">
                            </asp:CalendarExtender>--%>
                                <%--<asp:RequiredFieldValidator ID="ExDate1Req" runat="server" ErrorMessage="*" ControlToValidate="ExDate1Txt"
                                Enabled="false"></asp:RequiredFieldValidator>--%>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "exref1")%><br />
                            <%-- <%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}")%>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="InvoiceDate">
                        <HeaderTemplate>
                            InvoiceDate
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <div style="position: relative">
                                <asp:TextBox runat="server" Width="100px" ID="ExDate1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}") %>'>
                                </asp:TextBox>
                                <asp:CalendarExtender ID="ExDate1Txt_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="ExDate1Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                    Format="dd/MMM/yyyy">
                                </asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="ExDate1Req" runat="server" ErrorMessage="*" ControlToValidate="ExDate1Txt"
                                    Enabled="false"></asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridBoundColumn DataField="fcinvamt" SortExpression="fcinvamt" HeaderText="FCInvAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fcamt" SortExpression="fcamt" HeaderText="FCAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fctaxamt" SortExpression="fctaxamt" HeaderText="FCTaxAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="ExRate"
                        DataFormatString="{0:N6}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat=" Remark1">
                        <HeaderTemplate>
                            Remark1
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Rem1Txt" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'
                                TextMode="MultiLine" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "rem1") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat=" Remark2">
                        <HeaderTemplate>
                            Remark2
                        </HeaderTemplate>
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
                    <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
                <DetailTables>
                     <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" Width="100%" SkinID="Telerik"
                    AllowFilteringByColumn="false">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />
                    <Columns>
                        
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="Charge">
                        <HeaderTemplate>
                            Charge<br />
                            Description
                        </HeaderTemplate>
                        <EditItemTemplate>                         
                            <telerik:RadComboBox ID="ChargeList" Enabled="True" DataTextField="Descr" DataValueField="item"
                              
                                runat="server" 
                                Width="300px" AutoPostBack="True" />
                            <%--
                        <asp:TextBox ID="DescrTxt" runat="server" Width="300" Value='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>' />--%>
                            <asp:HiddenField ID="ChargeCodeTxt" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "chargedescr2") %><br />
                            <%--  <%# DataBinder.Eval(Container.DataItem, "chargedescr") %>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="Description">
                        <HeaderTemplate>
                            Description
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="DescrTxt" runat="server" Width="300" Value='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "chargedescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="CtnrNo">
                        <HeaderTemplate>
                            CtnrNo
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ContainerTxt" runat="server" 
                                AutoPostBack="true" Width="100"  /><br />
                            <%--    <asp:TextBox ID="JobTxt" runat="server" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "srcno") %>' />--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ctnrno")%><br />
                            <%--<%# DataBinder.Eval(Container.DataItem, "srcno")%>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="JobNo">
                        <HeaderTemplate>
                            JobNo
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="JobTxt" runat="server" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "srcno") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "srcno")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="EqpNo">
                        <HeaderTemplate>
                            EqpNo
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="EqList" Enabled="True" DataTextField="Descr" DataValueField="item"
                                
                                runat="server"  
                                Width="150px" AutoPostBack="True" />
                            <br />
                            <%--<asp:DropDownList ID="PerList" Enabled="True" DataTextField="descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerListDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'
                            runat="server" DataSource='<%# PerListDS%>' Width="150px" />--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "vehno") %><br />
                            <%--<%# DataBinder.Eval(Container.DataItem, "name") %>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="Personnel">
                        <HeaderTemplate>
                            Personnel
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="PerList" Enabled="True" DataTextField="descr" DataValueField="item"
                                runat="server" Width="150px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "name") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat=" Qty">
                        <HeaderTemplate>
                            Qty
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Qty1Txt" runat="server" Width="80" 
                                AutoPostBack="true" /><asp:RequiredFieldValidator
                                    ID="Qty1TxtReqVal" runat="server" ControlToValidate="Qty1Txt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="Qty1TxtCompVal" runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="Qty1TxtZeroVal"
                                            runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
                            <%--<asp:TextBox ID="RateTxt" runat="server" Width="80" OnTextChanged="QtyRate_TextChanged"
                            AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' /><asp:RequiredFieldValidator
                                ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt" ErrorMessage="*" /><asp:CompareValidator
                                    ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="RateTxtZeroVal"
                                        runat="server" ControlToValidate="RateTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}") %><br />
                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}") %>'
                                Visible="false" />
                            <%--  <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>
                        <asp:Label ID="RateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'
                            Visible="false" />--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="Rate($)">
                        <HeaderTemplate>
                            Rate($)
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="RateTxt" runat="server" Width="80" 
                                AutoPostBack="true"/><asp:RequiredFieldValidator
                                    ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="RateTxtZeroVal"
                                            runat="server" ControlToValidate="RateTxt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>
                            <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'
                                Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="FcAmt">
                        <HeaderTemplate>
                            FcAmt
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="FcAmtTxt" runat="server" Width="80" 
                                AutoPostBack="true"  /><asp:RequiredFieldValidator
                                    ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="FcAmtTxtCompVal" runat="server" ControlToValidate="FcAmtTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="FcAmtTxtZeroVal"
                                            runat="server" ControlToValidate="FcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
                            <%--  <asp:TextBox ID="LcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "lcamt") %>' /><asp:RequiredFieldValidator
                            ID="LcAmtTxtReqVal" runat="server" ControlToValidate="LcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="LcAmtTxtCompVal" runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="LcAmtTxtZeroVal"
                                    runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                    Operator="GreaterThanEqual" ValueToCompare="0" />--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "fcamt", "{0:#,0.00}") %><br />
                            <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcamt", "{0:#,0.00}") %>'
                                Visible="false" />
                            <%--<%# DataBinder.Eval(Container.DataItem, "lcamt", "{0:#,0.00}") %>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="LcAmt">
                        <HeaderTemplate>
                            LcAmt
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="LcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "lcamt") %>' /><asp:RequiredFieldValidator
                                ID="LcAmtTxtReqVal" runat="server" ControlToValidate="LcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                    ID="LcAmtTxtCompVal" runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="LcAmtTxtZeroVal"
                                        runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "lcamt", "{0:#,0.00}") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="Tax Type">
                        <HeaderTemplate>
                            Tax Type
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <%--OnSelectedIndexChanged="TaxType_SelectedIndexChanged" AutoPostBack="true"--%>
                            <asp:DropDownList ID="TaxTypeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                 AutoPostBack="true" runat="server"
                                />
                            <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="TaxFcAmt">
                        <HeaderTemplate>
                            TaxFcAmt
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TaxFcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "taxfcamt") %>' /><asp:RequiredFieldValidator
                                ID="TaxFcAmtTxtReqVal" runat="server" ControlToValidate="TaxFcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                    ID="TaxFcAmtTxtCompVal" runat="server" ControlToValidate="TaxFcAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="TaxFcAmtTxtZeroVal"
                                        runat="server" ControlToValidate="TaxFcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />
                            <%--<asp:TextBox ID="TaxLcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "taxlcamt") %>' /><asp:RequiredFieldValidator
                            ID="TaxLcAmtTxtReqVal" runat="server" ControlToValidate="TaxLcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="TaxLcAmtTxtCompVal" runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="TaxLcAmtTxtZeroVal"
                                    runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                    Operator="GreaterThanEqual" ValueToCompare="0" />--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taxfcamt", "{0:#,0.00}") %><br />
                            <%--<%# DataBinder.Eval(Container.DataItem, "taxlcamt", "{0:#,0.00}") %>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="TaxLcAmt">
                        <HeaderTemplate>
                            TaxLcAmt
                        </HeaderTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TaxLcAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "taxlcamt") %>' /><asp:RequiredFieldValidator
                                ID="TaxLcAmtTxtReqVal" runat="server" ControlToValidate="TaxLcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                    ID="TaxLcAmtTxtCompVal" runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="TaxLcAmtTxtZeroVal"
                                        runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taxlcamt", "{0:#,0.00}") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    </Columns>
                    </telerik:GridTableView>
                </DetailTables>
            </MasterTableView>
        </telerik:RadGrid>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
     </div>
         </div>
    </form>
</body>
</html>
