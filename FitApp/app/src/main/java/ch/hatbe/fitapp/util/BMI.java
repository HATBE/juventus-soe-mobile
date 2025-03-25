package ch.hatbe.fitapp.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class BMI implements Serializable {
    public static double calculate(double height, double weight) {
        return Math.round(weight / (height * height));
    }


    public static List<BMIclass> getLegend() {
        List<BMIclass> legend = new ArrayList<>();

        legend.add(new BMIclass(1,BMIcategory.UNDERWEIGHT, "very severely", 0.0, 15.0));
        legend.add(new BMIclass(2, BMIcategory.UNDERWEIGHT, "severely", 15.0, 16.0));
        legend.add( new BMIclass(3,BMIcategory.UNDERWEIGHT, "moderately", 16.0, 17.0));
        legend.add( new BMIclass(4,BMIcategory.UNDERWEIGHT, "slightly", 17.0, 18.5));

        legend.add( new BMIclass(5,BMIcategory.NORMAL, "healthy weight", 18.5, 25.0));

        legend.add( new BMIclass(6,BMIcategory.OVERWEIGHT, "overweight", 25.0, 30.0));

        legend.add( new BMIclass(7,BMIcategory.OBESE, "moderately (class I)", 30.0, 35.0));
        legend.add(new BMIclass(8, BMIcategory.OBESE, "severely (class II)", 35.0, 40.0));
        legend.add( new BMIclass(9,BMIcategory.OBESE, "very severely (class III)", 40.0, Double.MAX_VALUE));

        return legend;
    }

    public static List<String> getLegendNames() {
        return getLegend().stream()
                .map(BMIclass::getName)
                .collect(Collectors.toList());
    }

    public static BMIclass getLegendById(int id) {
        for (BMIclass item : getLegend()) {
            if (item.getId() == id) {
                return item;
            }
        }
        return null;
    }

    public static BMIclass getLegendByNumber(double bmiNumber) {
        for (BMIclass item : getLegend()) {
            if (bmiNumber >= item.getMin() && bmiNumber < item.getMax()) {
                return item;
            }
        }
        return null;
    }
}
