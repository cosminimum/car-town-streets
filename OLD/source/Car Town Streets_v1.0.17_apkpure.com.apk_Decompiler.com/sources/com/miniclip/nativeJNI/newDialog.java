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

public class newDialog extends Dialog {
    public newDialog(Context context, int theme) {
        super(context, theme);
    }

    public newDialog(Context context) {
        super(context);
    }

    public static class Builder {
        private boolean cancelable;
        private View contentView;
        private Context context;
        private String message;
        /* access modifiers changed from: private */
        public DialogInterface.OnClickListener negativeButtonClickListener;
        private String negativeButtonText;
        /* access modifiers changed from: private */
        public DialogInterface.OnClickListener neutralButtonClickListener;
        private String neutralButtonText;
        /* access modifiers changed from: private */
        public DialogInterface.OnClickListener positiveButtonClickListener;
        private String positiveButtonText;
        private String title;

        public Builder(Context context2) {
            this.context = context2;
        }

        public Builder setMessage(String message2) {
            this.message = message2;
            return this;
        }

        public Builder setMessage(int message2) {
            this.message = (String) this.context.getText(message2);
            return this;
        }

        public Builder setTitle(int title2) {
            this.title = (String) this.context.getText(title2);
            return this;
        }

        public Builder setTitle(String title2) {
            this.title = title2;
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

        public Builder setPositiveButton(int positiveButtonText2, DialogInterface.OnClickListener listener) {
            this.positiveButtonText = (String) this.context.getText(positiveButtonText2);
            this.positiveButtonClickListener = listener;
            return this;
        }

        public Builder setPositiveButton(String positiveButtonText2, DialogInterface.OnClickListener listener) {
            this.positiveButtonText = positiveButtonText2;
            this.positiveButtonClickListener = listener;
            return this;
        }

        public Builder setNegativeButton(int negativeButtonText2, DialogInterface.OnClickListener listener) {
            this.negativeButtonText = (String) this.context.getText(negativeButtonText2);
            this.negativeButtonClickListener = listener;
            return this;
        }

        public Builder setNegativeButton(String negativeButtonText2, DialogInterface.OnClickListener listener) {
            this.negativeButtonText = negativeButtonText2;
            this.negativeButtonClickListener = listener;
            return this;
        }

        public Builder setNeutralButton(String neutralButtonText2, DialogInterface.OnClickListener listener) {
            this.neutralButtonText = neutralButtonText2;
            this.neutralButtonClickListener = listener;
            return this;
        }

        public newDialog create() {
            final newDialog dialog = new newDialog(this.context, this.context.getResources().getIdentifier("Dialog", "style", this.context.getPackageName()));
            dialog.setCancelable(this.cancelable);
            View layout = ((LayoutInflater) this.context.getSystemService("layout_inflater")).inflate(this.context.getResources().getIdentifier("dialog", "layout", this.context.getPackageName()), (ViewGroup) null);
            dialog.addContentView(layout, new ViewGroup.LayoutParams(-1, -2));
            ((TextView) layout.findViewWithTag("title1")).setText(this.title);
            if (this.positiveButtonText != null) {
                ((Button) layout.findViewWithTag("positiveButton1")).setText(this.positiveButtonText);
                if (this.positiveButtonClickListener != null) {
                    ((Button) layout.findViewWithTag("positiveButton1")).setOnClickListener(new View.OnClickListener() {
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
                    ((Button) layout.findViewWithTag("negativeButton1")).setOnClickListener(new View.OnClickListener() {
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
                    ((Button) layout.findViewWithTag("neutralButton1")).setOnClickListener(new View.OnClickListener() {
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
