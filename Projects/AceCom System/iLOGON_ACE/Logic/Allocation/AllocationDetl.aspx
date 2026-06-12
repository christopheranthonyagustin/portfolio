<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="AllocationDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Logic.Allocation.AllocationDetl" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>AllocationDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function(a, b, e) {
                    this.scrollLeft = 0;
                });
            }
        </script>

        <%-- newly added--%>
        <%--<script type="text/javascript">
            function GridCreated(sender, args) {
                var scrollArea = sender.GridDataDiv;
                var parent = $get("gridContainer");
                var gridHeader = sender.GridHeaderDiv;
                scrollArea.style.height = parent.clientHeight - gridHeader.clientHeight + "px";
            }
        </script>--%>

        <script type="text/javascript">
            function pageLoad() {
                var grid = $find("<%= ResultDG.ClientID %>");
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
            
        </script>

    </telerik:RadCodeBlock>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });

    
    </script>
    <style type="text/css">
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="AllCodeLbl" runat="server" Visible="false"></asp:Label></div>
            </td>
            <td align="left">
                <%--<iWMS:iPopup ID="InputPopup" runat="server" Visible="False" Type="BTN" Mode="ADD" 
                    PageUrl="DetailInput.aspx" InputBoxHeight="320" InputBoxWidth="500" ButtonText="NewLine">CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                </iWMS:iPopup>--%>
                <%--<telerik:RadButton ID="BtnInputPopup" runat="server"  OnClick="Detail_PopUp"
                    Text="NewLine" ButtonType="LinkButton" mode="add">
                 </telerik:RadButton>--%>
                <asp:Button ID="BtnInputPopup" CssClass="white" runat="server" OnClick="Detail_PopUp"
                    Text="New" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Scrolling ScrollHeight="400px" AllowScroll="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server" ></asp:Label>
                        <a id="AllocationDetail_Edit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="AllocationDetail_Edit"
                            runat="server">
                        <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                        title="Edit" runat="server" /></a>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="AllDetail_Delete" runat="server">
                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Allocation Detail"
                                runat="server"></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn AllowFiltering="false">
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="step" SortExpression="step" HeaderText="Step#"
                    AllowFiltering="false" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sortby" SortExpression="sortby" HeaderText="Sort By"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="picktype" SortExpression="picktype" HeaderText="Pick UOM"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="frompickface" SortExpression="frompickface" HeaderText="From PF"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="zonecode" SortExpression="zonecode" HeaderText="Zone"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="logic" SortExpression="logic" HeaderText="Logic"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="logiccodedescr" SortExpression="logiccodedescr"
                    HeaderText="LogicCode" ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LogicValue" SortExpression="LogicValue" HeaderText="LogicValue"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                    HeaderText="EditUser">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
     
    </form>
</body>
</html>
