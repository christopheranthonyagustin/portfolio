<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SGTraDexManagerParticipant.aspx.cs" Inherits="iWMS.Web.Interface.SGTraDexManager.SGTraDexManagerParticipant" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SGTraDexManager Participant</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>


    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="EntityTab" Text="Entity" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AccountTab" Text="Account" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CarrierTab" Text="Carrier" Value="100" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ContainerDepotOperatorTab" Text="Container Depot Operator" Value="150" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PortOperatorTab" Text="Port Operator" Value="200" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="HaulierGPSProviderTab" Text="Haulier GPS Provider" Value="250" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MasterListRadPageView">
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="Button1" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" EnableLinqExpressions="false"
                    AllowPaging="false" Skin="Metro" AllowSorting="true" AllowFilteringByColumn="false" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemCommand="ResultDG_ItemCommand" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>

                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" CommandItemDisplay="Top" DataKeyNames="Id" EditMode="InPlace">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>

                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="BillofMaterialEdit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BillofMaterialDelete"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="Delete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="S/No" HeaderText="S/No" ReadOnly="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn UniqueName="Code" HeaderText="Code">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Code") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="CodeComBo" Text='<%# DataBinder.Eval(Container.DataItem, "Code") %>' runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155"
                                        EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="ItemComBo_ItemsRequested" OnSelectedIndexChanged="ItemComBo_SelectedIndexChanged"
                                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="ItemComBo_Load">
                                    </telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ControlToValidate="CodeComBo" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />

                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Name">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Name")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="NameTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ParticipantId" HeaderText="Participant Id" Display="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ParticipantId") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="ParticipantIdTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParticipantId") %>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="ParticipantIdTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn UniqueName="ParticipantName" HeaderText="Participant Name" Display="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ParticipantName") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="ParticipantIdTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParticipantName") %>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="ParticipantNameTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn UniqueName="PitstopEndpoint" HeaderText="Pitstop Endpoint" Display="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Pitstop_Endpoint") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="PitstopEndpointTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Pitstop_Endpoint") %>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="PitstopEndpointTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn UniqueName="HeaderKey" HeaderText="Header Key" Display="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Header_Key") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="HeaderKeyTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Header_Key") %>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="HeaderKeyTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn UniqueName="BodyKey" HeaderText="Body Key" Display="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Body_Key") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="BodyKeyTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Body_Key") %>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="BodyKeyTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>                            
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="1080px" ID="SGTraDexManagerParticipantAccountRadPageView" />
            <telerik:RadPageView runat="server" Height="1080px" ID="SGTraDexManagerParticipantCarrierRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SGTraDexManagerParticipantContainerDepotOperatorRadPageView" />
            <telerik:RadPageView runat="server" Height="1080px" ID="SGTraDexManagerParticipantPortOperatorRadPageView" />
            <telerik:RadPageView runat="server" Height="1080px" ID="SGTraDexManagerParticipantHaulierGPSProviderRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
