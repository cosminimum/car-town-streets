.class Lcom/google/ads/ag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/ag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Landroid/content/SharedPreferences$Editor;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/ads/ag$a;-><init>(Landroid/app/Activity;Landroid/content/SharedPreferences$Editor;)V

    .line 59
    return-void
.end method

.method constructor <init>(Landroid/app/Activity;Landroid/content/SharedPreferences$Editor;)V
    .locals 1

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/ag$a;->a:Ljava/lang/ref/WeakReference;

    .line 69
    iput-object p2, p0, Lcom/google/ads/ag$a;->b:Landroid/content/SharedPreferences$Editor;

    .line 70
    return-void
.end method

.method private a(Landroid/app/Activity;)Landroid/content/SharedPreferences$Editor;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/google/ads/ag$a;->b:Landroid/content/SharedPreferences$Editor;

    if-nez v0, :cond_0

    .line 74
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 77
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/ads/ag$a;->b:Landroid/content/SharedPreferences$Editor;

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 85
    :try_start_0
    iget-object v1, p0, Lcom/google/ads/ag$a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/app/Activity;

    move-object v7, v0

    .line 86
    if-nez v7, :cond_0

    .line 87
    const-string v1, "Activity was null while making a doritos cookie request."

    invoke-static {v1}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 121
    :goto_0
    return-void

    .line 91
    :cond_0
    invoke-virtual {v7}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 94
    sget-object v2, Lcom/google/ads/af;->b:Landroid/net/Uri;

    sget-object v3, Lcom/google/ads/af;->d:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 98
    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-lez v2, :cond_1

    .line 100
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 105
    :goto_1
    invoke-direct {p0, v7}, Lcom/google/ads/ag$a;->a(Landroid/app/Activity;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 106
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 110
    const-string v3, "drt"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 111
    const-string v1, "drt_ts"

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-interface {v2, v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 117
    :goto_2
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 118
    :catch_0
    move-exception v1

    .line 119
    const-string v2, "An unknown error occurred while sending a doritos request."

    invoke-static {v2, v1}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 103
    :cond_1
    :try_start_1
    const-string v1, "Google+ app not installed, not storing doritos cookie"

    invoke-static {v1}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    move-object v1, v8

    goto :goto_1

    .line 114
    :cond_2
    const-string v1, "drt"

    const-string v3, ""

    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 115
    const-string v1, "drt_ts"

    const-wide/16 v3, 0x0

    invoke-interface {v2, v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
