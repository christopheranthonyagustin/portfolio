package sg.acecom.track.systempest.model;

public class EventLog {

    int db_ID;
    int assetId;
    String tagId;
    String timestamp;
    String rxtime;
    int statusId;
    String remarks;
    String alertLevel;
    String alertLevelex;
    String flag;
    int ackUserId;
    int companyId;

    public EventLog(){

    }

    public EventLog(int db_ID, int assetId, String tagId, String timestamp, String rxtime, int statusId, String remarks, String alertLevel, String alertLevelex, String flag, int ackUserId, int companyId) {
        this.db_ID = db_ID;
        this.assetId = assetId;
        this.tagId = tagId;
        this.timestamp = timestamp;
        this.rxtime = rxtime;
        this.statusId = statusId;
        this.remarks = remarks;
        this.alertLevel = alertLevel;
        this.alertLevelex = alertLevelex;
        this.flag = flag;
        this.ackUserId = ackUserId;
        this.companyId = companyId;
    }

    public int getDb_ID() {
        return db_ID;
    }

    public void setDb_ID(int db_ID) {
        this.db_ID = db_ID;
    }

    public int getAssetId() {
        return assetId;
    }

    public void setAssetId(int assetId) {
        this.assetId = assetId;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getRxtime() {
        return rxtime;
    }

    public void setRxtime(String rxtime) {
        this.rxtime = rxtime;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getAlertLevel() {
        return alertLevel;
    }

    public void setAlertLevel(String alertLevel) {
        this.alertLevel = alertLevel;
    }

    public String getAlertLevelex() {
        return alertLevelex;
    }

    public void setAlertLevelex(String alertLevelex) {
        this.alertLevelex = alertLevelex;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public int getAckUserId() {
        return ackUserId;
    }

    public void setAckUserId(int ackUserId) {
        this.ackUserId = ackUserId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }
}
