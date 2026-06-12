package sg.acecom.track.systempest.adapter;

import android.app.Activity;
import android.app.AlertDialog;

import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

import sg.acecom.track.systempest.InventoryActivity;
import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.database.DatabaseHelper;
import sg.acecom.track.systempest.model.Inventory;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 17/4/18.
 */

public class InventoryAdapter extends RecyclerView.Adapter<InventoryAdapter.MyViewHolder>{

    private Activity mContext;
    private List<Inventory> inventoryList;
    private MyPreferences pref;
    AlertDialog.Builder alert_dialog;
    DatabaseHelper db;
    private final static int FADE_DURATION = 1000; //FADE_DURATION in milliseconds

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView inventoryItem, itemQuantity, inventoryUnit;
        public Button buttonRemove;
        public ImageView imageAdd, imageMinus;

        public MyViewHolder(View view) {
            super(view);
            inventoryItem = view.findViewById(R.id.inventoryItem);
            itemQuantity = view.findViewById(R.id.itemQuantity);
            buttonRemove = view.findViewById(R.id.buttonRemove);
            imageAdd = view.findViewById(R.id.imageAdd);
            imageMinus = view.findViewById(R.id.imageMinus);
            inventoryUnit = view.findViewById(R.id.inventoryUnit);
        }
    }


    public InventoryAdapter(Activity mContext, List<Inventory> inventoryList) {
        this.mContext = mContext;
        this.inventoryList = inventoryList;
        pref = new MyPreferences(mContext);
        db = new DatabaseHelper(mContext);
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.cardview_inventory, parent, false);


        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, final int position) {
        // Set the view to fade in
        setFadeAnimation(holder.itemView);
        final Inventory inventory = inventoryList.get(position);
        //inventory.setDb_ID(position + 1);
        System.out.println("DB_ID = " + inventory.getDb_ID());
        holder.inventoryItem.setText(inventory.getItemName());
        holder.inventoryUnit.setText(inventory.getItemUnit());
        //holder.itemQuantity.setText(String.valueOf(inventory.getItemQuantity()));
        final int[] quantity = {0};
        System.out.println("INVENTORY QTT = " + inventory.getItemQuantity());
        System.out.println("STOCKOUT  = " + inventory.getItemStockout());
        //inventory.setStockOutQuantity(Integer.parseInt(inventory.getItemStockout()));
        holder.itemQuantity.setText(inventory.getItemStockout());
        holder.imageAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String currentQuantity = String.valueOf(holder.itemQuantity.getText());
                if(Integer.parseInt(currentQuantity) >= Integer.parseInt(inventory.getItemQuantity())){
                    Toast.makeText(mContext, "Exceed number of quantity in Inventory", Toast.LENGTH_SHORT).show();
                }else{
                    ((InventoryActivity) mContext).updateItemCount("Add");
                    int intCurrentQuantity = Integer.parseInt(currentQuantity) + 1;
                    System.out.println("STOCKOUT = " + intCurrentQuantity + "????");
                    inventory.setItemStockout(String.valueOf(intCurrentQuantity));
                    //System.out.println("add = " + inventory.getItemStockout());
                    int isUpdate = db.updateInventory(inventory);
                    System.out.println("ISUPDATE = " + isUpdate);
                    holder.itemQuantity.setText(String.valueOf(intCurrentQuantity));
                }

            }
        });
        holder.imageMinus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String currentQuantity = String.valueOf(holder.itemQuantity.getText());
                if(Integer.parseInt(currentQuantity) <= 0){

                }else{
                    ((InventoryActivity) mContext).updateItemCount("Minus");
                    int intCurrentQuantity = Integer.parseInt(currentQuantity) - 1;
                    inventory.setItemStockout(String.valueOf(intCurrentQuantity));
                    int isUpdate = db.updateInventory(inventory);
                    System.out.println("ISUPDATE = " + isUpdate);
                    holder.itemQuantity.setText(String.valueOf(intCurrentQuantity));
                }
            }
        });

        holder.buttonRemove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                deleteItem(position);

                if(mContext instanceof InventoryActivity){
                    ((InventoryActivity)mContext).loadStorage();
                }
            }
        });
    }

    @Override
    public int getItemCount() {
        return inventoryList.size();
    }

    private void setFadeAnimation(View view) {
        AlphaAnimation anim = new AlphaAnimation(0.0f, 1.0f);
        anim.setDuration(FADE_DURATION);
        view.startAnimation(anim);
    }

    /**
     * Deleting note from SQLite and removing the
     * item from the list by its position
     */
    private void deleteItem(int position) {
        // deleting the note from db
        db.deleteInventory(inventoryList.get(position));

        // removing the note from the list
        inventoryList.remove(position);
        notifyItemRemoved(position);
    }

}