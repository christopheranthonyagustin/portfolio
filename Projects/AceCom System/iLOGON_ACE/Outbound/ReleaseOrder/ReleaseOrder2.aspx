<%@ Page Language="c#" CodeBehind="ReleaseOrder2.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrder2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReleaseOrder2</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            var currentLoadingPanel = null;
            var currentUpdatedControl = null;
            function RequestStart(sender, args) {
                currentLoadingPanel = $find("<%= RadAjaxLoadingPanel1.ClientID %>");

                currentUpdatedControl = "<%= ResultRadGrid.ClientID %>";
                //show the loading panel over the updated control
                currentLoadingPanel.show(currentUpdatedControl);
            }
            function ResponseEnd() {
                //hide the loading panel and clean up the global variables
                if (currentLoadingPanel != null)
                    currentLoadingPanel.hide(currentUpdatedControl);
                currentUpdatedControl = null;
                currentLoadingPanel = null;
            }
        </script>

    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="Button1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ResultRadGrid" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ResultRadGrid" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
        <ClientEvents OnRequestStart="RequestStart" OnResponseEnd="ResponseEnd" />
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <div id="demo">
        <telerik:RadGrid ID="ResultRadGrid" runat="server" AllowPaging="True" AllowSorting="True"
            OnItemDataBound="ResultRadGrid_ItemDataBound" AutoGenerateColumns="False" ShowStatusBar="true"
            Skin="Office2007" OnPreRender="ResultRadGrid_PreRender" OnNeedDataSource="ResultRadGrid_NeedDataSource"
            OnUpdateCommand="ResultRadGrid_UpdateCommand" OnInsertCommand="ResultRadGrid_InsertCommand"
            OnDeleteCommand="ResultRadGrid_DeleteCommand" PageSize="16">
            <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="id">
                <EditFormSettings>
                    <PopUpSettings Modal="false" />
                </EditFormSettings>
                <Columns>
                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn UniqueName="id" HeaderText="id" DataField="id" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="acid" HeaderText="acid" DataField="acid" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skuid" HeaderText="skuid" DataField="skuid"
                        Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skucode3" HeaderText="SKU/CustomsLot" DataField="skucode3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot4" HeaderText="CustomsLot" DataField="lot4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="uomqty" HeaderText="Qty" DataField="uomqty"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="uomdescr" HeaderText="UOM" DataField="uomdescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="SpecialInstruction" HeaderText="SpecialInstruction"
                        DataField="SpecialInstruction">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Remarks" HeaderText="Remarks" DataField="Remarks">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="adddate" HeaderText="AddDate" DataField="adddate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="adduser" HeaderText="AddUser" DataField="adduser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="editdate" HeaderText="EditDate" DataField="editdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="edituser" HeaderText="EditUser" DataField="edituser">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings UserControlName="ReleaseOrderDetl2.ascx" EditFormType="WebUserControl">
                    <EditColumn UniqueName="EditReleaseOrderDetl">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
