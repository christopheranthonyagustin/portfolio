<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="InvoiceForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.InvoiceRegisterV2.InvoiceForm" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>InvoiceForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Storage" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="System" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Adhoc" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Fixed" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="FreightIn" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="FreightOut" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Transport" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Manual" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Summary" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="600" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />&nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
            <tr style="height: 2px">
            </tr>
            <tr>
                <td>&nbsp;
                            <asp:Button ID="PrintBth" runat="server" Text="Invoice" CssClass="blue"
                                OnClick="PrintInvoice_Click" ToolTip="Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;
                            <asp:Button ID="DReBillImgBtn" runat="server" Text="eBilling" OnClick="DReBillImgBtn_Click"
                                CssClass="green" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <table>
                    <tr>
                        <td>&nbsp;   
                        <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="white"
                            OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id, true)" Visible="false"
                            ToolTip="Update" UseSubmitBehavior="false"></asp:Button>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            
                            &nbsp; 
                            <asp:Button ID="GenerateBtn" runat="server" Text="Generate" CssClass="white" UseSubmitBehavior="false"
                                OnClick="GenerateBtn_Click" OnClientClick="disableBtn(this.id,false)"></asp:Button>
                            <br />
                            <br />
                            <div style="width: min-content;">
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="false"
                                    Skin="Metro" AllowMultiRowSelection="True" OnItemDataBound="ResultDG_ItemDataBound">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" Scrolling-AllowScroll="true">
                                        <Selecting AllowRowSelect="true"></Selecting>
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                    <PagerStyle Mode="NextPrevAndNumeric" />
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" TableLayout="Fixed" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderText="Active" Reorderable="false" UniqueName="checkbox"
                                                AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="ActiveItemCB" runat="server"></asp:CheckBox>
                                                    <a id="lnkUndo" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Undo Generate Billable?')"
                                                        onserverclick="Undo_GenerateBillable" runat="server">
                                                        <img id="Undomg" src="../../image/Undo.png" width="15" height="15" border="0" alt="Undo"
                                                            runat="server" />
                                                    </a>
                                                    <asp:Label ID="UndoStsLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "status") %>'></asp:Label>
                                                    <asp:Label ID="BillLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "billingtype") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderText="" Reorderable="false" UniqueName="icon"
                                                AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="false" ID="queryImgBtn" ImageUrl="../../image/query.png"
                                                        Width="15" OnClick="query_JobNotInvoice" Height="15" AlternateText="JobNotInvoiced"
                                                        BackColor="Transparent" BorderWidth="0" CausesValidation="false"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="billingtype" UniqueName="billingtype" Display="false" />
                                            <telerik:GridBoundColumn HeaderText="BillingType" DataField="billingtypedescr" AllowFiltering="false"
                                                ColumnGroupName="billingtypedescr" SortExpression="billingtypedescr" UniqueName="billingtypedescr"
                                                Reorderable="true" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn HeaderText="From" Reorderable="false" UniqueName="frdate"
                                                AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <telerik:RadDatePicker ID="FrDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy"
                                                        Skin="Office2010Blue" Width="110px">
                                                        <Calendar runat="server">
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque"></telerik:RadCalendarDay>
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDatePicker>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderText="To" Reorderable="false" UniqueName="todate"
                                                AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <telerik:RadDatePicker ID="ToDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy"
                                                        Skin="Office2010Blue" Width="110px">
                                                        <Calendar runat="server">
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque"></telerik:RadCalendarDay>
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDatePicker>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderText="JobNo" Reorderable="false" UniqueName="srcno"
                                                AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="SrcNoTxt" runat="server" Width="100" />
                                                    <asp:CompareValidator ID="SrcNoTxtCompVal" runat="server" ControlToValidate="SrcNoTxt"
                                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="String" />
                                                    <asp:CompareValidator ID="SrcNoTxtZeroVal" runat="server" ControlToValidate="SrcNoTxt"
                                                        EnableClientScript="True" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="Source" DataField="srcDescr" AllowFiltering="false"
                                                ColumnGroupName="srcDescr" SortExpression="srcDescr" UniqueName="srcDescr"
                                                Reorderable="true" ReadOnly="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" />
                                            <telerik:GridTemplateColumn HeaderText="BillingGrp" Reorderable="false" UniqueName="billinggrpdescr"
                                                AllowFiltering="false" HeaderStyle-Width="113px" ItemStyle-Width="113px">
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="BGrpList" Enabled="True" DataTextField="Descr" DataValueField="code"
                                                        runat="server" DataSource='<%# bGrpListDS%>' Width="100px" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                                Reorderable="true" ReadOnly="true" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
                                            <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="false"
                                                ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" ReadOnly="true"
                                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                                 HeaderStyle-Width="140px" ItemStyle-Width="140px" />
                                            <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="false"
                                                ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                                                ReadOnly="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" />
                                            <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="false"
                                                ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                                                ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                                HeaderStyle-Width="140px" ItemStyle-Width="140px" />
                                            <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="false"
                                                ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                                                ReadOnly="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" />
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="HiddenField" runat="server" />
                <asp:HiddenField ID="HiddenFieldAcId" runat="server" />
                <telerik:RadWindow ID="OsJobGenerationRadWindow" runat="server" VisibleOnPageLoad="true" Title="OSJobGeneration" Width="900px" Height="500px"
                    NavigateUrl='<%# "JobsNotInvoiceGen.aspx?billingType="+ HiddenField.Value + "&AcId=" + HiddenFieldAcId.Value %>'
                    Modal="true" Left="100px" Top="20px" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="StorageRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SystemRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AdhocRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="FixedRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="FreightInRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="FreightOutRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TransportRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ManualRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SummaryRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        </telerik:RadMultiPage>
        <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
            DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
            CssClass="RedText" />
    </form>
</body>
</html>
