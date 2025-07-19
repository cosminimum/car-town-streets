package com.mopub.mobileads;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.google.android.gms.drive.DriveFile;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class MraidBrowserController extends MraidAbstractController {
    private static final String LOGTAG = "MraidBrowserController";

    /* JADX INFO: Access modifiers changed from: package-private */
    public MraidBrowserController(MraidView view) {
        super(view);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void open(String url) {
        Log.d(LOGTAG, "Opening in-app browser: " + url);
        MraidView view = getView();
        if (view.getOnOpenListener() != null) {
            view.getOnOpenListener().onOpen(view);
        }
        Context context = getView().getContext();
        Intent i = new Intent(context, MraidBrowser.class);
        i.putExtra(MraidBrowser.URL_EXTRA, url);
        i.addFlags(DriveFile.MODE_READ_ONLY);
        context.startActivity(i);
    }
}
