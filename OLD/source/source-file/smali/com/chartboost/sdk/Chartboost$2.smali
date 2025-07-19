.class Lcom/chartboost/sdk/Chartboost$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/chartboost/sdk/impl/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Chartboost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/Chartboost;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    .line 960
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V
    .locals 1

    .prologue
    .line 1027
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1028
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, p2, v0}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1032
    :cond_0
    :goto_0
    return-void

    .line 1029
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public a(Lcom/chartboost/sdk/impl/a;)V
    .locals 2

    .prologue
    .line 963
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->b:Lcom/chartboost/sdk/impl/a$b;

    if-ne v0, v1, :cond_2

    .line 964
    sget-object v0, Lcom/chartboost/sdk/impl/a$b;->a:Lcom/chartboost/sdk/impl/a$b;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 966
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v1, :cond_1

    .line 967
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0, p1}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    .line 990
    :cond_0
    :goto_0
    return-void

    .line 968
    :cond_1
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v1, :cond_0

    .line 969
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0, p1}, Lcom/chartboost/sdk/Chartboost;->b(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    goto :goto_0

    .line 972
    :cond_2
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->e:Lcom/chartboost/sdk/impl/a$b;

    if-ne v0, v1, :cond_0

    .line 974
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v1, :cond_4

    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 975
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->b(Lcom/chartboost/sdk/Chartboost;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 976
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 977
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/chartboost/sdk/ChartboostDelegate;->didCacheInterstitial(Ljava/lang/String;)V

    .line 988
    :cond_3
    :goto_1
    sget-object v0, Lcom/chartboost/sdk/impl/a$b;->f:Lcom/chartboost/sdk/impl/a$b;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    goto :goto_0

    .line 979
    :cond_4
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v1, :cond_3

    .line 980
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 981
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/chartboost/sdk/ChartboostDelegate;->didCacheMoreApps()V

    .line 983
    :cond_5
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->c(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/impl/a;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 984
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/chartboost/sdk/Chartboost;->c(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    .line 986
    :cond_6
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0, p1}, Lcom/chartboost/sdk/Chartboost;->c(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    goto :goto_1
.end method

.method public a(Lcom/chartboost/sdk/impl/a;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1037
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0, v5}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    .line 1040
    if-eqz p2, :cond_4

    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "null"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    move v0, v1

    .line 1042
    :goto_0
    iget-object v3, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v4, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    if-ne v3, v4, :cond_6

    .line 1043
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1044
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    iget-object v4, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    invoke-interface {v3, v4}, Lcom/chartboost/sdk/ChartboostDelegate;->didDismissInterstitial(Ljava/lang/String;)V

    .line 1046
    :cond_0
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1047
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    iget-object v4, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    invoke-interface {v3, v4}, Lcom/chartboost/sdk/ChartboostDelegate;->didClickInterstitial(Ljava/lang/String;)V

    .line 1050
    :cond_1
    iget-object v3, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v4, Lcom/chartboost/sdk/impl/a$b;->c:Lcom/chartboost/sdk/impl/a$b;

    if-ne v3, v4, :cond_2

    .line 1051
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v3}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/a;

    move-result-object v3

    .line 1052
    if-eqz v3, :cond_2

    .line 1053
    if-eqz v0, :cond_5

    :goto_1
    invoke-virtual {v3, p1, v2}, Lcom/chartboost/sdk/a;->a(Lcom/chartboost/sdk/impl/a;Z)V

    .line 1071
    :cond_2
    :goto_2
    new-instance v3, Lcom/chartboost/sdk/impl/k;

    const-string v2, "api"

    const-string v4, "click"

    invoke-direct {v3, v2, v4}, Lcom/chartboost/sdk/impl/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1072
    iget-object v2, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v2}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;)Landroid/app/Activity;

    move-result-object v2

    if-nez v2, :cond_a

    .line 1073
    iget-object v2, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v2}, Lcom/chartboost/sdk/Chartboost;->b()Landroid/app/Activity;

    move-result-object v2

    .line 1074
    :goto_3
    invoke-virtual {v3, v2}, Lcom/chartboost/sdk/impl/k;->a(Landroid/content/Context;)V

    .line 1076
    iget-object v2, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v4, "to"

    invoke-direct {p0, v2, v4, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1077
    iget-object v2, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v4, "cgn"

    invoke-direct {p0, v2, v4, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1078
    iget-object v2, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v4, "creative"

    invoke-direct {p0, v2, v4, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1079
    iget-object v2, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v4, "ad_id"

    invoke-direct {p0, v2, v4, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1080
    const-string v2, "cgn"

    invoke-direct {p0, p3, v2, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1081
    const-string v2, "creative"

    invoke-direct {p0, p3, v2, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1082
    const-string v2, "type"

    invoke-direct {p0, p3, v2, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1083
    const-string v2, "more_type"

    invoke-direct {p0, p3, v2, v3}, Lcom/chartboost/sdk/Chartboost$2;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/chartboost/sdk/impl/k;)V

    .line 1085
    iget-object v2, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v2}, Lcom/chartboost/sdk/Chartboost;->getAppID()Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v4}, Lcom/chartboost/sdk/Chartboost;->getAppSignature()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/chartboost/sdk/impl/k;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 1087
    if-eqz v0, :cond_3

    .line 1088
    new-instance v0, Lcom/chartboost/sdk/Chartboost$2$1;

    invoke-direct {v0, p0, p2}, Lcom/chartboost/sdk/Chartboost$2$1;-><init>(Lcom/chartboost/sdk/Chartboost$2;Ljava/lang/String;)V

    iput-object v0, v3, Lcom/chartboost/sdk/impl/k;->h:Lcom/chartboost/sdk/impl/k$a;

    .line 1094
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    new-instance v2, Lcom/chartboost/sdk/a$a;

    invoke-direct {v2, v1, v5}, Lcom/chartboost/sdk/a$a;-><init>(ZLcom/chartboost/sdk/impl/a;)V

    invoke-virtual {v0, v2}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/a$a;)V

    .line 1096
    :cond_3
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->e(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/impl/j;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/chartboost/sdk/impl/j;->a(Lcom/chartboost/sdk/impl/k;)V

    .line 1097
    return-void

    :cond_4
    move v0, v2

    .line 1040
    goto/16 :goto_0

    :cond_5
    move v2, v1

    .line 1053
    goto :goto_1

    .line 1055
    :cond_6
    iget-object v3, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v4, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v3, v4, :cond_2

    .line 1056
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 1057
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    invoke-interface {v3}, Lcom/chartboost/sdk/ChartboostDelegate;->didDismissMoreApps()V

    .line 1059
    :cond_7
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    if-eqz v3, :cond_8

    .line 1060
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v3}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v3

    invoke-interface {v3}, Lcom/chartboost/sdk/ChartboostDelegate;->didClickMoreApps()V

    .line 1063
    :cond_8
    iget-object v3, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v4, Lcom/chartboost/sdk/impl/a$b;->c:Lcom/chartboost/sdk/impl/a$b;

    if-ne v3, v4, :cond_2

    .line 1064
    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v3}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/a;

    move-result-object v3

    .line 1065
    if-eqz v3, :cond_2

    .line 1066
    if-eqz v0, :cond_9

    :goto_4
    invoke-virtual {v3, p1, v2}, Lcom/chartboost/sdk/a;->a(Lcom/chartboost/sdk/impl/a;Z)V

    goto/16 :goto_2

    :cond_9
    move v2, v1

    goto :goto_4

    .line 1073
    :cond_a
    iget-object v2, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v2}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;)Landroid/app/Activity;

    move-result-object v2

    goto/16 :goto_3
.end method

.method public b(Lcom/chartboost/sdk/impl/a;)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 994
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    .line 996
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v1, :cond_3

    .line 997
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 998
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/chartboost/sdk/ChartboostDelegate;->didDismissInterstitial(Ljava/lang/String;)V

    .line 1000
    :cond_0
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1001
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/chartboost/sdk/ChartboostDelegate;->didCloseInterstitial(Ljava/lang/String;)V

    .line 1004
    :cond_1
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->c:Lcom/chartboost/sdk/impl/a$b;

    if-ne v0, v1, :cond_2

    .line 1005
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/a;

    move-result-object v0

    .line 1006
    if-eqz v0, :cond_2

    .line 1007
    invoke-virtual {v0, p1, v2}, Lcom/chartboost/sdk/a;->a(Lcom/chartboost/sdk/impl/a;Z)V

    .line 1023
    :cond_2
    :goto_0
    return-void

    .line 1009
    :cond_3
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v1, :cond_2

    .line 1010
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 1011
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/chartboost/sdk/ChartboostDelegate;->didDismissMoreApps()V

    .line 1013
    :cond_4
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 1014
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/chartboost/sdk/ChartboostDelegate;->didCloseMoreApps()V

    .line 1017
    :cond_5
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->c:Lcom/chartboost/sdk/impl/a$b;

    if-ne v0, v1, :cond_2

    .line 1018
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/a;

    move-result-object v0

    .line 1019
    if-eqz v0, :cond_2

    .line 1020
    invoke-virtual {v0, p1, v2}, Lcom/chartboost/sdk/a;->a(Lcom/chartboost/sdk/impl/a;Z)V

    goto :goto_0
.end method

.method public c(Lcom/chartboost/sdk/impl/a;)V
    .locals 4

    .prologue
    .line 1101
    iget-object v1, p0, Lcom/chartboost/sdk/Chartboost$2;->a:Lcom/chartboost/sdk/Chartboost;

    iget-object v2, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v3, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v3, :cond_0

    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    :goto_0
    invoke-static {v1, v2, v0}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a$c;Ljava/lang/String;)V

    .line 1103
    return-void

    .line 1101
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
