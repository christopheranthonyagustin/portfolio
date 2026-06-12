$(document).ready(function () {

    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');


    $("#VehicleExportExcel").click(function () {
        $('#vehicles-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Vehicles" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#VehicleExportExcelEN").click(function () {
        $('#vehicles-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Vehicles" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#VehicleExportPDF").click(function () {
        $('#vehicles-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Vehicles" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#VehicleExportPDFEN").click(function () {
        $('#vehicles-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Vehicles" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#VehicleExportWord").click(function () {
        $('#vehicles-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Vehicles" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#VehicleExportWordEN").click(function () {
        $('#vehicles-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Vehicles" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });



    //======================================================================================================================//


    $("#ZonesExportExcel").click(function () {
        $('#zones-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Zones" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ZonesExportExcelEN").click(function () {
        $('#zones-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Zones" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ZonesExportPDF").click(function () {
        $('#zones-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Zones" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ZonesExportPDFEN").click(function () {
        $('#zones-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Zones" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ZonesExportWord").click(function () {
        $('#zones-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Zones" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ZonesExportWordEN").click(function () {
        $('#zones-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Zones" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    //======================================================================================================================//


    $("#CompaniesExportExcel").click(function () {
        $('#companies-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Companies" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#CompaniesExportExcelEN").click(function () {
        $('#companies-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Companies" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#CompaniesExportPDF").click(function () {
        $('#companies-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Companies" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#CompaniesExportPDFEN").click(function () {
        $('#companies-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Companies" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#CompaniesExportWord").click(function () {
        $('#companies-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Companies" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#CompaniesExportWordEN").click(function () {
        $('#companies-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Companies" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });


    //======================================================================================================================//


    $("#UsersExportExcel").click(function () {
        $('#users-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Users" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#UsersExportExcelEN").click(function () {
        $('#users-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Users" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#UsersExportPDF").click(function () {
        $('#users-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Users" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#UsersExportPDFEN").click(function () {
        $('#users-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Users" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#UsersExportWord").click(function () {
        $('#users-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Users" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#UsersExportWordEN").click(function () {
        $('#users-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Users" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });


    //======================================================================================================================//


    $("#DeviceExportExcel").click(function () {
        $('#devices-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Devices" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DeviceExportExcelEN").click(function () {
        $('#devices-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Devices" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DeviceExportPDF").click(function () {
        $('#devices-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Devices" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DeviceExportPDFEN").click(function () {
        $('#devices-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Devices" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DeviceExportWord").click(function () {
        $('#devices-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Devices" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DeviceExportWordEN").click(function () {
        $('#devices-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Devices" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });



    //======================================================================================================================//


    $("#ResellerExportExcel").click(function () {
        $('#reseller-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Reseller" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ResellerExportExcelEN").click(function () {
        $('#reseller-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Reseller" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ResellerExportPDF").click(function () {
        $('#reseller-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Reseller" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ResellerExportPDFEN").click(function () {
        $('#reseller-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Reseller" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ResellerExportWord").click(function () {
        $('#reseller-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Reseller" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#ResellerExportWordEN").click(function () {
        $('#reseller-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Reseller" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    //======================================================================================================================//

        $("#DriverExportExcel").click(function () {
        $('#drivers-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Driver" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DriverExportExcelEN").click(function () {
        $('#drivers-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Driver" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DriverExportPDF").click(function () {
        $('#drivers-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 7,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Driver" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DriverExportPDFEN").click(function () {
        $('#drivers-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 7,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Driver" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DriverExportWord").click(function () {
        $('#drivers-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Driver" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#DriverExportWordEN").click(function () {
        $('#drivers-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Driver" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    //======================================================================================================================//

    //======================================================================================================================//

        $("#InventoryExportExcel").click(function () {
        $('#inventory-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Inventory" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#InventoryExportExcelEN").click(function () {
        $('#inventory-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Inventory" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#InventoryExportPDF").click(function () {
        $('#inventory-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 7,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Inventory" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#InventoryExportPDFEN").click(function () {
        $('#inventory-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 7,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Inventory" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#InventoryExportWord").click(function () {
        $('#inventory-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Inventory" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#InventoryExportWordEN").click(function () {
        $('#inventory-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Inventory" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    //======================================================================================================================//  

    $("#JobExportExcel").click(function () {
        $('#jobs-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Jobs" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#JobExportExcelEN").click(function () {
        $('#jobs-editable').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Jobs" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#JobExportPDF").click(function () {
        $('#jobs-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Jobs" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#JobExportPDFEN").click(function () {
        $('#jobs-editable').tableExport({
            type: 'pdf',
            escape: 'false',
            pdfFontSize: 8,
            pdfLeftMargin: 0,
            fileName: "[" + getSessionstorageValueCompany + "] Jobs" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#JobExportWord").click(function () {
        $('#jobs-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Jobs" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#JobExportWordEN").click(function () {
        $('#jobs-editable').tableExport({
            type: 'doc',
            escape: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Jobs" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });



});






