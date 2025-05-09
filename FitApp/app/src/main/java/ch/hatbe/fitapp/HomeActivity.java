package ch.hatbe.fitapp;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import ch.hatbe.fitapp.calculator.EntryActivity;

public class HomeActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        var usernameLabel = (TextView) findViewById(R.id.labelUsername);

        var sharedPreferences = getSharedPreferences("login", MODE_PRIVATE);
        var username = sharedPreferences.getString("currentUser", "NO_VALUE");

        usernameLabel.setText(String.format(getString(R.string.greeting), username));

        var btnBmi = (Button) findViewById(R.id.btnBmi);
        btnBmi.setOnClickListener((view) -> {
            this.changeToBmiPage();
        });
    }

    private void changeToBmiPage() {
        Intent intent = new Intent(this, EntryActivity.class);
        startActivity(intent);
    }

}