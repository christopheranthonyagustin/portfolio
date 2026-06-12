package sg.acecom.track.systempest.database;

/**
 * Created by jmingl on 5/6/18.
 */

public class InventoryDB {
    public static final String TABLE_NAME = "inventory";
    public static final String COLUMN_ID = "id";
    public static final String COLUMN_ITEM_ID = "item_id";
    public static final String COLUMN_NAME = "name";
    public static final String COLUMN_REFERENCE = "reference";
    public static final String COLUMN_QUANTITY = "quantity";
    public static final String COLUMN_PRICE = "price";
    public static final String COLUMN_UNIT = "unit";
    public static final String COLUMN_STOCKOUT = "stockout";

    // Create table SQL query
    public static final String CREATE_TABLE =
            "CREATE TABLE " + TABLE_NAME + "("
                    + COLUMN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + COLUMN_ITEM_ID + " INTEGER,"
                    + COLUMN_NAME + " TEXT,"
                    + COLUMN_REFERENCE + " TEXT,"
                    + COLUMN_QUANTITY + " TEXT,"
                    + COLUMN_PRICE + " TEXT,"
                    + COLUMN_UNIT + " TEXT,"
                    + COLUMN_STOCKOUT + " TEXT"
                    + ")";

}
