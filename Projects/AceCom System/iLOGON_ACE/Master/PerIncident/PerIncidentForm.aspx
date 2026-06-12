<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PerIncidentForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.PerIncident.PerIncidentForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>PerIncident</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 1050px;
        }
    </style>
</head>


<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
     <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="False"
        AutoPostBack="True" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Attc" Value="100" runat="server">
            </telerik:RadTab>           
        </Tabs>
    </telerik:RadTabStrip>
<table>
        <tr>
            <td><br />
                &nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" >
<%--      	<asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="True" Text="Search Results"
		Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button>--%>
            <br />
         &nbsp;
            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
            <table>
                <tr>
                    <td valign="top">
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>                   
                </tr>
            </table>
  
    
    
    <%--<table id="table1" width="100%" border="0" runat="server">
        <tr>
            <td class="style1">
                &nbsp;
                <input id="tab1" class="TabTitle" value="Main Info" onclick='clickRow(1, "table1");'
                    style='cursor: pointer' runat="server">
            </td>
            <%--<td align="right">&nbsp						
					    <asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="True" Text="Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button></td>--%>
       <%-- </tr>--%>
        <%--<tr>
            <td colspan="2" class="style1">
                <br />
                &nbsp<asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    Style="z-index: 0" OnClick="UpdateBtn_Click"></asp:Button>&nbsp<asp:Label ID="IdLbl"
                        runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>--%>
    <table width="100%" border="0">
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
            <td colspan="2">
                <asp:Panel ID="FileUploadPanel" runat="server">
                    <table border="0" cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td width="150px">
                                <asp:CheckBox ID="ReAttachedChkBox" runat="server" Checked="False" Style="z-index: 0"
                                    Text="Re-Attach" AutoPostBack="true" OnCheckedChanged="ReAttachedChkBox_CheckedChanged" Visible="false" />
                            </td>
                            <td>
                                <input id="ImageFile" type="file" name="ImageFile" visible="false" runat="server">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table width="100%" border="0"><tr><td colspan="2" class="style1">    
         <asp:Button ID="AddPerIncDetlBtn" CssClass="white" runat="server" OnClick="AddPerIncDetlBtn_Click" Text="NewLine" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
        <br />&nbsp
    
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        AllowPaging="true" OnCancelCommand="ResultDG_Cancel" OnEditCommand="ResultDG_EditCommand"
        OnUpdateCommand="ResultDG_Update" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" align="absmiddle" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            CommandName="Edit"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="PerIncidentDetlDelete" runat="server">
                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete incidentDetl"
                                runat="server" align="absmiddle" /></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="PerDetlUpdate" ImageUrl="../../image/floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="PerDetlCancel" ImageUrl="../../image/arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="perincid" SortExpression="perincid" HeaderText="PerIncID"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="Personnel">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "pername")  %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="perDDL" DataMember="" DataTextField="descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(perListDS,DataBinder.Eval(Container.DataItem, "perid").ToString()) %>'
                            DataSource='<%# perListDS%>' runat="server" skin="WebBlue" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="jbno" SortExpression="jbno" UniqueName="jbno"
                    HeaderText="JobNo">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "jbno") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="JbNoTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "jbno") %>' 
                        OnTextChanged="ResultDG_OnTextChanged" AutoPostBack="true" skin="WebBlue" >
                        </telerik:RadTextBox>
                        <asp:Label ID="jbidLbl" runat="server" Visible="false" ></asp:Label>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="VehicleNo">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "vehno") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="vehnoDDL" DataMember="" DataTextField="descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "vehno").ToString()) %>'
                            DataSource='<%# vehListDS%>' runat="server" skin="WebBlue" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Type">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "type") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="typeDDL" DataMember="" DataTextField="descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(typeListDS,DataBinder.Eval(Container.DataItem, "type").ToString()) %>'
                            DataSource='<%# typeListDS%>' runat="server" skin="WebBlue" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="rem1" SortExpression="rem1" UniqueName="rem1"
                    HeaderText="Rem1">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "rem1") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="Rem1Txt" runat="server" skin="WebBlue" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="rem2" SortExpression="rem2" UniqueName="rem2"
                    HeaderText="Rem2">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "rem2") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="Rem2Txt" runat="server" skin="WebBlue" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "rem2") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Status">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "status") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="statusDDL" DataMember="" DataTextField="descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusDS,DataBinder.Eval(Container.DataItem, "status").ToString()) %>'
                            DataSource='<%# statusDS%>' runat="server" skin="WebBlue" /></EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                    ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                    ReadOnly="true">
                </telerik:GridBoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </MasterTableView>
    </telerik:RadGrid>
    </td>
    </tr>
    </table>
     </telerik:RadPageView>
        
    <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
    </telerik:RadPageView>    
 </telerik:RadMultiPage>
    
    </form>
</body>
</html>
