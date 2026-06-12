<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderRegistrationRoute.aspx.cs" Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderRegistrationRoute" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TankOrderTask</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />

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
    <form id="form1" method="post" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;<asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png" Visible="false"
                    OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                    ToolTip="Delete" />
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"  
        AllowFilteringByColumn="false" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
        OnEditCommand="ResultDG_Edit" OnUpdateCommand="ResultDG_Update" OnItemCommand="ResultDG_ItemCommand">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
            EditMode="InPlace">
            <Columns>
                <telerik:GridTemplateColumn UniqueName="icon" Reorderable="false">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="370px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="370px" />
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="RouteDetail_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                title="Delete Detail" runat="server" /></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="serialno" AllowFiltering="false" HeaderText="S/N">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="30px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="30px" />
                    <ItemTemplate>
                    </ItemTemplate>
                    <EditItemTemplate>
                        &nbsp;
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="FrPort" HeaderText="FrPort">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "frport")%> 
                    </ItemTemplate>
                    <EditItemTemplate>    
                        <telerik:RadComboBox ID="FrPortList" runat="server" DefaultMessage="Select a FrServicePt" OnSelectedIndexChanged="Port_SelectedIndexChanged"
                                     Skin="Sunset" DropDownHeight="150px" DataSource='<%# portListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(portListDS,DataBinder.Eval(Container.DataItem, "frport").ToString())%>'
                                        DataTextField="descr" DataValueField="item"  RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" BackColor="#ded7c6" >
                                    </telerik:RadComboBox>
                                   <asp:TextBox ID="FrPortListTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "frport") %>' BackColor="#ded7c6"/>                                                           
                        <asp:RequiredFieldValidator ID="FrPortListReqVal" runat="server" ControlToValidate="FrPortList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="FrTypeList" HeaderText="FrType">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="100px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "FrServicePtType")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="FrTypeList" runat="server" DefaultMessage="Select a FrType" OnSelectedIndexChanged="FrTypeList_SelectedIndexChanged"
                            DropDownHeight="150px" Skin="WebBlue" DataSource='<%# frServicePtTypeListDS %>' AutoPostBack="true" CausesValidation="false" DataTextField="descr" DataValueField="item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(frServicePtTypeListDS,DataBinder.Eval(Container.DataItem, "FrServicePtType").ToString())%>'>
                        </telerik:RadDropDownList>

                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="FrServicePt" HeaderText="FrServicePt">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "FrServicePt")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="FrServicePtList" runat="server" DefaultMessage="Select a FrServicePt" 
                                     Skin="Sunset" DropDownHeight="150px" 
                                        DataTextField="descr" DataValueField="item"  RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" BackColor="#ded7c6" >
                                    </telerik:RadComboBox>
                                    <%--DataSource='<%# frServicePtDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(toportListDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'--%>
                                   <asp:TextBox ID="FrServicePtTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "FrServicePt") %>' BackColor="#ded7c6"/>  
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="ToPort" HeaderText="ToPort">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ToPort")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="ToPortList" runat="server" DefaultMessage="Select a To Port" OnSelectedIndexChanged="ToPort_SelectedIndexChanged"
                                     Skin="Sunset" DropDownHeight="150px" DataSource='<%# toportListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(toportListDS,DataBinder.Eval(Container.DataItem, "ToPort").ToString())%>'
                                        DataTextField="descr" DataValueField="item"  RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" BackColor="#ded7c6" >
                                    </telerik:RadComboBox>
                                   <asp:TextBox ID="ToPortTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "ToPort") %>' BackColor="#ded7c6"/>
  <%--
                        <asp:RequiredFieldValidator ID="ToPortReqVal" runat="server" ControlToValidate="ToPortList"
                            ErrorMessage="*" />--%>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="totype" HeaderText="ToType">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="100px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ToServicePtType")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="ToTypeList" runat="server" DefaultMessage="Select a ToType" OnSelectedIndexChanged="ToTypeList_SelectedIndexChanged"
                            DropDownHeight="150px" Skin="WebBlue" DataSource='<%# toServicePtTypeListDS %>' AutoPostBack="true" CausesValidation="false" 
                            DataTextField="descr" DataValueField="item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(toServicePtTypeListDS,DataBinder.Eval(Container.DataItem, "ToServicePtType").ToString())%>'>
                        </telerik:RadDropDownList>
                
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="toservicept" HeaderText="ToServicePt">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "ToServicePt")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                         <telerik:RadComboBox ID="ToServicePtList" runat="server" DefaultMessage="Select a To Port" 
                                     Skin="Sunset" DropDownHeight="150px" 
                                        DataTextField="descr" DataValueField="item"  RenderMode="Lightweight" Filter="Contains"
                                        AutoPostBack="true" CausesValidation="false" BackColor="#ded7c6" >
                                    </telerik:RadComboBox>
                                   <asp:TextBox ID="ToServicePtListTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "ToServicePt") %>' BackColor="#ded7c6"/>
  <%--DataSource='<%# toServicePtListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(toServicePtListDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'--%>
                        <%--<asp:RequiredFieldValidator ID="ToServicePtListReqVal" runat="server" ControlToValidate="ToServicePtList"
                            ErrorMessage="*" />--%>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="remarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="Remarks" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' 
                            TextMode="MultiLine" Rows="2" Width="90%">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="statuscolour" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
