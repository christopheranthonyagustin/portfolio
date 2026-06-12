package sg.acecom.track.systempest.model;

/**
 * Created by jmingl on 5/6/18.
 */

public class Inventory {

    int db_ID;
    int itemID;
    String itemQuantity;
    String itemName;
    String itemReference;
    String itemPrice;
    int StockOutQuantity;
    int DriverID;
    int AssetID;
    String itemUnit;
    String itemStockout;


    public String getItemUnit() {
        return itemUnit;
    }

    public void setItemUnit(String itemUnit) {
        this.itemUnit = itemUnit;
    }

    public Inventory(){

    }

    public Inventory(int db_ID, int itemID, String itemName, String itemReference, String itemQuantity, String itemPrice, String itemUnit,String itemStockout) {
        this.db_ID = db_ID;
        this.itemID = itemID;
        this.itemName = itemName;
        this.itemReference = itemReference;
        this.itemQuantity = itemQuantity;
        this.itemPrice = itemPrice;
        this.itemUnit = itemUnit;
        this.itemStockout = itemStockout;
    }

    public Inventory(int itemID, String itemName, String itemReference, String itemQuantity, String itemPrice, String itemUnit, String itemStockout) {
        this.itemID = itemID;
        this.itemName = itemName;
        this.itemReference = itemReference;
        this.itemQuantity = itemQuantity;
        this.itemPrice = itemPrice;
        this.itemUnit = itemUnit;
        this.itemStockout = itemStockout;
    }

    public String getItemStockout() {
        return itemStockout;
    }

    public void setItemStockout(String itemStockout) {
        this.itemStockout = itemStockout;
    }

    public int getDb_ID() {
        return db_ID;
    }

    public void setDb_ID(int db_ID) {
        this.db_ID = db_ID;
    }


    public int getDriverID() {
        return DriverID;
    }

    public void setDriverID(int driverID) {
        DriverID = driverID;
    }

    public int getAssetID() {
        return AssetID;
    }

    public void setAssetID(int assetID) {
        AssetID = assetID;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public String getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(String itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    public String getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(String itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemReference() {
        return itemReference;
    }

    public void setItemReference(String itemReference) {
        this.itemReference = itemReference;
    }
}
