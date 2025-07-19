package com.google.android.gms.games;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.games.GamesMetadata;
import com.google.android.gms.games.Players;
import com.google.android.gms.games.achievement.Achievements;
import com.google.android.gms.games.achievement.OnAchievementUpdatedListener;
import com.google.android.gms.games.achievement.OnAchievementsLoadedListener;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.Leaderboards;
import com.google.android.gms.games.leaderboard.OnLeaderboardMetadataLoadedListener;
import com.google.android.gms.games.leaderboard.OnLeaderboardScoresLoadedListener;
import com.google.android.gms.games.leaderboard.OnPlayerLeaderboardScoreLoadedListener;
import com.google.android.gms.games.leaderboard.OnScoreSubmittedListener;
import com.google.android.gms.games.leaderboard.SubmitScoreResult;
import com.google.android.gms.games.multiplayer.Invitations;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;
import com.google.android.gms.games.multiplayer.OnInvitationsLoadedListener;
import com.google.android.gms.games.multiplayer.ParticipantResult;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer;
import com.google.android.gms.games.multiplayer.realtime.RealTimeReliableMessageSentListener;
import com.google.android.gms.games.multiplayer.realtime.RealTimeSocket;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomUpdateListener;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchCanceledListener;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchInitiatedListener;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchLeftListener;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchLoadedListener;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchUpdateReceivedListener;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchUpdatedListener;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchesLoadedListener;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatchConfig;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1141fl;
import java.util.List;

@Deprecated
public final class GamesClient implements GooglePlayServicesClient {
    public static final String EXTRA_EXCLUSIVE_BIT_MASK = "exclusive_bit_mask";
    public static final String EXTRA_INVITATION = "invitation";
    public static final String EXTRA_MAX_AUTOMATCH_PLAYERS = "max_automatch_players";
    public static final String EXTRA_MIN_AUTOMATCH_PLAYERS = "min_automatch_players";
    public static final String EXTRA_PLAYERS = "players";
    public static final String EXTRA_PLAYER_SEARCH_RESULTS = "player_search_results";
    public static final String EXTRA_ROOM = "room";
    public static final String EXTRA_TURN_BASED_MATCH = "turn_based_match";
    public static final int MAX_RELIABLE_MESSAGE_LEN = 1400;
    public static final int MAX_UNRELIABLE_MESSAGE_LEN = 1168;
    public static final int NOTIFICATION_TYPES_ALL = -1;
    public static final int NOTIFICATION_TYPES_MULTIPLAYER = 3;
    public static final int NOTIFICATION_TYPE_INVITATION = 1;
    public static final int NOTIFICATION_TYPE_MATCH_UPDATE = 2;
    public static final int STATUS_ACHIEVEMENT_NOT_INCREMENTAL = 3002;
    public static final int STATUS_ACHIEVEMENT_UNKNOWN = 3001;
    public static final int STATUS_ACHIEVEMENT_UNLOCKED = 3003;
    public static final int STATUS_ACHIEVEMENT_UNLOCK_FAILURE = 3000;
    public static final int STATUS_APP_MISCONFIGURED = 8;
    public static final int STATUS_CLIENT_RECONNECT_REQUIRED = 2;
    public static final int STATUS_GAME_NOT_FOUND = 9;
    public static final int STATUS_INTERNAL_ERROR = 1;
    public static final int STATUS_INVALID_REAL_TIME_ROOM_ID = 7002;
    public static final int STATUS_LICENSE_CHECK_FAILED = 7;
    public static final int STATUS_MATCH_ERROR_ALREADY_REMATCHED = 6505;
    public static final int STATUS_MATCH_ERROR_INACTIVE_MATCH = 6501;
    public static final int STATUS_MATCH_ERROR_INVALID_MATCH_RESULTS = 6504;
    public static final int STATUS_MATCH_ERROR_INVALID_MATCH_STATE = 6502;
    public static final int STATUS_MATCH_ERROR_INVALID_PARTICIPANT_STATE = 6500;
    public static final int STATUS_MATCH_ERROR_LOCALLY_MODIFIED = 6507;
    public static final int STATUS_MATCH_ERROR_OUT_OF_DATE_VERSION = 6503;
    public static final int STATUS_MATCH_NOT_FOUND = 6506;
    public static final int STATUS_MULTIPLAYER_DISABLED = 6003;
    public static final int STATUS_MULTIPLAYER_ERROR_CREATION_NOT_ALLOWED = 6000;
    public static final int STATUS_MULTIPLAYER_ERROR_INVALID_MULTIPLAYER_TYPE = 6002;
    public static final int STATUS_MULTIPLAYER_ERROR_INVALID_OPERATION = 6004;
    public static final int STATUS_MULTIPLAYER_ERROR_NOT_TRUSTED_TESTER = 6001;
    public static final int STATUS_NETWORK_ERROR_NO_DATA = 4;
    public static final int STATUS_NETWORK_ERROR_OPERATION_DEFERRED = 5;
    public static final int STATUS_NETWORK_ERROR_OPERATION_FAILED = 6;
    public static final int STATUS_NETWORK_ERROR_STALE_DATA = 3;
    public static final int STATUS_OK = 0;
    public static final int STATUS_OPERATION_IN_FLIGHT = 7007;
    public static final int STATUS_PARTICIPANT_NOT_CONNECTED = 7003;
    public static final int STATUS_REAL_TIME_CONNECTION_FAILED = 7000;
    public static final int STATUS_REAL_TIME_INACTIVE_ROOM = 7005;
    public static final int STATUS_REAL_TIME_MESSAGE_FAILED = -1;
    public static final int STATUS_REAL_TIME_MESSAGE_SEND_FAILED = 7001;
    public static final int STATUS_REAL_TIME_ROOM_NOT_JOINED = 7004;

    /* renamed from: te */
    private final C1141fl f1664te;

    @Deprecated
    public static final class Builder {

        /* renamed from: jD */
        private final GooglePlayServicesClient.ConnectionCallbacks f1737jD;

        /* renamed from: jE */
        private final GooglePlayServicesClient.OnConnectionFailedListener f1738jE;

        /* renamed from: jF */
        private String[] f1739jF = {Scopes.GAMES};

        /* renamed from: jG */
        private String f1740jG = "<<default account>>";
        private final Context mContext;

        /* renamed from: tA */
        private boolean f1741tA = true;

        /* renamed from: tB */
        private int f1742tB = 17;

        /* renamed from: tx */
        private String f1743tx;

        /* renamed from: ty */
        private int f1744ty = 49;

        /* renamed from: tz */
        private View f1745tz;

        public Builder(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
            this.mContext = context;
            this.f1743tx = context.getPackageName();
            this.f1737jD = connectedListener;
            this.f1738jE = connectionFailedListener;
        }

        public GamesClient create() {
            return new GamesClient(this.mContext, this.f1743tx, this.f1740jG, this.f1737jD, this.f1738jE, this.f1739jF, this.f1744ty, this.f1745tz, this.f1741tA, this.f1742tB);
        }

        public Builder setAccountName(String accountName) {
            this.f1740jG = (String) C1102eg.m2616f(accountName);
            return this;
        }

        public Builder setGravityForPopups(int gravity) {
            this.f1744ty = gravity;
            return this;
        }

        public Builder setScopes(String... scopes) {
            this.f1739jF = scopes;
            return this;
        }

        public Builder setShowConnectingPopup(boolean showConnectingPopup) {
            this.f1741tA = showConnectingPopup;
            this.f1742tB = 17;
            return this;
        }

        public Builder setShowConnectingPopup(boolean showConnectingPopup, int gravity) {
            this.f1741tA = showConnectingPopup;
            this.f1742tB = gravity;
            return this;
        }

        public Builder setViewForPopups(View gamesContentView) {
            this.f1745tz = (View) C1102eg.m2616f(gamesContentView);
            return this;
        }
    }

    private GamesClient(Context context, String gamePackageName, String accountName, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener, String[] scopes, int gravity, View gamesContentView, boolean showConnectingPopup, int connectingPopupGravity) {
        this.f1664te = new C1141fl(context, gamePackageName, accountName, connectedListener, connectionFailedListener, scopes, gravity, gamesContentView, false, showConnectingPopup, connectingPopupGravity);
    }

    @Deprecated
    public void acceptTurnBasedInvitation(final OnTurnBasedMatchInitiatedListener listener, String invitationId) {
        this.f1664te.mo7752e(new C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.InitiateMatchResult initiateMatchResult) {
                listener.onTurnBasedMatchInitiated(initiateMatchResult.getStatus().getStatusCode(), initiateMatchResult.getMatch());
            }
        }, invitationId);
    }

    @Deprecated
    public void cancelTurnBasedMatch(final OnTurnBasedMatchCanceledListener listener, String matchId) {
        this.f1664te.mo7755g(new C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.CancelMatchResult cancelMatchResult) {
                listener.onTurnBasedMatchCanceled(cancelMatchResult.getStatus().getStatusCode(), cancelMatchResult.getMatchId());
            }
        }, matchId);
    }

    @Deprecated
    public void cancelTurnBasedMatch(String matchId) {
        this.f1664te.mo7755g(new C0655a.C0659c<TurnBasedMultiplayer.CancelMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.CancelMatchResult cancelMatchResult) {
            }
        }, matchId);
    }

    @Deprecated
    public void clearAllNotifications() {
        this.f1664te.clearNotifications(-1);
    }

    @Deprecated
    public void clearNotifications(int notificationTypes) {
        this.f1664te.clearNotifications(notificationTypes);
    }

    @Deprecated
    public void connect() {
        this.f1664te.connect();
    }

    @Deprecated
    public void createRoom(RoomConfig config) {
        this.f1664te.createRoom(config);
    }

    @Deprecated
    public void createTurnBasedMatch(final OnTurnBasedMatchInitiatedListener listener, TurnBasedMatchConfig config) {
        this.f1664te.mo7727a((C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult>) new C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.InitiateMatchResult initiateMatchResult) {
                listener.onTurnBasedMatchInitiated(initiateMatchResult.getStatus().getStatusCode(), initiateMatchResult.getMatch());
            }
        }, config);
    }

    @Deprecated
    public void declineRoomInvitation(String invitationId) {
        this.f1664te.mo7776j(invitationId, 0);
    }

    @Deprecated
    public void declineTurnBasedInvitation(String invitationId) {
        this.f1664te.mo7776j(invitationId, 1);
    }

    @Deprecated
    public void disconnect() {
        this.f1664te.disconnect();
    }

    @Deprecated
    public void dismissRoomInvitation(String invitationId) {
        this.f1664te.mo7775i(invitationId, 0);
    }

    @Deprecated
    public void dismissTurnBasedInvitation(String invitationId) {
        this.f1664te.mo7775i(invitationId, 1);
    }

    @Deprecated
    public void dismissTurnBasedMatch(String matchId) {
        this.f1664te.dismissTurnBasedMatch(matchId);
    }

    @Deprecated
    public void finishTurnBasedMatch(final OnTurnBasedMatchUpdatedListener listener, String matchId) {
        this.f1664te.mo7737a((C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>) new C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, (byte[]) null, (ParticipantResult[]) null);
    }

    @Deprecated
    public void finishTurnBasedMatch(OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, List<ParticipantResult> results) {
        finishTurnBasedMatch(listener, matchId, matchData, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    @Deprecated
    public void finishTurnBasedMatch(final OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, ParticipantResult... results) {
        this.f1664te.mo7737a((C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>) new C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, results);
    }

    @Deprecated
    public Intent getAchievementsIntent() {
        return this.f1664te.getAchievementsIntent();
    }

    @Deprecated
    public Intent getAllLeaderboardsIntent() {
        return this.f1664te.getAllLeaderboardsIntent();
    }

    @Deprecated
    public String getAppId() {
        return this.f1664te.getAppId();
    }

    @Deprecated
    public String getCurrentAccountName() {
        return this.f1664te.getCurrentAccountName();
    }

    @Deprecated
    public Game getCurrentGame() {
        return this.f1664te.getCurrentGame();
    }

    @Deprecated
    public Player getCurrentPlayer() {
        return this.f1664te.getCurrentPlayer();
    }

    @Deprecated
    public String getCurrentPlayerId() {
        return this.f1664te.getCurrentPlayerId();
    }

    @Deprecated
    public Intent getInvitationInboxIntent() {
        return this.f1664te.getInvitationInboxIntent();
    }

    @Deprecated
    public Intent getLeaderboardIntent(String leaderboardId) {
        return this.f1664te.getLeaderboardIntent(leaderboardId);
    }

    @Deprecated
    public Intent getMatchInboxIntent() {
        return this.f1664te.getMatchInboxIntent();
    }

    @Deprecated
    public int getMaxTurnBasedMatchDataSize() {
        return this.f1664te.getMaxTurnBasedMatchDataSize();
    }

    @Deprecated
    public Intent getPlayerSearchIntent() {
        return this.f1664te.getPlayerSearchIntent();
    }

    @Deprecated
    public Intent getRealTimeSelectOpponentsIntent(int minPlayers, int maxPlayers) {
        return this.f1664te.getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    @Deprecated
    public Intent getRealTimeSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return this.f1664te.getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    @Deprecated
    public RealTimeSocket getRealTimeSocketForParticipant(String roomId, String participantId) {
        return this.f1664te.getRealTimeSocketForParticipant(roomId, participantId);
    }

    @Deprecated
    public Intent getRealTimeWaitingRoomIntent(Room room, int minParticipantsToStart) {
        return this.f1664te.getRealTimeWaitingRoomIntent(room, minParticipantsToStart);
    }

    @Deprecated
    public Intent getSettingsIntent() {
        return this.f1664te.getSettingsIntent();
    }

    @Deprecated
    public void getTurnBasedMatch(final OnTurnBasedMatchLoadedListener listener, String matchId) {
        this.f1664te.mo7774h(new C0655a.C0659c<TurnBasedMultiplayer.LoadMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.LoadMatchResult loadMatchResult) {
                listener.onTurnBasedMatchLoaded(loadMatchResult.getStatus().getStatusCode(), loadMatchResult.getMatch());
            }
        }, matchId);
    }

    @Deprecated
    public Intent getTurnBasedSelectOpponentsIntent(int minPlayers, int maxPlayers) {
        return this.f1664te.getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    @Deprecated
    public Intent getTurnBasedSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return this.f1664te.getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    @Deprecated
    public void incrementAchievement(String id, int numSteps) {
        this.f1664te.mo7729a((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id, numSteps);
    }

    @Deprecated
    public void incrementAchievementImmediate(final OnAchievementUpdatedListener listener, String id, int numSteps) {
        this.f1664te.mo7729a((C0655a.C0659c<Achievements.UpdateAchievementResult>) new C0655a.C0659c<Achievements.UpdateAchievementResult>() {
            /* renamed from: a */
            public void mo5612a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id, numSteps);
    }

    @Deprecated
    public boolean isConnected() {
        return this.f1664te.isConnected();
    }

    @Deprecated
    public boolean isConnecting() {
        return this.f1664te.isConnecting();
    }

    @Deprecated
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.f1664te.isConnectionCallbacksRegistered(listener);
    }

    @Deprecated
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.f1664te.isConnectionFailedListenerRegistered(listener);
    }

    @Deprecated
    public void joinRoom(RoomConfig config) {
        this.f1664te.joinRoom(config);
    }

    @Deprecated
    public void leaveRoom(RoomUpdateListener listener, String roomId) {
        this.f1664te.leaveRoom(listener, roomId);
    }

    @Deprecated
    public void leaveTurnBasedMatch(final OnTurnBasedMatchLeftListener listener, String matchId) {
        this.f1664te.mo7753f(new C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.LeaveMatchResult leaveMatchResult) {
                listener.onTurnBasedMatchLeft(leaveMatchResult.getStatus().getStatusCode(), leaveMatchResult.getMatch());
            }
        }, matchId);
    }

    @Deprecated
    public void leaveTurnBasedMatchDuringTurn(final OnTurnBasedMatchLeftListener listener, String matchId, String pendingParticipantId) {
        this.f1664te.mo7733a((C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult>) new C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.LeaveMatchResult leaveMatchResult) {
                listener.onTurnBasedMatchLeft(leaveMatchResult.getStatus().getStatusCode(), leaveMatchResult.getMatch());
            }
        }, matchId, pendingParticipantId);
    }

    @Deprecated
    public void loadAchievements(final OnAchievementsLoadedListener listener, boolean forceReload) {
        this.f1664te.mo7744b((C0655a.C0659c<Achievements.LoadAchievementsResult>) new C0655a.C0659c<Achievements.LoadAchievementsResult>() {
            /* renamed from: a */
            public void mo5612a(Achievements.LoadAchievementsResult loadAchievementsResult) {
                listener.onAchievementsLoaded(loadAchievementsResult.getStatus().getStatusCode(), loadAchievementsResult.getAchievements());
            }
        }, forceReload);
    }

    @Deprecated
    public void loadCurrentPlayerLeaderboardScore(final OnPlayerLeaderboardScoreLoadedListener listener, String leaderboardId, int span, int leaderboardCollection) {
        this.f1664te.mo7734a((C0655a.C0659c<Leaderboards.LoadPlayerScoreResult>) new C0655a.C0659c<Leaderboards.LoadPlayerScoreResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LoadPlayerScoreResult loadPlayerScoreResult) {
                listener.onPlayerLeaderboardScoreLoaded(loadPlayerScoreResult.getStatus().getStatusCode(), loadPlayerScoreResult.getScore());
            }
        }, (String) null, leaderboardId, span, leaderboardCollection);
    }

    @Deprecated
    public void loadGame(final OnGamesLoadedListener listener) {
        this.f1664te.mo7754g(new C0655a.C0659c<GamesMetadata.LoadGamesResult>() {
            /* renamed from: a */
            public void mo5612a(GamesMetadata.LoadGamesResult loadGamesResult) {
                listener.onGamesLoaded(loadGamesResult.getStatus().getStatusCode(), loadGamesResult.getGames());
            }
        });
    }

    @Deprecated
    public void loadInvitablePlayers(final OnPlayersLoadedListener listener, int pageSize, boolean forceReload) {
        this.f1664te.mo7725a((C0655a.C0659c<Players.LoadPlayersResult>) new C0655a.C0659c<Players.LoadPlayersResult>() {
            /* renamed from: a */
            public void mo5612a(Players.LoadPlayersResult loadPlayersResult) {
                listener.onPlayersLoaded(loadPlayersResult.getStatus().getStatusCode(), loadPlayersResult.getPlayers());
            }
        }, pageSize, false, forceReload);
    }

    @Deprecated
    public void loadInvitations(final OnInvitationsLoadedListener listener) {
        this.f1664te.mo7773h(new C0655a.C0659c<Invitations.LoadInvitationsResult>() {
            /* renamed from: a */
            public void mo5612a(Invitations.LoadInvitationsResult loadInvitationsResult) {
                listener.onInvitationsLoaded(loadInvitationsResult.getStatus().getStatusCode(), loadInvitationsResult.getInvitations());
            }
        });
    }

    @Deprecated
    public void loadLeaderboardMetadata(final OnLeaderboardMetadataLoadedListener listener, String leaderboardId, boolean forceReload) {
        this.f1664te.mo7735a((C0655a.C0659c<Leaderboards.LeaderboardMetadataResult>) new C0655a.C0659c<Leaderboards.LeaderboardMetadataResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LeaderboardMetadataResult leaderboardMetadataResult) {
                listener.onLeaderboardMetadataLoaded(leaderboardMetadataResult.getStatus().getStatusCode(), leaderboardMetadataResult.getLeaderboards());
            }
        }, leaderboardId, forceReload);
    }

    @Deprecated
    public void loadLeaderboardMetadata(final OnLeaderboardMetadataLoadedListener listener, boolean forceReload) {
        this.f1664te.mo7738a((C0655a.C0659c<Leaderboards.LeaderboardMetadataResult>) new C0655a.C0659c<Leaderboards.LeaderboardMetadataResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LeaderboardMetadataResult leaderboardMetadataResult) {
                listener.onLeaderboardMetadataLoaded(leaderboardMetadataResult.getStatus().getStatusCode(), leaderboardMetadataResult.getLeaderboards());
            }
        }, forceReload);
    }

    @Deprecated
    public void loadMoreInvitablePlayers(final OnPlayersLoadedListener listener, int pageSize) {
        this.f1664te.mo7725a((C0655a.C0659c<Players.LoadPlayersResult>) new C0655a.C0659c<Players.LoadPlayersResult>() {
            /* renamed from: a */
            public void mo5612a(Players.LoadPlayersResult loadPlayersResult) {
                listener.onPlayersLoaded(loadPlayersResult.getStatus().getStatusCode(), loadPlayersResult.getPlayers());
            }
        }, pageSize, true, false);
    }

    @Deprecated
    public void loadMoreScores(final OnLeaderboardScoresLoadedListener listener, LeaderboardScoreBuffer buffer, int maxResults, int pageDirection) {
        this.f1664te.mo7726a((C0655a.C0659c<Leaderboards.LoadScoresResult>) new C0655a.C0659c<Leaderboards.LoadScoresResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, buffer, maxResults, pageDirection);
    }

    @Deprecated
    public void loadPlayer(final OnPlayersLoadedListener listener, String playerId) {
        this.f1664te.mo7728a((C0655a.C0659c<Players.LoadPlayersResult>) new C0655a.C0659c<Players.LoadPlayersResult>() {
            /* renamed from: a */
            public void mo5612a(Players.LoadPlayersResult loadPlayersResult) {
                listener.onPlayersLoaded(loadPlayersResult.getStatus().getStatusCode(), loadPlayersResult.getPlayers());
            }
        }, playerId);
    }

    @Deprecated
    public void loadPlayerCenteredScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        this.f1664te.mo7743b(new C0655a.C0659c<Leaderboards.LoadScoresResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    @Deprecated
    public void loadPlayerCenteredScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults, boolean forceReload) {
        this.f1664te.mo7743b(new C0655a.C0659c<Leaderboards.LoadScoresResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, forceReload);
    }

    @Deprecated
    public void loadTopScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        this.f1664te.mo7730a(new C0655a.C0659c<Leaderboards.LoadScoresResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    @Deprecated
    public void loadTopScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults, boolean forceReload) {
        this.f1664te.mo7730a(new C0655a.C0659c<Leaderboards.LoadScoresResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, forceReload);
    }

    @Deprecated
    public void loadTurnBasedMatches(final OnTurnBasedMatchesLoadedListener listener, int... matchTurnStatuses) {
        this.f1664te.mo7739a((C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult>) new C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.LoadMatchesResult loadMatchesResult) {
                listener.onTurnBasedMatchesLoaded(loadMatchesResult.getStatus().getStatusCode(), loadMatchesResult.getMatches());
            }
        }, matchTurnStatuses);
    }

    @Deprecated
    public void reconnect() {
        this.f1664te.disconnect();
        this.f1664te.connect();
    }

    @Deprecated
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f1664te.registerConnectionCallbacks(listener);
    }

    @Deprecated
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f1664te.registerConnectionFailedListener(listener);
    }

    @Deprecated
    public void registerInvitationListener(OnInvitationReceivedListener listener) {
        this.f1664te.registerInvitationListener(listener);
    }

    @Deprecated
    public void registerMatchUpdateListener(OnTurnBasedMatchUpdateReceivedListener listener) {
        this.f1664te.registerMatchUpdateListener(listener);
    }

    @Deprecated
    public void rematchTurnBasedMatch(final OnTurnBasedMatchInitiatedListener listener, String matchId) {
        this.f1664te.mo7748d(new C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.InitiateMatchResult initiateMatchResult) {
                listener.onTurnBasedMatchInitiated(initiateMatchResult.getStatus().getStatusCode(), initiateMatchResult.getMatch());
            }
        }, matchId);
    }

    @Deprecated
    public void revealAchievement(String id) {
        this.f1664te.mo7741b((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id);
    }

    @Deprecated
    public void revealAchievementImmediate(final OnAchievementUpdatedListener listener, String id) {
        this.f1664te.mo7741b((C0655a.C0659c<Achievements.UpdateAchievementResult>) new C0655a.C0659c<Achievements.UpdateAchievementResult>() {
            /* renamed from: a */
            public void mo5612a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id);
    }

    @Deprecated
    public int sendReliableRealTimeMessage(final RealTimeReliableMessageSentListener listener, byte[] messageData, String roomId, String recipientParticipantId) {
        return this.f1664te.mo7722a((RealTimeMultiplayer.ReliableMessageSentCallback) new RealTimeMultiplayer.ReliableMessageSentCallback() {
            public void onRealTimeMessageSent(int statusCode, int tokenId, String recipientParticipantId) {
                listener.onRealTimeMessageSent(statusCode, tokenId, recipientParticipantId);
            }
        }, messageData, roomId, recipientParticipantId);
    }

    @Deprecated
    public int sendUnreliableRealTimeMessage(byte[] messageData, String roomId, String recipientParticipantId) {
        return this.f1664te.mo7723a(messageData, roomId, new String[]{recipientParticipantId});
    }

    @Deprecated
    public int sendUnreliableRealTimeMessage(byte[] messageData, String roomId, List<String> recipientParticipantIds) {
        return this.f1664te.mo7723a(messageData, roomId, (String[]) recipientParticipantIds.toArray(new String[recipientParticipantIds.size()]));
    }

    @Deprecated
    public int sendUnreliableRealTimeMessageToAll(byte[] messageData, String roomId) {
        return this.f1664te.sendUnreliableRealTimeMessageToAll(messageData, roomId);
    }

    @Deprecated
    public void setAchievementSteps(String id, int numSteps) {
        this.f1664te.mo7742b((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id, numSteps);
    }

    @Deprecated
    public void setAchievementStepsImmediate(final OnAchievementUpdatedListener listener, String id, int numSteps) {
        this.f1664te.mo7742b(new C0655a.C0659c<Achievements.UpdateAchievementResult>() {
            /* renamed from: a */
            public void mo5612a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id, numSteps);
    }

    @Deprecated
    public void setGravityForPopups(int gravity) {
        this.f1664te.setGravityForPopups(gravity);
    }

    @Deprecated
    public void setViewForPopups(View gamesContentView) {
        C1102eg.m2616f(gamesContentView);
        this.f1664te.setViewForPopups(gamesContentView);
    }

    @Deprecated
    public void signOut() {
        this.f1664te.mo7740b(new C0655a.C0659c<Status>() {
            /* renamed from: a */
            public void mo5612a(Status status) {
            }
        });
    }

    @Deprecated
    public void signOut(final OnSignOutCompleteListener listener) {
        this.f1664te.mo7740b(new C0655a.C0659c<Status>() {
            /* renamed from: a */
            public void mo5612a(Status status) {
                listener.onSignOutComplete();
            }
        });
    }

    @Deprecated
    public void submitScore(String leaderboardId, long score) {
        this.f1664te.mo7732a((C0655a.C0659c<Leaderboards.SubmitScoreResult>) null, leaderboardId, score, (String) null);
    }

    @Deprecated
    public void submitScore(String leaderboardId, long score, String scoreTag) {
        this.f1664te.mo7732a((C0655a.C0659c<Leaderboards.SubmitScoreResult>) null, leaderboardId, score, scoreTag);
    }

    @Deprecated
    public void submitScoreImmediate(final OnScoreSubmittedListener listener, String leaderboardId, long score) {
        this.f1664te.mo7732a((C0655a.C0659c<Leaderboards.SubmitScoreResult>) new C0655a.C0659c<Leaderboards.SubmitScoreResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.SubmitScoreResult submitScoreResult) {
                listener.onScoreSubmitted(submitScoreResult.getStatus().getStatusCode(), new SubmitScoreResult(submitScoreResult.getScoreData().mo6704dx()));
            }
        }, leaderboardId, score, (String) null);
    }

    @Deprecated
    public void submitScoreImmediate(final OnScoreSubmittedListener listener, String leaderboardId, long score, String scoreTag) {
        this.f1664te.mo7732a((C0655a.C0659c<Leaderboards.SubmitScoreResult>) new C0655a.C0659c<Leaderboards.SubmitScoreResult>() {
            /* renamed from: a */
            public void mo5612a(Leaderboards.SubmitScoreResult submitScoreResult) {
                listener.onScoreSubmitted(submitScoreResult.getStatus().getStatusCode(), new SubmitScoreResult(submitScoreResult.getScoreData().mo6704dx()));
            }
        }, leaderboardId, score, scoreTag);
    }

    @Deprecated
    public void takeTurn(final OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, String pendingParticipantId) {
        this.f1664te.mo7736a((C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>) new C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, pendingParticipantId, (ParticipantResult[]) null);
    }

    @Deprecated
    public void takeTurn(final OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, String pendingParticipantId, List<ParticipantResult> results) {
        this.f1664te.mo7736a((C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>) new C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, pendingParticipantId, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    @Deprecated
    public void takeTurn(final OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, String pendingParticipantId, ParticipantResult... results) {
        this.f1664te.mo7736a((C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>) new C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>() {
            /* renamed from: a */
            public void mo5612a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, pendingParticipantId, results);
    }

    @Deprecated
    public void unlockAchievement(String id) {
        this.f1664te.mo7745c((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id);
    }

    @Deprecated
    public void unlockAchievementImmediate(final OnAchievementUpdatedListener listener, String id) {
        this.f1664te.mo7745c(new C0655a.C0659c<Achievements.UpdateAchievementResult>() {
            /* renamed from: a */
            public void mo5612a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id);
    }

    @Deprecated
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f1664te.unregisterConnectionCallbacks(listener);
    }

    @Deprecated
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f1664te.unregisterConnectionFailedListener(listener);
    }

    @Deprecated
    public void unregisterInvitationListener() {
        this.f1664te.unregisterInvitationListener();
    }

    @Deprecated
    public void unregisterMatchUpdateListener() {
        this.f1664te.unregisterMatchUpdateListener();
    }
}
