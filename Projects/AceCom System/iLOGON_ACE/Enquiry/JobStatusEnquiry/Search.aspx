<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Enquiry.JobStatusEnquiry.Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobStatusEnquiry</title>
    <%--    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">--%>

    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <style type="text/css">
        #Form2 {
            height: 332px;
            width: 599px;
        }
    </style>
</head>
<body onload="javascript:window.focus();">
    <form id="Form2" method="post" runat="server">

        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="400px" runat="server">
            <tr>
                <td width="200px">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <asp:Button ID="Searchbtn" runat="server" CssClass="white" Text="Search"
            OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label>
        &nbsp;
        &nbsp;
        <table>
            <tr>
                <td>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                        AllowFilteringByColumn="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace">
                            <Columns>
                                <telerik:GridBoundColumn HeaderText="Number" DataField="number" AllowFiltering="false"
                                    ColumnGroupName="number" SortExpression="number" UniqueName="number"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Reference1" DataField="exref1" AllowFiltering="false"
                                    ColumnGroupName="exref1" SortExpression="exref1" UniqueName="exref1"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Reference2" DataField="exref2" AllowFiltering="false"
                                    ColumnGroupName="exref2" SortExpression="exref2" UniqueName="exref2"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="false"
                                    ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Permit" DataField="permitno" AllowFiltering="false"
                                    ColumnGroupName="permitno" SortExpression="permitno" UniqueName="permitno"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <br />
                    <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG2_NeedDataSource" AllowPaging="true" AllowSorting="true"
                        AllowFilteringByColumn="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderText="S/N">
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="Task" DataField="taskcodedescr" AllowFiltering="false"
                                    ColumnGroupName="taskcodedescr" SortExpression="taskcodedescr" UniqueName="taskcodedescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn HeaderText="Start Date" DataField="startdate" AllowFiltering="false"
                                    ColumnGroupName="startdate" SortExpression="startdate" UniqueName="startdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss tt}">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn HeaderText="Start Status" DataField="startstatusdescr" AllowFiltering="false"
                                    ColumnGroupName="startstatusdescr" SortExpression="startstatusdescr" UniqueName="startstatusdescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Start Reason" DataField="startreason" AllowFiltering="false"
                                    ColumnGroupName="startreason" SortExpression="startreason" UniqueName="startreason"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Start Remarks" DataField="startremarks" AllowFiltering="false"
                                    ColumnGroupName="startremarks" SortExpression="startremarks" UniqueName="startremarks"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn HeaderText="End Date" DataField="enddate" AllowFiltering="false"
                                    ColumnGroupName="enddate" SortExpression="enddate" UniqueName="enddate" Reorderable="true"
                                    DataFormatString="{0:dd/MMM/yyyy hh:mm:ss tt}">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn HeaderText="End Status" DataField="endstatusdescr" AllowFiltering="false"
                                    ColumnGroupName="endstatusdescr" SortExpression="endstatusdescr" UniqueName="endstatusdescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="End Reason" DataField="endreason" AllowFiltering="false"
                                    ColumnGroupName="endreason" SortExpression="endreason" UniqueName="endreason"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="End Remarks" DataField="endremarks" AllowFiltering="false"
                                    ColumnGroupName="endremarks" SortExpression="endremarks" UniqueName="endremarks"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Resource" DataField="resource" AllowFiltering="false"
                                    ColumnGroupName="resource" SortExpression="resource" UniqueName="resource" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <td>
            </tr>
        </table>


        <table>
            <tr>
                <td>
                    <br />
                    <telerik:RadGrid ID="ResultDG3" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG3_NeedDataSource" AllowPaging="true" AllowSorting="true"
                        AllowFilteringByColumn="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderText="S/N">
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" AllowFiltering="false"
                                    ColumnGroupName="startremarks" SortExpression="startremarks" UniqueName="startremarks"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn HeaderText="AddDate" DataField="AddDate" AllowFiltering="false"
                                    ColumnGroupName="startdate" SortExpression="startdate" UniqueName="startdate"
                                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss tt}">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn HeaderText="AddUser" DataField="AddUser" AllowFiltering="false"
                                    ColumnGroupName="startstatusdescr" SortExpression="startstatusdescr" UniqueName="startstatusdescr"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>                                
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <td>
            </tr>
        </table>


    </form>
</body>
</html>
