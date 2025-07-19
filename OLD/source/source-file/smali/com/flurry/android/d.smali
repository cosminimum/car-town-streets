.class final Lcom/flurry/android/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Landroid/content/Context;

.field private synthetic b:Z

.field private synthetic c:Lcom/flurry/android/FlurryAgent;


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;Z)V
    .locals 0

    .prologue
    .line 874
    iput-object p1, p0, Lcom/flurry/android/d;->c:Lcom/flurry/android/FlurryAgent;

    iput-object p2, p0, Lcom/flurry/android/d;->a:Landroid/content/Context;

    iput-boolean p3, p0, Lcom/flurry/android/d;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .prologue
    .line 878
    iget-object v0, p0, Lcom/flurry/android/d;->c:Lcom/flurry/android/FlurryAgent;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/FlurryAgent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 880
    iget-object v0, p0, Lcom/flurry/android/d;->c:Lcom/flurry/android/FlurryAgent;

    iget-object v1, p0, Lcom/flurry/android/d;->a:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;)V

    .line 882
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/d;->c:Lcom/flurry/android/FlurryAgent;

    iget-object v1, p0, Lcom/flurry/android/d;->a:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/flurry/android/d;->b:Z

    invoke-static {v0, v1, v2}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;Z)V

    .line 883
    return-void
.end method
