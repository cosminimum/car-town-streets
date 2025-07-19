.class final Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;
.super Ljava/lang/Object;
.source "GooglePlayServices.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GooglePlayServices/GooglePlayServices;->GPM_share(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$text:Ljava/lang/String;

.field final synthetic val$type:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 953
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;->val$type:Ljava/lang/String;

    iput-object p2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;->val$text:Ljava/lang/String;

    iput-object p3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 955
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;->val$type:Ljava/lang/String;

    iget-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;->val$text:Ljava/lang/String;

    iget-object v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->share(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 956
    return-void
.end method
