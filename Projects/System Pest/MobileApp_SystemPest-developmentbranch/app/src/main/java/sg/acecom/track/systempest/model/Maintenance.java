package sg.acecom.track.systempest.model;

/**
 * Created by jmingl on 26/6/18.
 */

public class Maintenance {

    int MaintenanceID;
    String Timestamp;
    String RxTime;
    String Address;
    String Postal;
    String Unit;
    String PIC;
    String Phone;
    String Email;
    String Site;
    String ContractStart;
    String ContractEnd;
    String MaintenanceInterval;
    String NotificationInterval;
    String Remarks;
    String NextJobDate;
    int CompanyID;
    int MaintenanceJobID;
    String AreaCovered;
    String ReferenceNo;
    String Pest;
    String Technician;

    public String getTechnician() {
        return Technician;
    }

    public void setTechnician(String technician) {
        Technician = technician;
    }

    public String getReferenceNo() {
        return ReferenceNo;
    }

    public void setReferenceNo(String referenceNo) {
        ReferenceNo = referenceNo;
    }

    public String getAreaCovered() {
        return AreaCovered;
    }

    public void setAreaCovered(String areaCovered) {
        AreaCovered = areaCovered;
    }

    public int getMaintenanceJobID() {
        return MaintenanceJobID;
    }

    public void setMaintenanceJobID(int maintenanceJobID) {
        MaintenanceJobID = maintenanceJobID;
    }

    public String getNextJobDate() {
        return NextJobDate;
    }

    public void setNextJobDate(String nextJobDate) {
        NextJobDate = nextJobDate;
    }

    public int getCompanyID() {
        return CompanyID;
    }

    public void setCompanyID(int companyID) {
        CompanyID = companyID;
    }

    public String getContractStart() {
        return ContractStart;
    }

    public void setContractStart(String contractStart) {
        ContractStart = contractStart;
    }

    public String getContractEnd() {
        return ContractEnd;
    }

    public void setContractEnd(String contractEnd) {
        ContractEnd = contractEnd;
    }

    public String getMaintenanceInterval() {
        return MaintenanceInterval;
    }

    public void setMaintenanceInterval(String maintenanceInterval) {
        MaintenanceInterval = maintenanceInterval;
    }

    public String getNotificationInterval() {
        return NotificationInterval;
    }

    public void setNotificationInterval(String notificationInterval) {
        NotificationInterval = notificationInterval;
    }

    public String getRemarks() {
        return Remarks;
    }

    public void setRemarks(String remarks) {
        Remarks = remarks;
    }


    public int getMaintenanceID() {
        return MaintenanceID;
    }

    public void setMaintenanceID(int maintenanceID) {
        MaintenanceID = maintenanceID;
    }

    public String getTimestamp() {
        return Timestamp;
    }

    public void setTimestamp(String timestamp) {
        Timestamp = timestamp;
    }

    public String getRxTime() {
        return RxTime;
    }

    public void setRxTime(String rxTime) {
        RxTime = rxTime;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPostal() {
        return Postal;
    }

    public void setPostal(String postal) {
        Postal = postal;
    }

    public String getUnit() {
        return Unit;
    }

    public void setUnit(String unit) {
        Unit = unit;
    }

    public String getPIC() {
        return PIC;
    }

    public void setPIC(String PIC) {
        this.PIC = PIC;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getSite() {
        return Site;
    }

    public void setSite(String site) {
        Site = site;
    }
}
