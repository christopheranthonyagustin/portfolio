<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterPack.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterPack" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>FMJobRegisterPack</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="UpdateJobVolWtBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp;&nbsp;&nbsp;&nbsp;Update&nbsp;&nbsp;&nbsp;&nbsp; Job Vol Wt"
                        OnClick="UpdateJobVolWtBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" />
                    &nbsp;
                     <asp:Button ID="DeleteBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp;&nbsp;&nbsp;&nbsp;Delete&nbsp;&nbsp;&nbsp;&nbsp;"
                         OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcelBtn_Click" Text="Excel"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />
                    &nbsp;
                     <asp:Button ID="GenerateDONumberBtn" runat="server" CssClass="LongLabelWhite" Text="Generate DONumber"
                         OnClick="GenerateDONumberBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                     <asp:Button ID="ShippingReleaseDOBtn" runat="server" CssClass="LongLabelBlue" Text="Shipping Release/DO"
                         OnClick="ShippingReleaseDOBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                     <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                        OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)"  UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label runat="server" ID="TotalValueLbl" Visible="false" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    <asp:Label runat="server" ID="ErrorLbl" Visible="false" Font-Size="Medium" Font-Bold="true" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnEditCommand="ResultDG_Edit"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
            OnUpdateCommand="ResultDG_Update">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" EditMode="InPlace" CommandItemDisplay="Top">
                <CommandItemSettings ShowRefreshButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="true" ID="Edit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ResultDG_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    title="Delete" runat="server" visible="true" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            &nbsp; &nbsp; 
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            <telerik:RadNumericTextBox ID="Id" runat="server" Visible="false" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Sno" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                        AllowFiltering="false" HeaderText="Sno" SortExpression="Sno">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="DONumber" SortExpression="DONumber" HeaderText="DONumber" UniqueName="DONumber"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn UniqueName="DODeliveryDate" HeaderText="DODeliveryDate">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="DODeliveryDate" Text='<%# Eval("DODeliveryDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="DODeliveryDate" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true"
                                  DateInput-DateFormat="dd/MMM/yyyy" Skin="Office2007" Width="120">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridTemplateColumn UniqueName="FMCSLCtnrId" HeaderText="Containers">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# Eval("ContainerNumber") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="FMCSLCtnrId" runat="server" Skin="WebBlue" RenderMode="Lightweight"
                                DataValueField="item" DataTextField="descr" DataSource='<%# ContainerDS%>' Width="120px" DropDownWidth="120px"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ContainerDS,DataBinder.Eval(Container.DataItem, "ContainerNumber").ToString())%>'
                                OnSelectedIndexChanged="FMCSLCtnrId_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                   <telerik:GridTemplateColumn UniqueName="ItemDescription" HeaderText="Item Description" >
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# Eval("ItemDescription") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="ItemDescription" runat="server" Text='<%# Eval("ItemDescription") %>' Skin="Office2007" Width="120px" TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="MarksAndNumbers" HeaderText="Marks And Numbers">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# Eval("MarksAndNumbers") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="MarksAndNumbers" runat="server" Text='<%# Eval("MarksAndNumbers") %>' Skin="Office2007" Width="120px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Length" HeaderText="Length x Width x Height">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# string.Format("{0:0.000}",Eval("Length")) %>
                            <asp:Label runat="server" Text="x" />
                            <%# string.Format("{0:0.000}",Eval("Width")) %>
                            <asp:Label runat="server" Text="x" />
                            <%# string.Format("{0:###.000}",Eval("Height")) %>
                            <%# DataBinder.Eval(Container.DataItem, "DIMSUOM") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox runat="server" ID="Length" Text='<%# Eval("Length") %>' Skin="Office2007" Width="70px" NumberFormat-DecimalDigits="3">
                            </telerik:RadNumericTextBox>
                            <asp:Label runat="server" Text="x" />
                            <telerik:RadNumericTextBox runat="server" ID="Width" Text='<%# Eval("Width") %>' Skin="Office2007" Width="70px" NumberFormat-DecimalDigits="3">
                            </telerik:RadNumericTextBox>
                            <asp:Label runat="server" Text="x" />
                            <telerik:RadNumericTextBox runat="server" ID="Height" Text='<%# Eval("Height") %>' Skin="Office2007" Width="70px" NumberFormat-DecimalDigits="3">
                            </telerik:RadNumericTextBox>
                            <telerik:RadComboBox ID="DimsUOM" runat="server" ExpandDirection="Down" Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false"
                                DataValueField="item" DataTextField="descr" DataSource='<%# FMDIMSUOMDS%>' Width="115px" DropDownWidth="140px" AllowCustomText="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(FMDIMSUOMDS,DataBinder.Eval(Container.DataItem, "DIMSUOM").ToString())%>'
                                OnSelectedIndexChanged="DimsUOM_SelectedIndexChanged" AutoPostBack="true">
                            </telerik:RadComboBox>
                            <asp:CompareValidator ID="LengthCompVal" runat="server" ControlToValidate="Length"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                            <asp:CompareValidator ID="WidthCompVal" runat="server" ControlToValidate="Width"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                            <asp:CompareValidator ID="HeightCompVal" runat="server" ControlToValidate="Height"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Packs" HeaderText="Packs">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# string.Format("{0:0.000}",Eval("NoofPack")) %>
                            <%# DataBinder.Eval(Container.DataItem, "PackUOM")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox runat="server" ID="Packs" Text='<%# Eval("NoofPack") %>' Skin="Office2007" Width="70px" NumberFormat-DecimalDigits="3">
                            </telerik:RadNumericTextBox>
                            <asp:CompareValidator ID="PacksCompVal" runat="server" ControlToValidate="Packs"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" />
                            <telerik:RadComboBox ID="PackUOM" runat="server" ExpandDirection="Down" Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false"
                                DataValueField="item" DataTextField="descr" DataSource='<%# PacksUOMDS%>' Width="115px" DropDownWidth="140px" AllowCustomText="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PacksUOMDS,DataBinder.Eval(Container.DataItem, "PackUOM").ToString())%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Vol" HeaderText="Vol">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# string.Format("{0:0.000}",Eval("Vol")) %>
                            <%# DataBinder.Eval(Container.DataItem, "VolUOM") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox runat="server" ID="Vol" Text='<%# Eval("Vol") %>' Skin="Office2007" Width="70px" NumberFormat-DecimalDigits="3">
                            </telerik:RadNumericTextBox>
                            <telerik:RadComboBox ID="VolUOM" runat="server" ExpandDirection="Down" Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false"
                                DataValueField="item" DataTextField="descr" DataSource='<%# VOLUOMDS%>' Width="115px" DropDownWidth="140px" AllowCustomText="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VOLUOMDS,DataBinder.Eval(Container.DataItem, "VolUOM").ToString())%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="GrossWT" HeaderText="GrossWT">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# string.Format("{0:0.000}",Eval("GrossWT")) %>
                            <%# DataBinder.Eval(Container.DataItem, "GrossWTUOM")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox runat="server" ID="GrossWT" Text='<%# Eval("GrossWT") %>' Skin="Office2007" Width="70px" NumberFormat-DecimalDigits="3">
                            </telerik:RadNumericTextBox>
                            <asp:CompareValidator ID="GrossWTCompVal" runat="server" ControlToValidate="GrossWT"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                            <telerik:RadComboBox ID="GrossWTUOM" runat="server" ExpandDirection="Down" Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false"
                                DataValueField="item" DataTextField="descr" DataSource='<%# WTUOMDS%>' Width="115px" DropDownWidth="140px" AllowCustomText="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(WTUOMDS,DataBinder.Eval(Container.DataItem, "GrossWTUOM").ToString())%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="NetWT" HeaderText="NetWT">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# string.Format("{0:0.000}",Eval("NetWT")) %>
                            <%# DataBinder.Eval(Container.DataItem, "NetWTUOM")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox runat="server" ID="NetWT" Text='<%# Eval("NetWT") %>' Skin="Office2007" Width="70px" NumberFormat-DecimalDigits="3">
                            </telerik:RadNumericTextBox>
                            <asp:CompareValidator ID="NetWTCompVal" runat="server" ControlToValidate="NetWT"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                            <telerik:RadComboBox ID="NetWTUOM" runat="server" ExpandDirection="Down" Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false"
                                DataValueField="item" DataTextField="descr" DataSource='<%# WTUOMDS%>' Width="115px" DropDownWidth="140px" AllowCustomText="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(WTUOMDS,DataBinder.Eval(Container.DataItem, "NetWTUOM").ToString())%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="CtnrRemarks" HeaderText="ContainerRemarks">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# Eval("CtnrRemarks") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="CtnrRemarks" runat="server" Text='<%# Eval("CtnrRemarks") %>' Skin="Office2007" Width="120px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate" UniqueName="adddate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser" UniqueName="adduser"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate" UniqueName="editdate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser" UniqueName="edituser"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
