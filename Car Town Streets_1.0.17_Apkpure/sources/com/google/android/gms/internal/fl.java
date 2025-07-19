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
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
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
import com.google.android.gms.internal.dw;
import com.google.android.gms.internal.fp;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public final class fl extends dw<fp> implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
    private final String jG;
    private boolean tA;
    private int tB;
    private final String tO;
    private final Map<String, RealTimeSocket> tP;
    private PlayerEntity tQ;
    private GameEntity tR;
    private final fq tS;
    private boolean tT;
    private final Binder tU;
    private final long tV;
    private final boolean tW;
    private final int tX;

    /* loaded from: classes.dex */
    abstract class a extends c {
        private final ArrayList<String> tY = new ArrayList<>();

        a(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder);
            for (String str : strArr) {
                this.tY.add(str);
            }
        }

        @Override // com.google.android.gms.internal.fl.c
        protected void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            a(roomStatusUpdateListener, room, this.tY);
        }

        protected abstract void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList);
    }

    /* loaded from: classes.dex */
    final class aa extends dw<fp>.b<RoomStatusUpdateListener> {
        private final String up;

        aa(RoomStatusUpdateListener roomStatusUpdateListener, String str) {
            super(roomStatusUpdateListener);
            this.up = str;
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(RoomStatusUpdateListener roomStatusUpdateListener) {
            if (roomStatusUpdateListener != null) {
                roomStatusUpdateListener.onP2PConnected(this.up);
            }
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class ab extends dw<fp>.b<RoomStatusUpdateListener> {
        private final String up;

        ab(RoomStatusUpdateListener roomStatusUpdateListener, String str) {
            super(roomStatusUpdateListener);
            this.up = str;
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(RoomStatusUpdateListener roomStatusUpdateListener) {
            if (roomStatusUpdateListener != null) {
                roomStatusUpdateListener.onP2PDisconnected(this.up);
            }
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class ac extends a {
        ac(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        @Override // com.google.android.gms.internal.fl.a
        protected void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeersConnected(room, arrayList);
        }
    }

    /* loaded from: classes.dex */
    final class ad extends a {
        ad(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        @Override // com.google.android.gms.internal.fl.a
        protected void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerDeclined(room, arrayList);
        }
    }

    /* loaded from: classes.dex */
    final class ae extends a {
        ae(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        @Override // com.google.android.gms.internal.fl.a
        protected void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeersDisconnected(room, arrayList);
        }
    }

    /* loaded from: classes.dex */
    final class af extends a {
        af(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        @Override // com.google.android.gms.internal.fl.a
        protected void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerInvitedToRoom(room, arrayList);
        }
    }

    /* loaded from: classes.dex */
    final class ag extends a {
        ag(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        @Override // com.google.android.gms.internal.fl.a
        protected void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerJoined(room, arrayList);
        }
    }

    /* loaded from: classes.dex */
    final class ah extends a {
        ah(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder, String[] strArr) {
            super(roomStatusUpdateListener, dataHolder, strArr);
        }

        @Override // com.google.android.gms.internal.fl.a
        protected void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room, ArrayList<String> arrayList) {
            roomStatusUpdateListener.onPeerLeft(room, arrayList);
        }
    }

    /* loaded from: classes.dex */
    final class ai extends fk {
        private final a.c<Leaderboards.LoadPlayerScoreResult> jW;

        ai(a.c<Leaderboards.LoadPlayerScoreResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void D(DataHolder dataHolder) {
            fl.this.a(new aj(this.jW, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class aj extends dw<fp>.d<a.c<Leaderboards.LoadPlayerScoreResult>> implements Leaderboards.LoadPlayerScoreResult {
        private final Status jY;
        private final com.google.android.gms.games.leaderboard.d uq;

        aj(a.c<Leaderboards.LoadPlayerScoreResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.jY = new Status(dataHolder.getStatusCode());
            LeaderboardScoreBuffer leaderboardScoreBuffer = new LeaderboardScoreBuffer(dataHolder);
            try {
                if (leaderboardScoreBuffer.getCount() > 0) {
                    this.uq = (com.google.android.gms.games.leaderboard.d) leaderboardScoreBuffer.mo391get(0).freeze();
                } else {
                    this.uq = null;
                }
            } finally {
                leaderboardScoreBuffer.close();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<Leaderboards.LoadPlayerScoreResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.leaderboard.Leaderboards.LoadPlayerScoreResult
        public LeaderboardScore getScore() {
            return this.uq;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* loaded from: classes.dex */
    final class ak extends fk {
        private final a.c<Players.LoadPlayersResult> jW;

        ak(a.c<Players.LoadPlayersResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void e(DataHolder dataHolder) {
            fl.this.a(new al(this.jW, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class al extends ao<a.c<Players.LoadPlayersResult>> implements Players.LoadPlayersResult {
        private final PlayerBuffer ur;

        al(a.c<Players.LoadPlayersResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.ur = new PlayerBuffer(dataHolder);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<Players.LoadPlayersResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.Players.LoadPlayersResult
        public PlayerBuffer getPlayers() {
            return this.ur;
        }
    }

    /* loaded from: classes.dex */
    final class am extends dw<fp>.b<RealTimeMultiplayer.ReliableMessageSentCallback> {
        private final int mC;
        private final String us;
        private final int ut;

        am(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback, int i, int i2, String str) {
            super(reliableMessageSentCallback);
            this.mC = i;
            this.ut = i2;
            this.us = str;
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback) {
            if (reliableMessageSentCallback != null) {
                reliableMessageSentCallback.onRealTimeMessageSent(this.mC, this.ut, this.us);
            }
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class an extends fk {
        final RealTimeMultiplayer.ReliableMessageSentCallback uu;

        public an(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback) {
            this.uu = reliableMessageSentCallback;
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void b(int i, int i2, String str) {
            fl.this.a(new am(this.uu, i, i2, str));
        }
    }

    /* loaded from: classes.dex */
    abstract class ao<R extends a.c<?>> extends dw<fp>.d<R> implements Releasable, Result {
        final Status jY;
        final DataHolder nE;

        public ao(R r, DataHolder dataHolder) {
            super(r, dataHolder);
            this.jY = new Status(dataHolder.getStatusCode());
            this.nE = dataHolder;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }

        @Override // com.google.android.gms.common.api.Releasable
        public void release() {
            if (this.nE != null) {
                this.nE.close();
            }
        }
    }

    /* loaded from: classes.dex */
    final class ap extends c {
        ap(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.c
        public void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onRoomAutoMatching(room);
        }
    }

    /* loaded from: classes.dex */
    final class aq extends fk {
        private final RoomUpdateListener uv;
        private final RoomStatusUpdateListener uw;
        private final RealTimeMessageReceivedListener ux;

        public aq(RoomUpdateListener roomUpdateListener) {
            this.uv = (RoomUpdateListener) eg.b(roomUpdateListener, "Callbacks must not be null");
            this.uw = null;
            this.ux = null;
        }

        public aq(RoomUpdateListener roomUpdateListener, RoomStatusUpdateListener roomStatusUpdateListener, RealTimeMessageReceivedListener realTimeMessageReceivedListener) {
            this.uv = (RoomUpdateListener) eg.b(roomUpdateListener, "Callbacks must not be null");
            this.uw = roomStatusUpdateListener;
            this.ux = realTimeMessageReceivedListener;
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void a(DataHolder dataHolder, String[] strArr) {
            fl.this.a(new af(this.uw, dataHolder, strArr));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void b(DataHolder dataHolder, String[] strArr) {
            fl.this.a(new ag(this.uw, dataHolder, strArr));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void c(DataHolder dataHolder, String[] strArr) {
            fl.this.a(new ah(this.uw, dataHolder, strArr));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void d(DataHolder dataHolder, String[] strArr) {
            fl.this.a(new ad(this.uw, dataHolder, strArr));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void e(DataHolder dataHolder, String[] strArr) {
            fl.this.a(new ac(this.uw, dataHolder, strArr));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void f(DataHolder dataHolder, String[] strArr) {
            fl.this.a(new ae(this.uw, dataHolder, strArr));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onLeftRoom(int statusCode, String externalRoomId) {
            fl.this.a(new v(this.uv, statusCode, externalRoomId));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onP2PConnected(String participantId) {
            fl.this.a(new aa(this.uw, participantId));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onP2PDisconnected(String participantId) {
            fl.this.a(new ab(this.uw, participantId));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onRealTimeMessageReceived(RealTimeMessage message) {
            fl.this.a(new z(this.ux, message));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void t(DataHolder dataHolder) {
            fl.this.a(new at(this.uv, dataHolder));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void u(DataHolder dataHolder) {
            fl.this.a(new q(this.uv, dataHolder));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void v(DataHolder dataHolder) {
            fl.this.a(new as(this.uw, dataHolder));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void w(DataHolder dataHolder) {
            fl.this.a(new ap(this.uw, dataHolder));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void x(DataHolder dataHolder) {
            fl.this.a(new ar(this.uv, dataHolder));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void y(DataHolder dataHolder) {
            fl.this.a(new h(this.uw, dataHolder));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void z(DataHolder dataHolder) {
            fl.this.a(new i(this.uw, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class ar extends b {
        ar(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.b
        public void a(RoomUpdateListener roomUpdateListener, Room room, int i) {
            roomUpdateListener.onRoomConnected(i, room);
        }
    }

    /* loaded from: classes.dex */
    final class as extends c {
        as(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.c
        public void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onRoomConnecting(room);
        }
    }

    /* loaded from: classes.dex */
    final class at extends b {
        public at(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.b
        public void a(RoomUpdateListener roomUpdateListener, Room room, int i) {
            roomUpdateListener.onRoomCreated(i, room);
        }
    }

    /* loaded from: classes.dex */
    final class au extends fk {
        private final a.c<Status> jW;

        public au(a.c<Status> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onSignOutComplete() {
            fl.this.a(new av(this.jW, new Status(0)));
        }
    }

    /* loaded from: classes.dex */
    final class av extends dw<fp>.b<a.c<Status>> {
        private final Status jY;

        public av(a.c<Status> cVar, Status status) {
            super(cVar);
            this.jY = status;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<Status> cVar) {
            cVar.a(this.jY);
        }
    }

    /* loaded from: classes.dex */
    final class aw extends fk {
        private final a.c<Leaderboards.SubmitScoreResult> jW;

        public aw(a.c<Leaderboards.SubmitScoreResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void d(DataHolder dataHolder) {
            fl.this.a(new ax(this.jW, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class ax extends ao<a.c<Leaderboards.SubmitScoreResult>> implements Leaderboards.SubmitScoreResult {
        private final ScoreSubmissionData uy;

        public ax(a.c<Leaderboards.SubmitScoreResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.uy = new ScoreSubmissionData(dataHolder);
        }

        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<Leaderboards.SubmitScoreResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.leaderboard.Leaderboards.SubmitScoreResult
        public ScoreSubmissionData getScoreData() {
            return this.uy;
        }
    }

    /* loaded from: classes.dex */
    abstract class ay<T extends a.c<?>> extends ao<T> {
        final TurnBasedMatch un;

        ay(T t, DataHolder dataHolder) {
            super(t, dataHolder);
            TurnBasedMatchBuffer turnBasedMatchBuffer = new TurnBasedMatchBuffer(dataHolder);
            try {
                if (turnBasedMatchBuffer.getCount() > 0) {
                    this.un = turnBasedMatchBuffer.get(0).freeze();
                } else {
                    this.un = null;
                }
            } finally {
                turnBasedMatchBuffer.close();
            }
        }

        protected void a(T t, DataHolder dataHolder) {
            i(t);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.gms.internal.dw.d
        protected /* bridge */ /* synthetic */ void a(Object obj, DataHolder dataHolder) {
            a((ay<T>) ((a.c) obj), dataHolder);
        }

        public TurnBasedMatch getMatch() {
            return this.un;
        }

        abstract void i(T t);
    }

    /* loaded from: classes.dex */
    final class az extends fk {
        private final a.c<TurnBasedMultiplayer.CancelMatchResult> uz;

        public az(a.c<TurnBasedMultiplayer.CancelMatchResult> cVar) {
            this.uz = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onTurnBasedMatchCanceled(int statusCode, String matchId) {
            fl.this.a(new ba(this.uz, new Status(statusCode), matchId));
        }
    }

    /* loaded from: classes.dex */
    abstract class b extends dw<fp>.d<RoomUpdateListener> {
        b(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            a(roomUpdateListener, fl.this.E(dataHolder), dataHolder.getStatusCode());
        }

        protected abstract void a(RoomUpdateListener roomUpdateListener, Room room, int i);
    }

    /* loaded from: classes.dex */
    final class ba extends dw<fp>.b<a.c<TurnBasedMultiplayer.CancelMatchResult>> implements TurnBasedMultiplayer.CancelMatchResult {
        private final Status jY;
        private final String uA;

        ba(a.c<TurnBasedMultiplayer.CancelMatchResult> cVar, Status status, String str) {
            super(cVar);
            this.jY = status;
            this.uA = str;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<TurnBasedMultiplayer.CancelMatchResult> cVar) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.CancelMatchResult
        public String getMatchId() {
            return this.uA;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* loaded from: classes.dex */
    final class bb extends fk {
        private final a.c<TurnBasedMultiplayer.InitiateMatchResult> uB;

        public bb(a.c<TurnBasedMultiplayer.InitiateMatchResult> cVar) {
            this.uB = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void n(DataHolder dataHolder) {
            fl.this.a(new bc(this.uB, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class bc extends ay<a.c<TurnBasedMultiplayer.InitiateMatchResult>> implements TurnBasedMultiplayer.InitiateMatchResult {
        bc(a.c<TurnBasedMultiplayer.InitiateMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.ay
        protected void i(a.c<TurnBasedMultiplayer.InitiateMatchResult> cVar) {
            cVar.a(this);
        }
    }

    /* loaded from: classes.dex */
    final class bd extends fk {
        private final a.c<TurnBasedMultiplayer.LeaveMatchResult> uC;

        public bd(a.c<TurnBasedMultiplayer.LeaveMatchResult> cVar) {
            this.uC = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void p(DataHolder dataHolder) {
            fl.this.a(new be(this.uC, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class be extends ay<a.c<TurnBasedMultiplayer.LeaveMatchResult>> implements TurnBasedMultiplayer.LeaveMatchResult {
        be(a.c<TurnBasedMultiplayer.LeaveMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.ay
        protected void i(a.c<TurnBasedMultiplayer.LeaveMatchResult> cVar) {
            cVar.a(this);
        }
    }

    /* loaded from: classes.dex */
    final class bf extends fk {
        private final a.c<TurnBasedMultiplayer.LoadMatchResult> uD;

        public bf(a.c<TurnBasedMultiplayer.LoadMatchResult> cVar) {
            this.uD = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void m(DataHolder dataHolder) {
            fl.this.a(new bg(this.uD, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class bg extends ay<a.c<TurnBasedMultiplayer.LoadMatchResult>> implements TurnBasedMultiplayer.LoadMatchResult {
        bg(a.c<TurnBasedMultiplayer.LoadMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.ay
        protected void i(a.c<TurnBasedMultiplayer.LoadMatchResult> cVar) {
            cVar.a(this);
        }
    }

    /* loaded from: classes.dex */
    final class bh extends fk {
        private final a.c<TurnBasedMultiplayer.UpdateMatchResult> uE;

        public bh(a.c<TurnBasedMultiplayer.UpdateMatchResult> cVar) {
            this.uE = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void o(DataHolder dataHolder) {
            fl.this.a(new bi(this.uE, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class bi extends ay<a.c<TurnBasedMultiplayer.UpdateMatchResult>> implements TurnBasedMultiplayer.UpdateMatchResult {
        bi(a.c<TurnBasedMultiplayer.UpdateMatchResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.ay
        protected void i(a.c<TurnBasedMultiplayer.UpdateMatchResult> cVar) {
            cVar.a(this);
        }
    }

    /* loaded from: classes.dex */
    final class bj extends fk {
        private final a.c<TurnBasedMultiplayer.LoadMatchesResult> uF;

        public bj(a.c<TurnBasedMultiplayer.LoadMatchesResult> cVar) {
            this.uF = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void a(int i, Bundle bundle) {
            bundle.setClassLoader(getClass().getClassLoader());
            fl.this.a(new bk(this.uF, new Status(i), bundle));
        }
    }

    /* loaded from: classes.dex */
    final class bk extends dw<fp>.b<a.c<TurnBasedMultiplayer.LoadMatchesResult>> implements TurnBasedMultiplayer.LoadMatchesResult {
        private final Status jY;
        private final LoadMatchesResponse uG;

        bk(a.c<TurnBasedMultiplayer.LoadMatchesResult> cVar, Status status, Bundle bundle) {
            super(cVar);
            this.jY = status;
            this.uG = new LoadMatchesResponse(bundle);
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<TurnBasedMultiplayer.LoadMatchesResult> cVar) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.LoadMatchesResult
        public LoadMatchesResponse getMatches() {
            return this.uG;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }

        @Override // com.google.android.gms.common.api.Releasable
        public void release() {
            this.uG.close();
        }
    }

    /* loaded from: classes.dex */
    abstract class c extends dw<fp>.d<RoomStatusUpdateListener> {
        c(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            a(roomStatusUpdateListener, fl.this.E(dataHolder));
        }

        protected abstract void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room);
    }

    /* loaded from: classes.dex */
    final class d extends fk {
        private final a.c<Achievements.UpdateAchievementResult> jW;

        d(a.c<Achievements.UpdateAchievementResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onAchievementUpdated(int statusCode, String achievementId) {
            fl.this.a(new e(this.jW, statusCode, achievementId));
        }
    }

    /* loaded from: classes.dex */
    final class e extends dw<fp>.b<a.c<Achievements.UpdateAchievementResult>> implements Achievements.UpdateAchievementResult {
        private final Status jY;
        private final String ua;

        e(a.c<Achievements.UpdateAchievementResult> cVar, int i, String str) {
            super(cVar);
            this.jY = new Status(i);
            this.ua = str;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<Achievements.UpdateAchievementResult> cVar) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.achievement.Achievements.UpdateAchievementResult
        public String getAchievementId() {
            return this.ua;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* loaded from: classes.dex */
    final class f extends fk {
        private final a.c<Achievements.LoadAchievementsResult> jW;

        f(a.c<Achievements.LoadAchievementsResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void b(DataHolder dataHolder) {
            fl.this.a(new g(this.jW, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class g extends ao<a.c<Achievements.LoadAchievementsResult>> implements Achievements.LoadAchievementsResult {
        private final AchievementBuffer ub;

        g(a.c<Achievements.LoadAchievementsResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.ub = new AchievementBuffer(dataHolder);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<Achievements.LoadAchievementsResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.achievement.Achievements.LoadAchievementsResult
        public AchievementBuffer getAchievements() {
            return this.ub;
        }
    }

    /* loaded from: classes.dex */
    final class h extends c {
        h(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.c
        public void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onConnectedToRoom(room);
        }
    }

    /* loaded from: classes.dex */
    final class i extends c {
        i(RoomStatusUpdateListener roomStatusUpdateListener, DataHolder dataHolder) {
            super(roomStatusUpdateListener, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.c
        public void a(RoomStatusUpdateListener roomStatusUpdateListener, Room room) {
            roomStatusUpdateListener.onDisconnectedFromRoom(room);
        }
    }

    /* loaded from: classes.dex */
    final class j extends fk {
        private final a.c<GamesMetadata.LoadGamesResult> jW;

        j(a.c<GamesMetadata.LoadGamesResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void g(DataHolder dataHolder) {
            fl.this.a(new k(this.jW, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class k extends ao<a.c<GamesMetadata.LoadGamesResult>> implements GamesMetadata.LoadGamesResult {
        private final GameBuffer uc;

        k(a.c<GamesMetadata.LoadGamesResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.uc = new GameBuffer(dataHolder);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<GamesMetadata.LoadGamesResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.GamesMetadata.LoadGamesResult
        public GameBuffer getGames() {
            return this.uc;
        }
    }

    /* loaded from: classes.dex */
    final class l extends fk {
        private final OnInvitationReceivedListener ud;

        l(OnInvitationReceivedListener onInvitationReceivedListener) {
            this.ud = onInvitationReceivedListener;
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void l(DataHolder dataHolder) {
            InvitationBuffer invitationBuffer = new InvitationBuffer(dataHolder);
            Invitation invitation = null;
            try {
                if (invitationBuffer.getCount() > 0) {
                    invitation = invitationBuffer.get(0).freeze();
                }
                if (invitation == null) {
                    return;
                }
                fl.this.a(new m(this.ud, invitation));
            } finally {
                invitationBuffer.close();
            }
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onInvitationRemoved(String invitationId) {
            fl.this.a(new n(this.ud, invitationId));
        }
    }

    /* loaded from: classes.dex */
    final class m extends dw<fp>.b<OnInvitationReceivedListener> {
        private final Invitation ue;

        m(OnInvitationReceivedListener onInvitationReceivedListener, Invitation invitation) {
            super(onInvitationReceivedListener);
            this.ue = invitation;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(OnInvitationReceivedListener onInvitationReceivedListener) {
            onInvitationReceivedListener.onInvitationReceived(this.ue);
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class n extends dw<fp>.b<OnInvitationReceivedListener> {
        private final String uf;

        n(OnInvitationReceivedListener onInvitationReceivedListener, String str) {
            super(onInvitationReceivedListener);
            this.uf = str;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(OnInvitationReceivedListener onInvitationReceivedListener) {
            onInvitationReceivedListener.onInvitationRemoved(this.uf);
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class o extends fk {
        private final a.c<Invitations.LoadInvitationsResult> jW;

        o(a.c<Invitations.LoadInvitationsResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void k(DataHolder dataHolder) {
            fl.this.a(new p(this.jW, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class p extends ao<a.c<Invitations.LoadInvitationsResult>> implements Invitations.LoadInvitationsResult {
        private final InvitationBuffer ug;

        p(a.c<Invitations.LoadInvitationsResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.ug = new InvitationBuffer(dataHolder);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<Invitations.LoadInvitationsResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.multiplayer.Invitations.LoadInvitationsResult
        public InvitationBuffer getInvitations() {
            return this.ug;
        }
    }

    /* loaded from: classes.dex */
    final class q extends b {
        public q(RoomUpdateListener roomUpdateListener, DataHolder dataHolder) {
            super(roomUpdateListener, dataHolder);
        }

        @Override // com.google.android.gms.internal.fl.b
        public void a(RoomUpdateListener roomUpdateListener, Room room, int i) {
            roomUpdateListener.onJoinedRoom(i, room);
        }
    }

    /* loaded from: classes.dex */
    final class r extends fk {
        private final a.c<Leaderboards.LoadScoresResult> jW;

        r(a.c<Leaderboards.LoadScoresResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void a(DataHolder dataHolder, DataHolder dataHolder2) {
            fl.this.a(new s(this.jW, dataHolder, dataHolder2));
        }
    }

    /* loaded from: classes.dex */
    final class s extends ao<a.c<Leaderboards.LoadScoresResult>> implements Leaderboards.LoadScoresResult {
        private final com.google.android.gms.games.leaderboard.a uh;
        private final LeaderboardScoreBuffer ui;

        s(a.c<Leaderboards.LoadScoresResult> cVar, DataHolder dataHolder, DataHolder dataHolder2) {
            super(cVar, dataHolder2);
            LeaderboardBuffer leaderboardBuffer = new LeaderboardBuffer(dataHolder);
            try {
                if (leaderboardBuffer.getCount() > 0) {
                    this.uh = (com.google.android.gms.games.leaderboard.a) leaderboardBuffer.get(0).freeze();
                } else {
                    this.uh = null;
                }
                leaderboardBuffer.close();
                this.ui = new LeaderboardScoreBuffer(dataHolder2);
            } catch (Throwable th) {
                leaderboardBuffer.close();
                throw th;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<Leaderboards.LoadScoresResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.leaderboard.Leaderboards.LoadScoresResult
        public Leaderboard getLeaderboard() {
            return this.uh;
        }

        @Override // com.google.android.gms.games.leaderboard.Leaderboards.LoadScoresResult
        public LeaderboardScoreBuffer getScores() {
            return this.ui;
        }
    }

    /* loaded from: classes.dex */
    final class t extends fk {
        private final a.c<Leaderboards.LeaderboardMetadataResult> jW;

        t(a.c<Leaderboards.LeaderboardMetadataResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void c(DataHolder dataHolder) {
            fl.this.a(new u(this.jW, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class u extends ao<a.c<Leaderboards.LeaderboardMetadataResult>> implements Leaderboards.LeaderboardMetadataResult {
        private final LeaderboardBuffer uj;

        u(a.c<Leaderboards.LeaderboardMetadataResult> cVar, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.uj = new LeaderboardBuffer(dataHolder);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<Leaderboards.LeaderboardMetadataResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.games.leaderboard.Leaderboards.LeaderboardMetadataResult
        public LeaderboardBuffer getLeaderboards() {
            return this.uj;
        }
    }

    /* loaded from: classes.dex */
    final class v extends dw<fp>.b<RoomUpdateListener> {
        private final int mC;
        private final String uk;

        v(RoomUpdateListener roomUpdateListener, int i, String str) {
            super(roomUpdateListener);
            this.mC = i;
            this.uk = str;
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(RoomUpdateListener roomUpdateListener) {
            roomUpdateListener.onLeftRoom(this.mC, this.uk);
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class w extends dw<fp>.b<OnTurnBasedMatchUpdateReceivedListener> {
        private final String ul;

        w(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener, String str) {
            super(onTurnBasedMatchUpdateReceivedListener);
            this.ul = str;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener) {
            onTurnBasedMatchUpdateReceivedListener.onTurnBasedMatchRemoved(this.ul);
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class x extends fk {
        private final OnTurnBasedMatchUpdateReceivedListener um;

        x(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener) {
            this.um = onTurnBasedMatchUpdateReceivedListener;
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void onTurnBasedMatchRemoved(String matchId) {
            fl.this.a(new w(this.um, matchId));
        }

        @Override // com.google.android.gms.internal.fk, com.google.android.gms.internal.fo
        public void q(DataHolder dataHolder) {
            TurnBasedMatchBuffer turnBasedMatchBuffer = new TurnBasedMatchBuffer(dataHolder);
            TurnBasedMatch turnBasedMatch = null;
            try {
                if (turnBasedMatchBuffer.getCount() > 0) {
                    turnBasedMatch = turnBasedMatchBuffer.get(0).freeze();
                }
                if (turnBasedMatch == null) {
                    return;
                }
                fl.this.a(new y(this.um, turnBasedMatch));
            } finally {
                turnBasedMatchBuffer.close();
            }
        }
    }

    /* loaded from: classes.dex */
    final class y extends dw<fp>.b<OnTurnBasedMatchUpdateReceivedListener> {
        private final TurnBasedMatch un;

        y(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener, TurnBasedMatch turnBasedMatch) {
            super(onTurnBasedMatchUpdateReceivedListener);
            this.un = turnBasedMatch;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(OnTurnBasedMatchUpdateReceivedListener onTurnBasedMatchUpdateReceivedListener) {
            onTurnBasedMatchUpdateReceivedListener.onTurnBasedMatchReceived(this.un);
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* loaded from: classes.dex */
    final class z extends dw<fp>.b<RealTimeMessageReceivedListener> {
        private final RealTimeMessage uo;

        z(RealTimeMessageReceivedListener realTimeMessageReceivedListener, RealTimeMessage realTimeMessage) {
            super(realTimeMessageReceivedListener);
            this.uo = realTimeMessage;
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(RealTimeMessageReceivedListener realTimeMessageReceivedListener) {
            if (realTimeMessageReceivedListener != null) {
                realTimeMessageReceivedListener.onRealTimeMessageReceived(this.uo);
            }
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    @Deprecated
    public fl(Context context, String str, String str2, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String[] strArr, int i2, View view, boolean z2, boolean z3, int i3) {
        this(context, str, str2, new dw.c(connectionCallbacks), new dw.g(onConnectionFailedListener), strArr, i2, view, z2, z3, i3, 4368);
    }

    public fl(Context context, String str, String str2, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String[] strArr, int i2, View view, boolean z2, boolean z3, int i3, int i4) {
        super(context, connectionCallbacks, onConnectionFailedListener, strArr);
        this.tT = false;
        this.tA = false;
        this.tO = str;
        this.jG = (String) eg.f(str2);
        this.tU = new Binder();
        this.tP = new HashMap();
        this.tS = fq.a(this, i2);
        setViewForPopups(view);
        this.tA = z3;
        this.tB = i3;
        this.tV = hashCode();
        this.tW = z2;
        this.tX = i4;
        registerConnectionCallbacks(this);
        registerConnectionFailedListener((GoogleApiClient.OnConnectionFailedListener) this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Room E(DataHolder dataHolder) {
        com.google.android.gms.games.multiplayer.realtime.a aVar = new com.google.android.gms.games.multiplayer.realtime.a(dataHolder);
        Room room = null;
        try {
            if (aVar.getCount() > 0) {
                room = aVar.get(0).freeze();
            }
            return room;
        } finally {
            aVar.close();
        }
    }

    private RealTimeSocket ae(String str) {
        fr frVar;
        try {
            String ag2 = bQ().ag(str);
            if (ag2 == null) {
                frVar = null;
            } else {
                LocalSocket localSocket = new LocalSocket();
                try {
                    localSocket.connect(new LocalSocketAddress(ag2));
                    frVar = new fr(localSocket, str);
                    this.tP.put(str, frVar);
                } catch (IOException e2) {
                    fn.d("GamesClientImpl", "connect() call failed on socket: " + e2.getMessage());
                    frVar = null;
                }
            }
            return frVar;
        } catch (RemoteException e3) {
            fn.d("GamesClientImpl", "Unable to create socket. Service died.");
            return null;
        }
    }

    private void dc() {
        this.tQ = null;
    }

    private void de() {
        for (RealTimeSocket realTimeSocket : this.tP.values()) {
            try {
                realTimeSocket.close();
            } catch (IOException e2) {
                fn.a("GamesClientImpl", "IOException:", e2);
            }
        }
        this.tP.clear();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.dw
    /* renamed from: F */
    public fp p(IBinder iBinder) {
        return fp.a.H(iBinder);
    }

    public int a(RealTimeMultiplayer.ReliableMessageSentCallback reliableMessageSentCallback, byte[] bArr, String str, String str2) {
        try {
            return bQ().a(new an(reliableMessageSentCallback), bArr, str, str2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return -1;
        }
    }

    public int a(byte[] bArr, String str, String[] strArr) {
        eg.b(strArr, "Participant IDs must not be null");
        try {
            return bQ().b(bArr, str, strArr);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return -1;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.dw
    public void a(int i2, IBinder iBinder, Bundle bundle) {
        if (i2 == 0 && bundle != null) {
            this.tT = bundle.getBoolean("show_welcome_popup");
        }
        super.a(i2, iBinder, bundle);
    }

    public void a(IBinder iBinder, Bundle bundle) {
        if (isConnected()) {
            try {
                bQ().a(iBinder, bundle);
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "service died");
            }
        }
    }

    public void a(a.c<Players.LoadPlayersResult> cVar, int i2, boolean z2, boolean z3) {
        try {
            bQ().a(new ak(cVar), i2, z2, z3);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Leaderboards.LoadScoresResult> cVar, LeaderboardScoreBuffer leaderboardScoreBuffer, int i2, int i3) {
        try {
            bQ().a(new r(cVar), leaderboardScoreBuffer.dq().dr(), i2, i3);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<TurnBasedMultiplayer.InitiateMatchResult> cVar, TurnBasedMatchConfig turnBasedMatchConfig) {
        try {
            bQ().a(new bb(cVar), turnBasedMatchConfig.getVariant(), turnBasedMatchConfig.getMinPlayers(), turnBasedMatchConfig.getInvitedPlayerIds(), turnBasedMatchConfig.getAutoMatchCriteria());
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Players.LoadPlayersResult> cVar, String str) {
        try {
            bQ().c(new ak(cVar), str);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Achievements.UpdateAchievementResult> cVar, String str, int i2) {
        d dVar;
        if (cVar == null) {
            dVar = null;
        } else {
            try {
                dVar = new d(cVar);
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "service died");
                return;
            }
        }
        bQ().a(dVar, str, i2, this.tS.dn(), this.tS.dm());
    }

    public void a(a.c<Leaderboards.LoadScoresResult> cVar, String str, int i2, int i3, int i4, boolean z2) {
        try {
            bQ().a(new r(cVar), str, i2, i3, i4, z2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Players.LoadPlayersResult> cVar, String str, int i2, boolean z2, boolean z3) {
        if (!str.equals("playedWith")) {
            throw new IllegalArgumentException("Invalid player collection: " + str);
        }
        try {
            bQ().d(new ak(cVar), str, i2, z2, z3);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Leaderboards.SubmitScoreResult> cVar, String str, long j2, String str2) {
        aw awVar;
        if (cVar == null) {
            awVar = null;
        } else {
            try {
                awVar = new aw(cVar);
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "service died");
                return;
            }
        }
        bQ().a(awVar, str, j2, str2);
    }

    public void a(a.c<TurnBasedMultiplayer.LeaveMatchResult> cVar, String str, String str2) {
        try {
            bQ().d(new bd(cVar), str, str2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Leaderboards.LoadPlayerScoreResult> cVar, String str, String str2, int i2, int i3) {
        try {
            bQ().a(new ai(cVar), str, str2, i2, i3);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Leaderboards.LeaderboardMetadataResult> cVar, String str, boolean z2) {
        try {
            bQ().c(new t(cVar), str, z2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<TurnBasedMultiplayer.UpdateMatchResult> cVar, String str, byte[] bArr, String str2, ParticipantResult[] participantResultArr) {
        try {
            bQ().a(new bh(cVar), str, bArr, str2, participantResultArr);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<TurnBasedMultiplayer.UpdateMatchResult> cVar, String str, byte[] bArr, ParticipantResult[] participantResultArr) {
        try {
            bQ().a(new bh(cVar), str, bArr, participantResultArr);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<Leaderboards.LeaderboardMetadataResult> cVar, boolean z2) {
        try {
            bQ().b(new t(cVar), z2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void a(a.c<TurnBasedMultiplayer.LoadMatchesResult> cVar, int[] iArr) {
        try {
            bQ().a(new bj(cVar), iArr);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    @Override // com.google.android.gms.internal.dw
    protected void a(ec ecVar, dw.e eVar) throws RemoteException {
        String locale = getContext().getResources().getConfiguration().locale.toString();
        Bundle bundle = new Bundle();
        bundle.putBoolean("com.google.android.gms.games.key.isHeadless", this.tW);
        bundle.putBoolean("com.google.android.gms.games.key.showConnectingPopup", this.tA);
        bundle.putInt("com.google.android.gms.games.key.connectingPopupGravity", this.tB);
        bundle.putInt("com.google.android.gms.games.key.sdkVariant", this.tX);
        ecVar.a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), this.jG, bO(), this.tO, this.tS.dn(), locale, bundle);
    }

    @Override // com.google.android.gms.internal.dw
    protected void a(String... strArr) {
        boolean z2 = false;
        boolean z3 = false;
        for (String str : strArr) {
            if (str.equals(Scopes.GAMES)) {
                z3 = true;
            } else if (str.equals("https://www.googleapis.com/auth/games.firstparty")) {
                z2 = true;
            }
        }
        if (z2) {
            eg.a(!z3, String.format("Cannot have both %s and %s!", Scopes.GAMES, "https://www.googleapis.com/auth/games.firstparty"));
        } else {
            eg.a(z3, String.format("Games APIs requires %s to function.", Scopes.GAMES));
        }
    }

    @Override // com.google.android.gms.internal.dw, com.google.android.gms.internal.dx.b
    public Bundle aU() {
        try {
            Bundle aU = bQ().aU();
            if (aU == null) {
                return aU;
            }
            aU.setClassLoader(fl.class.getClassLoader());
            return aU;
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    @Override // com.google.android.gms.internal.dw
    protected String am() {
        return "com.google.android.gms.games.service.START";
    }

    @Override // com.google.android.gms.internal.dw
    protected String an() {
        return "com.google.android.gms.games.internal.IGamesService";
    }

    public void b(a.c<Status> cVar) {
        try {
            bQ().a(new au(cVar));
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void b(a.c<Achievements.UpdateAchievementResult> cVar, String str) {
        d dVar;
        if (cVar == null) {
            dVar = null;
        } else {
            try {
                dVar = new d(cVar);
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "service died");
                return;
            }
        }
        bQ().a(dVar, str, this.tS.dn(), this.tS.dm());
    }

    public void b(a.c<Achievements.UpdateAchievementResult> cVar, String str, int i2) {
        d dVar;
        if (cVar == null) {
            dVar = null;
        } else {
            try {
                dVar = new d(cVar);
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "service died");
                return;
            }
        }
        bQ().b(dVar, str, i2, this.tS.dn(), this.tS.dm());
    }

    public void b(a.c<Leaderboards.LoadScoresResult> cVar, String str, int i2, int i3, int i4, boolean z2) {
        try {
            bQ().b(new r(cVar), str, i2, i3, i4, z2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void b(a.c<Achievements.LoadAchievementsResult> cVar, boolean z2) {
        try {
            bQ().a(new f(cVar), z2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void c(a.c<Achievements.UpdateAchievementResult> cVar, String str) {
        d dVar;
        if (cVar == null) {
            dVar = null;
        } else {
            try {
                dVar = new d(cVar);
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "service died");
                return;
            }
        }
        bQ().b(dVar, str, this.tS.dn(), this.tS.dm());
    }

    public void clearNotifications(int notificationTypes) {
        try {
            bQ().clearNotifications(notificationTypes);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    @Override // com.google.android.gms.internal.dw, com.google.android.gms.common.GooglePlayServicesClient
    public void connect() {
        dc();
        super.connect();
    }

    public void createRoom(RoomConfig config) {
        try {
            bQ().a(new aq(config.getRoomUpdateListener(), config.getRoomStatusUpdateListener(), config.getMessageReceivedListener()), this.tU, config.getVariant(), config.getInvitedPlayerIds(), config.getAutoMatchCriteria(), config.isSocketEnabled(), this.tV);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void d(a.c<TurnBasedMultiplayer.InitiateMatchResult> cVar, String str) {
        try {
            bQ().n(new bb(cVar), str);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public int dd() {
        try {
            return bQ().dd();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return 4368;
        }
    }

    public void df() {
        if (isConnected()) {
            try {
                bQ().df();
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "service died");
            }
        }
    }

    @Override // com.google.android.gms.internal.dw, com.google.android.gms.common.GooglePlayServicesClient
    public void disconnect() {
        this.tT = false;
        if (isConnected()) {
            try {
                fp bQ = bQ();
                bQ.df();
                bQ.j(this.tV);
            } catch (RemoteException e2) {
                fn.c("GamesClientImpl", "Failed to notify client disconnect.");
            }
        }
        de();
        super.disconnect();
    }

    public void dismissTurnBasedMatch(String matchId) {
        try {
            bQ().ak(matchId);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void e(a.c<TurnBasedMultiplayer.InitiateMatchResult> cVar, String str) {
        try {
            bQ().o(new bb(cVar), str);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void f(a.c<TurnBasedMultiplayer.LeaveMatchResult> cVar, String str) {
        try {
            bQ().q(new bd(cVar), str);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void g(a.c<GamesMetadata.LoadGamesResult> cVar) {
        try {
            bQ().d(new j(cVar));
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void g(a.c<TurnBasedMultiplayer.CancelMatchResult> cVar, String str) {
        try {
            bQ().p(new az(cVar), str);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public Intent getAchievementsIntent() {
        try {
            return bQ().getAchievementsIntent();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getAllLeaderboardsIntent() {
        try {
            return bQ().getAllLeaderboardsIntent();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public String getAppId() {
        try {
            return bQ().getAppId();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public String getCurrentAccountName() {
        try {
            return bQ().getCurrentAccountName();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Game getCurrentGame() {
        bP();
        synchronized (this) {
            if (this.tR == null) {
                try {
                    GameBuffer gameBuffer = new GameBuffer(bQ().di());
                    try {
                        if (gameBuffer.getCount() > 0) {
                            this.tR = (GameEntity) gameBuffer.mo391get(0).freeze();
                        }
                    } finally {
                        gameBuffer.close();
                    }
                } catch (RemoteException e2) {
                    fn.c("GamesClientImpl", "service died");
                }
            }
        }
        return this.tR;
    }

    public Player getCurrentPlayer() {
        bP();
        synchronized (this) {
            if (this.tQ == null) {
                try {
                    PlayerBuffer playerBuffer = new PlayerBuffer(bQ().dg());
                    try {
                        if (playerBuffer.getCount() > 0) {
                            this.tQ = (PlayerEntity) playerBuffer.mo391get(0).freeze();
                        }
                    } finally {
                        playerBuffer.close();
                    }
                } catch (RemoteException e2) {
                    fn.c("GamesClientImpl", "service died");
                }
            }
        }
        return this.tQ;
    }

    public String getCurrentPlayerId() {
        try {
            return bQ().getCurrentPlayerId();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getInvitationInboxIntent() {
        try {
            return bQ().getInvitationInboxIntent();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getLeaderboardIntent(String leaderboardId) {
        try {
            return bQ().getLeaderboardIntent(leaderboardId);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getMatchInboxIntent() {
        try {
            return bQ().getMatchInboxIntent();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public int getMaxTurnBasedMatchDataSize() {
        try {
            return bQ().getMaxTurnBasedMatchDataSize();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return 2;
        }
    }

    public Intent getPlayerSearchIntent() {
        try {
            return bQ().getPlayerSearchIntent();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getRealTimeSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        try {
            return bQ().getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public RealTimeSocket getRealTimeSocketForParticipant(String roomId, String participantId) {
        if (participantId == null || !ParticipantUtils.am(participantId)) {
            throw new IllegalArgumentException("Bad participant ID");
        }
        RealTimeSocket realTimeSocket = this.tP.get(participantId);
        return (realTimeSocket == null || realTimeSocket.isClosed()) ? ae(participantId) : realTimeSocket;
    }

    public Intent getRealTimeWaitingRoomIntent(Room room, int minParticipantsToStart) {
        try {
            return bQ().a((RoomEntity) room.freeze(), minParticipantsToStart);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getSettingsIntent() {
        try {
            return bQ().getSettingsIntent();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public Intent getTurnBasedSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        try {
            return bQ().getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return null;
        }
    }

    public void h(a.c<Invitations.LoadInvitationsResult> cVar) {
        try {
            bQ().e(new o(cVar));
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void h(a.c<TurnBasedMultiplayer.LoadMatchResult> cVar, String str) {
        try {
            bQ().r(new bf(cVar), str);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void i(String str, int i2) {
        try {
            bQ().i(str, i2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void j(String str, int i2) {
        try {
            bQ().j(str, i2);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void joinRoom(RoomConfig config) {
        try {
            bQ().a(new aq(config.getRoomUpdateListener(), config.getRoomStatusUpdateListener(), config.getMessageReceivedListener()), this.tU, config.getInvitationId(), config.isSocketEnabled(), this.tV);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void leaveRoom(RoomUpdateListener listener, String roomId) {
        try {
            bQ().e(new aq(listener), roomId);
            de();
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public void onConnected(Bundle connectionHint) {
        if (this.tT) {
            this.tS.dl();
            this.tT = false;
        }
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener
    public void onConnectionFailed(ConnectionResult result) {
        this.tT = false;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public void onConnectionSuspended(int cause) {
    }

    public void registerInvitationListener(OnInvitationReceivedListener listener) {
        try {
            bQ().a(new l(listener), this.tV);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void registerMatchUpdateListener(OnTurnBasedMatchUpdateReceivedListener listener) {
        try {
            bQ().b(new x(listener), this.tV);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public int sendUnreliableRealTimeMessageToAll(byte[] messageData, String roomId) {
        try {
            return bQ().b(messageData, roomId, (String[]) null);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
            return -1;
        }
    }

    public void setGravityForPopups(int gravity) {
        this.tS.setGravity(gravity);
    }

    public void setViewForPopups(View gamesContentView) {
        this.tS.e(gamesContentView);
    }

    public void unregisterInvitationListener() {
        try {
            bQ().k(this.tV);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }

    public void unregisterMatchUpdateListener() {
        try {
            bQ().l(this.tV);
        } catch (RemoteException e2) {
            fn.c("GamesClientImpl", "service died");
        }
    }
}
