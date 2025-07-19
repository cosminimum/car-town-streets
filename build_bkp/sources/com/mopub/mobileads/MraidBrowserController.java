package com.mopub.mobileads;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.google.android.gms.drive.DriveFile;

class MraidBrowserController extends MraidAbstractController {
    private static final String LOGTAG = "MraidBrowserController";

    MraidBrowserController(MraidView view) {
        super(view);
    }

    /* access modifiers changed from: protected */
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
