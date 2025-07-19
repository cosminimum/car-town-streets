.class public Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;
.super Lorg/apache/http/conn/ssl/SSLSocketFactory;
.source "SSLSocketFactoryTrustAll.java"


# static fields
.field private static final _HostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

.field private static final _TrustAllCerts:[Ljavax/net/ssl/TrustManager;


# instance fields
.field private _sslContext:Ljavax/net/ssl/SSLContext;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 26
    const/4 v0, 0x1

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    const/4 v1, 0x0

    new-instance v2, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll$1;

    invoke-direct {v2}, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll$1;-><init>()V

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_TrustAllCerts:[Ljavax/net/ssl/TrustManager;

    .line 37
    new-instance v0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll$2;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll$2;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_HostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    return-void
.end method

.method public constructor <init>(Ljava/security/KeyStore;)V
    .locals 3
    .param p1, "truststore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyManagementException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 52
    invoke-direct {p0, p1}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 48
    const-string v0, "TLS"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_sslContext:Ljavax/net/ssl/SSLContext;

    .line 55
    iget-object v0, p0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_sslContext:Ljavax/net/ssl/SSLContext;

    sget-object v1, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_TrustAllCerts:[Ljavax/net/ssl/TrustManager;

    invoke-virtual {v0, v2, v1, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 58
    sget-object v0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_HostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 59
    return-void
.end method


# virtual methods
.method public createSocket()Ljava/net/Socket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_sslContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .locals 1
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->_sslContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method
