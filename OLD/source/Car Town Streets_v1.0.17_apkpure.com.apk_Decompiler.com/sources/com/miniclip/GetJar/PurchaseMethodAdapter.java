package com.miniclip.GetJar;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.Product;
import com.getjar.sdk.utilities.Constants;
import com.miniclip.nativeJNI.cocojava;
import java.util.List;

public class PurchaseMethodAdapter extends BaseAdapter implements View.OnClickListener {
    private Context context;
    private SharedPreferences prefs;
    private List<Product> products;

    public PurchaseMethodAdapter(Context context2, List<Product> products2) {
        this.context = context2;
        this.products = products2;
    }

    public int getCount() {
        return this.products.size();
    }

    public Object getItem(int position) {
        return Integer.valueOf(position);
    }

    public long getItemId(int itemId) {
        return (long) itemId;
    }

    public View getView(int position, View view, ViewGroup arg2) {
        int id;
        View view2 = ((LayoutInflater) this.context.getSystemService("layout_inflater")).inflate(this.context.getResources().getIdentifier("purchase_method", "layout", this.context.getPackageName()), (ViewGroup) null);
        Product product = this.products.get(position);
        TextView productinfo = (TextView) view2.findViewById(this.context.getResources().getIdentifier("product_info", Constants.APP_ID, this.context.getPackageName()));
        productinfo.setText(String.valueOf(product.getAmount()));
        boolean gplayflag = product.getProductDescription() == "Google Play Store";
        if (gplayflag) {
            String result = cocojava.getProductPrice(product.getProductId());
            if (result == null || result.trim().length() <= 0) {
                productinfo.setText("Buy");
            } else {
                productinfo.setText(result);
            }
        }
        view2.setEnabled(true);
        view2.setOnClickListener(this);
        view2.setTag(product);
        ((TextView) view2.findViewById(this.context.getResources().getIdentifier("product_name", Constants.APP_ID, this.context.getPackageName()))).setText(product.getProductDescription());
        TextView productDesc = (TextView) view2.findViewById(this.context.getResources().getIdentifier("product_desc", Constants.APP_ID, this.context.getPackageName()));
        ImageView productImg = (ImageView) view2.findViewById(this.context.getResources().getIdentifier("product_img", Constants.APP_ID, this.context.getPackageName()));
        if (gplayflag) {
            productDesc.setText("Buy now");
            id = this.context.getResources().getIdentifier("icon_googlewallet", "drawable", this.context.getPackageName());
        } else {
            productDesc.setText("Try apps to earn free");
            id = this.context.getResources().getIdentifier("icon_getjar", "drawable", this.context.getPackageName());
        }
        productImg.setImageResource(id);
        return view2;
    }

    public void onClick(View v) {
        if (v.getTag() != null) {
            try {
                Product product = (Product) v.getTag();
                if (product.getProductDescription() == "Getjar Gold") {
                    Log.i(GetJarManager.GetjarIntentKey, "showOfferWall");
                    GetJar.showOfferWall(product);
                } else if (product.getProductDescription() == "Google Play Store") {
                    Log.i(GetJarManager.GetjarIntentKey, "gplay");
                    GetJar.getJarResponce(0);
                }
                GetJar.dismissPickDialog();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
