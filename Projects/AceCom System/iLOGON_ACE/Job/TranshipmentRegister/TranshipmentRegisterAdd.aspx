<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TranshipmentRegisterAdd.aspx.cs" Inherits="iWMS.Web.Job.TranshipmentRegister.TranshipmentRegisterAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TranshipmentRegisterAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckCtnrNoDigit(sender, eventArgs, index) {
                var grid = $find("<%=ResultDG.ClientID %>");
                var MasterTable = grid.get_masterTableView();
                var dataItems = MasterTable.get_dataItems();
                var ctnrno = dataItems[index].findControl("ContainerNoTxt").get_textBoxValue();

                if (ctnrno != "") {
                    var returnstr = ContainerNoCheckDigit(ctnrno);
                    if (returnstr != "Valid") {
                        alert(returnstr + " - [ " + ctnrno + " ]");
                        dataItems[index].findControl("ContainerNoTxt").focus();
                    }
                }
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

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>&nbsp;<asp:Button ID="AddBtn" runat="server" Text="Add" class="white" OnClick="AddBtn_Click"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="False" RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007"
            AutoPostBack="True">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server" />

                                    <iWMS:iForm ID="formCtl2" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight" Width="800px"
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" Name="ParentGrid" PageSize="50" HeaderStyle-HorizontalAlign="Center"
                                EditMode="InPlace" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="ContainerNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo <br/> BillSizeType" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <br />
                                            <telerik:RadTextBox ID="ContainerNoTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue"
                                                ClientEvents-OnValueChanged='<%# "function (s,a){CheckCtnrNoDigit(s,a," + Container.ItemIndex + ");}" %>'>
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            &nbsp;
                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" DataMember="" DataTextField="Descr" DataValueField="Item" Skin="WebBlue"
                                                DataSource='<%# BillSizeTypeDS%>' runat="server" />
                                            <asp:RequiredFieldValidator ID="BillSizeTypeDDLReqVal" runat="server" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" ForeColor="Red" Font-Size="Larger" />
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="TransportType" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-Wrap="true"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="TransportTypeDDL" DataMember="" DataTextField="Descr" DataValueField="Item" Skin="WebBlue"
                                                DataSource='<%# TransportTypeDS%>' runat="server" />
                                            <asp:RequiredFieldValidator ID="TransportTypeDDLReqVal" runat="server" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                ControlToValidate="TransportTypeDDL" ErrorMessage="*" ForeColor="Red" Font-Size="Larger" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="LoadVessel" ItemStyle-HorizontalAlign="Center" HeaderText="LoadVessel <br/> LoadVoyage <br/> ETA" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <br />
                                            <telerik:RadTextBox ID="LoadVesselTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue"></telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="LoadVesselTxtReqVal" runat="server" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                ControlToValidate="LoadVesselTxt" ErrorMessage="*" ForeColor="Red" Font-Size="Larger" />
                                            <br />
                                            <br />
                                            <telerik:RadTextBox ID="LoadVoyageTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue"></telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="LoadVoyageTxtReqVal" runat="server" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                ControlToValidate="LoadVoyageTxt" ErrorMessage="*" ForeColor="Red" Font-Size="Larger" />
                                            <br />
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <telerik:RadDateTimePicker ID="ETADate" Width="200px" Height="23px" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" Skin="Sunset" PopupDirection="TopRight" DateInput-TimeFormat="HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDateTimePicker>
                                            <asp:RequiredFieldValidator ID="BookingDateReqVal" runat="server" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                ControlToValidate="ETADate" ErrorMessage="*" ForeColor="Red" Font-Size="Larger" />
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BerthNo" ItemStyle-HorizontalAlign="Center" HeaderText="BerthNo <br/> DischargeCell <br/> LoadingCell" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <br />
                                            <telerik:RadTextBox ID="BerthNoTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox ID="DischargeCellTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox ID="LoadingCellTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue">
                                            </telerik:RadTextBox>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="OOG" Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="40px" HeaderStyle-Width="40px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" OnCheckedChanged="chkObjective_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Weight" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-Wrap="true"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                             <telerik:RadTextBox ID="WeightTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="O/H" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-Wrap="true"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                             <telerik:RadTextBox ID="OHTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                     <telerik:GridTemplateColumn HeaderText="O/W-(L)" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-Wrap="true"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                             <telerik:RadTextBox ID="OWLTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                     <telerik:GridTemplateColumn HeaderText="O/W-(R)" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-Wrap="true"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                             <telerik:RadTextBox ID="OWRTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                     <telerik:GridTemplateColumn HeaderText="O/L-(F)" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-Wrap="true"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                             <telerik:RadTextBox ID="OLFTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                      <telerik:GridTemplateColumn HeaderText="O/L-(R)" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-Wrap="true"
                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        <ItemTemplate>
                                             <telerik:RadTextBox ID="OLRTxt" runat="server" Width="160px" Height="23px" Skin="WebBlue" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="40px" HeaderStyle-Width="40px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddCtnr" ValidationGroup='<%# "Group_" + Container.DataSetIndex %>'
                                                ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                OnClick="AddCtnr_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="40px" HeaderStyle-Width="40px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Delete" ValidationGroup="NA"
                                                ImageUrl="../../image/deleted.png" Width="15" Height="15" AlternateText="Edit"
                                                OnClick="DeleteIcon_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
