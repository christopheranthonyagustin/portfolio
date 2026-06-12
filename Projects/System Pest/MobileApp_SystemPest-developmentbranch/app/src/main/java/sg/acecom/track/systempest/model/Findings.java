package sg.acecom.track.systempest.model;

/**
 * Created by jmingl on 26/6/18.
 */

public class Findings {

    String PestDesc;
    String AreaConcerned;
    String Findings;
    String header;
    String FinalFindings;

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getFindings() {
        return Findings;
    }

    public String getFinalFindings() {
        return FinalFindings;
    }

    public void setFinalFindings(String finalFindings) {
        FinalFindings = finalFindings;
    }

    public void setFindings(String findings) {
        Findings = findings;
    }

    public Findings(){

    }

    public Findings(String findings) {
        Findings = findings;
    }

    public Findings(String pestDesc, String areaConcerned, String findings) {
        PestDesc = pestDesc;
        AreaConcerned = areaConcerned;
        Findings = findings;
    }

    public Findings(String pestDesc, String areaConcerned, String findings, String finalFindings) {
        PestDesc = pestDesc;
        AreaConcerned = areaConcerned;
        Findings = findings;
        FinalFindings = finalFindings;
    }

    public String getPestDesc() {
        return PestDesc;
    }

    public void setPestDesc(String pestDesc) {
        PestDesc = pestDesc;
    }

    public String getAreaConcerned() {
        return AreaConcerned;
    }

    public void setAreaConcerned(String areaConcerned) {
        AreaConcerned = areaConcerned;
    }
}
