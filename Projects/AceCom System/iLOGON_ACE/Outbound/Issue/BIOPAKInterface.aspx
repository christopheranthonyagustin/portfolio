<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BIOPAKInterface.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.BIOPAKInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BIOPAKInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Interface" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
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
                    <telerik:RadButton ID="UndoBtn" Visible="false" runat="server" OnClick="UndoBtn_Click" Text="   Undo   " Skin="WebBlue">
                    </telerik:RadButton>
                    <telerik:RadButton ID="IgnoreBtn" Visible="false" runat="server" OnClick="IgnoreBtn_Click" Text="  Ignore  " Skin="WebBlue">
                    </telerik:RadButton>
                    <br />
                    <br />
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="false" Width="100%"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="false" AllowMultiRowSelection="true" CellPadding="2"
            UseAccessibleHeader="True" Skin="Metro" Height="430px" ClientSettings-AllowColumnsReorder="true">

            <ClientSettings>
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" />
            </ClientSettings>
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Reference" DataField="reference"
                        SortExpression="reference" UniqueName="reference" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Delivery" DataField="delivery"
                        SortExpression="delivery" UniqueName="delivery" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PickSlip" DataField="pickslip"
                        SortExpression="pickslip" UniqueName="pickslip" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Date" DataField="expdate"
                        SortExpression="expdate" UniqueName="expdate" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Bill_to_name" DataField="bill_to_name"
                        SortExpression="bill_to_name" UniqueName="bill_to_name" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Ship_to_name" DataField="ship_to_name"
                        SortExpression="ship_to_name" UniqueName="ship_to_name" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Ship_to_Country" DataField="ship_to_country"
                        SortExpression="ship_to_country" UniqueName="ship_to_country" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Filename" DataField="filename"
                        SortExpression="filename" UniqueName="filename" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FilesReceived" DataField="filereceived"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Filepath" DataField="filepath"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="processid" DataField="processid"
                        SortExpression="processid" UniqueName="processid" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="id" DataField="id"
                        SortExpression="id" UniqueName="id" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
