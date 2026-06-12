package sg.acecom.track.systempest.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

import sg.acecom.track.systempest.model.EventLog;

public class DatabaseHelper_EventLog extends SQLiteOpenHelper {

    // Database Version
    private static final int DATABASE_VERSION = 1;

    // Database Name
    private static final String DATABASE_NAME = "eventlog_db";


    public DatabaseHelper_EventLog(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    // Creating Tables
    @Override
    public void onCreate(SQLiteDatabase db) {

        // create notes table
        db.execSQL(EventLogDB.CREATE_TABLE);
    }

    // Upgrading database
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Drop older table if existed
        db.execSQL("DROP TABLE IF EXISTS " + EventLogDB.TABLE_NAME);

        // Create tables again
        onCreate(db);
    }

    public long insertEventLog(int assetId, String tagId, String timestamp, String rxtime, int statusId, String remarks, String alertLevel, String alertLevelEx, String flag, int ackUserId, int companyId) {
        // get writable database as we want to write data
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        // `id` and `timestamp` will be inserted automatically.
        // no need to add them
        values.put(EventLogDB.ASSET_ID, assetId);
        values.put(EventLogDB.TAG_ID, tagId);
        values.put(EventLogDB.TIMESTAMP, timestamp);
        values.put(EventLogDB.RXTIME, rxtime);
        values.put(EventLogDB.STATUS_ID, statusId);
        values.put(EventLogDB.REMARKS, remarks);
        values.put(EventLogDB.ALERT_LEVEL, alertLevel);
        values.put(EventLogDB.ALERT_LEVELEX, alertLevelEx);
        values.put(EventLogDB.FLAG, flag);
        values.put(EventLogDB.ACK_USER_ID, ackUserId);
        values.put(EventLogDB.COMPANY_ID, companyId);

        // insert row
        long id = db.insert(EventLogDB.TABLE_NAME, null, values);

        // close db connection
        db.close();

        // return newly inserted row id
        return id;
    }

    public EventLog getNote(long id) {
        // get readable database as we are not inserting anything
        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.query(EventLogDB.TABLE_NAME,
                new String[]{EventLogDB.COLUMN_ID, EventLogDB.ASSET_ID, EventLogDB.TAG_ID, EventLogDB.TIMESTAMP
                        , EventLogDB.RXTIME, EventLogDB.STATUS_ID, EventLogDB.REMARKS, EventLogDB.ALERT_LEVEL
                        , EventLogDB.ALERT_LEVELEX, EventLogDB.FLAG, EventLogDB.ACK_USER_ID, EventLogDB.COMPANY_ID},
                EventLogDB.COLUMN_ID + "=?",
                new String[]{String.valueOf(id)}, null, null, null, null);

        if (cursor != null)
            cursor.moveToFirst();

        // prepare note object
        EventLog note = new EventLog(
                cursor.getInt(cursor.getColumnIndex(EventLogDB.COLUMN_ID)),
                cursor.getInt(cursor.getColumnIndex(EventLogDB.ASSET_ID)),
                cursor.getString(cursor.getColumnIndex(EventLogDB.TAG_ID)),
                cursor.getString(cursor.getColumnIndex(EventLogDB.TIMESTAMP)),
                cursor.getString(cursor.getColumnIndex(EventLogDB.RXTIME)),
                cursor.getInt(cursor.getColumnIndex(EventLogDB.STATUS_ID)),
                cursor.getString(cursor.getColumnIndex(EventLogDB.REMARKS)),
                cursor.getString(cursor.getColumnIndex(EventLogDB.ALERT_LEVEL)),
                cursor.getString(cursor.getColumnIndex(EventLogDB.ALERT_LEVELEX)),
                cursor.getString(cursor.getColumnIndex(EventLogDB.FLAG)),
                cursor.getInt(cursor.getColumnIndex(EventLogDB.ACK_USER_ID)),
                cursor.getInt(cursor.getColumnIndex(EventLogDB.COMPANY_ID)));

        // close the db connection
        cursor.close();

        return note;
    }

    public List<EventLog> getAllEventLog() {
        List<EventLog> eventLogs = new ArrayList<>();

        // Select All Query
        String selectQuery = "SELECT  * FROM " + EventLogDB.TABLE_NAME;

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        // looping through all rows and adding to list
        if (cursor.moveToFirst()) {
            do {
                EventLog eventLog = new EventLog();
                eventLog.setDb_ID(cursor.getInt(cursor.getColumnIndex(EventLogDB.COLUMN_ID)));
                eventLog.setAssetId(cursor.getInt(cursor.getColumnIndex(EventLogDB.ASSET_ID)));
                eventLog.setTagId(cursor.getString(cursor.getColumnIndex(EventLogDB.TAG_ID)));
                eventLog.setTimestamp(cursor.getString(cursor.getColumnIndex(EventLogDB.TIMESTAMP)));
                eventLog.setRxtime(cursor.getString(cursor.getColumnIndex(EventLogDB.RXTIME)));
                eventLog.setStatusId(cursor.getInt(cursor.getColumnIndex(EventLogDB.STATUS_ID)));
                eventLog.setRemarks(cursor.getString(cursor.getColumnIndex(EventLogDB.REMARKS)));
                eventLog.setAlertLevel(cursor.getString(cursor.getColumnIndex(EventLogDB.ALERT_LEVEL)));
                eventLog.setAlertLevelex(cursor.getString(cursor.getColumnIndex(EventLogDB.ALERT_LEVELEX)));
                eventLog.setFlag(cursor.getString(cursor.getColumnIndex(EventLogDB.FLAG)));
                eventLog.setAckUserId(cursor.getInt(cursor.getColumnIndex(EventLogDB.ACK_USER_ID)));
                eventLog.setCompanyId(cursor.getInt(cursor.getColumnIndex(EventLogDB.COMPANY_ID)));

                eventLogs.add(eventLog);
            } while (cursor.moveToNext());
        }

        // close db connection
        db.close();

        // return notes list
        return eventLogs;
    }

    public int getEventLogCount() {
        String countQuery = "SELECT  * FROM " + EventLogDB.TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(countQuery, null);

        int count = cursor.getCount();
        cursor.close();

        // return count
        return count;
    }

    public int updateEventLog(EventLog eventLog) {
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(EventLogDB.ASSET_ID, eventLog.getAssetId());
        values.put(EventLogDB.TAG_ID, eventLog.getTagId());
        values.put(EventLogDB.TIMESTAMP, eventLog.getTimestamp());
        values.put(EventLogDB.RXTIME, eventLog.getRxtime());
        values.put(EventLogDB.STATUS_ID, eventLog.getStatusId());
        values.put(EventLogDB.REMARKS, eventLog.getRemarks());
        values.put(EventLogDB.ALERT_LEVEL, eventLog.getAlertLevel());
        values.put(EventLogDB.ALERT_LEVELEX, eventLog.getAlertLevelex());
        values.put(EventLogDB.FLAG, eventLog.getFlag());
        values.put(EventLogDB.ACK_USER_ID, eventLog.getAckUserId());
        values.put(EventLogDB.COMPANY_ID, eventLog.getCompanyId());


        // updating row
        return db.update(EventLogDB.TABLE_NAME, values, EventLogDB.ASSET_ID + " = ?",
                new String[]{String.valueOf(eventLog.getAssetId())});
    }

    public void deleteEventLog(EventLog eventLog) {
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(EventLogDB.TABLE_NAME, EventLogDB.ASSET_ID + " = ?",
                new String[]{String.valueOf(eventLog.getAssetId())});
        db.close();
    }

    public void deleteAll(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("delete from "+ EventLogDB.TABLE_NAME);
        db.close();
    }
}
