package ch.hatbe.fitapp.calculator;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import ch.hatbe.fitapp.BaseActivity;
import ch.hatbe.fitapp.HomeActivity;
import ch.hatbe.fitapp.R;
import ch.hatbe.fitapp.rating.LegendActivity;
import ch.hatbe.fitapp.util.BMI;
import ch.hatbe.fitapp.util.BMIclass;
import ch.hatbe.fitapp.util.DatabaseConnection;

public class ResultActivity extends BaseActivity {

    @SuppressLint({"StringFormatMatches", "SetTextI18n"})
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        TextView labelRes = findViewById(R.id.labelResult);

        Bundle extras = getIntent().getExtras();

        int weight = extras.getInt("weight");
        double height = extras.getDouble("height");

        double bmiValue = BMI.calculate(height, weight);

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

        Button btnSave = findViewById(R.id.btnSave);
        btnSave.setOnClickListener(view -> {
            DatabaseConnection dbConnection = new DatabaseConnection(ResultActivity.this);
            dbConnection.open();

            String date = java.time.LocalDate.now().toString();

            var sharedPreferences = getSharedPreferences("login", MODE_PRIVATE);
            String username = sharedPreferences.getString("currentUser", "NO_VALUE");

            dbConnection.insertMeasurement(date, username, height, weight);

            Toast.makeText(ResultActivity.this, R.string.saved_successfully, Toast.LENGTH_LONG).show();
        });
    }
}
