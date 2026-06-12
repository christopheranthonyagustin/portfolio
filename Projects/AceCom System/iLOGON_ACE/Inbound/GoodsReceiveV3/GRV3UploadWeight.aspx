<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3UploadWeight.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3UploadWeight" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UploadWeight @ GoodReceive V3</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook">
                        <Localization Select="Select a File" />
                    </telerik:RadAsyncUpload>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" Text="Note : Only Microsoft Excel files can be Uploaded." runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:UpdatePanel ID="Panel" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="UploadBtn" runat="server" Text="Upload" CssClass="white" OnClick="UploadBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="UploadBtn" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    &nbsp;<asp:Label ID="Label2" Text="Processing Rules:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label3" Text="1. Eash SKU Line can only be uploaded once." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label4" Text="2. SKU Line ExpectedQty must tally with total UploadQty." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label5" Text="3. If an UploadLot column is left blank, it will inherit the corresponding value from the original SKU Line." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Visible="false"
            OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro"
            AllowSorting="true" AllowFilteringByColumn="true" AllowPaging="true" PageSize="50">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling ScrollHeight="400px" UseStaticHeaders="True" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="rcdtid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Line" DataField="line" AllowFiltering="false" Visible="false"
                        SortExpression="line" UniqueName="line" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true"
                        SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKUDescr" DataField="rcsskudescr" AllowFiltering="true"
                        SortExpression="rcsskudescr" UniqueName="rcsskudescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Packing" DataField="packing" AllowFiltering="true"
                        SortExpression="packing" UniqueName="packing" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="BillGroup" DataField="BillingGrpDescr" AllowFiltering="true"
                        SortExpression="BillingGrpDescr" UniqueName="BillingGrpDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="false"
                        SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Expected" DataField="expecteduomqty" AllowFiltering="false"
                        SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="InTransit" DataField="intransituomqty" AllowFiltering="false"
                        SortExpression="intransituomqty" UniqueName="intransituomqty" Reorderable="true"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Received" DataField="receiveduomqty" AllowFiltering="true"
                        SortExpression="receiveduomqty" UniqueName="receiveduomqty" Reorderable="true"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalSerialNo" DataField="CntSNo" AllowFiltering="true"
                        SortExpression="CntSNo" UniqueName="CntSNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToLoc" DataField="loccode" AllowFiltering="true"
                        SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="PaLoc" HeaderText="PaLoc">
                        <ItemTemplate>
                            <asp:TextBox ID="palocTxt" runat="server" Visible="false" Text='<%# Eval("paloccode") %>'>
                            </asp:TextBox>
                            <asp:Label ID="Ploc" Text='<%#DataBinder.Eval(Container.DataItem, "paloccode")%>' runat="server" Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="checkdigit" HeaderText="Checkdigits">
                        <ItemTemplate>
                            <asp:TextBox ID="checkdigitText" runat="server" Text='<%# Eval("loccheckdigit") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="RCSStatus" DataField="statusdescr" AllowFiltering="true"
                        SortExpression="statusdescr" UniqueName="RcsStatus" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TUNo1" DataField="tuno1" AllowFiltering="true"
                        SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="LotId" DataField="LotId" AllowFiltering="true"
                        SortExpression="LotId" UniqueName="LotId" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="RcvDate" DataField="rcdate" AllowFiltering="true"
                        SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true"
                        SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true"
                        SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true"
                        SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true"
                        SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true"
                        SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true"
                        SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true"
                        SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true"
                        SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true"
                        SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true"
                        SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true"
                        SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true"
                        SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" AllowFiltering="true"
                        SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" AllowFiltering="true"
                        SortExpression="lot14" UniqueName="lot14" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" AllowFiltering="true"
                        SortExpression="lot15" UniqueName="lot15" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" AllowFiltering="true"
                        SortExpression="lot16" UniqueName="lot16" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" AllowFiltering="true"
                        SortExpression="lot17" UniqueName="lot17" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" AllowFiltering="true"
                        SortExpression="lot18" UniqueName="lot18" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" AllowFiltering="true"
                        SortExpression="lot19" UniqueName="lot19" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" AllowFiltering="true"
                        SortExpression="lot20" UniqueName="lot20" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" AllowFiltering="true"
                        SortExpression="lot21" UniqueName="lot21" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" AllowFiltering="true"
                        SortExpression="lot22" UniqueName="lot22" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" AllowFiltering="true"
                        SortExpression="lot23" UniqueName="lot23" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" AllowFiltering="true"
                        SortExpression="lot24" UniqueName="lot24" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" AllowFiltering="true"
                        SortExpression="lot25" UniqueName="lot25" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" AllowFiltering="true"
                        SortExpression="lot26" UniqueName="lot26" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" AllowFiltering="true"
                        SortExpression="lot27" UniqueName="lot27" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" AllowFiltering="true"
                        SortExpression="lot28" UniqueName="lot28" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" AllowFiltering="true"
                        SortExpression="lot29" UniqueName="lot29" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" AllowFiltering="true"
                        SortExpression="lot30" UniqueName="lot30" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" AllowFiltering="true"
                        SortExpression="lot31" UniqueName="lot31" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" AllowFiltering="true"
                        SortExpression="lot32" UniqueName="lot32" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" AllowFiltering="true"
                        SortExpression="lot33" UniqueName="lot33" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" AllowFiltering="true"
                        SortExpression="lot34" UniqueName="lot34" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" AllowFiltering="true"
                        SortExpression="lot35" UniqueName="lot35" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" AllowFiltering="true"
                        SortExpression="lot36" UniqueName="lot36" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" AllowFiltering="true"
                        SortExpression="lot37" UniqueName="lot37" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" AllowFiltering="true"
                        SortExpression="lot38" UniqueName="lot38" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" AllowFiltering="true"
                        SortExpression="lot39" UniqueName="lot39" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" AllowFiltering="true"
                        SortExpression="lot40" UniqueName="lot40" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" AllowFiltering="true"
                        SortExpression="lot41" UniqueName="lot41" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" AllowFiltering="true"
                        SortExpression="lot42" UniqueName="lot42" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" AllowFiltering="true"
                        SortExpression="lot43" UniqueName="lot43" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" AllowFiltering="true"
                        SortExpression="lot44" UniqueName="lot44" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" AllowFiltering="true"
                        SortExpression="lot45" UniqueName="lot45" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" AllowFiltering="true"
                        SortExpression="lot46" UniqueName="lot46" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" AllowFiltering="true"
                        SortExpression="lot47" UniqueName="lot47" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" AllowFiltering="true"
                        SortExpression="lot48" UniqueName="lot48" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" AllowFiltering="true"
                        SortExpression="lot49" UniqueName="lot49" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" AllowFiltering="true"
                        SortExpression="lot50" UniqueName="lot50" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" AllowFiltering="true"
                        SortExpression="lot51" UniqueName="lot51" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" AllowFiltering="true"
                        SortExpression="lot52" UniqueName="lot52" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" AllowFiltering="true"
                        SortExpression="lot53" UniqueName="lot53" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" AllowFiltering="true"
                        SortExpression="lot54" UniqueName="lot54" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" AllowFiltering="true"
                        SortExpression="lot55" UniqueName="lot55" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" AllowFiltering="true"
                        SortExpression="lot56" UniqueName="lot56" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" AllowFiltering="true"
                        SortExpression="lot57" UniqueName="lot57" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" AllowFiltering="true"
                        SortExpression="lot58" UniqueName="lot58" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" AllowFiltering="true"
                        SortExpression="lot59" UniqueName="lot59" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" AllowFiltering="true"
                        SortExpression="lot60" UniqueName="lot60" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotExpNetWt" DataField="totexpnetwt" AllowFiltering="true"
                        SortExpression="totexpnetwt" UniqueName="totexpnetwt" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TUNo2" DataField="tuno2" AllowFiltering="true"
                        SortExpression="tuno2" UniqueName="tuno2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExRef" DataField="RDExRef" AllowFiltering="true"
                        SortExpression="RDExRef" UniqueName="RDExRef" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExLine" DataField="ExLine" AllowFiltering="true"
                        SortExpression="ExLine" UniqueName="ExLine" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalWt" DataField="RCSTotWt" AllowFiltering="true"
                        SortExpression="RCSTotWt" UniqueName="RCSTotWt" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalVol" DataField="RCSTotVol" AllowFiltering="true"
                        SortExpression="RCSTotVol" UniqueName="RCSTotVol" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="WT" DataField="WT" AllowFiltering="true"
                        SortExpression="wt" UniqueName="wt" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vol" DataField="vol" AllowFiltering="true"
                        SortExpression="vol" UniqueName="vol" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Area(L)" DataField="arealength" AllowFiltering="true"
                        SortExpression="arealength" UniqueName="arealength" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Area(W)" DataField="areawidth" AllowFiltering="true"
                        SortExpression="areawidth" UniqueName="areawidth" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Area" DataField="area" AllowFiltering="true"
                        SortExpression="area" UniqueName="area" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                        SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                        SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                        SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                        SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />
                    <telerik:GridBoundColumn Display="False" DataField="skuid" />
                    <telerik:GridBoundColumn Display="False" DataField="rcdstatus" />
                    <telerik:GridBoundColumn Display="False" DataField="rcid" />
                    <telerik:GridBoundColumn Display="False" DataField="rcdstatuscolor" />
                    <telerik:GridBoundColumn Display="False" DataField="expectedqty" />
                    <telerik:GridBoundColumn Display="False" DataField="intransitqty" />
                    <telerik:GridBoundColumn Display="False" DataField="receivedqty" />
                    <telerik:GridBoundColumn DataField="BillingGrp"
                        SortExpression="BillingGrp" UniqueName="BillingGrp" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="status" />
                    <telerik:GridBoundColumn Display="False" DataField="DirectDischargeQty" UniqueName="DirectDischargeQty" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
