.class public Lcom/miniclip/nativeJNI/HtmlDialog;
.super Landroid/app/Dialog;
.source "HtmlDialog.java"


# static fields
.field static final DIMENSIONS_DIFF_LANDSCAPE:[F

.field static final DIMENSIONS_DIFF_PORTRAIT:[F

.field static final DISPLAY_STRING:Ljava/lang/String; = "touch"

.field static final FILL:Landroid/widget/FrameLayout$LayoutParams;

.field static final MARGIN:I = 0x4

.field static final PADDING:I = 0x2


# instance fields
.field private mContent:Landroid/widget/FrameLayout;

.field private mCrossImage:Landroid/widget/ImageView;

.field private mHtml:Ljava/lang/String;

.field private mIsInternalURL:I

.field private mListener:Lcom/facebook/android/Facebook$DialogListener;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    const/4 v1, -0x1

    .line 30
    new-array v0, v2, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miniclip/nativeJNI/HtmlDialog;->DIMENSIONS_DIFF_LANDSCAPE:[F

    .line 31
    new-array v0, v2, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/miniclip/nativeJNI/HtmlDialog;->DIMENSIONS_DIFF_PORTRAIT:[F

    .line 32
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    sput-object v0, Lcom/miniclip/nativeJNI/HtmlDialog;->FILL:Landroid/widget/FrameLayout$LayoutParams;

    return-void

    .line 30
    :array_0
    .array-data 4
        0x41a00000    # 20.0f
        0x42700000    # 60.0f
    .end array-data

    .line 31
    :array_1
    .array-data 4
        0x42200000    # 40.0f
        0x42700000    # 60.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ILcom/facebook/android/Facebook$DialogListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "html"    # Ljava/lang/String;
    .param p3, "isInternalURL"    # I
    .param p4, "listener"    # Lcom/facebook/android/Facebook$DialogListener;

    .prologue
    const/16 v2, 0x400

    .line 49
    const v1, 0x1030010

    invoke-direct {p0, p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 40
    const/4 v1, 0x1

    iput v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mIsInternalURL:I

    .line 50
    iput-object p2, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mHtml:Ljava/lang/String;

    .line 51
    iput-object p4, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mListener:Lcom/facebook/android/Facebook$DialogListener;

    .line 52
    iput p3, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mIsInternalURL:I

    .line 54
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 55
    .local v0, "dialog_window":Landroid/view/Window;
    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/android/Facebook$DialogListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "html"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/facebook/android/Facebook$DialogListener;

    .prologue
    const/16 v2, 0x400

    .line 59
    const v1, 0x1030010

    invoke-direct {p0, p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 40
    const/4 v1, 0x1

    iput v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mIsInternalURL:I

    .line 60
    iput-object p2, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mHtml:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mListener:Lcom/facebook/android/Facebook$DialogListener;

    .line 63
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 64
    .local v0, "dialog_window":Landroid/view/Window;
    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 65
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/HtmlDialog;)Lcom/facebook/android/Facebook$DialogListener;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/HtmlDialog;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mListener:Lcom/facebook/android/Facebook$DialogListener;

    return-object v0
.end method

.method private createCrossImage()V
    .locals 5

    .prologue
    .line 97
    new-instance v1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mCrossImage:Landroid/widget/ImageView;

    .line 99
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mCrossImage:Landroid/widget/ImageView;

    new-instance v2, Lcom/miniclip/nativeJNI/HtmlDialog$1;

    invoke-direct {v2, p0}, Lcom/miniclip/nativeJNI/HtmlDialog$1;-><init>(Lcom/miniclip/nativeJNI/HtmlDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "close"

    const-string v3, "drawable"

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 111
    .local v0, "resourceId":I
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mCrossImage:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 116
    return-void
.end method

.method private setUpWebView(I)V
    .locals 7
    .param p1, "margin"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 119
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 120
    .local v0, "webViewContainer":Landroid/widget/LinearLayout;
    new-instance v1, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    .line 121
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v6}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 122
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v5}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 123
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Landroid/webkit/WebViewClient;

    invoke-direct {v2}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 124
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 125
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const-string v2, "utf-8"

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDefaultTextEncodingName(Ljava/lang/String;)V

    .line 129
    :try_start_0
    iget v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mIsInternalURL:I

    if-nez v1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mHtml:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :goto_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v6}, Landroid/webkit/WebView;->setScrollContainer(Z)V

    .line 140
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    sget-object v2, Lcom/miniclip/nativeJNI/HtmlDialog;->FILL:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mContent:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v5}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 144
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v5}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 145
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mCrossImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 148
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 149
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 150
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mContent:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 151
    return-void

    .line 132
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mHtml:Ljava/lang/String;

    const-string v3, "utf-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\+"

    const-string v4, " "

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "text/html; charset=UTF-8"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v1

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, -0x1

    const/4 v4, -0x2

    .line 69
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 74
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/miniclip/nativeJNI/HtmlDialog;->requestWindowFeature(I)Z

    .line 75
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mContent:Landroid/widget/FrameLayout;

    .line 81
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/HtmlDialog;->createCrossImage()V

    .line 86
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mCrossImage:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    .line 87
    .local v0, "crossWidth":I
    div-int/lit8 v1, v0, 0x2

    invoke-direct {p0, v1}, Lcom/miniclip/nativeJNI/HtmlDialog;->setUpWebView(I)V

    .line 92
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mContent:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mCrossImage:Landroid/widget/ImageView;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    iget-object v1, p0, Lcom/miniclip/nativeJNI/HtmlDialog;->mContent:Landroid/widget/FrameLayout;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Lcom/miniclip/nativeJNI/HtmlDialog;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    return-void
.end method
