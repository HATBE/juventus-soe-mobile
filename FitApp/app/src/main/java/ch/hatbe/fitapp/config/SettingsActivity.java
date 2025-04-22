package ch.hatbe.fitapp.config;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

import ch.hatbe.fitapp.BaseActivity;
import ch.hatbe.fitapp.HomeActivity;
import ch.hatbe.fitapp.R;

public class SettingsActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);

        var btnUserActivity = (Button) findViewById(R.id.btnUserActivity);
        btnUserActivity.setOnClickListener((view) -> {

            Intent intent = new Intent(this, UsersActivity.class);
            startActivity(intent);
        });

    }
}