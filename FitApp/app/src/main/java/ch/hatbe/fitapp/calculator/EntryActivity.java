package ch.hatbe.fitapp.calculator;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import ch.hatbe.fitapp.HomeActivity;
import ch.hatbe.fitapp.R;
import ch.hatbe.fitapp.util.BMI;

public class EntryActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_entry);

        var inputHeight = (EditText) findViewById(R.id.inputHeight);
        var inputWeight= (EditText) findViewById(R.id.inputWeight);

        var btnCalc = (Button) findViewById(R.id.btnCalc);
        btnCalc.setOnClickListener((view) -> {
            int weight = 0;
            double height = 0;

            try {
                weight = Integer.parseInt(inputWeight.getText().toString());
                height = Double.parseDouble(inputHeight.getText().toString()) / 100;

                Intent intent = new Intent(this, ResultActivity.class);
                intent.putExtra("res", BMI.calculate(height, weight));
                startActivity(intent);
            } catch (NumberFormatException e) {
                Log.e("MAIN", "WRONG FORMAT");
            }
        });

        var btnClear = (Button) findViewById(R.id.btnClr);
        btnClear.setOnClickListener((view) -> {
            inputHeight.setText("");
            inputWeight.setText("");
        });

        var btnBack = (Button) findViewById(R.id.btnBack);
        btnBack.setOnClickListener((view) -> {
            Intent intent = new Intent(this, HomeActivity.class);
            startActivity(intent);
        });

    }
}