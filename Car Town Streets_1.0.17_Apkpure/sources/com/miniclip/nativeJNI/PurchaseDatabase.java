package com.miniclip.nativeJNI;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import com.miniclip.nativeJNI.Consts;
import java.io.File;
/* loaded from: classes.dex */
public class PurchaseDatabase {
    private static final String DATABASE_NAME = "purchase.db";
    private static final int DATABASE_VERSION = 1;
    static final String HISTORY_ORDER_ID_COL = "_id";
    private static final String PURCHASED_ITEMS_TABLE_NAME = "purchased";
    public static final String PURCHASED_PRODUCT_ID_COL = "_id";
    public static final String PURCHASED_QUANTITY_COL = "quantity";
    private static final String PURCHASE_HISTORY_TABLE_NAME = "history";
    private static final String TAG = "PurchaseDatabase";
    private DatabaseHelper mDatabaseHelper;
    private SQLiteDatabase mDb;
    static final String HISTORY_PRODUCT_ID_COL = "productId";
    static final String HISTORY_STATE_COL = "state";
    static final String HISTORY_PURCHASE_TIME_COL = "purchaseTime";
    static final String HISTORY_DEVELOPER_PAYLOAD_COL = "developerPayload";
    private static final String[] HISTORY_COLUMNS = {"_id", HISTORY_PRODUCT_ID_COL, HISTORY_STATE_COL, HISTORY_PURCHASE_TIME_COL, HISTORY_DEVELOPER_PAYLOAD_COL};
    private static final String[] PURCHASED_COLUMNS = {"_id", "quantity"};

    public PurchaseDatabase(Context context) {
        this.mDatabaseHelper = DatabaseHelper.getInstance(context);
        try {
            this.mDb = this.mDatabaseHelper.getWritableDatabase();
        } catch (RuntimeException e) {
            File db = context.getDatabasePath(DATABASE_NAME);
            if (db != null) {
                db.delete();
            }
            File f = new File("/data/data/" + context.getPackageName() + "/databases/");
            f.mkdirs();
            this.mDatabaseHelper = DatabaseHelper.getInstance(context);
            this.mDb = this.mDatabaseHelper.getWritableDatabase();
        }
    }

    public void close() {
        Log.i("InAppActivity", "close database");
        this.mDatabaseHelper.close();
    }

    private void insertOrder(String orderId, String productId, Consts.PurchaseState state, long purchaseTime, String developerPayload) {
        ContentValues values = new ContentValues();
        values.put("_id", orderId);
        values.put(HISTORY_PRODUCT_ID_COL, productId);
        values.put(HISTORY_STATE_COL, Integer.valueOf(state.ordinal()));
        values.put(HISTORY_PURCHASE_TIME_COL, Long.valueOf(purchaseTime));
        values.put(HISTORY_DEVELOPER_PAYLOAD_COL, developerPayload);
        this.mDb.replace(PURCHASE_HISTORY_TABLE_NAME, null, values);
    }

    private void updatePurchasedItem(String productId, int quantity) {
        if (quantity == 0) {
            this.mDb.delete(PURCHASED_ITEMS_TABLE_NAME, "_id=?", new String[]{productId});
            return;
        }
        ContentValues values = new ContentValues();
        values.put("_id", productId);
        values.put("quantity", Integer.valueOf(quantity));
        this.mDb.replace(PURCHASED_ITEMS_TABLE_NAME, null, values);
    }

    public synchronized int updatePurchase(String orderId, String productId, Consts.PurchaseState purchaseState, long purchaseTime, String developerPayload) {
        int quantity;
        insertOrder(orderId, productId, purchaseState, purchaseTime, developerPayload);
        Cursor cursor = this.mDb.query(PURCHASE_HISTORY_TABLE_NAME, HISTORY_COLUMNS, "productId=?", new String[]{productId}, null, null, null, null);
        if (cursor == null) {
            quantity = 0;
        } else {
            quantity = 0;
            while (cursor.moveToNext()) {
                int stateIndex = cursor.getInt(2);
                Consts.PurchaseState state = Consts.PurchaseState.valueOf(stateIndex);
                if (state == Consts.PurchaseState.PURCHASED || state == Consts.PurchaseState.REFUNDED) {
                    quantity++;
                }
            }
            updatePurchasedItem(productId, quantity);
            if (cursor != null) {
                cursor.close();
            }
        }
        return quantity;
    }

    public Cursor queryAllPurchasedItems() {
        return this.mDb.query(PURCHASED_ITEMS_TABLE_NAME, PURCHASED_COLUMNS, null, null, null, null, null);
    }

    /* loaded from: classes.dex */
    private static class DatabaseHelper extends SQLiteOpenHelper {
        private static DatabaseHelper mInstance;

        public static DatabaseHelper getInstance(Context context) {
            if (mInstance == null) {
                mInstance = new DatabaseHelper(context);
            }
            return mInstance;
        }

        @Override // android.database.sqlite.SQLiteOpenHelper, java.lang.AutoCloseable
        public void close() {
            if (mInstance != null) {
                mInstance.close();
                mInstance = null;
            }
        }

        public DatabaseHelper(Context context) {
            super(context, PurchaseDatabase.DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 1);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            createPurchaseTable(db);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            if (newVersion != 1) {
                Log.w(PurchaseDatabase.TAG, "Database upgrade from old: " + oldVersion + " to: " + newVersion);
                db.execSQL("DROP TABLE IF EXISTS history");
                db.execSQL("DROP TABLE IF EXISTS purchased");
                createPurchaseTable(db);
            }
        }

        private void createPurchaseTable(SQLiteDatabase db) {
            db.execSQL("CREATE TABLE history(_id TEXT PRIMARY KEY, state INTEGER, productId TEXT, developerPayload TEXT, purchaseTime INTEGER)");
            db.execSQL("CREATE TABLE purchased(_id TEXT PRIMARY KEY, quantity INTEGER)");
        }
    }
}
