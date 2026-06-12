<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceForm.aspx.cs"
    Inherits="iWMS.Web.HouseKeeping.Maintenance.MaintenanceForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>TransferForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />     
    <script type="text/javascript" src="../../js/row.js"></script>

    <style type="text/css">
        .style1
        {
            width: 540px;
        }
    </style>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                &nbsp;<asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <br>
                &nbsp;&nbsp;
                <telerik:RadButton ID="UpdateBtn" runat="server" Text="  Update  " CssClass="detailButton"
                    Skin="WebBlue" OnClick="UpdateBtn_Click" CausesValidation ="false">
                </telerik:RadButton>
                 &nbsp;
                <telerik:RadButton Style="z-index: 0" ID="BackButton" runat="server" Visible="True"
                    Text="All Item(s)" Skin="WebBlue" CausesValidation="False" OnClick="BackButton_Click">
                </telerik:RadButton>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>    
     <table>
        <tr>
            <td>              
                <telerik:RadButton ID="FinalizeBtn" runat="server" Text=" Finalize " CssClass="detailButton"
                    Skin="WebBlue" OnClick="FinalizeBtn_Click" CausesValidation ="false">
                </telerik:RadButton>                          
            </td>
            <td>              
                <telerik:RadButton ID="DeleteBtn" runat="server" Text=" Delete " CssClass="detailButton"
                    Skin="WebBlue" OnClick="DeleteBtn_Click" CausesValidation ="false">
                </telerik:RadButton>                          
            </td>
        </tr>       
    </table>
    <br />    
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="false" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowAutomaticInserts="True" Width="200%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" EditMode="InPlace" Width="100%" 
        AllowFilteringByColumn="true" HierarchyLoadMode="Client" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="New Record">
        <CommandItemTemplate>
        <div style="padding: 5px 5px;">
            &nbsp;&nbsp;
             <asp:ImageButton runat="server" Visible="True" ID="MODetlAdd" ImageUrl="..\..\image\add.png"
                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Add New Maintenance"
                ToolTip="Add MaintenanceDetail" OnClick="MNDetlAdd_Click" CausesValidation="False"></asp:ImageButton>&nbsp;
            <asp:Label ID="Lbl1" runat="server" Text="New Record" Font-Bold="true" />
        </div>
        </CommandItemTemplate>
            <Columns>
             <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate> 
                        <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Sku" DataField="fromskucode" AllowFiltering="true"
                    ColumnGroupName="fromskucode" SortExpression="fromskucode" UniqueName="fromskucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Skuid" DataField="fromskuid" AllowFiltering="true" Display="false"
                    ColumnGroupName="fromskuid" SortExpression="fromskuid" UniqueName="fromskuid" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                    ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Qty" DataField="transferedspqty" AllowFiltering="true" DataFormatString="{0:0.###}" 
                    ColumnGroupName="transferedspqty" SortExpression="transferedspqty" UniqueName="transferedspqty" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ToLocCode" DataField="toloccode" AllowFiltering="true"
                    ColumnGroupName="toloccode" SortExpression="toloccode" UniqueName="toloccode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="status" Display="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="statuscolor" Display="false">                   
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot1" DataField="fromlot1" AllowFiltering="true"
                    ColumnGroupName="fromlot1" SortExpression="fromlot1" DataFormatString="{0:dd/MMM/yyyy}" UniqueName="fromlot1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot2" DataField="fromlot2" AllowFiltering="true"
                    ColumnGroupName="fromlot2" SortExpression="fromlot2" DataFormatString="{0:dd/MMM/yyyy}" UniqueName="fromlot2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot3" DataField="fromlot3" AllowFiltering="true"
                    ColumnGroupName="fromlot3" SortExpression="fromlot3" DataFormatString="{0:dd/MMM/yyyy}" UniqueName="fromlot3">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot4" DataField="fromlot4" AllowFiltering="true"
                    ColumnGroupName="fromlot4" SortExpression="fromlot4" UniqueName="fromlot4">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot5" DataField="fromlot5" AllowFiltering="true"
                    ColumnGroupName="fromlot5" SortExpression="fromlot5" UniqueName="fromlot5">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot6" DataField="fromlot6" AllowFiltering="true"
                    ColumnGroupName="fromlot6" SortExpression="fromlot6" UniqueName="fromlot6">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot7" DataField="fromlot7" AllowFiltering="true"
                    ColumnGroupName="fromlot7" SortExpression="fromlot7" UniqueName="fromlot7">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot8" DataField="fromlot8" AllowFiltering="true"
                    ColumnGroupName="fromlot8" SortExpression="fromlot8" UniqueName="fromlot8">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot9" DataField="fromlot9" AllowFiltering="true"
                    ColumnGroupName="fromlot9" SortExpression="fromlot9" UniqueName="fromlot9">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot10" DataField="fromlot10" AllowFiltering="true"
                    ColumnGroupName="fromlot10" SortExpression="fromlot10" UniqueName="fromlot10">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot11" DataField="fromlot11" AllowFiltering="true"
                    ColumnGroupName="fromlot11" SortExpression="fromlot11" UniqueName="fromlot11">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot12" DataField="fromlot12" AllowFiltering="true"
                    ColumnGroupName="fromlot12" SortExpression="fromlot12" UniqueName="fromlot12">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot13" DataField="fromlot13" AllowFiltering="true"
                    ColumnGroupName="fromlot13" SortExpression="fromlot13" UniqueName="fromlot13">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot14" DataField="fromlot14" AllowFiltering="true"
                    ColumnGroupName="fromlot14" SortExpression="fromlot14" UniqueName="fromlot14">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot15" DataField="fromlot15" AllowFiltering="true"
                    ColumnGroupName="fromlot15" SortExpression="fromlot15" UniqueName="fromlot15">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Qty" DataField="transferedqty" AllowFiltering="true" Display="false"
                    UniqueName="transferedqty" Reorderable="true">
                </telerik:GridBoundColumn>
            </Columns>
             <DetailTables>
                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                    Width="40%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />
                    <%--<CommandItemSettings ShowRefreshButton="false" AddNewRecordText="Add Personnel" />--%>
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="tfdtid" MasterKeyField="id" />
                    </ParentTableRelation>
                    <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="MIEdit" ImageUrl="..\..\image\pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit MI"
                            ToolTip="Edit MIDetail" OnClick="MIEdit_Click" CausesValidation="False"></asp:ImageButton>
                    </ItemTemplate>
                    <ItemStyle Wrap="false" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="TFDtID" DataField="tfdtid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Sku" DataField="fromskucode" AllowFiltering="true" Display="false"
                    ColumnGroupName="fromskucode" SortExpression="fromskucode" UniqueName="fromskucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Skuid" DataField="fromskuid" AllowFiltering="true"
                    ColumnGroupName="fromskuid" SortExpression="fromskuid" UniqueName="fromskuid" Reorderable="true">
                </telerik:GridBoundColumn>          
                <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                    ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Qty" DataField="transferedqty" AllowFiltering="true"
                    ColumnGroupName="transferedqty" SortExpression="transferedqty" UniqueName="transferedqty" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ToLocCode" DataField="toloccode" AllowFiltering="true"
                    ColumnGroupName="toloccode" SortExpression="toloccode" UniqueName="toloccode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="statuscolor" Display="false">                
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot1" DataField="tolot1" AllowFiltering="true"
                    ColumnGroupName="tolot1" SortExpression="tolot1" DataFormatString="{0:dd/MMM/yyyy}" UniqueName="tolot1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot2" DataField="tolot2" AllowFiltering="true"
                    ColumnGroupName="tolot2" SortExpression="tolot2" DataFormatString="{0:dd/MMM/yyyy}" UniqueName="tolot2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot3" DataField="tolot3" AllowFiltering="true"
                    ColumnGroupName="tolot3" SortExpression="tolot3" DataFormatString="{0:dd/MMM/yyyy}" UniqueName="tolot3">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot4" DataField="tolot4" AllowFiltering="true"
                    ColumnGroupName="tolot4" SortExpression="tolot4" UniqueName="tolot4">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot5" DataField="tolot5" AllowFiltering="true"
                    ColumnGroupName="tolot5" SortExpression="tolot5" UniqueName="tolot5">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot6" DataField="tolot6" AllowFiltering="true"
                    ColumnGroupName="tolot6" SortExpression="tolot6" UniqueName="tolot6">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot7" DataField="tolot7" AllowFiltering="true"
                    ColumnGroupName="tolot7" SortExpression="tolot7" UniqueName="tolot7">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot8" DataField="tolot8" AllowFiltering="true"
                    ColumnGroupName="tolot8" SortExpression="tolot8" UniqueName="tolot8">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot9" DataField="tolot9" AllowFiltering="true"
                    ColumnGroupName="tolot9" SortExpression="tolot9" UniqueName="tolot9">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot10" DataField="tolot10" AllowFiltering="true"
                    ColumnGroupName="tolot10" SortExpression="tolot10" UniqueName="tolot10">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot11" DataField="tolot11" AllowFiltering="true"
                    ColumnGroupName="tolot11" SortExpression="tolot11" UniqueName="tolot11">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot12" DataField="tolot12" AllowFiltering="true"
                    ColumnGroupName="tolot12" SortExpression="tolot12" UniqueName="tolot12">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot13" DataField="tolot13" AllowFiltering="true"
                    ColumnGroupName="tolot13" SortExpression="tolot12" UniqueName="tolot13">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot14" DataField="tolot14" AllowFiltering="true"
                    ColumnGroupName="tolot14" SortExpression="tolot12" UniqueName="tolot14">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot15" DataField="tolot15" AllowFiltering="true"
                    ColumnGroupName="tolot15" SortExpression="tolot12" UniqueName="tolot15">
                </telerik:GridBoundColumn>
            </Columns>
                </telerik:GridTableView>
            </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
