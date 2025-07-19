.class public Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;
.super Landroid/widget/ImageView;
.source "NewsfeedDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/newsfeed/NewsfeedDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "URLImageView"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/newsfeed/NewsfeedDialog;


# direct methods
.method public constructor <init>(Lcom/miniclip/newsfeed/NewsfeedDialog;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->this$0:Lcom/miniclip/newsfeed/NewsfeedDialog;

    .line 36
    invoke-direct {p0, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 37
    return-void
.end method


# virtual methods
.method public loadFromURL(Ljava/lang/String;)Z
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 42
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 44
    .local v2, "newurl":Ljava/net/URL;
    :try_start_1
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 45
    .local v1, "imageBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, v1}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    .line 46
    const/4 v3, 0x1

    .line 53
    .end local v1    # "imageBitmap":Landroid/graphics/Bitmap;
    .end local v2    # "newurl":Ljava/net/URL;
    :goto_0
    return v3

    .line 47
    .restart local v2    # "newurl":Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_1

    .line 53
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "newurl":Ljava/net/URL;
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 50
    :catch_1
    move-exception v0

    .line 51
    .local v0, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_1
.end method
