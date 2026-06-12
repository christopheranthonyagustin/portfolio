<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMTransshipmentRegisterForm.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMTransshipmentRegister.FMTransshipmentRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMTransshipmentRegisterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev"
                                        CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                        OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next"
                                        CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="UpdateBtn" />
                        <asp:PostBackTrigger ControlID="PrevItemBtn" />
                        <asp:PostBackTrigger ControlID="NextItemBtn" />
                    </Triggers>
                </asp:UpdatePanel>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                      CausesValidation="false" SelectedIndex="0" Skin="Office2007">
                    <Tabs>
                        <telerik:RadTab Id="NewTab" Text="New" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="SalesInvoiceTab" Text="SalesInvoice" Value="100" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>

                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="NewRadPageView">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Button ID="GenerateBtn" CssClass="LongLabelWhite" runat="server" OnClick="GenerateInvBtn_Click" Visible="True" Text="Generate Invoice"
                                        CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                        <telerik:RadGrid ID="ResultDG" runat="server"  ExportSettings-UseItemStyles="true" EnableLinqExpressions="false" RenderMode="Auto" AutoGenerateColumns="false"
                            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"  GridLines="None" AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false"
                            OnItemDataBound="ResultDG_ItemDataBound" OnEditCommand="ResultDG_EditCommand" OnUpdateCommand="ResultDG_UpdateCommand" OnItemCommand="ResultDG_ItemCommand">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True"/>
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="FMTransshipmentXFMJobId" Name="ParentGrid" EditMode="InPlace" CommandItemDisplay="Top">
                                <CommandItemSettings ShowRefreshButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="cbicon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Edit"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"  CommandName="Edit" CausesValidation="false"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="InkDelete_ServerClick" runat="server">
                                                <img id="Img1" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                    title="Delete" runat="server" visible="true" /></a>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            &nbsp; &nbsp; 
                                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <telerik:RadNumericTextBox ID="Id" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="SeqNo" HeaderText="SeqNo">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# Eval("SeqNo") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox ID="SeqNo" runat="server" Text='<%# Eval("SeqNo") %>' Skin="Office2007" Width="120px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                 <telerik:GridTemplateColumn SortExpression="status" UniqueName="Number" HeaderText="Number">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Number") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="NumberDDL" runat="server" Skin="Office2007" DataSource='<%# NumberDS %>' DataTextField="Descr" DataValueField="Item" AutoPostBack="true"
                                       OnSelectedIndexChanged="NumberDDL_SelectedIndexChanged" Text='<%# DataBinder.Eval(Container.DataItem, "Number") %>'>
                                    </telerik:RadDropDownList>
                                      <asp:RequiredFieldValidator ID="NumReq" runat="server" ControlToValidate="NumberDDL" ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn UniqueName="TransportMode" HeaderText="TransportMode">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# Eval("TransportMode") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox ID="TransportMode" runat="server" Text='<%# Eval("TransportMode") %>' Skin="Office2007" Width="120px" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="POL" HeaderText="POL">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# Eval("POL") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox ID="POL" runat="server" Text='<%# Eval("POL") %>' Skin="Office2007" Width="120px" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="POD" HeaderText="POD">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# Eval("POD") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox ID="POD" runat="server" Text='<%# Eval("POD") %>' Skin="Office2007" Width="120px" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ETA" HeaderText="ETA">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# Eval("ETA") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker ID="ETA" runat="server" Text='<%# Eval("ETA") %>' Skin="Office2007" Width="120px" ReadOnly="true"></telerik:RadDatePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ETD" HeaderText="ETD">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# Eval("ETD") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker ID="ETD" runat="server" Text='<%# Eval("ETD") %>' Skin="Office2007" Width="120px" ReadOnly="true"></telerik:RadDatePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate" UniqueName="adddate"
                                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser" UniqueName="adduser"
                                        ItemStyle-Wrap="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate" UniqueName="editdate"
                                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser" UniqueName="edituser"
                                        ItemStyle-Wrap="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Id" UniqueName="Id" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FMTransshipmentID" UniqueName="FMTransshipmentID" Display="false"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="SalesInvoiceRadPageView">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                <asp:Button ID="AmendInvBtn" runat="server" CssClass="LongLabelWhite" Text="Amend Invoice" CausesValidation="false"
                                    OnClick="AmendInvBtn_Click" OnClientClick="return confirm('Confirm to Amend Invoice?');" />
                                    &nbsp;
                                <asp:Button ID="CancelInvBtn" class="LongLabelWhite" runat="server" OnClick="CancelInvBtn_Click"
                                    Text="Cancel &nbsp; Invoice" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;                  
                                <asp:Button ID="ReOpenInvBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp; ReOpen &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="ReOpenInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;
                                <asp:Button ID="PostInvBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp; Post &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="PostInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Enabled="false" />
                                    &nbsp;
                                <asp:Button ID="PrintInvBtn" runat="server" CssClass="LongLabelBlue" Text="&nbsp; Print &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="PrintInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <telerik:RadGrid ID="ResultDG2" runat="server" EnableLinqExpressions="false"
                             AutoGenerateColumns="false" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" GridLines="None" 
                            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
                                <CommandItemSettings ShowRefreshButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="cbicon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="InvNo" HeaderText="InvNo <br/> Date <br/> Status">
                                        <ItemTemplate>
                                            <%# string.Format("<b>{0:}</b>",Eval("invno")) %>
                                            <br />
                                             <%# string.Format("{0:dd/MMM/yyyy}",Eval("invdate")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Salesman <br/> DeliveryMethod" UniqueName="Salesman">
                                        <ItemTemplate>
                                             <%# string.Format("{0:}",Eval("smancode")) %>
                                            <br />
                                             <%# string.Format("{0:}",Eval("InvoiceDeliveryMethod")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BillTo <br/> Address" UniqueName="BillTo">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("billname")) %>
                                            <br />
                                             <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr1")) %>
                                            <br />
                                             <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr2")) %>
                                            <br />
                                             <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr3")) %>
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr4")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PaymentInfo" HeaderText="PaymentInfo <br/> Payterm">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("InvoicePaymentInfo")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("payterms")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Currency" HeaderText="TotalAmount <br/> Currency">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TotInvamt")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("currcode")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="ModeifiedOn <br/> ModeifiedBy">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("edituser")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="status" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ARHId" UniqueName="ARHId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DRId" UniqueName="DRId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="fmjobid" UniqueName="fmjobid" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="InvNo" UniqueName="InvNo" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="billacid" UniqueName="billacid" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="billname" UniqueName="billname" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotInvamt" UniqueName="TotInvamt" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

