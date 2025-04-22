package ch.hatbe.fitapp.config;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.util.List;

import ch.hatbe.fitapp.R;
import ch.hatbe.fitapp.calculator.ResultActivity;
import ch.hatbe.fitapp.util.DatabaseConnection;
import ch.hatbe.fitapp.util.Measurement;
import ch.hatbe.fitapp.util.User;

public class UsersActivity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_users);

        var spinner = (Spinner) findViewById(R.id.userSpinner);

        DatabaseConnection dbConnection = new DatabaseConnection(this);
        dbConnection.open();

        List<User> usersO = dbConnection.selectUsers();

        var users = new String[usersO.size()];

        for(int i = 0; i < usersO.size(); i++) {
            users[i] = usersO.get(i).username;
        }

        var adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, users);
        spinner.setAdapter(adapter);
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                var sharedPreferences = getSharedPreferences("login", MODE_PRIVATE);
                var editor = sharedPreferences.edit();

                editor.putString("currentUser", users[position]);

                editor.apply();

                Toast.makeText(UsersActivity.this, String.format(getString(R.string.youAreNow), users[position]), Toast.LENGTH_LONG).show();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });

        var inputUsername = (EditText) findViewById(R.id.inputCreateUsername);

        var btnCreateUser = (Button) findViewById(R.id.btnCreateUser);
        btnCreateUser.setOnClickListener((view) -> {
            dbConnection.insertUser(inputUsername.getText().toString());

            Toast.makeText(UsersActivity.this, R.string.saved_successfully, Toast.LENGTH_LONG).show();
            inputUsername.setText("");
        });
    }
}