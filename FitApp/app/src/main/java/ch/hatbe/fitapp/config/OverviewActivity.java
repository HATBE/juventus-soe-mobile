package ch.hatbe.fitapp.config;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

import ch.hatbe.fitapp.BaseActivity;
import ch.hatbe.fitapp.R;
import ch.hatbe.fitapp.rating.DetailActivity;
import ch.hatbe.fitapp.util.BMI;
import ch.hatbe.fitapp.util.DatabaseConnection;
import ch.hatbe.fitapp.util.Measurement;

public class OverviewActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_overview);

        ListView list = findViewById(R.id.listHistory);

        DatabaseConnection dbConnection = new DatabaseConnection(this);
        dbConnection.open();

        List<Measurement> measurements = dbConnection.selectMeasurements();

        List<String> displayList = new ArrayList<>();
        for (Measurement m : measurements) {
            displayList.add(m.date + "\n" + m.username + "\n" + Math.round(m.height * 100.0) / 100.0 + "m / " + m.weight + "kg\n" + "BMI: " + BMI.calculate(m.height, m.weight));
        }

        ArrayAdapter<String> adapter = new ArrayAdapter<>(
                this,
                android.R.layout.simple_list_item_1,
                displayList
        );
        list.setAdapter(adapter);
    }
}
