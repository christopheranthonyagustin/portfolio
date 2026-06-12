<%@ Page Language="c#" CodeBehind="InvoiceAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.InvoiceRegisterV2.InvoiceAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceAdd</title>

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    </telerik:RadScriptBlock>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <br />
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <p>
            <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                OnClientClick="disableBtn(this.id,true)" ToolTip="Add" UseSubmitBehavior="false" CssClass="white" />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <div style="width: min-content;">
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="false"
                            Skin="Metro" AllowMultiRowSelection="True" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" Scrolling-AllowScroll="true">
                                <Selecting AllowRowSelect="true"></Selecting>
                                <Scrolling UseStaticHeaders="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <PagerStyle Mode="NextPrevAndNumeric" />
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="10" TableLayout="Fixed">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="Active" Reorderable="false" UniqueName="checkbox"
                                        AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ActiveItemCB" runat="server" Checked="true"></asp:CheckBox>
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
                                    <telerik:GridTemplateColumn HeaderText="Source" Reorderable="false" UniqueName="srcDescr"
                                        AllowFiltering="false" HeaderStyle-Width="113px" ItemStyle-Width="113px">
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="BSrcList" Enabled="True" DataTextField="Descr" DataValueField="item"
                                                runat="server" DataSource='<%# bSrcListDS%>' Width="100px" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BillingGrp" Reorderable="false" UniqueName="billinggrpdescr"
                                        AllowFiltering="false" HeaderStyle-Width="113px" ItemStyle-Width="113px">
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="BGrpList" Enabled="True" DataTextField="Descr" DataValueField="code"
                                                runat="server" DataSource='<%# bGrpListDS%>' AutoPostBack="True" Width="100px" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="false" ID="queryImgBtn" ImageUrl="../../image/query.png"
                                                Width="15" OnClick="query_JobNotInvoice" Height="15" AlternateText="JobNotInvoiced"
                                                BackColor="Transparent" BorderWidth="0" CausesValidation="false"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>

                    <asp:HiddenField ID="HiddenField" runat="server" />
                    <asp:HiddenField ID="HiddenFieldAcId" runat="server" />
                    <telerik:RadWindow ID="OsJobGenerationRadWindow" runat="server" VisibleOnPageLoad="true" Title="OSJobGeneration" Width="900px" Height="500px"
                        NavigateUrl='<%# "JobsNotInvoiceGen.aspx?billingType="+ HiddenField.Value + "&AcId=" + HiddenFieldAcId.Value %>'
                        Modal="true" Left="100px" Top="20px" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
                    </telerik:RadWindow>
                </ContentTemplate>
            </asp:UpdatePanel>
        </p>
        <p>
            <asp:ValidationSummary Style="z-index: 0" ID="valSummary" runat="server" CssClass="RedText"
                HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
                EnableClientScript="true"></asp:ValidationSummary>
        </p>
    </form>
</body>
</html>
