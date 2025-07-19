package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameBuffer;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.GamesMetadata;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerBuffer;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.games.Players;
import com.google.android.gms.games.achievement.AchievementBuffer;
import com.google.android.gms.games.achievement.Achievements;
import com.google.android.gms.games.leaderboard.C0828a;
import com.google.android.gms.games.leaderboard.C0831d;
import com.google.android.gms.games.leaderboard.Leaderboard;
import com.google.android.gms.games.leaderboard.LeaderboardBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardScore;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.Leaderboards;
import com.google.android.gms.games.leaderboard.ScoreSubmissionData;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.games.multiplayer.InvitationBuffer;
import com.google.android.gms.games.multiplayer.Invitations;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;
import com.google.android.gms.games.multiplayer.ParticipantResult;
import com.google.android.gms.games.multiplayer.ParticipantUtils;
import com.google.android.gms.games.multiplayer.realtime.C0844a;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessage;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessageReceivedListener;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer;
import com.google.android.gms.games.multiplayer.realtime.RealTimeSocket;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomEntity;
import com.google.android.gms.games.multiplayer.realtime.RoomStatusUpdateListener;
import com.google.android.gms.games.multiplayer.realtime.RoomUpdateListener;
import com.google.android.gms.games.multiplayer.turnbased.LoadMatchesResponse;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchUpdateReceivedListener;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatch;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatchBuffer;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatchConfig;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer;
import com.google.android.gms.internal.C1071dw;
import com.google.android.gms.internal.C1210fp;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.fl */
public final class C1141fl extends C1071dw<C1210fp> implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {

    /* renamed from: jG */
    private final String f2693jG;

    /* renamed from: tA */
    private boolean f2694tA;

    /* renamed from: tB */
    private int f2695tB;

    /* renamed from: tO */
    private final String f2696tO;

    /* renamed from: tP */
    private final Map<String, RealTimeSocket> f2697tP;

    /* renamed from: tQ */
    private PlayerEntity f2698tQ;

    /* renamed from: tR */
    private GameEntity f2699tR;

    /* renamed from: tS */
    private final C1213fq f2700tS;

    /* renamed from: tT */
    private boolean f2701tT;

    /* renamed from: tU */
    private final Binder f2702tU;

    /* renamed from: tV */
    private final long f2703tV;

    /* renamed from: tW */
    private final boolean f2704tW;

    /* renamed from: tX */
    private final int f2705tX;

    /* renamed from: com.google.android.gms.internal.fl$a */
    abstract class C1142a extends C1181c {

        /* renamed from: tY */
        private final ArrayList<String> f2706tY = new ArrayList<>();

        C1142a(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder);
            for (String add : strArr) {
                this.f2706tY.add(add);
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7786a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            mo7787a(roomStatusUpdateListener, room, this.f2706tY);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public abstract void mo7787a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList);
    }

    /* renamed from: com.google.android.gms.internal.fl$aa */
    final class C1143aa extends C1071dw<C1210fp>.b<RoomStatusUpdateListener> {

        /* renamed from: up */
        private final String f2709up;

        C1143aa(RoomStatusUpdateListener roomStatusUpdateListener, String str) {
            super(roomStatusUpdateListener);
            this.f2709up = str;
        }

        /* renamed from: a */
        public void mo7307b(RoomStatusUpdateListener roomStatusUpdateListener) {
            if (roomStatusUpdateListener != null) {
                roomStatusUpdateListener.onP2PConnected(this.f2709up);
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ab */
    final class C1144ab extends C1071dw<C1210fp>.b<RoomStatusUpdateListener> {

        /* renamed from: up */
        private final String f2711up;

        C1144ab(RoomStatusUpdateListener roomStatusUpdateListener, String str) {
            super(roomStatusUpdateListener);
            this.f2711up = str;
        }

        /* renamed from: a */
        public void mo7307b(RoomStatusUpdateListener roomStatusUpdateListener) {
            if (roomStatusUpdateListener != null) {
                roomStatusUpdateListener.onP2PDisconnected(this.f2711up);
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ac */
    final class C1145ac extends C1142a {
        C1145ac(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7787a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeersConnected(room, arrayList);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ad */
    final class C1146ad extends C1142a {
        C1146ad(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7787a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerDeclined(room, arrayList);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ae */
    final class C1147ae extends C1142a {
        C1147ae(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7787a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeersDisconnected(room, arrayList);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$af */
    final class C1148af extends C1142a {
        C1148af(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7787a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerInvitedToRoom(room, arrayList);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ag */
    final class C1149ag extends C1142a {
        C1149ag(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7787a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerJoined(room, arrayList);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ah */
    final class C1150ah extends C1142a {
        C1150ah(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7787a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerLeft(room, arrayList);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ai */
    final class C1151ai extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Leaderboards.LoadPlayerScoreResult> f2718jW;

        C1151ai(C0655a.C0659c<Leaderboards.LoadPlayerScoreResult> cVar) {
            this.f2718jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: D */
        public void mo7671D(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1152aj(this.f2718jW, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$aj */
    final class C1152aj extends C1071dw<C1210fp>.d<C0655a.C0659c<Leaderboards.LoadPlayerScoreResult>> implements Leaderboards.LoadPlayerScoreResult {

        /* renamed from: jY */
        private final Status f2720jY;

        /* renamed from: uq */
        private final C0831d f2722uq;

        C1152aj(C0655a.C0659c<Leaderboards.LoadPlayerScoreResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2720jY = new Status(dataHolder.getStatusCode());
            LeaderboardScoreBuffer leaderboardScoreBuffer = new LeaderboardScoreBuffer(dataHolder);
            try {
                if (leaderboardScoreBuffer.getCount() > 0) {
                    this.f2722uq = (C0831d) leaderboardScoreBuffer.get(0).freeze();
                } else {
                    this.f2722uq = null;
                }
            } finally {
                leaderboardScoreBuffer.close();
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Leaderboards.LoadPlayerScoreResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public LeaderboardScore getScore() {
            return this.f2722uq;
        }

        public Status getStatus() {
            return this.f2720jY;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ak */
    final class C1153ak extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Players.LoadPlayersResult> f2723jW;

        C1153ak(C0655a.C0659c<Players.LoadPlayersResult> cVar) {
            this.f2723jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: e */
        public void mo7688e(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1154al(this.f2723jW, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$al */
    final class C1154al extends C1157ao<C0655a.C0659c<Players.LoadPlayersResult>> implements Players.LoadPlayersResult {

        /* renamed from: ur */
        private final PlayerBuffer f2726ur;

        C1154al(C0655a.C0659c<Players.LoadPlayersResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2726ur = new PlayerBuffer(dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Players.LoadPlayersResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public PlayerBuffer getPlayers() {
            return this.f2726ur;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$am */
    final class C1155am extends C1071dw<C1210fp>.b<RealTimeMultiplayer.ReliableMessageSentCallback> {

        /* renamed from: mC */
        private final int f2727mC;

        /* renamed from: us */
        private final String f2729us;

        /* renamed from: ut */
        private final int f2730ut;

        C1155am(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback, int i, int i2, String str) {
            super(reliableMessageSentCallback);
            this.f2727mC = i;
            this.f2730ut = i2;
            this.f2729us = str;
        }

        /* renamed from: a */
        public void mo7307b(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback) {
            if (reliableMessageSentCallback != null) {
                reliableMessageSentCallback.onRealTimeMessageSent(this.f2727mC, this.f2730ut, this.f2729us);
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$an */
    final class C1156an extends C1140fk {

        /* renamed from: uu */
        final RealTimeMultiplayer.ReliableMessageSentCallback f2732uu;

        public C1156an(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback) {
            this.f2732uu = reliableMessageSentCallback;
        }

        /* renamed from: b */
        public void mo7680b(int i, int i2, String str) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1155am(this.f2732uu, i, i2, str));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ao */
    abstract class C1157ao<R extends C0655a.C0659c<?>> extends C1071dw<C1210fp>.d<R> implements Releasable, Result {

        /* renamed from: jY */
        final Status f2733jY;

        /* renamed from: nE */
        final DataHolder f2734nE;

        public C1157ao(R r, DataHolder dataHolder) {
            super(r, dataHolder);
            this.f2733jY = new Status(dataHolder.getStatusCode());
            this.f2734nE = dataHolder;
        }

        public Status getStatus() {
            return this.f2733jY;
        }

        public void release() {
            if (this.f2734nE != null) {
                this.f2734nE.close();
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ap */
    final class C1158ap extends C1181c {
        C1158ap(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        /* renamed from: a */
        public void mo7786a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onRoomAutoMatching(room);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$aq */
    final class C1159aq extends C1140fk {

        /* renamed from: uv */
        private final RoomUpdateListener f2738uv;

        /* renamed from: uw */
        private final RoomStatusUpdateListener f2739uw;

        /* renamed from: ux */
        private final RealTimeMessageReceivedListener f2740ux;

        public C1159aq(RoomUpdateListener roomUpdateListener) {
            this.f2738uv = (RoomUpdateListener) C1102eg.m2614b(roomUpdateListener, (Object) "Callbacks must not be null");
            this.f2739uw = null;
            this.f2740ux = null;
        }

        public C1159aq(RoomUpdateListener roomUpdateListener, RoomStatusUpdateListener roomStatusUpdateListener, RealTimeMessageReceivedListener realTimeMessageReceivedListener) {
            this.f2738uv = (RoomUpdateListener) C1102eg.m2614b(roomUpdateListener, (Object) "Callbacks must not be null");
            this.f2739uw = roomStatusUpdateListener;
            this.f2740ux = realTimeMessageReceivedListener;
        }

        /* renamed from: a */
        public void mo7675a(DataHolder dataHolder, String[] strArr) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1148af(this.f2739uw, dataHolder, strArr));
        }

        /* renamed from: b */
        public void mo7682b(DataHolder dataHolder, String[] strArr) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1149ag(this.f2739uw, dataHolder, strArr));
        }

        /* renamed from: c */
        public void mo7684c(DataHolder dataHolder, String[] strArr) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1150ah(this.f2739uw, dataHolder, strArr));
        }

        /* renamed from: d */
        public void mo7687d(DataHolder dataHolder, String[] strArr) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1146ad(this.f2739uw, dataHolder, strArr));
        }

        /* renamed from: e */
        public void mo7689e(DataHolder dataHolder, String[] strArr) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1145ac(this.f2739uw, dataHolder, strArr));
        }

        /* renamed from: f */
        public void mo7691f(DataHolder dataHolder, String[] strArr) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1147ae(this.f2739uw, dataHolder, strArr));
        }

        public void onLeftRoom(int statusCode, String externalRoomId) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1200v(this.f2738uv, statusCode, externalRoomId));
        }

        public void onP2PConnected(String participantId) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1143aa(this.f2739uw, participantId));
        }

        public void onP2PDisconnected(String participantId) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1144ab(this.f2739uw, participantId));
        }

        public void onRealTimeMessageReceived(RealTimeMessage message) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1204z(this.f2740ux, message));
        }

        /* renamed from: t */
        public void mo7714t(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1162at(this.f2738uv, dataHolder));
        }

        /* renamed from: u */
        public void mo7715u(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1195q(this.f2738uv, dataHolder));
        }

        /* renamed from: v */
        public void mo7716v(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1161as(this.f2739uw, dataHolder));
        }

        /* renamed from: w */
        public void mo7717w(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1158ap(this.f2739uw, dataHolder));
        }

        /* renamed from: x */
        public void mo7718x(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1160ar(this.f2738uv, dataHolder));
        }

        /* renamed from: y */
        public void mo7719y(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1186h(this.f2739uw, dataHolder));
        }

        /* renamed from: z */
        public void mo7720z(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1187i(this.f2739uw, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ar */
    final class C1160ar extends C1169b {
        C1160ar(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        /* renamed from: a */
        public void mo7793a(RoomUpdateListener roomUpdateListener, Room room, int i) {
            roomUpdateListener.onRoomConnected(i, room);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$as */
    final class C1161as extends C1181c {
        C1161as(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        /* renamed from: a */
        public void mo7786a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onRoomConnecting(room);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$at */
    final class C1162at extends C1169b {
        public C1162at(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        /* renamed from: a */
        public void mo7793a(RoomUpdateListener roomUpdateListener, Room room, int i) {
            roomUpdateListener.onRoomCreated(i, room);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$au */
    final class C1163au extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Status> f2744jW;

        public C1163au(C0655a.C0659c<Status> cVar) {
            this.f2744jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        public void onSignOutComplete() {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1164av(this.f2744jW, new Status(0)));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$av */
    final class C1164av extends C1071dw<C1210fp>.b<C0655a.C0659c<Status>> {

        /* renamed from: jY */
        private final Status f2746jY;

        public C1164av(C0655a.C0659c<Status> cVar, Status status) {
            super(cVar);
            this.f2746jY = status;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<Status> cVar) {
            cVar.mo5612a(this.f2746jY);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$aw */
    final class C1165aw extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Leaderboards.SubmitScoreResult> f2748jW;

        public C1165aw(C0655a.C0659c<Leaderboards.SubmitScoreResult> cVar) {
            this.f2748jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: d */
        public void mo7686d(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1166ax(this.f2748jW, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ax */
    final class C1166ax extends C1157ao<C0655a.C0659c<Leaderboards.SubmitScoreResult>> implements Leaderboards.SubmitScoreResult {

        /* renamed from: uy */
        private final ScoreSubmissionData f2751uy;

        public C1166ax(C0655a.C0659c<Leaderboards.SubmitScoreResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2751uy = new ScoreSubmissionData(dataHolder);
        }

        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Leaderboards.SubmitScoreResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public ScoreSubmissionData getScoreData() {
            return this.f2751uy;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$ay */
    abstract class C1167ay<T extends C0655a.C0659c<?>> extends C1157ao<T> {

        /* renamed from: un */
        final TurnBasedMatch f2753un;

        C1167ay(T t, DataHolder dataHolder) {
            super(t, dataHolder);
            TurnBasedMatchBuffer turnBasedMatchBuffer = new TurnBasedMatchBuffer(dataHolder);
            try {
                if (turnBasedMatchBuffer.getCount() > 0) {
                    this.f2753un = (TurnBasedMatch) ((TurnBasedMatch) turnBasedMatchBuffer.get(0)).freeze();
                } else {
                    this.f2753un = null;
                }
            } finally {
                turnBasedMatchBuffer.close();
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(T t, DataHolder dataHolder) {
            mo7798i(t);
        }

        public TurnBasedMatch getMatch() {
            return this.f2753un;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: i */
        public abstract void mo7798i(T t);
    }

    /* renamed from: com.google.android.gms.internal.fl$az */
    final class C1168az extends C1140fk {

        /* renamed from: uz */
        private final C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult> f2755uz;

        public C1168az(C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult> cVar) {
            this.f2755uz = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        public void onTurnBasedMatchCanceled(int statusCode, String matchId) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1170ba(this.f2755uz, new Status(statusCode), matchId));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$b */
    abstract class C1169b extends C1071dw<C1210fp>.d<RoomUpdateListener> {
        C1169b(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            mo7793a(roomUpdateListener, C1141fl.this.m2819E(dataHolder), dataHolder.getStatusCode());
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public abstract void mo7793a(RoomUpdateListener roomUpdateListener, Room room, int i);
    }

    /* renamed from: com.google.android.gms.internal.fl$ba */
    final class C1170ba extends C1071dw<C1210fp>.b<C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult>> implements TurnBasedMultiplayer.CancelMatchResult {

        /* renamed from: jY */
        private final Status f2757jY;

        /* renamed from: uA */
        private final String f2759uA;

        C1170ba(C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult> cVar, Status status, String str) {
            super(cVar);
            this.f2757jY = status;
            this.f2759uA = str;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult> cVar) {
            cVar.mo5612a(this);
        }

        public String getMatchId() {
            return this.f2759uA;
        }

        public Status getStatus() {
            return this.f2757jY;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bb */
    final class C1171bb extends C1140fk {

        /* renamed from: uB */
        private final C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult> f2761uB;

        public C1171bb(C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult> cVar) {
            this.f2761uB = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: n */
        public void mo7699n(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1172bc(this.f2761uB, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bc */
    final class C1172bc extends C1167ay<C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult>> implements TurnBasedMultiplayer.InitiateMatchResult {
        C1172bc(C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: i */
        public void mo7798i(C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult> cVar) {
            cVar.mo5612a(this);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bd */
    final class C1173bd extends C1140fk {

        /* renamed from: uC */
        private final C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult> f2764uC;

        public C1173bd(C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult> cVar) {
            this.f2764uC = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: p */
        public void mo7710p(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1174be(this.f2764uC, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$be */
    final class C1174be extends C1167ay<C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult>> implements TurnBasedMultiplayer.LeaveMatchResult {
        C1174be(C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: i */
        public void mo7798i(C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult> cVar) {
            cVar.mo5612a(this);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bf */
    final class C1175bf extends C1140fk {

        /* renamed from: uD */
        private final C0655a.C0659c<TurnBasedMultiplayer.LoadMatchResult> f2767uD;

        public C1175bf(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchResult> cVar) {
            this.f2767uD = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: m */
        public void mo7698m(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1176bg(this.f2767uD, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bg */
    final class C1176bg extends C1167ay<C0655a.C0659c<TurnBasedMultiplayer.LoadMatchResult>> implements TurnBasedMultiplayer.LoadMatchResult {
        C1176bg(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: i */
        public void mo7798i(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchResult> cVar) {
            cVar.mo5612a(this);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bh */
    final class C1177bh extends C1140fk {

        /* renamed from: uE */
        private final C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult> f2770uE;

        public C1177bh(C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult> cVar) {
            this.f2770uE = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: o */
        public void mo7700o(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1178bi(this.f2770uE, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bi */
    final class C1178bi extends C1167ay<C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>> implements TurnBasedMultiplayer.UpdateMatchResult {
        C1178bi(C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: i */
        public void mo7798i(C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult> cVar) {
            cVar.mo5612a(this);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bj */
    final class C1179bj extends C1140fk {

        /* renamed from: uF */
        private final C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult> f2773uF;

        public C1179bj(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult> cVar) {
            this.f2773uF = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: a */
        public void mo7672a(int i, Bundle bundle) {
            bundle.setClassLoader(getClass().getClassLoader());
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1180bk(this.f2773uF, new Status(i), bundle));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$bk */
    final class C1180bk extends C1071dw<C1210fp>.b<C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult>> implements TurnBasedMultiplayer.LoadMatchesResult {

        /* renamed from: jY */
        private final Status f2774jY;

        /* renamed from: uG */
        private final LoadMatchesResponse f2776uG;

        C1180bk(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult> cVar, Status status, Bundle bundle) {
            super(cVar);
            this.f2774jY = status;
            this.f2776uG = new LoadMatchesResponse(bundle);
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult> cVar) {
            cVar.mo5612a(this);
        }

        public LoadMatchesResponse getMatches() {
            return this.f2776uG;
        }

        public Status getStatus() {
            return this.f2774jY;
        }

        public void release() {
            this.f2776uG.close();
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$c */
    abstract class C1181c extends C1071dw<C1210fp>.d<RoomStatusUpdateListener> {
        C1181c(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            mo7786a(roomStatusUpdateListener, C1141fl.this.m2819E(dataHolder));
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public abstract void mo7786a(RoomStatusUpdateListener roomStatusUpdateListener, Room room);
    }

    /* renamed from: com.google.android.gms.internal.fl$d */
    final class C1182d extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Achievements.UpdateAchievementResult> f2778jW;

        C1182d(C0655a.C0659c<Achievements.UpdateAchievementResult> cVar) {
            this.f2778jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        public void onAchievementUpdated(int statusCode, String achievementId) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1183e(this.f2778jW, statusCode, achievementId));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$e */
    final class C1183e extends C1071dw<C1210fp>.b<C0655a.C0659c<Achievements.UpdateAchievementResult>> implements Achievements.UpdateAchievementResult {

        /* renamed from: jY */
        private final Status f2780jY;

        /* renamed from: ua */
        private final String f2782ua;

        C1183e(C0655a.C0659c<Achievements.UpdateAchievementResult> cVar, int i, String str) {
            super(cVar);
            this.f2780jY = new Status(i);
            this.f2782ua = str;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<Achievements.UpdateAchievementResult> cVar) {
            cVar.mo5612a(this);
        }

        public String getAchievementId() {
            return this.f2782ua;
        }

        public Status getStatus() {
            return this.f2780jY;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$f */
    final class C1184f extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Achievements.LoadAchievementsResult> f2783jW;

        C1184f(C0655a.C0659c<Achievements.LoadAchievementsResult> cVar) {
            this.f2783jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: b */
        public void mo7681b(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1185g(this.f2783jW, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$g */
    final class C1185g extends C1157ao<C0655a.C0659c<Achievements.LoadAchievementsResult>> implements Achievements.LoadAchievementsResult {

        /* renamed from: ub */
        private final AchievementBuffer f2786ub;

        C1185g(C0655a.C0659c<Achievements.LoadAchievementsResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2786ub = new AchievementBuffer(dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Achievements.LoadAchievementsResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public AchievementBuffer getAchievements() {
            return this.f2786ub;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$h */
    final class C1186h extends C1181c {
        C1186h(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        /* renamed from: a */
        public void mo7786a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onConnectedToRoom(room);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$i */
    final class C1187i extends C1181c {
        C1187i(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        /* renamed from: a */
        public void mo7786a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onDisconnectedFromRoom(room);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$j */
    final class C1188j extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<GamesMetadata.LoadGamesResult> f2789jW;

        C1188j(C0655a.C0659c<GamesMetadata.LoadGamesResult> cVar) {
            this.f2789jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: g */
        public void mo7692g(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1189k(this.f2789jW, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$k */
    final class C1189k extends C1157ao<C0655a.C0659c<GamesMetadata.LoadGamesResult>> implements GamesMetadata.LoadGamesResult {

        /* renamed from: uc */
        private final GameBuffer f2792uc;

        C1189k(C0655a.C0659c<GamesMetadata.LoadGamesResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2792uc = new GameBuffer(dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<GamesMetadata.LoadGamesResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public GameBuffer getGames() {
            return this.f2792uc;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$l */
    final class C1190l extends C1140fk {

        /* renamed from: ud */
        private final OnInvitationReceivedListener f2794ud;

        C1190l(OnInvitationReceivedListener onInvitationReceivedListener) {
            this.f2794ud = onInvitationReceivedListener;
        }

        /* renamed from: l */
        public void mo7697l(DataHolder dataHolder) {
            InvitationBuffer invitationBuffer = new InvitationBuffer(dataHolder);
            Invitation invitation = null;
            try {
                if (invitationBuffer.getCount() > 0) {
                    invitation = (Invitation) ((Invitation) invitationBuffer.get(0)).freeze();
                }
                if (invitation != null) {
                    C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1191m(this.f2794ud, invitation));
                }
            } finally {
                invitationBuffer.close();
            }
        }

        public void onInvitationRemoved(String invitationId) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1192n(this.f2794ud, invitationId));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$m */
    final class C1191m extends C1071dw<C1210fp>.b<OnInvitationReceivedListener> {

        /* renamed from: ue */
        private final Invitation f2796ue;

        C1191m(OnInvitationReceivedListener onInvitationReceivedListener, Invitation invitation) {
            super(onInvitationReceivedListener);
            this.f2796ue = invitation;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7307b(OnInvitationReceivedListener onInvitationReceivedListener) {
            onInvitationReceivedListener.onInvitationReceived(this.f2796ue);
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$n */
    final class C1192n extends C1071dw<C1210fp>.b<OnInvitationReceivedListener> {

        /* renamed from: uf */
        private final String f2798uf;

        C1192n(OnInvitationReceivedListener onInvitationReceivedListener, String str) {
            super(onInvitationReceivedListener);
            this.f2798uf = str;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7307b(OnInvitationReceivedListener onInvitationReceivedListener) {
            onInvitationReceivedListener.onInvitationRemoved(this.f2798uf);
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$o */
    final class C1193o extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Invitations.LoadInvitationsResult> f2799jW;

        C1193o(C0655a.C0659c<Invitations.LoadInvitationsResult> cVar) {
            this.f2799jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: k */
        public void mo7696k(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1194p(this.f2799jW, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$p */
    final class C1194p extends C1157ao<C0655a.C0659c<Invitations.LoadInvitationsResult>> implements Invitations.LoadInvitationsResult {

        /* renamed from: ug */
        private final InvitationBuffer f2802ug;

        C1194p(C0655a.C0659c<Invitations.LoadInvitationsResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2802ug = new InvitationBuffer(dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Invitations.LoadInvitationsResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public InvitationBuffer getInvitations() {
            return this.f2802ug;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$q */
    final class C1195q extends C1169b {
        public C1195q(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        /* renamed from: a */
        public void mo7793a(RoomUpdateListener roomUpdateListener, Room room, int i) {
            roomUpdateListener.onJoinedRoom(i, room);
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$r */
    final class C1196r extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Leaderboards.LoadScoresResult> f2804jW;

        C1196r(C0655a.C0659c<Leaderboards.LoadScoresResult> cVar) {
            this.f2804jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: a */
        public void mo7674a(DataHolder dataHolder, DataHolder dataHolder2) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1197s(this.f2804jW, dataHolder, dataHolder2));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$s */
    final class C1197s extends C1157ao<C0655a.C0659c<Leaderboards.LoadScoresResult>> implements Leaderboards.LoadScoresResult {

        /* renamed from: uh */
        private final C0828a f2807uh;

        /* renamed from: ui */
        private final LeaderboardScoreBuffer f2808ui;

        /* JADX INFO: finally extract failed */
        C1197s(C0655a.C0659c<Leaderboards.LoadScoresResult> cVar, DataHolder dataHolder, DataHolder dataHolder2) {
            super(cVar, dataHolder2);
            LeaderboardBuffer leaderboardBuffer = new LeaderboardBuffer(dataHolder);
            try {
                if (leaderboardBuffer.getCount() > 0) {
                    this.f2807uh = (C0828a) ((Leaderboard) leaderboardBuffer.get(0)).freeze();
                } else {
                    this.f2807uh = null;
                }
                leaderboardBuffer.close();
                this.f2808ui = new LeaderboardScoreBuffer(dataHolder2);
            } catch (Throwable th) {
                leaderboardBuffer.close();
                throw th;
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Leaderboards.LoadScoresResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public Leaderboard getLeaderboard() {
            return this.f2807uh;
        }

        public LeaderboardScoreBuffer getScores() {
            return this.f2808ui;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$t */
    final class C1198t extends C1140fk {

        /* renamed from: jW */
        private final C0655a.C0659c<Leaderboards.LeaderboardMetadataResult> f2809jW;

        C1198t(C0655a.C0659c<Leaderboards.LeaderboardMetadataResult> cVar) {
            this.f2809jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        /* renamed from: c */
        public void mo7683c(DataHolder dataHolder) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1199u(this.f2809jW, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$u */
    final class C1199u extends C1157ao<C0655a.C0659c<Leaderboards.LeaderboardMetadataResult>> implements Leaderboards.LeaderboardMetadataResult {

        /* renamed from: uj */
        private final LeaderboardBuffer f2812uj;

        C1199u(C0655a.C0659c<Leaderboards.LeaderboardMetadataResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2812uj = new LeaderboardBuffer(dataHolder);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Leaderboards.LeaderboardMetadataResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public LeaderboardBuffer getLeaderboards() {
            return this.f2812uj;
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$v */
    final class C1200v extends C1071dw<C1210fp>.b<RoomUpdateListener> {

        /* renamed from: mC */
        private final int f2813mC;

        /* renamed from: uk */
        private final String f2815uk;

        C1200v(RoomUpdateListener roomUpdateListener, int i, String str) {
            super(roomUpdateListener);
            this.f2813mC = i;
            this.f2815uk = str;
        }

        /* renamed from: a */
        public void mo7307b(RoomUpdateListener roomUpdateListener) {
            roomUpdateListener.onLeftRoom(this.f2813mC, this.f2815uk);
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$w */
    final class C1201w extends C1071dw<C1210fp>.b<OnTurnBasedMatchUpdateReceivedListener> {

        /* renamed from: ul */
        private final String f2817ul;

        C1201w(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener, String str) {
            super(onTurnBasedMatchUpdateReceivedListener);
            this.f2817ul = str;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7307b(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener) {
            onTurnBasedMatchUpdateReceivedListener.onTurnBasedMatchRemoved(this.f2817ul);
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$x */
    final class C1202x extends C1140fk {

        /* renamed from: um */
        private final OnTurnBasedMatchUpdateReceivedListener f2819um;

        C1202x(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener) {
            this.f2819um = onTurnBasedMatchUpdateReceivedListener;
        }

        public void onTurnBasedMatchRemoved(String matchId) {
            C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1201w(this.f2819um, matchId));
        }

        /* renamed from: q */
        public void mo7711q(DataHolder dataHolder) {
            TurnBasedMatchBuffer turnBasedMatchBuffer = new TurnBasedMatchBuffer(dataHolder);
            TurnBasedMatch turnBasedMatch = null;
            try {
                if (turnBasedMatchBuffer.getCount() > 0) {
                    turnBasedMatch = (TurnBasedMatch) ((TurnBasedMatch) turnBasedMatchBuffer.get(0)).freeze();
                }
                if (turnBasedMatch != null) {
                    C1141fl.this.mo7451a((C1071dw<T>.b<?>) new C1203y(this.f2819um, turnBasedMatch));
                }
            } finally {
                turnBasedMatchBuffer.close();
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$y */
    final class C1203y extends C1071dw<C1210fp>.b<OnTurnBasedMatchUpdateReceivedListener> {

        /* renamed from: un */
        private final TurnBasedMatch f2821un;

        C1203y(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener, TurnBasedMatch turnBasedMatch) {
            super(onTurnBasedMatchUpdateReceivedListener);
            this.f2821un = turnBasedMatch;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7307b(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener) {
            onTurnBasedMatchUpdateReceivedListener.onTurnBasedMatchReceived(this.f2821un);
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.fl$z */
    final class C1204z extends C1071dw<C1210fp>.b<RealTimeMessageReceivedListener> {

        /* renamed from: uo */
        private final RealTimeMessage f2823uo;

        C1204z(RealTimeMessageReceivedListener realTimeMessageReceivedListener, RealTimeMessage realTimeMessage) {
            super(realTimeMessageReceivedListener);
            this.f2823uo = realTimeMessage;
        }

        /* renamed from: a */
        public void mo7307b(RealTimeMessageReceivedListener realTimeMessageReceivedListener) {
            if (realTimeMessageReceivedListener != null) {
                realTimeMessageReceivedListener.onRealTimeMessageReceived(this.f2823uo);
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    @Deprecated
    public C1141fl(Context context, String str, String str2, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String[] strArr, int i, View view, boolean z, boolean z2, int i2) {
        this(context, str, str2, new C1071dw.C1074c(connectionCallbacks), new C1071dw.C1078g(onConnectionFailedListener), strArr, i, view, z, z2, i2, 4368);
    }

    public C1141fl(Context context, String str, String str2, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String[] strArr, int i, View view, boolean z, boolean z2, int i2, int i3) {
        super(context, connectionCallbacks, onConnectionFailedListener, strArr);
        this.f2701tT = false;
        this.f2694tA = false;
        this.f2696tO = str;
        this.f2693jG = (String) C1102eg.m2616f(str2);
        this.f2702tU = new Binder();
        this.f2697tP = new HashMap();
        this.f2700tS = C1213fq.m3303a(this, i);
        setViewForPopups(view);
        this.f2694tA = z2;
        this.f2695tB = i2;
        this.f2703tV = (long) hashCode();
        this.f2704tW = z;
        this.f2705tX = i3;
        registerConnectionCallbacks((GoogleApiClient.ConnectionCallbacks) this);
        registerConnectionFailedListener((GoogleApiClient.OnConnectionFailedListener) this);
    }

    /* access modifiers changed from: private */
    /* renamed from: E */
    public Room m2819E(DataHolder dataHolder) {
        C0844a aVar = new C0844a(dataHolder);
        Room room = null;
        try {
            if (aVar.getCount() > 0) {
                room = (Room) ((Room) aVar.get(0)).freeze();
            }
            return room;
        } finally {
            aVar.close();
        }
    }

    /* renamed from: ae */
    private RealTimeSocket m2821ae(String str) {
        try {
            String ag = ((C1210fp) mo7454bQ()).mo7856ag(str);
            if (ag == null) {
                return null;
            }
            LocalSocket localSocket = new LocalSocket();
            try {
                localSocket.connect(new LocalSocketAddress(ag));
                C1217fr frVar = new C1217fr(localSocket, str);
                this.f2697tP.put(str, frVar);
                return frVar;
            } catch (IOException e) {
                C1206fn.m2982d("GamesClientImpl", "connect() call failed on socket: " + e.getMessage());
                return null;
            }
        } catch (RemoteException e2) {
            C1206fn.m2982d("GamesClientImpl", "Unable to create socket. Service died.");
            return null;
        }
    }

    /* renamed from: dc */
    private void m2822dc() {
        this.f2698tQ = null;
    }

    /* renamed from: de */
    private void m2823de() {
        for (RealTimeSocket close : this.f2697tP.values()) {
            try {
                close.close();
            } catch (IOException e) {
                C1206fn.m2980a("GamesClientImpl", "IOException:", e);
            }
        }
        this.f2697tP.clear();
    }

    /* access modifiers changed from: protected */
    /* renamed from: F */
    public C1210fp mo6207p(IBinder iBinder) {
        return C1210fp.C1211a.m3187H(iBinder);
    }

    /* renamed from: a */
    public int mo7722a(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback, byte[] bArr, String str, String str2) {
        try {
            return ((C1210fp) mo7454bQ()).mo7818a((C1207fo) new C1156an(reliableMessageSentCallback), bArr, str, str2);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return -1;
        }
    }

    /* renamed from: a */
    public int mo7723a(byte[] bArr, String str, String[] strArr) {
        C1102eg.m2614b(strArr, (Object) "Participant IDs must not be null");
        try {
            return ((C1210fp) mo7454bQ()).mo7862b(bArr, str, strArr);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return -1;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6201a(int i, IBinder iBinder, Bundle bundle) {
        if (i == 0 && bundle != null) {
            this.f2701tT = bundle.getBoolean("show_welcome_popup");
        }
        super.mo6201a(i, iBinder, bundle);
    }

    /* renamed from: a */
    public void mo7724a(IBinder iBinder, Bundle bundle) {
        if (isConnected()) {
            try {
                ((C1210fp) mo7454bQ()).mo7822a(iBinder, bundle);
            } catch (RemoteException e) {
                C1206fn.m2981c("GamesClientImpl", "service died");
            }
        }
    }

    /* renamed from: a */
    public void mo7725a(C0655a.C0659c<Players.LoadPlayersResult> cVar, int i, boolean z, boolean z2) {
        try {
            ((C1210fp) mo7454bQ()).mo7826a((C1207fo) new C1153ak(cVar), i, z, z2);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7726a(C0655a.C0659c<Leaderboards.LoadScoresResult> cVar, LeaderboardScoreBuffer leaderboardScoreBuffer, int i, int i2) {
        try {
            ((C1210fp) mo7454bQ()).mo7829a((C1207fo) new C1196r(cVar), leaderboardScoreBuffer.mo6668dq().mo6722dr(), i, i2);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7727a(C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult> cVar, TurnBasedMatchConfig turnBasedMatchConfig) {
        try {
            ((C1210fp) mo7454bQ()).mo7825a((C1207fo) new C1171bb(cVar), turnBasedMatchConfig.getVariant(), turnBasedMatchConfig.getMinPlayers(), turnBasedMatchConfig.getInvitedPlayerIds(), turnBasedMatchConfig.getAutoMatchCriteria());
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7728a(C0655a.C0659c<Players.LoadPlayersResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7881c((C1207fo) new C1153ak(cVar), str);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7729a(C0655a.C0659c<Achievements.UpdateAchievementResult> cVar, String str, int i) {
        try {
            ((C1210fp) mo7454bQ()).mo7834a((C1207fo) cVar == null ? null : new C1182d(cVar), str, i, this.f2700tS.mo7952dn(), this.f2700tS.mo7951dm());
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7730a(C0655a.C0659c<Leaderboards.LoadScoresResult> cVar, String str, int i, int i2, int i3, boolean z) {
        try {
            ((C1210fp) mo7454bQ()).mo7833a((C1207fo) new C1196r(cVar), str, i, i2, i3, z);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7731a(C0655a.C0659c<Players.LoadPlayersResult> cVar, String str, int i, boolean z, boolean z2) {
        if (!str.equals("playedWith")) {
            throw new IllegalArgumentException("Invalid player collection: " + str);
        }
        try {
            ((C1210fp) mo7454bQ()).mo7891d(new C1153ak(cVar), str, i, z, z2);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7732a(C0655a.C0659c<Leaderboards.SubmitScoreResult> cVar, String str, long j, String str2) {
        try {
            ((C1210fp) mo7454bQ()).mo7839a((C1207fo) cVar == null ? null : new C1165aw(cVar), str, j, str2);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7733a(C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult> cVar, String str, String str2) {
        try {
            ((C1210fp) mo7454bQ()).mo7892d((C1207fo) new C1173bd(cVar), str, str2);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7734a(C0655a.C0659c<Leaderboards.LoadPlayerScoreResult> cVar, String str, String str2, int i, int i2) {
        try {
            ((C1210fp) mo7454bQ()).mo7842a((C1207fo) new C1151ai(cVar), str, str2, i, i2);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7735a(C0655a.C0659c<Leaderboards.LeaderboardMetadataResult> cVar, String str, boolean z) {
        try {
            ((C1210fp) mo7454bQ()).mo7884c((C1207fo) new C1198t(cVar), str, z);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7736a(C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult> cVar, String str, byte[] bArr, String str2, ParticipantResult[] participantResultArr) {
        try {
            ((C1210fp) mo7454bQ()).mo7848a((C1207fo) new C1177bh(cVar), str, bArr, str2, participantResultArr);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7737a(C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult> cVar, String str, byte[] bArr, ParticipantResult[] participantResultArr) {
        try {
            ((C1210fp) mo7454bQ()).mo7849a((C1207fo) new C1177bh(cVar), str, bArr, participantResultArr);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7738a(C0655a.C0659c<Leaderboards.LeaderboardMetadataResult> cVar, boolean z) {
        try {
            ((C1210fp) mo7454bQ()).mo7877b((C1207fo) new C1198t(cVar), z);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: a */
    public void mo7739a(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult> cVar, int[] iArr) {
        try {
            ((C1210fp) mo7454bQ()).mo7853a((C1207fo) new C1179bj(cVar), iArr);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        String locale = getContext().getResources().getConfiguration().locale.toString();
        Bundle bundle = new Bundle();
        bundle.putBoolean("com.google.android.gms.games.key.isHeadless", this.f2704tW);
        bundle.putBoolean("com.google.android.gms.games.key.showConnectingPopup", this.f2694tA);
        bundle.putInt("com.google.android.gms.games.key.connectingPopupGravity", this.f2695tB);
        bundle.putInt("com.google.android.gms.games.key.sdkVariant", this.f2705tX);
        ecVar.mo7515a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), this.f2693jG, mo7452bO(), this.f2696tO, this.f2700tS.mo7952dn(), locale, bundle);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo7300a(String... strArr) {
        boolean z = false;
        boolean z2 = false;
        for (String str : strArr) {
            if (str.equals(Scopes.GAMES)) {
                z2 = true;
            } else if (str.equals("https://www.googleapis.com/auth/games.firstparty")) {
                z = true;
            }
        }
        if (z) {
            C1102eg.m2612a(!z2, String.format("Cannot have both %s and %s!", new Object[]{Scopes.GAMES, "https://www.googleapis.com/auth/games.firstparty"}));
            return;
        }
        C1102eg.m2612a(z2, String.format("Games APIs requires %s to function.", new Object[]{Scopes.GAMES}));
    }

    /* renamed from: aU */
    public Bundle mo5883aU() {
        try {
            Bundle aU = ((C1210fp) mo7454bQ()).mo7854aU();
            if (aU == null) {
                return aU;
            }
            aU.setClassLoader(C1141fl.class.getClassLoader());
            return aU;
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.games.service.START";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.games.internal.IGamesService";
    }

    /* renamed from: b */
    public void mo7740b(C0655a.C0659c<Status> cVar) {
        try {
            ((C1210fp) mo7454bQ()).mo7823a(new C1163au(cVar));
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: b */
    public void mo7741b(C0655a.C0659c<Achievements.UpdateAchievementResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7840a((C1207fo) cVar == null ? null : new C1182d(cVar), str, this.f2700tS.mo7952dn(), this.f2700tS.mo7951dm());
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: b */
    public void mo7742b(C0655a.C0659c<Achievements.UpdateAchievementResult> cVar, String str, int i) {
        try {
            ((C1210fp) mo7454bQ()).mo7870b((C1207fo) cVar == null ? null : new C1182d(cVar), str, i, this.f2700tS.mo7952dn(), this.f2700tS.mo7951dm());
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: b */
    public void mo7743b(C0655a.C0659c<Leaderboards.LoadScoresResult> cVar, String str, int i, int i2, int i3, boolean z) {
        try {
            ((C1210fp) mo7454bQ()).mo7869b(new C1196r(cVar), str, i, i2, i3, z);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: b */
    public void mo7744b(C0655a.C0659c<Achievements.LoadAchievementsResult> cVar, boolean z) {
        try {
            ((C1210fp) mo7454bQ()).mo7851a((C1207fo) new C1184f(cVar), z);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: c */
    public void mo7745c(C0655a.C0659c<Achievements.UpdateAchievementResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7872b((C1207fo) cVar == null ? null : new C1182d(cVar), str, this.f2700tS.mo7952dn(), this.f2700tS.mo7951dm());
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public void clearNotifications(int notificationTypes) {
        try {
            ((C1210fp) mo7454bQ()).clearNotifications(notificationTypes);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public void connect() {
        m2822dc();
        super.connect();
    }

    public void createRoom(RoomConfig config) {
        try {
            ((C1210fp) mo7454bQ()).mo7830a((C1207fo) new C1159aq(config.getRoomUpdateListener(), config.getRoomStatusUpdateListener(), config.getMessageReceivedListener()), (IBinder) this.f2702tU, config.getVariant(), config.getInvitedPlayerIds(), config.getAutoMatchCriteria(), config.isSocketEnabled(), this.f2703tV);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: d */
    public void mo7748d(C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7940n(new C1171bb(cVar), str);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: dd */
    public int mo7749dd() {
        try {
            return ((C1210fp) mo7454bQ()).mo7894dd();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return 4368;
        }
    }

    /* renamed from: df */
    public void mo7750df() {
        if (isConnected()) {
            try {
                ((C1210fp) mo7454bQ()).mo7895df();
            } catch (RemoteException e) {
                C1206fn.m2981c("GamesClientImpl", "service died");
            }
        }
    }

    public void disconnect() {
        this.f2701tT = false;
        if (isConnected()) {
            try {
                C1210fp fpVar = (C1210fp) mo7454bQ();
                fpVar.mo7895df();
                fpVar.mo7932j(this.f2703tV);
            } catch (RemoteException e) {
                C1206fn.m2981c("GamesClientImpl", "Failed to notify client disconnect.");
            }
        }
        m2823de();
        super.disconnect();
    }

    public void dismissTurnBasedMatch(String matchId) {
        try {
            ((C1210fp) mo7454bQ()).mo7860ak(matchId);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: e */
    public void mo7752e(C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7941o(new C1171bb(cVar), str);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: f */
    public void mo7753f(C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7943q(new C1173bd(cVar), str);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: g */
    public void mo7754g(C0655a.C0659c<GamesMetadata.LoadGamesResult> cVar) {
        try {
            ((C1210fp) mo7454bQ()).mo7888d(new C1188j(cVar));
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: g */
    public void mo7755g(C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7942p(new C1168az(cVar), str);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public Intent getAchievementsIntent() {
        try {
            return ((C1210fp) mo7454bQ()).getAchievementsIntent();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getAllLeaderboardsIntent() {
        try {
            return ((C1210fp) mo7454bQ()).getAllLeaderboardsIntent();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public String getAppId() {
        try {
            return ((C1210fp) mo7454bQ()).getAppId();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public String getCurrentAccountName() {
        try {
            return ((C1210fp) mo7454bQ()).getCurrentAccountName();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Game getCurrentGame() {
        GameBuffer gameBuffer;
        mo7453bP();
        synchronized (this) {
            if (this.f2699tR == null) {
                try {
                    gameBuffer = new GameBuffer(((C1210fp) mo7454bQ()).mo7898di());
                    if (gameBuffer.getCount() > 0) {
                        this.f2699tR = (GameEntity) gameBuffer.get(0).freeze();
                    }
                    gameBuffer.close();
                } catch (RemoteException e) {
                    C1206fn.m2981c("GamesClientImpl", "service died");
                } catch (Throwable th) {
                    gameBuffer.close();
                    throw th;
                }
            }
        }
        return this.f2699tR;
    }

    public Player getCurrentPlayer() {
        PlayerBuffer playerBuffer;
        mo7453bP();
        synchronized (this) {
            if (this.f2698tQ == null) {
                try {
                    playerBuffer = new PlayerBuffer(((C1210fp) mo7454bQ()).mo7896dg());
                    if (playerBuffer.getCount() > 0) {
                        this.f2698tQ = (PlayerEntity) playerBuffer.get(0).freeze();
                    }
                    playerBuffer.close();
                } catch (RemoteException e) {
                    C1206fn.m2981c("GamesClientImpl", "service died");
                } catch (Throwable th) {
                    playerBuffer.close();
                    throw th;
                }
            }
        }
        return this.f2698tQ;
    }

    public String getCurrentPlayerId() {
        try {
            return ((C1210fp) mo7454bQ()).getCurrentPlayerId();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getInvitationInboxIntent() {
        try {
            return ((C1210fp) mo7454bQ()).getInvitationInboxIntent();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getLeaderboardIntent(String leaderboardId) {
        try {
            return ((C1210fp) mo7454bQ()).getLeaderboardIntent(leaderboardId);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getMatchInboxIntent() {
        try {
            return ((C1210fp) mo7454bQ()).getMatchInboxIntent();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public int getMaxTurnBasedMatchDataSize() {
        try {
            return ((C1210fp) mo7454bQ()).getMaxTurnBasedMatchDataSize();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return 2;
        }
    }

    public Intent getPlayerSearchIntent() {
        try {
            return ((C1210fp) mo7454bQ()).getPlayerSearchIntent();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getRealTimeSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        try {
            return ((C1210fp) mo7454bQ()).getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public RealTimeSocket getRealTimeSocketForParticipant(String roomId, String participantId) {
        if (participantId == null || !ParticipantUtils.m1851am(participantId)) {
            throw new IllegalArgumentException("Bad participant ID");
        }
        RealTimeSocket realTimeSocket = this.f2697tP.get(participantId);
        return (realTimeSocket == null || realTimeSocket.isClosed()) ? m2821ae(participantId) : realTimeSocket;
    }

    public Intent getRealTimeWaitingRoomIntent(Room room, int minParticipantsToStart) {
        try {
            return ((C1210fp) mo7454bQ()).mo7819a((RoomEntity) room.freeze(), minParticipantsToStart);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getSettingsIntent() {
        try {
            return ((C1210fp) mo7454bQ()).getSettingsIntent();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getTurnBasedSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        try {
            return ((C1210fp) mo7454bQ()).getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return null;
        }
    }

    /* renamed from: h */
    public void mo7773h(C0655a.C0659c<Invitations.LoadInvitationsResult> cVar) {
        try {
            ((C1210fp) mo7454bQ()).mo7902e((C1207fo) new C1193o(cVar));
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: h */
    public void mo7774h(C0655a.C0659c<TurnBasedMultiplayer.LoadMatchResult> cVar, String str) {
        try {
            ((C1210fp) mo7454bQ()).mo7944r(new C1175bf(cVar), str);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: i */
    public void mo7775i(String str, int i) {
        try {
            ((C1210fp) mo7454bQ()).mo7930i(str, i);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    /* renamed from: j */
    public void mo7776j(String str, int i) {
        try {
            ((C1210fp) mo7454bQ()).mo7933j(str, i);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public void joinRoom(RoomConfig config) {
        try {
            ((C1210fp) mo7454bQ()).mo7831a((C1207fo) new C1159aq(config.getRoomUpdateListener(), config.getRoomStatusUpdateListener(), config.getMessageReceivedListener()), (IBinder) this.f2702tU, config.getInvitationId(), config.isSocketEnabled(), this.f2703tV);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public void leaveRoom(RoomUpdateListener listener, String roomId) {
        try {
            ((C1210fp) mo7454bQ()).mo7904e((C1207fo) new C1159aq(listener), roomId);
            m2823de();
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public void onConnected(Bundle connectionHint) {
        if (this.f2701tT) {
            this.f2700tS.mo7950dl();
            this.f2701tT = false;
        }
    }

    public void onConnectionFailed(ConnectionResult result) {
        this.f2701tT = false;
    }

    public void onConnectionSuspended(int cause) {
    }

    public void registerInvitationListener(OnInvitationReceivedListener listener) {
        try {
            ((C1210fp) mo7454bQ()).mo7827a((C1207fo) new C1190l(listener), this.f2703tV);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public void registerMatchUpdateListener(OnTurnBasedMatchUpdateReceivedListener listener) {
        try {
            ((C1210fp) mo7454bQ()).mo7866b((C1207fo) new C1202x(listener), this.f2703tV);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public int sendUnreliableRealTimeMessageToAll(byte[] messageData, String roomId) {
        try {
            return ((C1210fp) mo7454bQ()).mo7862b(messageData, roomId, (String[]) null);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
            return -1;
        }
    }

    public void setGravityForPopups(int gravity) {
        this.f2700tS.setGravity(gravity);
    }

    public void setViewForPopups(View gamesContentView) {
        this.f2700tS.mo7953e(gamesContentView);
    }

    public void unregisterInvitationListener() {
        try {
            ((C1210fp) mo7454bQ()).mo7934k(this.f2703tV);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }

    public void unregisterMatchUpdateListener() {
        try {
            ((C1210fp) mo7454bQ()).mo7937l(this.f2703tV);
        } catch (RemoteException e) {
            C1206fn.m2981c("GamesClientImpl", "service died");
        }
    }
}
