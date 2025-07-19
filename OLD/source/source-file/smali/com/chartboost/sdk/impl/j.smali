.class public Lcom/chartboost/sdk/impl/j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/impl/j$a;,
        Lcom/chartboost/sdk/impl/j$b;,
        Lcom/chartboost/sdk/impl/j$c;
    }
.end annotation


# static fields
.field private static g:I

.field private static h:Lorg/apache/http/client/HttpClient;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/chartboost/sdk/impl/j$c;

.field public c:Ljava/lang/String;

.field public d:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/chartboost/sdk/impl/j$b;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 174
    const/4 v0, 0x0

    sput v0, Lcom/chartboost/sdk/impl/j;->g:I

    .line 295
    const/4 v0, 0x0

    sput-object v0, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/chartboost/sdk/impl/j$c;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/4 v0, 0x1

    iput v0, p0, Lcom/chartboost/sdk/impl/j;->e:I

    .line 79
    const-string v0, "Loading..."

    iput-object v0, p0, Lcom/chartboost/sdk/impl/j;->f:Ljava/lang/String;

    .line 82
    if-nez p1, :cond_0

    const-string p1, "https://www.chartboost.com"

    :cond_0
    iput-object p1, p0, Lcom/chartboost/sdk/impl/j;->a:Ljava/lang/String;

    .line 83
    iput-object p2, p0, Lcom/chartboost/sdk/impl/j;->b:Lcom/chartboost/sdk/impl/j$c;

    .line 84
    iput-object p3, p0, Lcom/chartboost/sdk/impl/j;->c:Ljava/lang/String;

    .line 85
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/j;->d:Landroid/util/SparseArray;

    .line 87
    return-void
.end method

.method static synthetic a(Landroid/app/Application;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 377
    invoke-static {p0, p1}, Lcom/chartboost/sdk/impl/j;->b(Landroid/app/Application;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(I)V
    .locals 0

    .prologue
    .line 174
    sput p0, Lcom/chartboost/sdk/impl/j;->g:I

    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/j;Lcom/chartboost/sdk/impl/k;)V
    .locals 0

    .prologue
    .line 106
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/impl/j;->b(Lcom/chartboost/sdk/impl/k;)V

    return-void
.end method

.method private static b(Landroid/app/Application;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 380
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 381
    invoke-virtual {p0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 380
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 381
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 385
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 386
    invoke-virtual {p0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    const-string v0, " ("

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    const-string v0, "Linux; U; Android "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    const-string v0, "; "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 394
    const-string v0, "; "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    if-eqz p1, :cond_0

    .line 398
    const-string v0, " "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 382
    :catch_0
    move-exception v0

    .line 383
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static b()Lorg/apache/http/client/HttpClient;
    .locals 4

    .prologue
    .line 297
    sget-object v0, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;

    if-eqz v0, :cond_0

    .line 298
    sget-object v0, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;

    .line 372
    :goto_0
    return-object v0

    .line 301
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    .line 302
    new-instance v1, Lcom/chartboost/sdk/impl/j$1;

    invoke-direct {v1, v0}, Lcom/chartboost/sdk/impl/j$1;-><init>(Landroid/app/Application;)V

    sput-object v1, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;

    .line 352
    sget-object v0, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 354
    :catch_0
    move-exception v0

    .line 360
    :try_start_1
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 361
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    .line 362
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    .line 363
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    new-instance v3, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    .line 364
    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v1

    invoke-direct {v3, v0, v1}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 363
    invoke-direct {v2, v3, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    sput-object v2, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;

    .line 365
    sget-object v0, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 366
    :catch_1
    move-exception v0

    .line 371
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    sput-object v0, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;

    .line 372
    sget-object v0, Lcom/chartboost/sdk/impl/j;->h:Lorg/apache/http/client/HttpClient;

    goto :goto_0
.end method

.method private b(Lcom/chartboost/sdk/impl/k;)V
    .locals 5

    .prologue
    .line 107
    iget-boolean v0, p1, Lcom/chartboost/sdk/impl/k;->i:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/chartboost/sdk/impl/j;->c:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 108
    invoke-static {}, Lcom/chartboost/sdk/Libraries/d;->a()Landroid/content/SharedPreferences;

    move-result-object v1

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "CBQueuedRequests-"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/chartboost/sdk/impl/j;->c:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 111
    :try_start_0
    invoke-virtual {p1}, Lcom/chartboost/sdk/impl/k;->d()Lorg/json/JSONObject;

    move-result-object v3

    .line 112
    if-eqz v3, :cond_0

    .line 113
    const/4 v0, 0x0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 115
    if-eqz v0, :cond_1

    .line 117
    :try_start_1
    new-instance v4, Lorg/json/JSONTokener;

    invoke-direct {v4, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 118
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v4}, Lorg/json/JSONArray;-><init>(Lorg/json/JSONTokener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 126
    :goto_0
    :try_start_2
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 127
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 128
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 129
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 138
    :cond_0
    :goto_1
    return-void

    .line 119
    :catch_0
    move-exception v0

    .line 120
    const-string v0, "Chartboost"

    const-string v4, "Failure reading saved request list"

    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 131
    :catch_1
    move-exception v0

    .line 132
    const-string v0, "Chartboost"

    const-string v1, "Unable to save failed request"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 124
    :cond_1
    :try_start_3
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 135
    :cond_2
    iget-object v0, p0, Lcom/chartboost/sdk/impl/j;->b:Lcom/chartboost/sdk/impl/j$c;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/chartboost/sdk/impl/j;->b:Lcom/chartboost/sdk/impl/j$c;

    invoke-interface {v0, p1}, Lcom/chartboost/sdk/impl/j$c;->a(Lcom/chartboost/sdk/impl/k;)V

    goto :goto_1
.end method

.method static synthetic c()I
    .locals 1

    .prologue
    .line 174
    sget v0, Lcom/chartboost/sdk/impl/j;->g:I

    return v0
.end method


# virtual methods
.method public a()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 142
    invoke-static {}, Lcom/chartboost/sdk/impl/l;->a()Z

    move-result v0

    if-nez v0, :cond_1

    .line 171
    :cond_0
    :goto_0
    return-void

    .line 146
    :cond_1
    invoke-static {}, Lcom/chartboost/sdk/Libraries/d;->a()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 147
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CBQueuedRequests-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/chartboost/sdk/impl/j;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 149
    if-eqz v2, :cond_0

    .line 150
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 151
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 152
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 155
    :try_start_0
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, v2}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 156
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Lorg/json/JSONTokener;)V

    .line 157
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    if-ge v0, v2, :cond_0

    .line 159
    :try_start_1
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 160
    invoke-static {v2}, Lcom/chartboost/sdk/impl/k;->a(Lorg/json/JSONObject;)Lcom/chartboost/sdk/impl/k;

    move-result-object v2

    .line 161
    if-eqz v2, :cond_2

    .line 162
    invoke-virtual {p0, v2}, Lcom/chartboost/sdk/impl/j;->a(Lcom/chartboost/sdk/impl/k;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 157
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 163
    :catch_0
    move-exception v2

    .line 164
    :try_start_2
    const-string v2, "Chartboost"

    const-string v3, "Retrying request failed"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 167
    :catch_1
    move-exception v0

    .line 168
    const-string v0, "Chartboost"

    const-string v1, "Retrying request list failed"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public a(Lcom/chartboost/sdk/impl/k;)V
    .locals 4

    .prologue
    .line 91
    invoke-static {}, Lcom/chartboost/sdk/impl/l;->a()Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/impl/j;->b(Lcom/chartboost/sdk/impl/k;)V

    .line 104
    :goto_0
    return-void

    .line 96
    :cond_0
    iget v0, p0, Lcom/chartboost/sdk/impl/j;->e:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/chartboost/sdk/impl/j;->e:I

    .line 97
    new-instance v1, Lcom/chartboost/sdk/impl/j$b;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/chartboost/sdk/impl/j$b;-><init>(Lcom/chartboost/sdk/impl/j;Lcom/chartboost/sdk/impl/k;Lorg/json/JSONObject;)V

    .line 98
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, v1, Lcom/chartboost/sdk/impl/j$b;->c:Ljava/lang/Integer;

    .line 99
    iget-object v2, p0, Lcom/chartboost/sdk/impl/j;->d:Landroid/util/SparseArray;

    invoke-virtual {v2, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 100
    new-instance v0, Lcom/chartboost/sdk/impl/j$a;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/impl/j$a;-><init>(Lcom/chartboost/sdk/impl/j;)V

    .line 102
    const/4 v2, 0x1

    new-array v2, v2, [Lcom/chartboost/sdk/impl/j$b;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    invoke-virtual {v0, v2}, Lcom/chartboost/sdk/impl/j$a;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method
