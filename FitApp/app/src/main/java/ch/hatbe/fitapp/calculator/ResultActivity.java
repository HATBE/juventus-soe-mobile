package ch.hatbe.fitapp.calculator;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import ch.hatbe.fitapp.BaseActivity;
import ch.hatbe.fitapp.HomeActivity;
import ch.hatbe.fitapp.R;
import ch.hatbe.fitapp.rating.LegendActivity;
import ch.hatbe.fitapp.util.BMI;
import ch.hatbe.fitapp.util.BMIclass;

public class ResultActivity extends BaseActivity {

    @SuppressLint({"StringFormatMatches", "SetTextI18n"})
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        TextView labelRes = findViewById(R.id.labelResult);

        Bundle extras = getIntent().getExtras();
        double bmiValue = extras.getDouble("res");

        BMIclass bmiObject = BMI.getLegendByNumber(bmiValue);
        if (bmiObject != null) {
            labelRes.setText(String.format(getString(R.string.bmi_result), bmiValue) + "\n" + bmiObject.getName());
        } else {
            labelRes.setText("BMI value out of range: " + bmiValue);
        }

        Button btnLegend = findViewById(R.id.btnLegend);
        btnLegend.setOnClickListener(view -> {
            Intent intent = new Intent(this, LegendActivity.class);
            startActivity(intent);
        });
    }
}
