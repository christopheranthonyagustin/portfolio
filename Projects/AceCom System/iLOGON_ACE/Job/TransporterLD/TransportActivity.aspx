<%@ Page Language="c#" CodeBehind="TransportActivity.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterLD.TransportActivity" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportActivityDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .MostInnerHeaderStyle {
            background: lightblue !important;
            font-size: 12px !important;
            color: black !important; /*add more style definitions here*/
        }

        .MostInnerItemStyle {
            background: lightgrey !important;
            color: black !important; /*add more style definitions here*/
        }

        .MostInnerAlernatingItemStyle {
            background: white !important;
            color: black !important; /*add more style definitions here*/
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function OnClientClick() {
                var Grid = $find("<%= ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length; i++) {
                    var row = MasterTable.get_dataItems()[i];
                    if (row.get_expanded() == false) {
                        row.set_expanded(true);
                    }
                    else
                        row.set_expanded(false);
                }
                var btn = document.getElementById(id);
                btn.disabled = true;
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

    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td runat="server" id="AddDetailBtn" visible="false">
                    <asp:Button ID="AddDetailBtn1" runat="server" Text="New" CssClass="white" OnClick="AddDetailBtn_Click" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                </td>
                <td runat="server" id="CollapseExpandBtn">
                     <asp:Button ID="CollapseExpandBtn1"  runat="server" Text="Show/Hide"  CssClass="white" OnClientClick="OnClientClick(this.id)"  
                      UseSubmitBehavior="false" />
                                        &nbsp;
                        <%--Ticket #5615: SMPL : Enhancement to Job Register - <Activity> tab (JBPERATVT), added by JL, 4th May 2016--%>
                    <%--            <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/Delete.png"
                            Visible="false" OnClick="DeleteAllBtn_Click" BackColor="Transparent"
                            BorderWidth="0" ImageAlign="AbsMiddle" ToolTip="Delete Selected Container(s)" />--%>
                    <%--  <telerik:RadButton ID="DelImgBtn" runat="server" CausesValidation="False" CssClass="green"
                            OnClick="DeleteAllBtn_Click" Text="Excel"  OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false">
                        </telerik:RadButton>--%>
                    <asp:Button ID="DelImgBtn" runat="server" CausesValidation="False" CssClass="white"
                        OnClick="DeleteAllBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Label ID="hrLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="minLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="TotalLbl" runat="server"></asp:Label>
                </td>
                <td>
                    <div runat="server" id="AddPanel" visible="false" style="float: left;">
                        <%--   <telerik:RadButton ID="SaveNextBtn" runat="server" CssClass="white" OnClick="SaveNextBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                            Text="Save &amp; Next" >
                        </telerik:RadButton>--%>
                        <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" OnClick="SaveNextBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                            Text="Save &amp; Next" />
                        &nbsp;
                        <asp:Button ID="SaveBtn" runat="server" CssClass="white" OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                            Text=" Save " />
                        &nbsp;
                        <asp:Button ID="ClosePanelBtn" runat="server" CausesValidation="False" CssClass="white"
                            OnClick="ClosePanelBtn_Click" Text="Hide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </div>
                </td>
                <td class="pagetitle">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>
                </td>

            </tr>
            <tr>
                <td runat="server" visible="false" id="tdfCtl">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Metro"
            AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
            OnPreRender="ResultDG_PreRender">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                TableLayout="Fixed" ItemStyle-Wrap="true" HeaderStyle-Wrap="true" AlternatingItemStyle-Wrap="true"
                HierarchyLoadMode="Client">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="PerHead" Width="100%" SkinID="Telerik"
                        runat="server">
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="jbperatvtid" MasterKeyField="id" />
                        </ParentTableRelation>
                        <%--<DetailTables>
                        <telerik:GridTableView DataKeyNames="id" Name="PerDetl" Width="100%" SkinID="Telerik"
                            runat="server">
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="jbperhid" MasterKeyField="id" />
                            </ParentTableRelation>
                            <HeaderStyle Wrap="false" />
                            <ItemStyle Wrap="false" />
                            <AlternatingItemStyle Wrap="false" />
                            <Columns>
                                <telerik:GridTemplateColumn HeaderStyle-Width="70px" Visible="false">
                                    <ItemTemplate>
                                        <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="PerDetlDetail_Edit"
                                            runat="server">
                                            <img id="editImg" src="../../image/pencil.gif" width="15" height="15" border="0"
                                                alt="Edit" title="Edit" runat="server" /></a>--%>
                        <%-- <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm copy?')" 
                                                runat="server">
                                                <img id="Img4" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy exact"
                                                    title="Copy exact" runat="server" /></a>--%>
                        <%-- <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                            runat="server" onserverclick="PerDetlDetail_Delete">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Charge"
                                                title="Delete Charge" runat="server" /></a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderStyle-ForeColor="Black">
                                    <HeaderTemplate>
                                        S/N
                                    </HeaderTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="Activity" DataField="peratvtcodedescr" AllowFiltering="true"
                                    ColumnGroupName="peratvtcodedescr" SortExpression="peratvtcodedescr" UniqueName="peratvtcodedescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Personnel" DataField="pername" AllowFiltering="true"
                                    ColumnGroupName="pername" SortExpression="pername" UniqueName="pername" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Vehicle" DataField="vehno" AllowFiltering="true"
                                    ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="StartDate" DataField="fractdate" AllowFiltering="true"
                                    ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="EndDate" DataField="toactdate" AllowFiltering="true"
                                    ColumnGroupName="toactdate" SortExpression="toactdate" UniqueName="toactdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrActTime" DataField="fracttime" AllowFiltering="true"
                                    ColumnGroupName="fracttime" SortExpression="fracttime" UniqueName="fracttime"
                                    Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToActTime" DataField="toacttime" AllowFiltering="true"
                                    ColumnGroupName="toacttime" SortExpression="toacttime" UniqueName="toacttime"
                                    Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TotHours" DataField="tothours" AllowFiltering="true"
                                    ColumnGroupName="tothours" SortExpression="tothours" UniqueName="tothours" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem1" AllowFiltering="true"
                                    ColumnGroupName="rem1" SortExpression="rem1" UniqueName="rem1" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrSvcPt" DataField="frservicept" AllowFiltering="true"
                                    ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true"
                                    ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToSvcPt" DataField="toservicept" AllowFiltering="true"
                                    ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true"
                                    ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>--%>
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" HeaderStyle-Width="70px" UniqueName="icon"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="PerHeadDetail_Edit"
                                        runat="server">
                                        <img id="editImg" src="../../image/pencil.gif" width="15" height="15" border="0"
                                            alt="Edit" title="Edit" runat="server" /></a>
                                    <asp:Label ID="DetailLbl" runat="server" />
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        runat="server" onserverclick="PerHeadDetail_Delete">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                            title="Delete Detail" runat="server" /></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-Width="70px">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn SortExpression="id" HeaderText="jbperhid" DataField="id"
                                UniqueName="jbperhid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="Type" AllowFiltering="true"
                                ColumnGroupName="Type" SortExpression="Type" UniqueName="Type" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ManRemarks" DataField="ManRemarks" AllowFiltering="true"
                                ColumnGroupName="ManRemarks" SortExpression="ManRemarks" UniqueName="ManRemarks"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Personnel" DataField="Personnel" AllowFiltering="true"
                                ColumnGroupName="Personnel" SortExpression="Personnel" UniqueName="Personnel"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Vehicle" DataField="Vehicle" AllowFiltering="true"
                                ColumnGroupName="Vehicle" SortExpression="Vehicle" UniqueName="Vehicle" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActStartDate" DataField="ActStartDate" AllowFiltering="true"
                                ColumnGroupName="ActStartDate" SortExpression="ActStartDate" UniqueName="ActStartDate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActEndDate" DataField="ActEndDate" AllowFiltering="true"
                                ColumnGroupName="ActEndDate" SortExpression="ActEndDate" UniqueName="ActEndDate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillStartDate" DataField="BillStartDate" AllowFiltering="true"
                                ColumnGroupName="BillStartDate" SortExpression="BillStartDate" UniqueName="BillStartDate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillEndDate" DataField="BillEndDate" AllowFiltering="true"
                                ColumnGroupName="BillEndDate" SortExpression="BillEndDate" UniqueName="BillEndDate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PerRemarks" DataField="PerRemarks" AllowFiltering="true"
                                ColumnGroupName="PerRemarks" SortExpression="PerRemarks" UniqueName="PerRemarks"
                                Reorderable="true" HeaderStyle-Width="2000px" ItemStyle-Width="2000px">
                            </telerik:GridBoundColumn>
                            <%--<telerik:GridBoundColumn HeaderText="ExpDate" DataField="expdate" AllowFiltering="true"
                            ColumnGroupName="expdate" SortExpression="expdate" UniqueName="expdate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>--%>
                            <%--<telerik:GridBoundColumn HeaderText="Qty" DataField="qty" AllowFiltering="true" ColumnGroupName="qty"
                            SortExpression="qty" UniqueName="qty" Reorderable="true" DataFormatString="{0:N0}">
                        </telerik:GridBoundColumn>--%>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <%--Ticket #5615: SMPL : Enhancement to Job Register - <Activity> tab (JBPERATVT), added by JL, 4th May 2016--%>
                    <telerik:GridTemplateColumn HeaderStyle-Width="35px" ItemStyle-Width="35px" Reorderable="false"
                        UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="false"
                        UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="ldEdit" ImageUrl="../../image/pencil.gif" Width="15"
                                Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="JBPerAtvt_Copy"
                                runat="server">
                                <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                    title="Copy" runat="server" /></a> <a id="AddLbl" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onserverclick="AddBtn_Click" runat="server">
                                        <img id="addImg" src="../../image/add.png" width="15" height="15" border="0" alt="Add PerHead"
                                            runat="server"></a>
                            <asp:Label ID="DetailLbl" runat="server" />
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="JBPerAtvt_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete JBPerAtvt"
                                    title="Delete JBPerAtvt" runat="server" /></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="40px" ItemStyle-Width="40px" Reorderable="false"
                        UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderStyle-Width="300px" ItemStyle-Width="300px" SortExpression="id"
                        HeaderText="jbperatvtid" DataField="id" UniqueName="jbperatvtid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Activity" DataField="peratvtcodedescr" AllowFiltering="true"
                        ColumnGroupName="peratvtcodedescr" SortExpression="peratvtcodedescr" UniqueName="peratvtcodedescr"
                        Reorderable="true">
                        <HeaderStyle Wrap="true" Width="400px" />
                        <ItemStyle Wrap="true" Width="400px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Activity Remarks" DataField="atvtremarks" AllowFiltering="true"
                        ColumnGroupName="atvtremarks" SortExpression="atvtremarks" UniqueName="AtvtRemarks"
                        Reorderable="true" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CertReq" DataField="certrequired" AllowFiltering="true"
                        ColumnGroupName="certrequired" SortExpression="certrequired" UniqueName="certrequired"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FrExpDate" DataField="frexpdate" AllowFiltering="true"
                        ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToExpDate" DataField="toexpdate" AllowFiltering="true"
                        ColumnGroupName="toexpdate" SortExpression="toexpdate" UniqueName="toexpdate"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalTime" DataField="TotTime" AllowFiltering="true"
                        ColumnGroupName="TotTime" SortExpression="TotTime" UniqueName="TotalTime" Reorderable="true"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NoOfEqp" DataField="qty" AllowFiltering="true"
                        ColumnGroupName="qty" SortExpression="qty" UniqueName="qty" Reorderable="true"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" DataFormatString="{0:N0}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="billsizetype" AllowFiltering="true"
                        ColumnGroupName="billsizetype" SortExpression="billsizetype" UniqueName="billsizetype"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true" DataFormatString="{0:N0}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FrAddr" DataField="atvtfraddr" AllowFiltering="true"
                        ColumnGroupName="atvtfraddr" SortExpression="atvtfraddr" UniqueName="atvtfraddr"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToAddr" DataField="atvttoaddr" AllowFiltering="true"
                        ColumnGroupName="atvttoaddr" SortExpression="atvttoaddr" UniqueName="atvttoaddr"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VendorName" DataField="vendorname" AllowFiltering="true"
                        ColumnGroupName="vendorname" SortExpression="vendorname" UniqueName="vendorname"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FumigationID" DataField="fumigationdescr" AllowFiltering="true"
                        ColumnGroupName="fumigationdescr" SortExpression="fumigationdescr" UniqueName="fumigationid"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NoOfPackages" DataField="noofpkg" AllowFiltering="true"
                        ColumnGroupName="noofpkg" SortExpression="noofpkg" UniqueName="noofpkg" Reorderable="true"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="GoodsDescr" DataField="AtvtGoodsDescr" AllowFiltering="true"
                        ColumnGroupName="AtvtGoodsDescr" SortExpression="AtvtGoodsDescr" UniqueName="AtvtGoodsDescr"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="GoodsWt" DataField="goodswt" AllowFiltering="true"
                        ColumnGroupName="goodswt" SortExpression="goodswt" UniqueName="goodswt" Reorderable="true"
                        ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.000}" HeaderStyle-Width="120px"
                        ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="GoodsVol" DataField="goodsvol" AllowFiltering="true"
                        ColumnGroupName="goodsvol" SortExpression="goodsvol" UniqueName="goodsvol" Reorderable="true"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right"
                        DataFormatString="{0:#,0.000}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                        ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true"
                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Category" DataField="cat" AllowFiltering="true"
                        ColumnGroupName="cat" SortExpression="cat" UniqueName="cat" Reorderable="true"
                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true"
                        ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true"
                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true"
                        ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true"
                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="hr" DataField="hr" Display="false" HeaderStyle-Width="120px"
                        ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="min" DataField="min" Display="false" HeaderStyle-Width="120px"
                        ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                        ColumnGroupName="status" SortExpression="status" UniqueName="status" Reorderable="true"
                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                        ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                        ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                        Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
