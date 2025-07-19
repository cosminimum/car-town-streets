package com.miniclip.nativeJNI;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
/* loaded from: classes.dex */
public class newDialog extends Dialog {
    public newDialog(Context context, int theme) {
        super(context, theme);
    }

    public newDialog(Context context) {
        super(context);
    }

    /* loaded from: classes.dex */
    public static class Builder {
        private boolean cancelable;
        private View contentView;
        private Context context;
        private String message;
        private DialogInterface.OnClickListener negativeButtonClickListener;
        private String negativeButtonText;
        private DialogInterface.OnClickListener neutralButtonClickListener;
        private String neutralButtonText;
        private DialogInterface.OnClickListener positiveButtonClickListener;
        private String positiveButtonText;
        private String title;

        public Builder(Context context) {
            this.context = context;
        }

        public Builder setMessage(String message) {
            this.message = message;
            return this;
        }

        public Builder setMessage(int message) {
            this.message = (String) this.context.getText(message);
            return this;
        }

        public Builder setTitle(int title) {
            this.title = (String) this.context.getText(title);
            return this;
        }

        public Builder setTitle(String title) {
            this.title = title;
            return this;
        }

        public Builder setContentView(View v) {
            this.contentView = v;
            return this;
        }

        public Builder setCancelable(boolean isCancelable) {
            this.cancelable = isCancelable;
            return this;
        }

        public Builder setPositiveButton(int positiveButtonText, DialogInterface.OnClickListener listener) {
            this.positiveButtonText = (String) this.context.getText(positiveButtonText);
            this.positiveButtonClickListener = listener;
            return this;
        }

        public Builder setPositiveButton(String positiveButtonText, DialogInterface.OnClickListener listener) {
            this.positiveButtonText = positiveButtonText;
            this.positiveButtonClickListener = listener;
            return this;
        }

        public Builder setNegativeButton(int negativeButtonText, DialogInterface.OnClickListener listener) {
            this.negativeButtonText = (String) this.context.getText(negativeButtonText);
            this.negativeButtonClickListener = listener;
            return this;
        }

        public Builder setNegativeButton(String negativeButtonText, DialogInterface.OnClickListener listener) {
            this.negativeButtonText = negativeButtonText;
            this.negativeButtonClickListener = listener;
            return this;
        }

        public Builder setNeutralButton(String neutralButtonText, DialogInterface.OnClickListener listener) {
            this.neutralButtonText = neutralButtonText;
            this.neutralButtonClickListener = listener;
            return this;
        }

        public newDialog create() {
            LayoutInflater inflater = (LayoutInflater) this.context.getSystemService("layout_inflater");
            int dialogStyle = this.context.getResources().getIdentifier("Dialog", "style", this.context.getPackageName());
            final newDialog dialog = new newDialog(this.context, dialogStyle);
            dialog.setCancelable(this.cancelable);
            int dialogLayout = this.context.getResources().getIdentifier("dialog", "layout", this.context.getPackageName());
            View layout = inflater.inflate(dialogLayout, (ViewGroup) null);
            dialog.addContentView(layout, new ViewGroup.LayoutParams(-1, -2));
            ((TextView) layout.findViewWithTag("title1")).setText(this.title);
            if (this.positiveButtonText != null) {
                ((Button) layout.findViewWithTag("positiveButton1")).setText(this.positiveButtonText);
                if (this.positiveButtonClickListener != null) {
                    ((Button) layout.findViewWithTag("positiveButton1")).setOnClickListener(new View.OnClickListener() { // from class: com.miniclip.nativeJNI.newDialog.Builder.1
                        @Override // android.view.View.OnClickListener
                        public void onClick(View v) {
                            Builder.this.positiveButtonClickListener.onClick(dialog, -1);
                            dialog.dismiss();
                        }
                    });
                }
            } else {
                layout.findViewWithTag("positiveButton1").setVisibility(8);
            }
            if (this.negativeButtonText != null) {
                ((Button) layout.findViewWithTag("negativeButton1")).setText(this.negativeButtonText);
                if (this.negativeButtonClickListener != null) {
                    ((Button) layout.findViewWithTag("negativeButton1")).setOnClickListener(new View.OnClickListener() { // from class: com.miniclip.nativeJNI.newDialog.Builder.2
                        @Override // android.view.View.OnClickListener
                        public void onClick(View v) {
                            Builder.this.negativeButtonClickListener.onClick(dialog, -2);
                            dialog.dismiss();
                        }
                    });
                }
            } else {
                layout.findViewWithTag("negativeButton1").setVisibility(8);
            }
            if (this.neutralButtonText != null) {
                ((Button) layout.findViewWithTag("neutralButton1")).setText(this.neutralButtonText);
                if (this.neutralButtonClickListener != null) {
                    ((Button) layout.findViewWithTag("neutralButton1")).setOnClickListener(new View.OnClickListener() { // from class: com.miniclip.nativeJNI.newDialog.Builder.3
                        @Override // android.view.View.OnClickListener
                        public void onClick(View v) {
                            Builder.this.neutralButtonClickListener.onClick(dialog, -3);
                            dialog.dismiss();
                        }
                    });
                }
            } else {
                layout.findViewWithTag("neutralButton1").setVisibility(8);
            }
            if (this.message != null) {
                ((TextView) layout.findViewWithTag("message1")).setText(this.message);
            } else if (this.contentView != null) {
                ((LinearLayout) layout.findViewWithTag("content1")).removeAllViews();
                ((LinearLayout) layout.findViewWithTag("content1")).addView(this.contentView, new ViewGroup.LayoutParams(-2, -2));
            }
            dialog.setContentView(layout);
            return dialog;
        }
    }
}
