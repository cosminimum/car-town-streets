.class final Lcom/flurry/android/u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field static a:Ljava/lang/String;

.field static b:Ljava/lang/String;

.field private static volatile c:Ljava/lang/String;

.field private static volatile d:Ljava/lang/String;

.field private static volatile e:Ljava/lang/String;

.field private static f:Ljava/lang/String;

.field private static g:I

.field private static volatile z:J


# instance fields
.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:J

.field private l:J

.field private m:J

.field private n:Lcom/flurry/android/z;

.field private o:Z

.field private volatile p:Z

.field private q:Ljava/lang/String;

.field private r:Ljava/util/Map;

.field private s:Landroid/os/Handler;

.field private t:Z

.field private transient u:Ljava/util/Map;

.field private v:Lcom/flurry/android/ag;

.field private w:Ljava/util/List;

.field private x:Ljava/util/Map;

.field private y:Lcom/flurry/android/AppCircleCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 35
    const-string v0, "market://"

    sput-object v0, Lcom/flurry/android/u;->c:Ljava/lang/String;

    .line 36
    const-string v0, "market://details?id="

    sput-object v0, Lcom/flurry/android/u;->d:Ljava/lang/String;

    .line 37
    const-string v0, "https://market.android.com/details?id="

    sput-object v0, Lcom/flurry/android/u;->e:Ljava/lang/String;

    .line 38
    const-string v0, "com.flurry.android.ACTION_CATALOG"

    sput-object v0, Lcom/flurry/android/u;->f:Ljava/lang/String;

    .line 43
    const-string v0, "FlurryAgent"

    sput-object v0, Lcom/flurry/android/u;->a:Ljava/lang/String;

    .line 44
    new-instance v0, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    .line 45
    const/16 v0, 0x1388

    sput v0, Lcom/flurry/android/u;->g:I

    .line 54
    const-string v0, ""

    sput-object v0, Lcom/flurry/android/u;->b:Ljava/lang/String;

    .line 90
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/flurry/android/u;->z:J

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/u;->o:Z

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/u;->u:Ljava/util/Map;

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/u;->w:Ljava/util/List;

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/u;->x:Ljava/util/Map;

    .line 96
    new-instance v0, Lcom/flurry/android/z;

    invoke-direct {v0}, Lcom/flurry/android/z;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    .line 97
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/u;)Lcom/flurry/android/AppCircleCallback;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/flurry/android/u;->y:Lcom/flurry/android/AppCircleCallback;

    return-object v0
.end method

.method private a(Ljava/lang/String;Lcom/flurry/android/v;)Lcom/flurry/android/Offer;
    .locals 8

    .prologue
    .line 528
    new-instance v3, Lcom/flurry/android/p;

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/flurry/android/u;->k()J

    move-result-wide v1

    invoke-direct {v3, p1, v0, v1, v2}, Lcom/flurry/android/p;-><init>(Ljava/lang/String;BJ)V

    .line 529
    invoke-direct {p0, v3}, Lcom/flurry/android/u;->a(Lcom/flurry/android/p;)V

    .line 530
    new-instance v0, Lcom/flurry/android/f;

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/flurry/android/u;->k()J

    move-result-wide v4

    invoke-direct {v0, v1, v4, v5}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v3, v0}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    .line 532
    iput-object p2, v3, Lcom/flurry/android/p;->b:Lcom/flurry/android/v;

    .line 533
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    iget-wide v1, p2, Lcom/flurry/android/v;->a:J

    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/z;->a(J)Lcom/flurry/android/al;

    move-result-object v0

    .line 534
    if-nez v0, :cond_0

    const-string v6, ""

    .line 535
    :goto_0
    if-nez v0, :cond_1

    const/4 v7, 0x0

    .line 537
    :goto_1
    new-instance v0, Lcom/flurry/android/OfferInSdk;

    sget-wide v1, Lcom/flurry/android/u;->z:J

    const-wide/16 v4, 0x1

    add-long/2addr v1, v4

    sput-wide v1, Lcom/flurry/android/u;->z:J

    iget-object v4, p2, Lcom/flurry/android/v;->h:Lcom/flurry/android/AdImage;

    iget-object v5, p2, Lcom/flurry/android/v;->d:Ljava/lang/String;

    invoke-direct/range {v0 .. v7}, Lcom/flurry/android/OfferInSdk;-><init>(JLcom/flurry/android/p;Lcom/flurry/android/AdImage;Ljava/lang/String;Ljava/lang/String;I)V

    .line 538
    iget-object v1, p0, Lcom/flurry/android/u;->x:Ljava/util/Map;

    iget-wide v2, v0, Lcom/flurry/android/OfferInSdk;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    new-instance v7, Lcom/flurry/android/Offer;

    iget-wide v1, v0, Lcom/flurry/android/OfferInSdk;->a:J

    iget-object v3, v0, Lcom/flurry/android/OfferInSdk;->f:Lcom/flurry/android/AdImage;

    iget-object v4, v0, Lcom/flurry/android/OfferInSdk;->c:Ljava/lang/String;

    iget-object v5, v0, Lcom/flurry/android/OfferInSdk;->d:Ljava/lang/String;

    iget v6, v0, Lcom/flurry/android/OfferInSdk;->e:I

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/Offer;-><init>(JLcom/flurry/android/AdImage;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v7

    .line 534
    :cond_0
    iget-object v6, v0, Lcom/flurry/android/al;->a:Ljava/lang/String;

    goto :goto_0

    .line 535
    :cond_1
    iget v7, v0, Lcom/flurry/android/al;->c:I

    goto :goto_1
.end method

.method private a(Lcom/flurry/android/p;Ljava/lang/Long;)Ljava/lang/String;
    .locals 6

    .prologue
    .line 712
    iget-object v0, p1, Lcom/flurry/android/p;->b:Lcom/flurry/android/v;

    .line 713
    invoke-virtual {p1}, Lcom/flurry/android/p;->a()J

    move-result-wide v1

    .line 715
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "?apik="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/u;->j:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&cid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v0, Lcom/flurry/android/v;->e:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&adid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v0, Lcom/flurry/android/v;->a:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&pid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/u;->q:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&iid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/flurry/android/u;->k:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&sid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/flurry/android/u;->l:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&its="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&hid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/flurry/android/p;->a:Ljava/lang/String;

    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&ac="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, v0, Lcom/flurry/android/v;->g:[B

    invoke-static {v0}, Lcom/flurry/android/u;->a([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 727
    iget-object v0, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 729
    iget-object v0, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 731
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "c_"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 732
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/flurry/android/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 733
    const-string v4, "&"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 740
    :cond_0
    const-string v0, "&ats="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 741
    if-eqz p2, :cond_1

    .line 743
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 746
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/android/u;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/flurry/android/u;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a([B)Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0xa

    .line 751
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 752
    const/4 v0, 0x0

    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_2

    .line 754
    aget-byte v2, p0, v0

    shr-int/lit8 v2, v2, 0x4

    and-int/lit8 v2, v2, 0xf

    .line 755
    if-ge v2, v3, :cond_0

    .line 757
    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 764
    :goto_1
    aget-byte v2, p0, v0

    and-int/lit8 v2, v2, 0xf

    .line 765
    if-ge v2, v3, :cond_1

    .line 767
    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 752
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 761
    :cond_0
    add-int/lit8 v2, v2, 0x41

    add-int/lit8 v2, v2, -0xa

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 771
    :cond_1
    add-int/lit8 v2, v2, 0x41

    add-int/lit8 v2, v2, -0xa

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 774
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 615
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->b()Z

    move-result v0

    if-nez v0, :cond_1

    .line 617
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 641
    :goto_0
    return-object v0

    .line 620
    :cond_1
    iget-object v1, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/flurry/android/z;->a(Ljava/lang/String;)[Lcom/flurry/android/v;

    move-result-object v0

    .line 622
    if-eqz v0, :cond_4

    array-length v1, v0

    if-lez v1, :cond_4

    .line 624
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 625
    invoke-static {v1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 626
    if-eqz p2, :cond_3

    .line 628
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 630
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/v;

    .line 631
    iget-wide v3, v0, Lcom/flurry/android/v;->a:J

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-nez v0, :cond_2

    .line 633
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 639
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-interface {v1, v7, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 641
    :cond_4
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method private a(Lcom/flurry/android/p;)V
    .locals 3

    .prologue
    .line 603
    iget-object v0, p0, Lcom/flurry/android/u;->w:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x7fff

    if-ge v0, v1, :cond_0

    .line 605
    iget-object v0, p0, Lcom/flurry/android/u;->w:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 606
    iget-object v0, p0, Lcom/flurry/android/u;->u:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/flurry/android/p;->a()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    :cond_0
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/u;Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 32
    sget-object v0, Lcom/flurry/android/u;->d:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flurry/android/u;->d:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flurry/android/u;->o:Z

    if-eqz v1, :cond_0

    :try_start_0
    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Launching Android Market for app "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ah;->a(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot launch Marketplace url "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ah;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Launching Android Market website for app "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/ah;->a(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flurry/android/u;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected android market url scheme: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ah;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static a(Ljava/lang/Runnable;)V
    .locals 1

    .prologue
    .line 803
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 804
    return-void
.end method

.method private b(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 686
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/android/u;->p()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 687
    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 688
    const-string v1, "u"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 689
    if-eqz p2, :cond_0

    .line 692
    const-string v1, "o"

    invoke-virtual {p2}, Lcom/flurry/android/p;->a()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 694
    :cond_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 695
    return-void
.end method

.method static synthetic b(Lcom/flurry/android/u;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/flurry/android/u;->e(Ljava/lang/String;)V

    return-void
.end method

.method private d(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 355
    :try_start_0
    sget-object v1, Lcom/flurry/android/u;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 357
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 358
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 359
    invoke-interface {v2, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 361
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    .line 363
    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 365
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object p1

    .line 366
    sget-object v1, Lcom/flurry/android/u;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 368
    invoke-direct {p0, p1}, Lcom/flurry/android/u;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 393
    :cond_0
    :goto_0
    return-object p1

    .line 373
    :cond_1
    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot process with responseCode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/flurry/android/ah;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error when fetching application\'s android market ID, responseCode "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flurry/android/u;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 379
    :catch_0
    move-exception v1

    .line 381
    sget-object v2, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown host: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flurry/android/ah;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    iget-object v2, p0, Lcom/flurry/android/u;->y:Lcom/flurry/android/AppCircleCallback;

    if-eqz v2, :cond_2

    .line 384
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 385
    invoke-direct {p0, v1}, Lcom/flurry/android/u;->e(Ljava/lang/String;)V

    :cond_2
    move-object p1, v0

    .line 388
    goto :goto_0

    .line 390
    :catch_1
    move-exception v1

    .line 392
    sget-object v2, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed on url: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/flurry/android/ah;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object p1, v0

    .line 393
    goto/16 :goto_0
.end method

.method private e(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 399
    new-instance v0, Lcom/flurry/android/ae;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/ae;-><init>(Lcom/flurry/android/u;Ljava/lang/String;)V

    .line 410
    invoke-static {v0}, Lcom/flurry/android/u;->a(Ljava/lang/Runnable;)V

    .line 411
    return-void
.end method

.method private declared-synchronized o()Lcom/flurry/android/AdImage;
    .locals 2

    .prologue
    .line 237
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 239
    const/4 v0, 0x0

    .line 241
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flurry/android/z;->a(S)Lcom/flurry/android/AdImage;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 237
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static p()Ljava/lang/String;
    .locals 1

    .prologue
    .line 706
    sget-object v0, Lcom/flurry/android/FlurryAgent;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flurry/android/FlurryAgent;->a:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/android/u;->f:Ljava/lang/String;

    goto :goto_0
.end method

.method private q()Z
    .locals 2

    .prologue
    .line 835
    iget-boolean v0, p0, Lcom/flurry/android/u;->p:Z

    if-nez v0, :cond_0

    .line 837
    sget-object v0, Lcom/flurry/android/u;->a:Ljava/lang/String;

    const-string v1, "AppCircle is not initialized"

    invoke-static {v0, v1}, Lcom/flurry/android/ah;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/u;->q:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 841
    sget-object v0, Lcom/flurry/android/u;->a:Ljava/lang/String;

    const-string v1, "Cannot identify UDID."

    invoke-static {v0, v1}, Lcom/flurry/android/ah;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 843
    :cond_1
    iget-boolean v0, p0, Lcom/flurry/android/u;->p:Z

    return v0
.end method


# virtual methods
.method final declared-synchronized a(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;
    .locals 2

    .prologue
    .line 590
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 592
    const/4 v0, 0x0

    .line 598
    :goto_0
    monitor-exit p0

    return-object v0

    .line 595
    :cond_0
    :try_start_1
    new-instance v0, Lcom/flurry/android/o;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/flurry/android/o;-><init>(Lcom/flurry/android/u;Landroid/content/Context;Ljava/lang/String;I)V

    .line 596
    iget-object v1, p0, Lcom/flurry/android/u;->v:Lcom/flurry/android/ag;

    invoke-virtual {v1, v0}, Lcom/flurry/android/ag;->a(Lcom/flurry/android/o;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 590
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(J)Lcom/flurry/android/AdImage;
    .locals 1

    .prologue
    .line 219
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 221
    const/4 v0, 0x0

    .line 223
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/android/z;->b(J)Lcom/flurry/android/AdImage;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 219
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Landroid/content/Context;Ljava/util/List;Ljava/lang/Long;IZ)Ljava/util/List;
    .locals 11

    .prologue
    .line 545
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z

    move-result v0

    if-nez v0, :cond_0

    .line 547
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 585
    :goto_0
    monitor-exit p0

    return-object v0

    .line 550
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->b()Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz p2, :cond_4

    .line 552
    invoke-direct {p0, p2, p3}, Lcom/flurry/android/u;->a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v9

    .line 554
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 555
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 556
    const/4 v0, 0x0

    move v8, v0

    :goto_1
    if-ge v8, v10, :cond_3

    .line 558
    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 559
    iget-object v1, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v1, v0}, Lcom/flurry/android/z;->b(Ljava/lang/String;)Lcom/flurry/android/e;

    move-result-object v4

    .line 560
    if-eqz v4, :cond_2

    .line 562
    new-instance v3, Lcom/flurry/android/p;

    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/flurry/android/u;->k()J

    move-result-wide v5

    invoke-direct {v3, v0, v1, v5, v6}, Lcom/flurry/android/p;-><init>(Ljava/lang/String;BJ)V

    .line 563
    invoke-direct {p0, v3}, Lcom/flurry/android/u;->a(Lcom/flurry/android/p;)V

    .line 565
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-ge v8, v0, :cond_1

    .line 567
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/v;

    .line 568
    iput-object v0, v3, Lcom/flurry/android/p;->b:Lcom/flurry/android/v;

    .line 569
    new-instance v0, Lcom/flurry/android/f;

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/flurry/android/u;->k()J

    move-result-wide v5

    invoke-direct {v0, v1, v5, v6}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v3, v0}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    .line 571
    new-instance v0, Lcom/flurry/android/y;

    move-object v1, p1

    move-object v2, p0

    move v5, p4

    move/from16 v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/y;-><init>(Landroid/content/Context;Lcom/flurry/android/u;Lcom/flurry/android/p;Lcom/flurry/android/e;IZ)V

    .line 573
    const/4 v1, 0x0

    invoke-direct {p0, v3, v1}, Lcom/flurry/android/u;->a(Lcom/flurry/android/p;Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/y;->a(Ljava/lang/String;)V

    .line 574
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 556
    :cond_1
    :goto_2
    add-int/lit8 v0, v8, 0x1

    move v8, v0

    goto :goto_1

    .line 579
    :cond_2
    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find hook: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ah;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 545
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    move-object v0, v7

    .line 582
    goto/16 :goto_0

    .line 585
    :cond_4
    :try_start_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    goto/16 :goto_0
.end method

.method final declared-synchronized a()V
    .locals 1

    .prologue
    .line 134
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/u;->w:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    monitor-exit p0

    return-void

    .line 134
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(I)V
    .locals 1

    .prologue
    .line 808
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/u;->y:Lcom/flurry/android/AppCircleCallback;

    if-eqz v0, :cond_0

    .line 810
    new-instance v0, Lcom/flurry/android/ad;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/ad;-><init>(Lcom/flurry/android/u;I)V

    .line 820
    invoke-static {v0}, Lcom/flurry/android/u;->a(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 822
    :cond_0
    monitor-exit p0

    return-void

    .line 808
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Landroid/content/Context;J)V
    .locals 7

    .prologue
    .line 466
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 484
    :goto_0
    monitor-exit p0

    return-void

    .line 471
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->x:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/OfferInSdk;

    .line 472
    if-nez v0, :cond_1

    .line 474
    sget-object v0, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot find offer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ah;->b(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 466
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 477
    :cond_1
    :try_start_2
    iget-object v1, v0, Lcom/flurry/android/OfferInSdk;->b:Lcom/flurry/android/p;

    .line 478
    new-instance v2, Lcom/flurry/android/f;

    const/4 v3, 0x4

    invoke-virtual {p0}, Lcom/flurry/android/u;->k()J

    move-result-wide v4

    invoke-direct {v2, v3, v4, v5}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v1, v2}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    .line 479
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->c()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/flurry/android/p;->a()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lcom/flurry/android/u;->a(Lcom/flurry/android/p;Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 481
    sget-object v3, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Offer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v0, Lcom/flurry/android/OfferInSdk;->a:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " accepted. Sent with cookies: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/flurry/android/ah;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    invoke-virtual {p0, p1, v1, v2}, Lcom/flurry/android/u;->a(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0
.end method

.method final declared-synchronized a(Landroid/content/Context;Lcom/flurry/android/a;)V
    .locals 5

    .prologue
    const/4 v0, 0x1

    .line 101
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/flurry/android/u;->p:Z

    if-nez v1, :cond_0

    .line 103
    iget-object v1, p2, Lcom/flurry/android/a;->e:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/android/u;->h:Ljava/lang/String;

    .line 104
    iget-object v1, p2, Lcom/flurry/android/a;->f:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/android/u;->i:Ljava/lang/String;

    .line 105
    iget-object v1, p2, Lcom/flurry/android/a;->a:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/android/u;->j:Ljava/lang/String;

    .line 106
    iget-wide v1, p2, Lcom/flurry/android/a;->b:J

    iput-wide v1, p0, Lcom/flurry/android/u;->k:J

    .line 107
    iget-wide v1, p2, Lcom/flurry/android/a;->c:J

    iput-wide v1, p0, Lcom/flurry/android/u;->l:J

    .line 108
    iget-wide v1, p2, Lcom/flurry/android/a;->d:J

    iput-wide v1, p0, Lcom/flurry/android/u;->m:J

    .line 109
    iget-object v1, p2, Lcom/flurry/android/a;->g:Landroid/os/Handler;

    iput-object v1, p0, Lcom/flurry/android/u;->s:Landroid/os/Handler;

    .line 111
    new-instance v1, Lcom/flurry/android/ag;

    iget-object v2, p0, Lcom/flurry/android/u;->s:Landroid/os/Handler;

    sget v3, Lcom/flurry/android/u;->g:I

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/ag;-><init>(Landroid/os/Handler;I)V

    iput-object v1, p0, Lcom/flurry/android/u;->v:Lcom/flurry/android/ag;

    .line 113
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 115
    iget-object v1, p0, Lcom/flurry/android/u;->x:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 116
    iget-object v1, p0, Lcom/flurry/android/u;->u:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 117
    iget-object v1, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v1, p1, p0, p2}, Lcom/flurry/android/z;->a(Landroid/content/Context;Lcom/flurry/android/u;Lcom/flurry/android/a;)V

    .line 118
    iget-object v1, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 120
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flurry/android/u;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 v2, 0x10000

    invoke-virtual {v1, v3, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    :goto_0
    iput-boolean v0, p0, Lcom/flurry/android/u;->o:Z

    .line 122
    invoke-virtual {p0}, Lcom/flurry/android/u;->a()V

    .line 124
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/u;->p:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    :cond_0
    monitor-exit p0

    return-void

    .line 120
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 101
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 315
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 348
    :goto_0
    monitor-exit p0

    return-void

    .line 320
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->s:Landroid/os/Handler;

    new-instance v1, Lcom/flurry/android/ak;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/flurry/android/ak;-><init>(Lcom/flurry/android/u;Ljava/lang/String;Landroid/content/Context;Lcom/flurry/android/p;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 315
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    .prologue
    .line 261
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 288
    :goto_0
    monitor-exit p0

    return-void

    .line 268
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/flurry/android/u;->a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v0

    .line 269
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 271
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/flurry/android/u;->m:J

    sub-long/2addr v1, v3

    .line 272
    new-instance v3, Lcom/flurry/android/p;

    const/4 v4, 0x2

    invoke-direct {v3, p2, v4, v1, v2}, Lcom/flurry/android/p;-><init>(Ljava/lang/String;BJ)V

    .line 273
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/v;

    iput-object v0, v3, Lcom/flurry/android/p;->b:Lcom/flurry/android/v;

    .line 274
    invoke-direct {p0, v3}, Lcom/flurry/android/u;->a(Lcom/flurry/android/p;)V

    .line 276
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flurry/android/u;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v3, v1}, Lcom/flurry/android/u;->a(Lcom/flurry/android/p;Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 277
    invoke-direct {p0, p1, v3, v0}, Lcom/flurry/android/u;->b(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 284
    :catch_0
    move-exception v0

    .line 286
    :try_start_2
    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to launch promotional canvas for hook: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ah;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 261
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 281
    :cond_1
    :try_start_3
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/android/u;->p()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0
.end method

.method final a(Lcom/flurry/android/AppCircleCallback;)V
    .locals 0

    .prologue
    .line 292
    iput-object p1, p0, Lcom/flurry/android/u;->y:Lcom/flurry/android/AppCircleCallback;

    .line 293
    return-void
.end method

.method final a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 160
    iput-object p1, p0, Lcom/flurry/android/u;->q:Ljava/lang/String;

    .line 161
    return-void
.end method

.method final declared-synchronized a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 669
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 670
    monitor-exit p0

    return-void

    .line 669
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Ljava/util/List;)V
    .locals 3

    .prologue
    .line 516
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    .line 524
    :cond_0
    monitor-exit p0

    return-void

    .line 520
    :cond_1
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 522
    iget-object v2, p0, Lcom/flurry/android/u;->x:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 516
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 7

    .prologue
    .line 190
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 197
    :goto_0
    monitor-exit p0

    return-void

    .line 194
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/android/z;->a(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 196
    const-string v0, "FlurryAgent"

    iget-object v1, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v1}, Lcom/flurry/android/z;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 190
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final a(Z)V
    .locals 0

    .prologue
    .line 297
    iput-boolean p1, p0, Lcom/flurry/android/u;->t:Z

    .line 298
    return-void
.end method

.method final declared-synchronized b(Ljava/lang/String;)Lcom/flurry/android/Offer;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 447
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_1

    .line 462
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 452
    :cond_1
    const/4 v1, 0x1

    :try_start_1
    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/flurry/android/u;->a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v1

    .line 453
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 457
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/v;

    .line 458
    invoke-direct {p0, p1, v0}, Lcom/flurry/android/u;->a(Ljava/lang/String;Lcom/flurry/android/v;)Lcom/flurry/android/Offer;

    move-result-object v0

    .line 460
    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Impression for offer with ID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/android/Offer;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/ah;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 447
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized b(J)Lcom/flurry/android/p;
    .locals 2

    .prologue
    .line 251
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/u;->u:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/p;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final b()Z
    .locals 1

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/flurry/android/u;->p:Z

    return v0
.end method

.method final declared-synchronized c(Ljava/lang/String;)Ljava/util/List;
    .locals 5

    .prologue
    .line 489
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z

    move-result v0

    if-nez v0, :cond_0

    .line 491
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 511
    :goto_0
    monitor-exit p0

    return-object v0

    .line 494
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->b()Z

    move-result v0

    if-nez v0, :cond_1

    .line 496
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 499
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0, p1}, Lcom/flurry/android/z;->a(Ljava/lang/String;)[Lcom/flurry/android/v;

    move-result-object v2

    .line 501
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 502
    if-eqz v2, :cond_2

    array-length v1, v2

    if-lez v1, :cond_2

    .line 504
    array-length v3, v2

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v3, :cond_2

    aget-object v4, v2, v1

    .line 506
    invoke-direct {p0, p1, v4}, Lcom/flurry/android/u;->a(Ljava/lang/String;Lcom/flurry/android/v;)Lcom/flurry/android/Offer;

    move-result-object v4

    .line 507
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 504
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 510
    :cond_2
    sget-object v1, Lcom/flurry/android/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Impressions for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " offers."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/ah;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 489
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized c()V
    .locals 1

    .prologue
    .line 166
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 171
    :goto_0
    monitor-exit p0

    return-void

    .line 170
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->d()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 166
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized d()V
    .locals 1

    .prologue
    .line 176
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 181
    :goto_0
    monitor-exit p0

    return-void

    .line 180
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->e()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 176
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized e()J
    .locals 2

    .prologue
    .line 201
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 203
    const-wide/16 v0, 0x0

    .line 205
    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->c()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    goto :goto_0

    .line 201
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized f()Ljava/util/Set;
    .locals 1

    .prologue
    .line 210
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z

    move-result v0

    if-nez v0, :cond_0

    .line 212
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 214
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->a()Ljava/util/Set;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 210
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized g()Ljava/util/List;
    .locals 1

    .prologue
    .line 246
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/u;->w:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized h()V
    .locals 1

    .prologue
    .line 256
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/u;->u:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 257
    monitor-exit p0

    return-void

    .line 256
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final i()Z
    .locals 1

    .prologue
    .line 302
    iget-boolean v0, p0, Lcom/flurry/android/u;->t:Z

    return v0
.end method

.method final j()Ljava/lang/String;
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/flurry/android/u;->h:Ljava/lang/String;

    return-object v0
.end method

.method final k()J
    .locals 4

    .prologue
    .line 646
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flurry/android/u;->m:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method final declared-synchronized l()V
    .locals 1

    .prologue
    .line 674
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/u;->r:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 675
    monitor-exit p0

    return-void

    .line 674
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized m()Lcom/flurry/android/AdImage;
    .locals 1

    .prologue
    .line 794
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 796
    const/4 v0, 0x0

    .line 798
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/flurry/android/u;->o()Lcom/flurry/android/AdImage;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 794
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized n()Z
    .locals 1

    .prologue
    .line 826
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/u;->q()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 828
    const/4 v0, 0x0

    .line 830
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/u;->n:Lcom/flurry/android/z;

    invoke-virtual {v0}, Lcom/flurry/android/z;->b()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 826
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized onClick(Landroid/view/View;)V
    .locals 7

    .prologue
    .line 652
    monitor-enter p0

    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/flurry/android/y;

    move-object v1, v0

    .line 653
    invoke-virtual {v1}, Lcom/flurry/android/y;->a()Lcom/flurry/android/p;

    move-result-object v2

    .line 654
    new-instance v3, Lcom/flurry/android/f;

    const/4 v4, 0x4

    invoke-virtual {p0}, Lcom/flurry/android/u;->k()J

    move-result-wide v5

    invoke-direct {v3, v4, v5, v6}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v2, v3}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    .line 657
    iget-boolean v3, p0, Lcom/flurry/android/u;->t:Z

    if-eqz v3, :cond_0

    .line 659
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/u;->h:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/flurry/android/y;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v3, v2, v1}, Lcom/flurry/android/u;->b(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 665
    :goto_0
    monitor-exit p0

    return-void

    .line 663
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/u;->i:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/flurry/android/y;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v3, v2, v1}, Lcom/flurry/android/u;->a(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 652
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 780
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 781
    const-string v1, "[adLogs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/u;->w:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 784
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
