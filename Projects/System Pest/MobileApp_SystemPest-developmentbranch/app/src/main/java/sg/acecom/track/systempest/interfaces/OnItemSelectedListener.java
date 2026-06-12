package sg.acecom.track.systempest.interfaces;

import android.view.View;

/**
 * Created by michael on 1/14/17.
 */

public interface OnItemSelectedListener {
    void onItemSelected(View view, int position, long id);
    void onNothingSelected();
}
