package ch.hatbe.fitapp;

import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;

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

        var inputUsername = (EditText) findViewById(R.id.inputUsername);

        var btnLogin = (Button) findViewById(R.id.buttonLogin);
        btnLogin.setOnClickListener((view) -> {

            Log.i("MAIN", inputUsername.getText().toString());

        });
    }
}