package ch.hatbe.fitapp;

import android.content.Intent;
import android.view.Menu;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import ch.hatbe.fitapp.calculator.EntryActivity;
import ch.hatbe.fitapp.history.OverviewActivity;
import ch.hatbe.fitapp.config.SettingsActivity;
import ch.hatbe.fitapp.rating.LegendActivity;

public class BaseActivity extends AppCompatActivity {
    protected boolean showMenu = true;

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        Intent intent;
        if(item.getItemId() == R.id.menu_general_item_home) {
            intent = new Intent(this, HomeActivity.class);
        } else if(item.getItemId() == R.id.menu_general_item_history) {
            intent = new Intent(this, OverviewActivity.class);
        } else if(item.getItemId() == R.id.menu_general_item_calculator) {
            intent = new Intent(this, EntryActivity.class);
        } else if(item.getItemId() == R.id.menu_general_item_rating) {
            intent = new Intent(this, LegendActivity.class);
        } else if(item.getItemId() == R.id.menu_general_item_settings) {
            intent = new Intent(this, SettingsActivity.class);
        } else {
            super.onOptionsItemSelected(item);
            return false;
        }

        startActivity(intent);

        return true;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);

        if(this.showMenu) {
            getMenuInflater().inflate(R.menu.general_menu, menu);

            if (this instanceof HomeActivity) {
                menu.findItem(R.id.menu_general_item_home).setEnabled(false);
            } else if (this instanceof OverviewActivity) {
                menu.findItem(R.id.menu_general_item_history).setEnabled(false);
            } else if (this instanceof EntryActivity) {
                menu.findItem(R.id.menu_general_item_calculator).setEnabled(false);
            } else if (this instanceof LegendActivity) {
                menu.findItem(R.id.menu_general_item_rating).setEnabled(false);
            } else if (this instanceof SettingsActivity) {
                menu.findItem(R.id.menu_general_item_settings).setEnabled(false);
            }
        }

        return true;
    }

}
