package sg.acecom.track.systempest.database;

public class EventLogDB {
    public static final String TABLE_NAME = "evevntlog";
    public static final String COLUMN_ID = "id";
    public static final String ASSET_ID = "asset_id";
    public static final String TAG_ID = "tag_id";
    public static final String TIMESTAMP = "timestamp";
    public static final String RXTIME = "rxtime";
    public static final String STATUS_ID = "status_id";
    public static final String REMARKS = "remarks";
    public static final String ALERT_LEVEL = "alert_level";
    public static final String ALERT_LEVELEX = "alert_levelex";
    public static final String FLAG = "flag";
    public static final String ACK_USER_ID = "ack_user_id";
    public static final String COMPANY_ID = "company_id";


    // Create table SQL query
    public static final String CREATE_TABLE =
            "CREATE TABLE " + TABLE_NAME + "("
                    + COLUMN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + ASSET_ID + " INTEGER,"
                    + TAG_ID + " INTEGER,"
                    + TIMESTAMP + " DATETIME,"
                    + RXTIME + " DATETIME,"
                    + STATUS_ID + " INTEGER,"
                    + REMARKS + " TEXT,"
                    + ALERT_LEVEL + " TEXT,"
                    + ALERT_LEVELEX + " TEXT,"
                    + FLAG + " TEXT,"
                    + ACK_USER_ID + " INTEGER,"
                    + COMPANY_ID + " INTEGER"
                    + ")";
}
