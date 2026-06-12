<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="ReleaseOrderDetl2.ascx.cs"
    Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrderDetl2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
<asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
    runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
</asp:Button>&nbsp;
<asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
    CommandName="Cancel"></asp:Button>
