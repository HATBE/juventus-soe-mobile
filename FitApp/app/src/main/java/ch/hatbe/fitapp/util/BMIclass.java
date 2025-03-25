package ch.hatbe.fitapp.util;

import android.os.Parcel;
import android.os.Parcelable;

import androidx.annotation.NonNull;

public class BMIclass {
    int id;
    private BMIcategory category;
    private String name;
    private double min;

    private double max;

    public BMIclass(int id, BMIcategory category, String name, double min, double max) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.min = min;
        this.max = max;
    }

    public int getId() {
        return id;
    }

    public BMIcategory getCategory() {
        return category;
    }

    public String getName() {
        return String.format("%s: %s", category.name(), name);
    }

    public double getMin() {
        return min;
    }

    public double getMax() {
        return max;
    }

}
