package ch.hatbe.d001;

import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        var inputHeight = (EditText) findViewById(R.id.inputHeight);
        var inputWeight= (EditText) findViewById(R.id.inputWeight);

        var labelRes = (TextView) findViewById(R.id.labelRes);

        var btnCalc = (Button) findViewById(R.id.btnCalc);
        btnCalc.setOnClickListener((view) -> {
            int weight = 0;
            double height = 0;

            try {
                weight = Integer.parseInt(inputWeight.getText().toString());
                height = Double.parseDouble(inputHeight.getText().toString()) / 100;

                labelRes.setText(String.format("%s", weight / (height * height)));
            } catch (NumberFormatException e) {
                Log.e("MAIN", "WRONG FORMAT");
            }
        });

        var btnClear = (Button) findViewById(R.id.btnClr);
        btnClear.setOnClickListener((view) -> {
            inputHeight.setText("");
            inputWeight.setText("");
            labelRes.setText("");
        });


    }

}