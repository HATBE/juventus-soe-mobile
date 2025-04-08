package ch.hatbe.fitapp.rating;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import ch.hatbe.fitapp.BaseActivity;
import ch.hatbe.fitapp.R;
import ch.hatbe.fitapp.util.BMI;
import ch.hatbe.fitapp.util.BMIclass;

public class LegendActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_legend);

        var list = (ListView) findViewById(R.id.listView);

        var adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1,
                BMI.getLegendNames());
        list.setAdapter(adapter);

        list.setOnItemClickListener((adapterView, view, position, id) -> {
            BMIclass clickedBMI = BMI.getLegend().get(position);
            int clickedId = clickedBMI.getId();

            Intent intent = new Intent(this, DetailActivity.class);
            intent.putExtra("id", clickedId);
            startActivity(intent);
        });


    }
}