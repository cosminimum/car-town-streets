package com.apsalar.sdk;

import com.getjar.sdk.utilities.Utility;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: ApWebViewClient */
class CallbackURL {
    public ArrayList<String> argNames = new ArrayList<>();
    public ArrayList<String> argVals = new ArrayList<>();
    public JSONArray argValsJSON = new JSONArray();
    public JSONObject clickParams = new JSONObject();
    public String name;
    public String signature;

    public CallbackURL(String str) {
        String[] split = str.replaceAll("^callback:", "").split("\\?");
        if (split.length > 1) {
            this.name = split[0];
            String[] split2 = split[1].split(Utility.QUERY_APPENDIX);
            for (String split3 : split2) {
                String[] split4 = split3.split("=");
                if (split4.length >= 2) {
                    if (split4[0].startsWith("__")) {
                        try {
                            this.clickParams.put(split4[0], split4[1]);
                        } catch (JSONException e) {
                        }
                    } else {
                        this.argNames.add(split4[0]);
                        this.argVals.add(split4[1]);
                        this.argValsJSON.put(split4[1]);
                    }
                }
            }
            this.signature = this.name + "(";
            for (int i = 0; i < this.argNames.size(); i++) {
                this.signature += this.argNames.get(i) + ",";
            }
            this.signature = this.signature.replaceFirst(",$", "") + ")";
        }
    }
}
