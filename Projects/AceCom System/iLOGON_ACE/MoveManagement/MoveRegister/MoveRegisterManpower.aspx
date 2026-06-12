<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveRegisterManpower.aspx.cs" Inherits="iWMS.Web.MoveManagement.MoveRegister.MoveRegisterManpower" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Move Register Manpower</title>
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
                    <asp:Button ID="CollapseExpandBtn1" runat="server" Text="Show/Hide" CssClass="white" OnClientClick="OnClientClick(this.id)"
                        UseSubmitBehavior="false" />
                    &nbsp;&nbsp;                       
                    <asp:Button ID="DelImgBtn" runat="server" CausesValidation="False" CssClass="white"
                        OnClick="DeleteAllBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Label ID="hrLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="minLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="TotalLbl" runat="server"></asp:Label>
                </td>
                <td>
                    <div runat="server" id="AddPanel" visible="false" style="float: left;">
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
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007"
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
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                TableLayout="Fixed" ItemStyle-Wrap="true" HeaderStyle-Wrap="true" AlternatingItemStyle-Wrap="true"
                HierarchyLoadMode="Client">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="JPDId" Name="PerHead" Width="100%" SkinID="Telerik"
                        runat="server">
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="jbperatvtid" MasterKeyField="id" />
                        </ParentTableRelation>
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" HeaderStyle-Width="70px" UniqueName="icon"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.JPDId")%>' onserverclick="PerHeadDetail_Edit"
                                        runat="server">
                                        <img id="editImg" src="../../image/pencil.gif" width="15" height="15" border="0"
                                            alt="Edit" title="Edit" runat="server" /></a>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.JPDId")%>' onclick="return confirm('Confirm delete?')"
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
                            <telerik:GridBoundColumn HeaderText="Personnel" DataField="PerName" AllowFiltering="true"
                                ColumnGroupName="PerName" SortExpression="PerName" UniqueName="PerName"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Vehicle" DataField="vehno" AllowFiltering="true"
                                ColumnGroupName="vehno" SortExpression="vehno" UniqueName="vehno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActStartDate" DataField="inctstartdate" AllowFiltering="true"
                                ColumnGroupName="inctstartdate" SortExpression="inctstartdate" UniqueName="inctstartdate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActEndDate" DataField="inctenddate" AllowFiltering="true"
                                ColumnGroupName="inctenddate" SortExpression="inctenddate" UniqueName="inctenddate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillStartDate" DataField="fractdate" AllowFiltering="true"
                                ColumnGroupName="fractdate" SortExpression="fractdate" UniqueName="fractdate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillEndDate" DataField="toactdate" AllowFiltering="true"
                                ColumnGroupName="toactdate" SortExpression="toactdate" UniqueName="toactdate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PerRemarks" DataField="rem1" AllowFiltering="true"
                                ColumnGroupName="rem1" SortExpression="rem1" UniqueName="rem1"
                                Reorderable="true" HeaderStyle-Width="2000px" ItemStyle-Width="2000px">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
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
