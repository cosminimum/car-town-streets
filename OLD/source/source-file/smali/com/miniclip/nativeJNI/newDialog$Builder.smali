.class public Lcom/miniclip/nativeJNI/newDialog$Builder;
.super Ljava/lang/Object;
.source "newDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/newDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private cancelable:Z

.field private contentView:Landroid/view/View;

.field private context:Landroid/content/Context;

.field private message:Ljava/lang/String;

.field private negativeButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private negativeButtonText:Ljava/lang/String;

.field private neutralButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private neutralButtonText:Ljava/lang/String;

.field private positiveButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private positiveButtonText:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/newDialog$Builder;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/newDialog$Builder;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miniclip/nativeJNI/newDialog$Builder;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/newDialog$Builder;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/miniclip/nativeJNI/newDialog$Builder;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/newDialog$Builder;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->neutralButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-object v0
.end method


# virtual methods
.method public create()Lcom/miniclip/nativeJNI/newDialog;
    .locals 11

    .prologue
    const/16 v10, 0x8

    const/4 v9, -0x2

    .line 186
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    const-string v6, "layout_inflater"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/LayoutInflater;

    .line 189
    .local v3, "inflater":Landroid/view/LayoutInflater;
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "Dialog"

    const-string v7, "style"

    iget-object v8, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 190
    .local v2, "dialogStyle":I
    new-instance v0, Lcom/miniclip/nativeJNI/newDialog;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-direct {v0, v5, v2}, Lcom/miniclip/nativeJNI/newDialog;-><init>(Landroid/content/Context;I)V

    .line 192
    .local v0, "dialog":Lcom/miniclip/nativeJNI/newDialog;
    iget-boolean v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->cancelable:Z

    invoke-virtual {v0, v5}, Lcom/miniclip/nativeJNI/newDialog;->setCancelable(Z)V

    .line 193
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "dialog"

    const-string v7, "layout"

    iget-object v8, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 194
    .local v1, "dialogLayout":I
    const/4 v5, 0x0

    invoke-virtual {v3, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 196
    .local v4, "layout":Landroid/view/View;
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v5}, Lcom/miniclip/nativeJNI/newDialog;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 199
    const-string v5, "title1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->title:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonText:Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 204
    const-string v5, "positiveButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonText:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 206
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v5, :cond_0

    .line 208
    const-string v5, "positiveButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    new-instance v6, Lcom/miniclip/nativeJNI/newDialog$Builder$1;

    invoke-direct {v6, p0, v0}, Lcom/miniclip/nativeJNI/newDialog$Builder$1;-><init>(Lcom/miniclip/nativeJNI/newDialog$Builder;Lcom/miniclip/nativeJNI/newDialog;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonText:Ljava/lang/String;

    if-eqz v5, :cond_5

    .line 226
    const-string v5, "negativeButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonText:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 228
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v5, :cond_1

    .line 230
    const-string v5, "negativeButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    new-instance v6, Lcom/miniclip/nativeJNI/newDialog$Builder$2;

    invoke-direct {v6, p0, v0}, Lcom/miniclip/nativeJNI/newDialog$Builder$2;-><init>(Lcom/miniclip/nativeJNI/newDialog$Builder;Lcom/miniclip/nativeJNI/newDialog;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 246
    :cond_1
    :goto_1
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->neutralButtonText:Ljava/lang/String;

    if-eqz v5, :cond_6

    .line 248
    const-string v5, "neutralButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->neutralButtonText:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 250
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->neutralButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v5, :cond_2

    .line 252
    const-string v5, "neutralButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    new-instance v6, Lcom/miniclip/nativeJNI/newDialog$Builder$3;

    invoke-direct {v6, p0, v0}, Lcom/miniclip/nativeJNI/newDialog$Builder$3;-><init>(Lcom/miniclip/nativeJNI/newDialog$Builder;Lcom/miniclip/nativeJNI/newDialog;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    :cond_2
    :goto_2
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->message:Ljava/lang/String;

    if-eqz v5, :cond_7

    .line 270
    const-string v5, "message1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->message:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 284
    :cond_3
    :goto_3
    invoke-virtual {v0, v4}, Lcom/miniclip/nativeJNI/newDialog;->setContentView(Landroid/view/View;)V

    .line 285
    return-object v0

    .line 220
    :cond_4
    const-string v5, "positiveButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 242
    :cond_5
    const-string v5, "negativeButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 264
    :cond_6
    const-string v5, "neutralButton1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    .line 271
    :cond_7
    iget-object v5, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->contentView:Landroid/view/View;

    if-eqz v5, :cond_3

    .line 275
    const-string v5, "content1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 278
    const-string v5, "content1"

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->contentView:Landroid/view/View;

    new-instance v7, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v7, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3
.end method

.method public setCancelable(Z)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 0
    .param p1, "isCancelable"    # Z

    .prologue
    .line 111
    iput-boolean p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->cancelable:Z

    .line 112
    return-object p0
.end method

.method public setContentView(Landroid/view/View;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->contentView:Landroid/view/View;

    .line 107
    return-object p0
.end method

.method public setMessage(I)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 1
    .param p1, "message"    # I

    .prologue
    .line 74
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->message:Ljava/lang/String;

    .line 75
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->message:Ljava/lang/String;

    .line 65
    return-object p0
.end method

.method public setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 1
    .param p1, "negativeButtonText"    # I
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonText:Ljava/lang/String;

    .line 152
    iput-object p2, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 153
    return-object p0
.end method

.method public setNegativeButton(Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 0
    .param p1, "negativeButtonText"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonText:Ljava/lang/String;

    .line 165
    iput-object p2, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->negativeButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 166
    return-object p0
.end method

.method public setNeutralButton(Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 0
    .param p1, "neutralButtonText"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->neutralButtonText:Ljava/lang/String;

    .line 178
    iput-object p2, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->neutralButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 179
    return-object p0
.end method

.method public setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 1
    .param p1, "positiveButtonText"    # I
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 123
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonText:Ljava/lang/String;

    .line 125
    iput-object p2, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 126
    return-object p0
.end method

.method public setPositiveButton(Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 0
    .param p1, "positiveButtonText"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonText:Ljava/lang/String;

    .line 138
    iput-object p2, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->positiveButtonClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 139
    return-object p0
.end method

.method public setTitle(I)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 1
    .param p1, "title"    # I

    .prologue
    .line 84
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->title:Ljava/lang/String;

    .line 85
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/miniclip/nativeJNI/newDialog$Builder;
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder;->title:Ljava/lang/String;

    .line 95
    return-object p0
.end method
