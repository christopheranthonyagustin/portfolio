package sg.acecom.track.systempest.model;

/**
 * Created by jmingl on 28/6/18.
 */

public class Recommendations {

    int RecommendationID;
    String RecommendationDesc;

    public Recommendations(){

    }

    public Recommendations(int recommendationID, String recommendationDesc) {
        RecommendationID = recommendationID;
        RecommendationDesc = recommendationDesc;
    }

    public int getRecommendationID() {
        return RecommendationID;
    }

    public void setRecommendationID(int recommendationID) {
        RecommendationID = recommendationID;
    }

    public String getRecommendationDesc() {
        return RecommendationDesc;
    }

    public void setRecommendationDesc(String recommendationDesc) {
        RecommendationDesc = recommendationDesc;
    }
}
