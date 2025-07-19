.class Lcom/chartboost/sdk/Libraries/e$c;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Libraries/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "c"
.end annotation


# instance fields
.field private final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/chartboost/sdk/Libraries/e$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/Libraries/e$a;)V
    .locals 1

    .prologue
    .line 247
    invoke-direct {p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    .line 249
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 248
    iput-object v0, p0, Lcom/chartboost/sdk/Libraries/e$c;->a:Ljava/lang/ref/WeakReference;

    .line 250
    return-void
.end method


# virtual methods
.method public a()Lcom/chartboost/sdk/Libraries/e$a;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$c;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/chartboost/sdk/Libraries/e$a;

    return-object v0
.end method
