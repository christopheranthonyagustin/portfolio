<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VERTIVInterface.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.VERTIVInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>VertivInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" />
                </td>
            </tr>
            <tr>
                <td>
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
                    <telerik:RadButton ID="UploadBtn" runat="server" OnClick="UploadBtn_Click" Text=" Upload " OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Click to Upload Selected Files"
                        UseSubmitBehavior="false" CssClass="white">
                    </telerik:RadButton>
                    <telerik:RadButton ID="IgnoreBtn" runat="server" OnClick="IgnoreBtn_Click" visible="false" Text=" Ignore " OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Click to Ignore Selected Files"
                        UseSubmitBehavior="false" CssClass="white">
                    </telerik:RadButton>                    
                    <br />
                    <br />
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="false" Width="100%"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="false" AllowMultiRowSelection="true" CellPadding="2"
            UseAccessibleHeader="True" Skin="Office2007" Height="430px" ClientSettings-AllowColumnsReorder="true">

            <ClientSettings>
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" />
            </ClientSettings>
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="PONo" DataField="pono"
                        SortExpression="pono" UniqueName="pono" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="type"
                        SortExpression="type" UniqueName="type" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vendor" DataField="sucode"
                        SortExpression="sucode" UniqueName="sucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filename" DataField="filename"
                        SortExpression="filename" UniqueName="filename" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FilesReceived" DataField="filereceived"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Filepath" DataField="filepath"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
