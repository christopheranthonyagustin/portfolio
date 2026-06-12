<%--%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>--%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page MaintainScrollPositionOnPostback="true" Language="c#" CodeBehind="TransportEqpDetList.aspx.cs"
    AutoEventWireup="True" Inherits="iWMS.Web.Job.Transporter2.TransportEqpDetList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ReceiptDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script language="javascript" type="text/javascript">
        function CheckAllDataGridCheckBoxes(aspCheckBoxID, checkVal) {
            re = new RegExp(':' + aspCheckBoxID + '$')  //generated control name starts with a colon
            for (i = 0; i < Form1.elements.length; i++) {
                elm = document.forms[0].elements[i]
                if (elm.type == 'checkbox') {
                    if (re.test(elm.name))
                        elm.checked = checkVal
                }
            }
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="EquipmentSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                        AllowFilteringByColumn="true" OnItemDataBound="ResultDG1_ItemDataBound" OnNeedDataSource="ResultDG1_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn AllowFiltering="false">
                                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                        No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn Display="False" DataField="id" HeaderText="id">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="jbid" ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jbno" SortExpression="jbno" HeaderText="JobNo"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jobtype" SortExpression="jobtype" HeaderText="JobType"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="EquipmentRef"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eqptype" SortExpression="eqptype" HeaderText="EquipmentType"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tpttype" SortExpression="tpttype" HeaderText="TrasportType"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="expdate" HeaderText="Exp Date" SortExpression="expdate"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bkref" SortExpression="bkref" HeaderText="BookingReference"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status" Display="false"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Vessel" SortExpression="Vessel" HeaderText="Vessel"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Voyage" SortExpression="Voyage" HeaderText="Voyage"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ETA" SortExpression="ETA" HeaderText="ETA"
                                    DataFormatString="{0:dd/MMM/yyyy HH:MM}" ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bkreforiginal" SortExpression="bkreforiginal"
                                    HeaderText="OrginalBookingRef" ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="billsizetype" SortExpression="billsizetype" HeaderText="BillSizeType"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="policeescort" SortExpression="policeescort" HeaderText="PoliceEscort"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="ContainerType"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tptercode" SortExpression="tptercode" HeaderText="VendorOpCode"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tptername" SortExpression="tptername" HeaderText="VendorOpName"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="ContainerWeight"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="ContainerSeal No"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
