package ch.hatbe2113.d005;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);



    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if(item.getItemId() == R.id.menu_general_item_apple) {
            System.out.println("MENU PRESSED APPLE");
        } else if(item.getItemId() == R.id.menu_general_item_clementine) {
            System.out.println("MENU PRESSED CLEMENTINE");
        } else {
            super.onOptionsItemSelected(item);
        }

        return true;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);

        getMenuInflater().inflate(R.menu.general_menu, menu);
        menu.findItem(R.id.menu_general_item_apple).setEnabled(false);

        return true;
    }
}