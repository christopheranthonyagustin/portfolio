package sg.acecom.track.systempest.interfaces;

import android.view.View;

/**
 * Created by michael on 2/12/17.
 */

public interface ISpinnerSelectedView {
    View getNoSelectionView();
    View getSelectedView(int position);
}
