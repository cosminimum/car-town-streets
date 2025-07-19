package tapjoy;

import java.lang.reflect.Array;

public class TapjoyVideoObject {
    public static final int BUTTON_MAX = 10;
    public int buttonCount;
    public String[][] buttonData = ((String[][]) Array.newInstance(String.class, new int[]{10, 2}));
    public String clickURL;
    public String currencyAmount;
    public String currencyName;
    public String dataLocation;
    public String iconURL;
    public String offerID;
    public String videoAdName;
    public String videoURL;
    public String webviewURL;

    public void addButton(String name, String url) {
        this.buttonData[this.buttonCount][0] = name;
        this.buttonData[this.buttonCount][1] = url;
        this.buttonCount++;
    }
}
