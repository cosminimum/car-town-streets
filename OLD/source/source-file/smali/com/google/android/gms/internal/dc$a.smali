.class final Lcom/google/android/gms/internal/dc$a;
.super Lcom/google/android/gms/internal/db;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field private final jW:Lcom/google/android/gms/common/api/a$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/AppStateManager$StateDeletedResult;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic jX:Lcom/google/android/gms/internal/dc;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dc;Lcom/google/android/gms/common/api/a$c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/AppStateManager$StateDeletedResult;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/dc$a;->jX:Lcom/google/android/gms/internal/dc;

    invoke-direct {p0}, Lcom/google/android/gms/internal/db;-><init>()V

    const-string v0, "Result holder must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/eg;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/a$c;

    iput-object v0, p0, Lcom/google/android/gms/internal/dc$a;->jW:Lcom/google/android/gms/common/api/a$c;

    return-void
.end method


# virtual methods
.method public onStateDeleted(II)V
    .locals 5
    .param p1, "statusCode"    # I
    .param p2, "stateKey"    # I

    .prologue
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/dc$a;->jX:Lcom/google/android/gms/internal/dc;

    new-instance v2, Lcom/google/android/gms/internal/dc$b;

    iget-object v3, p0, Lcom/google/android/gms/internal/dc$a;->jX:Lcom/google/android/gms/internal/dc;

    iget-object v4, p0, Lcom/google/android/gms/internal/dc$a;->jW:Lcom/google/android/gms/common/api/a$c;

    invoke-direct {v2, v3, v4, v0, p2}, Lcom/google/android/gms/internal/dc$b;-><init>(Lcom/google/android/gms/internal/dc;Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/api/Status;I)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/dc;->a(Lcom/google/android/gms/internal/dw$b;)V

    return-void
.end method
