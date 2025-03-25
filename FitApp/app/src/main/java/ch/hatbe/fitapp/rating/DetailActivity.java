package ch.hatbe.fitapp.rating;

import android.os.Bundle;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import ch.hatbe.fitapp.R;
import ch.hatbe.fitapp.util.BMI;
import ch.hatbe.fitapp.util.BMIclass;

public class DetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            int id = extras.getInt("id");
            BMIclass bmiClass = BMI.getLegendById(id); // Ensure you have a method to find by ID

            if (bmiClass != null) {
                TextView labelCategory = findViewById(R.id.labelCategory);
                labelCategory.setText(bmiClass.getCategory().name());

                TextView labeName = findViewById(R.id.labelName);
                labeName.setText(bmiClass.getName());

                TextView labeMin = findViewById(R.id.labelMin);
                labeMin.setText(String.valueOf(bmiClass.getMin()));

                TextView labeMax = findViewById(R.id.labelMax);
                labeMax.setText(String.valueOf(bmiClass.getMax()));
            } else {
                // Handle error: legend not found
            }
        }

    }
}