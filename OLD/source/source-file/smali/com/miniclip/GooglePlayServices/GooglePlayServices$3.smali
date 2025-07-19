.class Lcom/miniclip/GooglePlayServices/GooglePlayServices$3;
.super Ljava/lang/Object;
.source "GooglePlayServices.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GooglePlayServices/GooglePlayServices;->onPeopleLoaded(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/people/PersonBuffer;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/GooglePlayServices/GooglePlayServices;


# direct methods
.method constructor <init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices;)V
    .locals 0

    .prologue
    .line 863
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$3;->this$0:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 866
    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$300()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$200()I

    move-result v1

    invoke-static {v0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->MPeopleLoaded(Ljava/lang/String;I)V

    .line 867
    return-void
.end method
