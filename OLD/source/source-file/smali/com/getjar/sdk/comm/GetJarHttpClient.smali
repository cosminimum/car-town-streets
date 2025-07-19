.class public Lcom/getjar/sdk/comm/GetJarHttpClient;
.super Lorg/apache/http/impl/client/DefaultHttpClient;
.source "GetJarHttpClient.java"


# direct methods
.method private constructor <init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    .locals 0
    .param p1, "connManager"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p2, "httpParams"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 69
    return-void
.end method

.method public static newInstance(Ljava/lang/String;II)Lcom/getjar/sdk/comm/GetJarHttpClient;
    .locals 8
    .param p0, "userAgent"    # Ljava/lang/String;
    .param p1, "connectionTimeout"    # I
    .param p2, "socketTimeout"    # I

    .prologue
    const/4 v5, 0x0

    .line 36
    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 39
    .local v1, "params":Lorg/apache/http/params/HttpParams;
    invoke-static {v1, v5}, Lorg/apache/http/params/HttpConnectionParams;->setStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;Z)V

    .line 42
    invoke-static {v1, p1}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 43
    invoke-static {v1, p2}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 44
    const/16 v4, 0x2000

    invoke-static {v1, v4}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    .line 47
    invoke-static {v1, v5}, Lorg/apache/http/client/params/HttpClientParams;->setRedirecting(Lorg/apache/http/params/HttpParams;Z)V

    .line 50
    invoke-static {v1, p0}, Lorg/apache/http/params/HttpProtocolParams;->setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 53
    new-instance v2, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v2}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 54
    .local v2, "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-static {}, Lcom/getjar/sdk/comm/GetJarHttpClient;->newSSLSocketFactoryInstance()Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;

    move-result-object v3

    .line 58
    .local v3, "socketFactory":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v6

    const/16 v7, 0x1f90

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v2, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 59
    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v6

    const/16 v7, 0x50

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v2, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 60
    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "https"

    const/16 v6, 0x20fb

    invoke-direct {v4, v5, v3, v6}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v2, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 61
    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "https"

    const/16 v6, 0x1bb

    invoke-direct {v4, v5, v3, v6}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v2, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 63
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 64
    .local v0, "manager":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v4, Lcom/getjar/sdk/comm/GetJarHttpClient;

    invoke-direct {v4, v0, v1}, Lcom/getjar/sdk/comm/GetJarHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    return-object v4
.end method

.method private static newSSLSocketFactoryInstance()Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;
    .locals 5

    .prologue
    .line 74
    :try_start_0
    const-string v3, "BKS"

    invoke-static {v3}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v2

    .line 75
    .local v2, "trusted":Ljava/security/KeyStore;
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 76
    new-instance v1, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;

    invoke-direct {v1, v2}, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;-><init>(Ljava/security/KeyStore;)V

    .line 77
    .local v1, "sslFactory":Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;
    sget-object v3, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v1, v3}, Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/UnrecoverableKeyException; {:try_start_0 .. :try_end_0} :catch_5

    .line 91
    return-object v1

    .line 78
    .end local v1    # "sslFactory":Lcom/getjar/sdk/comm/SSLSocketFactoryTrustAll;
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/security/KeyStoreException;
    new-instance v3, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v3, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 80
    .end local v0    # "e":Ljava/security/KeyStoreException;
    :catch_1
    move-exception v0

    .line 81
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v3, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 82
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2
    move-exception v0

    .line 83
    .local v0, "e":Ljava/security/cert/CertificateException;
    new-instance v3, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v3, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 84
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :catch_3
    move-exception v0

    .line 85
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v3, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 86
    .end local v0    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v0

    .line 87
    .local v0, "e":Ljava/security/KeyManagementException;
    new-instance v3, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v3, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 88
    .end local v0    # "e":Ljava/security/KeyManagementException;
    :catch_5
    move-exception v0

    .line 89
    .local v0, "e":Ljava/security/UnrecoverableKeyException;
    new-instance v3, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v3, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
