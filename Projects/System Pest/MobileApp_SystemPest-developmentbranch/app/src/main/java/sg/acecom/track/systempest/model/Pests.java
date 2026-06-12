package sg.acecom.track.systempest.model;

/**
 * Created by jmingl on 22/6/18.
 */

public class Pests {

    int PestTreatmentID;
    int PestJobID;
    String PestDesc;
    String TreatmentDesc;
    int itemNo;

    public Pests(){

    }

    public Pests(int pestTreatmentID, String pestDesc, String treatmentDesc) {
        PestTreatmentID = pestTreatmentID;
        PestDesc = pestDesc;
        TreatmentDesc = treatmentDesc;
    }

    public int getPestTreatmentID() {
        return PestTreatmentID;
    }

    public void setPestTreatmentID(int pestTreatmentID) {
        PestTreatmentID = pestTreatmentID;
    }

    public int getPestJobID() {
        return PestJobID;
    }

    public void setPestJobID(int pestJobID) {
        PestJobID = pestJobID;
    }

    public String getPestDesc() {
        return PestDesc;
    }

    public void setPestDesc(String pestDesc) {
        PestDesc = pestDesc;
    }

    public String getTreatmentDesc() {
        return TreatmentDesc;
    }

    public void setTreatmentDesc(String treatmentDesc) {
        TreatmentDesc = treatmentDesc;
    }

    public int getItemNo() {
        return itemNo;
    }

    public void setItemNo(int itemNo) {
        this.itemNo = itemNo;
    }
}
