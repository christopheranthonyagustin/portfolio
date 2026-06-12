<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PPGInterface.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.PPGInterce" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PSInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        .RadPivotGrid_Metro .rpgContentZoneDiv td
        {
            white-space: nowrap;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function(a, b, e) {
                    this.scrollLeft = 0;
                });
            }
        </script>

        <script type="text/javascript">
            function pageLoad() {
                var grid = $find("<%= ResultRadGrid.ClientID %>");
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
        </script>

    </telerik:RadCodeBlock>

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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table ">
        <tr>
            <td >
                <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" Text="PPG - Interface Upload" />
                <br />
                <br />
                <asp:Label runat="server" ID="FilePathLbl" Text="Path" />
                <br />
                <telerik:RadTextBox runat="server" ID="FilePathTxt" Width="250px" Skin="Office2007" ReadOnly="true"></telerik:RadTextBox>
                <br />
                <br />
            </td>
           
        </tr>
        <tr>
            <td>
                <telerik:RadDropDownList ID="StatusDDL" runat="server" DefaultMessage="Select a Status"
                    DropDownWidth="150px" Skin="WebBlue" Width="150px" 
                    AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_Changed">
                </telerik:RadDropDownList>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadButton ID="UploadBtn" runat="server" OnClick="UploadBtn_Click" Text=" Upload " ToolTip="Click to Upload Selected Files" Skin="WebBlue">
                </telerik:RadButton>

                <telerik:RadButton ID="CombineInto1Btn" runat="server" OnClick="CombineInto1_Click" Text="CombineInto1" Skin="WebBlue">
                </telerik:RadButton>
                 
                     <telerik:RadButton ID="UndoBtn" Visible="false" runat="server" OnClick="UndoBtn_Click" Text="   Undo   " Skin="WebBlue">
                </telerik:RadButton>
       </td>
            <td>
               &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;           
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp
                  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;
                <telerik:RadButton ID="IgnoreBtn" Visible="false" runat="server" OnClick="IgnoreBtn_Click" Text="  Ignore  " Skin="WebBlue">
                </telerik:RadButton>     
              </td>
        </tr>
    </table>
        <br />
	 <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" OnItemCreated="ResultRadGrid_ItemCreated"
        OnItemCommand="ResultRadGrid_ItemCommand"
        Skin="Office2007" 
        OnItemDataBound="ResultRadGrid_ItemDataBound">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
            Resizing-AllowColumnResize="true">
            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
        <mastertableview allowmulticolumnsorting="false" tablelayout="Fixed" name="Master"
            width="100%">
            <Columns>
                <telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectChkBox" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlWidth="50px" HeaderStyle-Width="80px" ItemStyle-Width="80px" AllowFiltering="true" 
                    DataField="status" ColumnGroupName="status" ShowFilterIcon="false" SortExpression="status" 
                    UniqueName="Status" HeaderText="Status" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                    <ItemTemplate>
                        &nbsp;
                        <asp:LinkButton ID="logLnkBtn" runat="server" OnClick="logLnkBtn_Click" Text='<% #DataBinder.Eval(Container,"DataItem.status")%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="DeliveryNoteNo" DataField="exref2" AllowFiltering="true"
                    HeaderStyle-Width="110px" FilterControlWidth="90px" ColumnGroupName="exref2"
                    SortExpression="exref2" UniqueName="exref2" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="DeliveryDate" DataField="exdate2" AllowFiltering="true"
                   FilterControlWidth="100px" HeaderStyle-Width="100px" ItemStyle-Width="100px" ColumnGroupName="exdate2"
                    SortExpression="exdate2" UniqueName="exdate2" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false" >
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn HeaderText="Lines" DataField="lines" AllowFiltering="false"
                    HeaderStyle-Width="70px" ColumnGroupName="lines" SortExpression="lines" UniqueName="Lines">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FileName" DataField="filename" AllowFiltering="true"
                   FilterControlWidth="100px" HeaderStyle-Width="100px" ItemStyle-Width="100px" ColumnGroupName="filename" SortExpression="filename"
                    UniqueName="FileName" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn DataField="filereceived" HeaderText="FileReceived" UniqueName="FileReceived"
                   FilterControlWidth="100px" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="filereceived" PickerType="DatePicker"
                    EnableTimeIndependentFiltering="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn HeaderText="RCNo" DataField="srcno" AllowFiltering="true"
                    FilterControlWidth="80px" HeaderStyle-Width="100px" ColumnGroupName="srcno"
                    SortExpression="srcno" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false" UniqueName="srcno">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="RCStatus" DataField="rcstatusdescr" AllowFiltering="false"
                    HeaderStyle-Width="100px" ColumnGroupName="rcstatusdescr" SortExpression="rcstatusdescr"
                    UniqueName="rcstatusdescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FilePath" DataField="filepath" AllowFiltering="false"
                    ColumnGroupName="filepath" SortExpression="filepath" UniqueName="FilePath" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
        </mastertableview>
    </telerik:RadGrid>
    </form>
</body>
</html>
