package ch.hatbe.fitapp.util;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {

    private DatabaseHelper databaseHelper;
    private SQLiteDatabase database;

    public DatabaseConnection(Context context) {
        databaseHelper = new DatabaseHelper(context);
    }

    public void open() {
        database = databaseHelper.getWritableDatabase();
    }

    public void insertMeasurement(String date, String username, double height, int weight) {
        ContentValues values = new ContentValues();
        values.put("date", date);
        values.put("username", username);
        values.put("height", height);
        values.put("weight", weight);
        database.insert("measurement", null, values);
    }

    public List<Measurement> selectMeasurements() {
        List<Measurement> measurements = new ArrayList<>();
        Cursor cursor = database.query("measurement", null, null, null, null, null, null);

        if (cursor != null && cursor.moveToFirst()) {
            do {
                int id = cursor.getInt(cursor.getColumnIndexOrThrow("id"));
                String date = cursor.getString(cursor.getColumnIndexOrThrow("date"));
                String username = cursor.getString(cursor.getColumnIndexOrThrow("username"));
                double height = cursor.getFloat(cursor.getColumnIndexOrThrow("height"));
                int weight = cursor.getInt(cursor.getColumnIndexOrThrow("weight"));

                System.out.println(height);

                measurements.add(new Measurement(id, date, username, height, weight));
            } while (cursor.moveToNext());
            cursor.close();
        }

        return measurements;
    }

    private static class DatabaseHelper extends SQLiteOpenHelper {

        private static final int databaseVersion = 1;
        private static final String databaseName = "data";

        public DatabaseHelper(Context context) {
            super(context, databaseName, null, databaseVersion);
        }

        @Override
        public void onCreate(SQLiteDatabase database) {
            database.execSQL(
                    "CREATE TABLE IF NOT EXISTS measurement (" +
                            "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                            "date TEXT, " +
                            "username TEXT, " +
                            "height REAL, " +
                            "weight INTEGER);"
            );
        }

        @Override
        public void onUpgrade(SQLiteDatabase database, int oldVersion, int newVersion) {
            database.execSQL("DROP TABLE IF EXISTS measurement;");
            onCreate(database);
        }
    }
}
