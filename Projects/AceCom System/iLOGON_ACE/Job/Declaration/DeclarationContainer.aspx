<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeclarationContainer.aspx.cs" Inherits="iWMS.Web.Job.Declaration.DeclarationContainer" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Declaration Container</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;
                <asp:Button ID="AddDetailBtn" runat="server" CssClass="white" Visible="false" Text="New"
                    OnClick="AddDetailBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                
                &nbsp;<br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                    <table id="Table1" border="0" cellspacing="1" cellpadding="1">
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="SaveNextBtn" CssClass="white" runat="server" 
                                                OnClick="SaveNextBtn_Click" Text="Save &amp; Next"  
                                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"  
                                                Text="Save" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="ClosePanelBtn" CssClass="white" runat="server" OnClick="ClosePanelBtn_Click"  
                                                Text="Hide" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="CtnrNoReqlb1" runat="server">Container No.</asp:Label>
                                    <asp:RequiredFieldValidator Style="z-index: 0" ID="CtnrNoReq" runat="server" Width="155px"
                                        ControlToValidate="CtnrNoTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                    <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                </td>
                                <td >
                                    <asp:Label ID="SizeTypeReqlb1" runat="server">Size/Type</asp:Label>
                                    <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" Width="155px" ControlToValidate="SizeTypeList"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                    <telerik:RadDropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" Skin="Sunset">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="WeightReqlb1" runat="server">Weight</asp:Label>
                                    <asp:CompareValidator Style="z-index: 0" ID="WeightCompareVal" runat="server" ControlToValidate="WeightTxt"
                                        ErrorMessage="#" ForeColor="Red" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator Style="z-index: 0" ID="WeightReq" runat="server" Width="155px"
                                        ControlToValidate="WeightTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <telerik:RadTextBox ID="WeightTxt" runat="server" Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="SealNoReqlb1" runat="server">Seal No.</asp:Label>
                                    <asp:RequiredFieldValidator ID="SealNoReq" runat="server" Width="155px" ControlToValidate="SealNoTxt"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                    <telerik:RadTextBox Style="z-index: 0" ID="SealNoTxt" runat="server" Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 80%" id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            Style="margin-bottom: 200px">
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
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="Detail_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    runat="server"></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Container No."
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Size/Type"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="wt" SortExpression="wt" HeaderText="Weight"
                        DataFormatString="{0:#0##}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="Seal No."
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
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
    </div>
    </form>
</body>
</html>
