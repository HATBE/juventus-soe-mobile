package ch.hatbe.fitapp;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends BaseActivity {

    public MainActivity() {
        super();

        this.showMenu = false;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        var inputUsername = (EditText) findViewById(R.id.inputUsername);

        var btnLogin = (Button) findViewById(R.id.buttonLogin);
        btnLogin.setOnClickListener((view) -> {

                var sharedPreferences = getSharedPreferences("login", MODE_PRIVATE);
                var editor = sharedPreferences.edit();

                String username = inputUsername.getText().toString();

                if(username.isEmpty()) {
                    return;
                }

                editor.putString("currentUser", username);

                editor.apply();

                Intent intent = new Intent(this, HomeActivity.class);
                startActivity(intent);
        });
    }
}