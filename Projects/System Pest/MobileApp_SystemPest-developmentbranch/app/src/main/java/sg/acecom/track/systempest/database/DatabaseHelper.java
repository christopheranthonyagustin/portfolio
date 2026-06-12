package sg.acecom.track.systempest.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

import sg.acecom.track.systempest.model.Inventory;

/**
 * Created by jmingl on 5/6/18.
 */

public class DatabaseHelper extends SQLiteOpenHelper {

    // Database Version
    private static final int DATABASE_VERSION = 1;

    // Database Name
    private static final String DATABASE_NAME = "inventory_db";


    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    // Creating Tables
    @Override
    public void onCreate(SQLiteDatabase db) {

        // create notes table
        db.execSQL(InventoryDB.CREATE_TABLE);
    }

    // Upgrading database
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Drop older table if existed
        db.execSQL("DROP TABLE IF EXISTS " + InventoryDB.TABLE_NAME);

        // Create tables again
        onCreate(db);
    }

    public long insertNote(int itemID, String name, String reference, String quantity, String price, String unit, String stockout) {
        // get writable database as we want to write data
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        // `id` and `timestamp` will be inserted automatically.
        // no need to add them
        values.put(InventoryDB.COLUMN_ITEM_ID, itemID);
        values.put(InventoryDB.COLUMN_NAME, name);
        values.put(InventoryDB.COLUMN_REFERENCE, reference);
        values.put(InventoryDB.COLUMN_QUANTITY, quantity);
        values.put(InventoryDB.COLUMN_PRICE, price);
        values.put(InventoryDB.COLUMN_UNIT, unit);
        values.put(InventoryDB.COLUMN_STOCKOUT, stockout);

        // insert row
        long id = db.insert(InventoryDB.TABLE_NAME, null, values);

        // close db connection
        db.close();

        // return newly inserted row id
        return id;
    }

    public Inventory getNote(long id) {
        // get readable database as we are not inserting anything
        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.query(InventoryDB.TABLE_NAME,
                new String[]{InventoryDB.COLUMN_ID, InventoryDB.COLUMN_ITEM_ID, InventoryDB.COLUMN_NAME, InventoryDB.COLUMN_REFERENCE
                        , InventoryDB.COLUMN_QUANTITY, InventoryDB.COLUMN_PRICE, InventoryDB.COLUMN_UNIT, InventoryDB.COLUMN_STOCKOUT},
                InventoryDB.COLUMN_ID + "=?",
                new String[]{String.valueOf(id)}, null, null, null, null);

        if (cursor != null)
            cursor.moveToFirst();

        // prepare note object
        Inventory note = new Inventory(
                cursor.getInt(cursor.getColumnIndex(InventoryDB.COLUMN_ID)),
                cursor.getInt(cursor.getColumnIndex(InventoryDB.COLUMN_ITEM_ID)),
                cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_NAME)),
                cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_REFERENCE)),
                cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_QUANTITY)),
                cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_PRICE)),
                cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_UNIT)),
                cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_STOCKOUT)));

        // close the db connection
        cursor.close();

        return note;
    }

    public List<Inventory> getAllInventory() {
        List<Inventory> inventories = new ArrayList<>();

        // Select All Query
        String selectQuery = "SELECT  * FROM " + InventoryDB.TABLE_NAME;

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        // looping through all rows and adding to list
        if (cursor.moveToFirst()) {
            do {
                Inventory inventory = new Inventory();
                inventory.setDb_ID(cursor.getInt(cursor.getColumnIndex(InventoryDB.COLUMN_ID)));
                inventory.setItemID(cursor.getInt(cursor.getColumnIndex(InventoryDB.COLUMN_ITEM_ID)));
                inventory.setItemName(cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_NAME)));
                inventory.setItemReference(cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_REFERENCE)));
                inventory.setItemQuantity(cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_QUANTITY)));
                inventory.setItemPrice(cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_PRICE)));
                inventory.setItemUnit(cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_UNIT)));
                inventory.setItemStockout(cursor.getString(cursor.getColumnIndex(InventoryDB.COLUMN_STOCKOUT)));

                inventories.add(inventory);
            } while (cursor.moveToNext());
        }

        // close db connection
        db.close();

        // return notes list
        return inventories;
    }

    public int getInventoryCount() {
        String countQuery = "SELECT  * FROM " + InventoryDB.TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(countQuery, null);

        int count = cursor.getCount();
        cursor.close();

        // return count
        return count;
    }

    public int updateInventory(Inventory inventory) {
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(InventoryDB.COLUMN_ITEM_ID, inventory.getItemID());
        values.put(InventoryDB.COLUMN_NAME, inventory.getItemName());
        values.put(InventoryDB.COLUMN_REFERENCE, inventory.getItemReference());
        values.put(InventoryDB.COLUMN_QUANTITY, String.valueOf(inventory.getItemQuantity()));
        values.put(InventoryDB.COLUMN_PRICE, String.valueOf(inventory.getItemPrice()));
        values.put(InventoryDB.COLUMN_UNIT, String.valueOf(inventory.getItemUnit()));
        values.put(InventoryDB.COLUMN_STOCKOUT, String.valueOf(inventory.getItemStockout()));

        // updating row
        return db.update(InventoryDB.TABLE_NAME, values, InventoryDB.COLUMN_ITEM_ID + " = ?",
                new String[]{String.valueOf(inventory.getItemID())});
    }

    public void deleteInventory(Inventory inventory) {
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(InventoryDB.TABLE_NAME, InventoryDB.COLUMN_REFERENCE + " = ?",
                new String[]{String.valueOf(inventory.getItemReference())});
        db.close();
    }

    public void deleteAll(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("delete from "+ InventoryDB.TABLE_NAME);
        db.close();
    }
}
