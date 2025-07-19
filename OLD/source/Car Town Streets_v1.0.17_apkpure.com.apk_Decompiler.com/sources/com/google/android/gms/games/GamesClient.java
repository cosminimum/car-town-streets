package com.google.android.gms.games;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
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
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.fl;
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
    private final fl te;

    @Deprecated
    public static final class Builder {
        private final GooglePlayServicesClient.ConnectionCallbacks jD;
        private final GooglePlayServicesClient.OnConnectionFailedListener jE;
        private String[] jF = {Scopes.GAMES};
        private String jG = "<<default account>>";
        private final Context mContext;
        private boolean tA = true;
        private int tB = 17;
        private String tx;
        private int ty = 49;
        private View tz;

        public Builder(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
            this.mContext = context;
            this.tx = context.getPackageName();
            this.jD = connectedListener;
            this.jE = connectionFailedListener;
        }

        public GamesClient create() {
            return new GamesClient(this.mContext, this.tx, this.jG, this.jD, this.jE, this.jF, this.ty, this.tz, this.tA, this.tB);
        }

        public Builder setAccountName(String accountName) {
            this.jG = (String) eg.f(accountName);
            return this;
        }

        public Builder setGravityForPopups(int gravity) {
            this.ty = gravity;
            return this;
        }

        public Builder setScopes(String... scopes) {
            this.jF = scopes;
            return this;
        }

        public Builder setShowConnectingPopup(boolean showConnectingPopup) {
            this.tA = showConnectingPopup;
            this.tB = 17;
            return this;
        }

        public Builder setShowConnectingPopup(boolean showConnectingPopup, int gravity) {
            this.tA = showConnectingPopup;
            this.tB = gravity;
            return this;
        }

        public Builder setViewForPopups(View gamesContentView) {
            this.tz = (View) eg.f(gamesContentView);
            return this;
        }
    }

    private GamesClient(Context context, String gamePackageName, String accountName, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener, String[] scopes, int gravity, View gamesContentView, boolean showConnectingPopup, int connectingPopupGravity) {
        this.te = new fl(context, gamePackageName, accountName, connectedListener, connectionFailedListener, scopes, gravity, gamesContentView, false, showConnectingPopup, connectingPopupGravity);
    }

    @Deprecated
    public void acceptTurnBasedInvitation(final OnTurnBasedMatchInitiatedListener listener, String invitationId) {
        this.te.e(new a.c<TurnBasedMultiplayer.InitiateMatchResult>() {
            public void a(TurnBasedMultiplayer.InitiateMatchResult initiateMatchResult) {
                listener.onTurnBasedMatchInitiated(initiateMatchResult.getStatus().getStatusCode(), initiateMatchResult.getMatch());
            }
        }, invitationId);
    }

    @Deprecated
    public void cancelTurnBasedMatch(final OnTurnBasedMatchCanceledListener listener, String matchId) {
        this.te.g(new a.c<TurnBasedMultiplayer.CancelMatchResult>() {
            public void a(TurnBasedMultiplayer.CancelMatchResult cancelMatchResult) {
                listener.onTurnBasedMatchCanceled(cancelMatchResult.getStatus().getStatusCode(), cancelMatchResult.getMatchId());
            }
        }, matchId);
    }

    @Deprecated
    public void cancelTurnBasedMatch(String matchId) {
        this.te.g(new a.c<TurnBasedMultiplayer.CancelMatchResult>() {
            public void a(TurnBasedMultiplayer.CancelMatchResult cancelMatchResult) {
            }
        }, matchId);
    }

    @Deprecated
    public void clearAllNotifications() {
        this.te.clearNotifications(-1);
    }

    @Deprecated
    public void clearNotifications(int notificationTypes) {
        this.te.clearNotifications(notificationTypes);
    }

    @Deprecated
    public void connect() {
        this.te.connect();
    }

    @Deprecated
    public void createRoom(RoomConfig config) {
        this.te.createRoom(config);
    }

    @Deprecated
    public void createTurnBasedMatch(final OnTurnBasedMatchInitiatedListener listener, TurnBasedMatchConfig config) {
        this.te.a((a.c<TurnBasedMultiplayer.InitiateMatchResult>) new a.c<TurnBasedMultiplayer.InitiateMatchResult>() {
            public void a(TurnBasedMultiplayer.InitiateMatchResult initiateMatchResult) {
                listener.onTurnBasedMatchInitiated(initiateMatchResult.getStatus().getStatusCode(), initiateMatchResult.getMatch());
            }
        }, config);
    }

    @Deprecated
    public void declineRoomInvitation(String invitationId) {
        this.te.j(invitationId, 0);
    }

    @Deprecated
    public void declineTurnBasedInvitation(String invitationId) {
        this.te.j(invitationId, 1);
    }

    @Deprecated
    public void disconnect() {
        this.te.disconnect();
    }

    @Deprecated
    public void dismissRoomInvitation(String invitationId) {
        this.te.i(invitationId, 0);
    }

    @Deprecated
    public void dismissTurnBasedInvitation(String invitationId) {
        this.te.i(invitationId, 1);
    }

    @Deprecated
    public void dismissTurnBasedMatch(String matchId) {
        this.te.dismissTurnBasedMatch(matchId);
    }

    @Deprecated
    public void finishTurnBasedMatch(final OnTurnBasedMatchUpdatedListener listener, String matchId) {
        this.te.a((a.c<TurnBasedMultiplayer.UpdateMatchResult>) new a.c<TurnBasedMultiplayer.UpdateMatchResult>() {
            public void a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
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
        this.te.a((a.c<TurnBasedMultiplayer.UpdateMatchResult>) new a.c<TurnBasedMultiplayer.UpdateMatchResult>() {
            public void a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, results);
    }

    @Deprecated
    public Intent getAchievementsIntent() {
        return this.te.getAchievementsIntent();
    }

    @Deprecated
    public Intent getAllLeaderboardsIntent() {
        return this.te.getAllLeaderboardsIntent();
    }

    @Deprecated
    public String getAppId() {
        return this.te.getAppId();
    }

    @Deprecated
    public String getCurrentAccountName() {
        return this.te.getCurrentAccountName();
    }

    @Deprecated
    public Game getCurrentGame() {
        return this.te.getCurrentGame();
    }

    @Deprecated
    public Player getCurrentPlayer() {
        return this.te.getCurrentPlayer();
    }

    @Deprecated
    public String getCurrentPlayerId() {
        return this.te.getCurrentPlayerId();
    }

    @Deprecated
    public Intent getInvitationInboxIntent() {
        return this.te.getInvitationInboxIntent();
    }

    @Deprecated
    public Intent getLeaderboardIntent(String leaderboardId) {
        return this.te.getLeaderboardIntent(leaderboardId);
    }

    @Deprecated
    public Intent getMatchInboxIntent() {
        return this.te.getMatchInboxIntent();
    }

    @Deprecated
    public int getMaxTurnBasedMatchDataSize() {
        return this.te.getMaxTurnBasedMatchDataSize();
    }

    @Deprecated
    public Intent getPlayerSearchIntent() {
        return this.te.getPlayerSearchIntent();
    }

    @Deprecated
    public Intent getRealTimeSelectOpponentsIntent(int minPlayers, int maxPlayers) {
        return this.te.getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    @Deprecated
    public Intent getRealTimeSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return this.te.getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    @Deprecated
    public RealTimeSocket getRealTimeSocketForParticipant(String roomId, String participantId) {
        return this.te.getRealTimeSocketForParticipant(roomId, participantId);
    }

    @Deprecated
    public Intent getRealTimeWaitingRoomIntent(Room room, int minParticipantsToStart) {
        return this.te.getRealTimeWaitingRoomIntent(room, minParticipantsToStart);
    }

    @Deprecated
    public Intent getSettingsIntent() {
        return this.te.getSettingsIntent();
    }

    @Deprecated
    public void getTurnBasedMatch(final OnTurnBasedMatchLoadedListener listener, String matchId) {
        this.te.h(new a.c<TurnBasedMultiplayer.LoadMatchResult>() {
            public void a(TurnBasedMultiplayer.LoadMatchResult loadMatchResult) {
                listener.onTurnBasedMatchLoaded(loadMatchResult.getStatus().getStatusCode(), loadMatchResult.getMatch());
            }
        }, matchId);
    }

    @Deprecated
    public Intent getTurnBasedSelectOpponentsIntent(int minPlayers, int maxPlayers) {
        return this.te.getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    @Deprecated
    public Intent getTurnBasedSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return this.te.getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    @Deprecated
    public void incrementAchievement(String id, int numSteps) {
        this.te.a((a.c<Achievements.UpdateAchievementResult>) null, id, numSteps);
    }

    @Deprecated
    public void incrementAchievementImmediate(final OnAchievementUpdatedListener listener, String id, int numSteps) {
        this.te.a((a.c<Achievements.UpdateAchievementResult>) new a.c<Achievements.UpdateAchievementResult>() {
            public void a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id, numSteps);
    }

    @Deprecated
    public boolean isConnected() {
        return this.te.isConnected();
    }

    @Deprecated
    public boolean isConnecting() {
        return this.te.isConnecting();
    }

    @Deprecated
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.te.isConnectionCallbacksRegistered(listener);
    }

    @Deprecated
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.te.isConnectionFailedListenerRegistered(listener);
    }

    @Deprecated
    public void joinRoom(RoomConfig config) {
        this.te.joinRoom(config);
    }

    @Deprecated
    public void leaveRoom(RoomUpdateListener listener, String roomId) {
        this.te.leaveRoom(listener, roomId);
    }

    @Deprecated
    public void leaveTurnBasedMatch(final OnTurnBasedMatchLeftListener listener, String matchId) {
        this.te.f(new a.c<TurnBasedMultiplayer.LeaveMatchResult>() {
            public void a(TurnBasedMultiplayer.LeaveMatchResult leaveMatchResult) {
                listener.onTurnBasedMatchLeft(leaveMatchResult.getStatus().getStatusCode(), leaveMatchResult.getMatch());
            }
        }, matchId);
    }

    @Deprecated
    public void leaveTurnBasedMatchDuringTurn(final OnTurnBasedMatchLeftListener listener, String matchId, String pendingParticipantId) {
        this.te.a((a.c<TurnBasedMultiplayer.LeaveMatchResult>) new a.c<TurnBasedMultiplayer.LeaveMatchResult>() {
            public void a(TurnBasedMultiplayer.LeaveMatchResult leaveMatchResult) {
                listener.onTurnBasedMatchLeft(leaveMatchResult.getStatus().getStatusCode(), leaveMatchResult.getMatch());
            }
        }, matchId, pendingParticipantId);
    }

    @Deprecated
    public void loadAchievements(final OnAchievementsLoadedListener listener, boolean forceReload) {
        this.te.b((a.c<Achievements.LoadAchievementsResult>) new a.c<Achievements.LoadAchievementsResult>() {
            public void a(Achievements.LoadAchievementsResult loadAchievementsResult) {
                listener.onAchievementsLoaded(loadAchievementsResult.getStatus().getStatusCode(), loadAchievementsResult.getAchievements());
            }
        }, forceReload);
    }

    @Deprecated
    public void loadCurrentPlayerLeaderboardScore(final OnPlayerLeaderboardScoreLoadedListener listener, String leaderboardId, int span, int leaderboardCollection) {
        this.te.a((a.c<Leaderboards.LoadPlayerScoreResult>) new a.c<Leaderboards.LoadPlayerScoreResult>() {
            public void a(Leaderboards.LoadPlayerScoreResult loadPlayerScoreResult) {
                listener.onPlayerLeaderboardScoreLoaded(loadPlayerScoreResult.getStatus().getStatusCode(), loadPlayerScoreResult.getScore());
            }
        }, (String) null, leaderboardId, span, leaderboardCollection);
    }

    @Deprecated
    public void loadGame(final OnGamesLoadedListener listener) {
        this.te.g(new a.c<GamesMetadata.LoadGamesResult>() {
            public void a(GamesMetadata.LoadGamesResult loadGamesResult) {
                listener.onGamesLoaded(loadGamesResult.getStatus().getStatusCode(), loadGamesResult.getGames());
            }
        });
    }

    @Deprecated
    public void loadInvitablePlayers(final OnPlayersLoadedListener listener, int pageSize, boolean forceReload) {
        this.te.a((a.c<Players.LoadPlayersResult>) new a.c<Players.LoadPlayersResult>() {
            public void a(Players.LoadPlayersResult loadPlayersResult) {
                listener.onPlayersLoaded(loadPlayersResult.getStatus().getStatusCode(), loadPlayersResult.getPlayers());
            }
        }, pageSize, false, forceReload);
    }

    @Deprecated
    public void loadInvitations(final OnInvitationsLoadedListener listener) {
        this.te.h(new a.c<Invitations.LoadInvitationsResult>() {
            public void a(Invitations.LoadInvitationsResult loadInvitationsResult) {
                listener.onInvitationsLoaded(loadInvitationsResult.getStatus().getStatusCode(), loadInvitationsResult.getInvitations());
            }
        });
    }

    @Deprecated
    public void loadLeaderboardMetadata(final OnLeaderboardMetadataLoadedListener listener, String leaderboardId, boolean forceReload) {
        this.te.a((a.c<Leaderboards.LeaderboardMetadataResult>) new a.c<Leaderboards.LeaderboardMetadataResult>() {
            public void a(Leaderboards.LeaderboardMetadataResult leaderboardMetadataResult) {
                listener.onLeaderboardMetadataLoaded(leaderboardMetadataResult.getStatus().getStatusCode(), leaderboardMetadataResult.getLeaderboards());
            }
        }, leaderboardId, forceReload);
    }

    @Deprecated
    public void loadLeaderboardMetadata(final OnLeaderboardMetadataLoadedListener listener, boolean forceReload) {
        this.te.a((a.c<Leaderboards.LeaderboardMetadataResult>) new a.c<Leaderboards.LeaderboardMetadataResult>() {
            public void a(Leaderboards.LeaderboardMetadataResult leaderboardMetadataResult) {
                listener.onLeaderboardMetadataLoaded(leaderboardMetadataResult.getStatus().getStatusCode(), leaderboardMetadataResult.getLeaderboards());
            }
        }, forceReload);
    }

    @Deprecated
    public void loadMoreInvitablePlayers(final OnPlayersLoadedListener listener, int pageSize) {
        this.te.a((a.c<Players.LoadPlayersResult>) new a.c<Players.LoadPlayersResult>() {
            public void a(Players.LoadPlayersResult loadPlayersResult) {
                listener.onPlayersLoaded(loadPlayersResult.getStatus().getStatusCode(), loadPlayersResult.getPlayers());
            }
        }, pageSize, true, false);
    }

    @Deprecated
    public void loadMoreScores(final OnLeaderboardScoresLoadedListener listener, LeaderboardScoreBuffer buffer, int maxResults, int pageDirection) {
        this.te.a((a.c<Leaderboards.LoadScoresResult>) new a.c<Leaderboards.LoadScoresResult>() {
            public void a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, buffer, maxResults, pageDirection);
    }

    @Deprecated
    public void loadPlayer(final OnPlayersLoadedListener listener, String playerId) {
        this.te.a((a.c<Players.LoadPlayersResult>) new a.c<Players.LoadPlayersResult>() {
            public void a(Players.LoadPlayersResult loadPlayersResult) {
                listener.onPlayersLoaded(loadPlayersResult.getStatus().getStatusCode(), loadPlayersResult.getPlayers());
            }
        }, playerId);
    }

    @Deprecated
    public void loadPlayerCenteredScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        this.te.b(new a.c<Leaderboards.LoadScoresResult>() {
            public void a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    @Deprecated
    public void loadPlayerCenteredScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults, boolean forceReload) {
        this.te.b(new a.c<Leaderboards.LoadScoresResult>() {
            public void a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, forceReload);
    }

    @Deprecated
    public void loadTopScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        this.te.a(new a.c<Leaderboards.LoadScoresResult>() {
            public void a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    @Deprecated
    public void loadTopScores(final OnLeaderboardScoresLoadedListener listener, String leaderboardId, int span, int leaderboardCollection, int maxResults, boolean forceReload) {
        this.te.a(new a.c<Leaderboards.LoadScoresResult>() {
            public void a(Leaderboards.LoadScoresResult loadScoresResult) {
                listener.onLeaderboardScoresLoaded(loadScoresResult.getStatus().getStatusCode(), loadScoresResult.getLeaderboard(), loadScoresResult.getScores());
            }
        }, leaderboardId, span, leaderboardCollection, maxResults, forceReload);
    }

    @Deprecated
    public void loadTurnBasedMatches(final OnTurnBasedMatchesLoadedListener listener, int... matchTurnStatuses) {
        this.te.a((a.c<TurnBasedMultiplayer.LoadMatchesResult>) new a.c<TurnBasedMultiplayer.LoadMatchesResult>() {
            public void a(TurnBasedMultiplayer.LoadMatchesResult loadMatchesResult) {
                listener.onTurnBasedMatchesLoaded(loadMatchesResult.getStatus().getStatusCode(), loadMatchesResult.getMatches());
            }
        }, matchTurnStatuses);
    }

    @Deprecated
    public void reconnect() {
        this.te.disconnect();
        this.te.connect();
    }

    @Deprecated
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.te.registerConnectionCallbacks(listener);
    }

    @Deprecated
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.te.registerConnectionFailedListener(listener);
    }

    @Deprecated
    public void registerInvitationListener(OnInvitationReceivedListener listener) {
        this.te.registerInvitationListener(listener);
    }

    @Deprecated
    public void registerMatchUpdateListener(OnTurnBasedMatchUpdateReceivedListener listener) {
        this.te.registerMatchUpdateListener(listener);
    }

    @Deprecated
    public void rematchTurnBasedMatch(final OnTurnBasedMatchInitiatedListener listener, String matchId) {
        this.te.d(new a.c<TurnBasedMultiplayer.InitiateMatchResult>() {
            public void a(TurnBasedMultiplayer.InitiateMatchResult initiateMatchResult) {
                listener.onTurnBasedMatchInitiated(initiateMatchResult.getStatus().getStatusCode(), initiateMatchResult.getMatch());
            }
        }, matchId);
    }

    @Deprecated
    public void revealAchievement(String id) {
        this.te.b((a.c<Achievements.UpdateAchievementResult>) null, id);
    }

    @Deprecated
    public void revealAchievementImmediate(final OnAchievementUpdatedListener listener, String id) {
        this.te.b((a.c<Achievements.UpdateAchievementResult>) new a.c<Achievements.UpdateAchievementResult>() {
            public void a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id);
    }

    @Deprecated
    public int sendReliableRealTimeMessage(final RealTimeReliableMessageSentListener listener, byte[] messageData, String roomId, String recipientParticipantId) {
        return this.te.a((RealTimeMultiplayer.ReliableMessageSentCallback) new RealTimeMultiplayer.ReliableMessageSentCallback() {
            public void onRealTimeMessageSent(int statusCode, int tokenId, String recipientParticipantId) {
                listener.onRealTimeMessageSent(statusCode, tokenId, recipientParticipantId);
            }
        }, messageData, roomId, recipientParticipantId);
    }

    @Deprecated
    public int sendUnreliableRealTimeMessage(byte[] messageData, String roomId, String recipientParticipantId) {
        return this.te.a(messageData, roomId, new String[]{recipientParticipantId});
    }

    @Deprecated
    public int sendUnreliableRealTimeMessage(byte[] messageData, String roomId, List<String> recipientParticipantIds) {
        return this.te.a(messageData, roomId, (String[]) recipientParticipantIds.toArray(new String[recipientParticipantIds.size()]));
    }

    @Deprecated
    public int sendUnreliableRealTimeMessageToAll(byte[] messageData, String roomId) {
        return this.te.sendUnreliableRealTimeMessageToAll(messageData, roomId);
    }

    @Deprecated
    public void setAchievementSteps(String id, int numSteps) {
        this.te.b((a.c<Achievements.UpdateAchievementResult>) null, id, numSteps);
    }

    @Deprecated
    public void setAchievementStepsImmediate(final OnAchievementUpdatedListener listener, String id, int numSteps) {
        this.te.b(new a.c<Achievements.UpdateAchievementResult>() {
            public void a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id, numSteps);
    }

    @Deprecated
    public void setGravityForPopups(int gravity) {
        this.te.setGravityForPopups(gravity);
    }

    @Deprecated
    public void setViewForPopups(View gamesContentView) {
        eg.f(gamesContentView);
        this.te.setViewForPopups(gamesContentView);
    }

    @Deprecated
    public void signOut() {
        this.te.b(new a.c<Status>() {
            public void a(Status status) {
            }
        });
    }

    @Deprecated
    public void signOut(final OnSignOutCompleteListener listener) {
        this.te.b(new a.c<Status>() {
            public void a(Status status) {
                listener.onSignOutComplete();
            }
        });
    }

    @Deprecated
    public void submitScore(String leaderboardId, long score) {
        this.te.a((a.c<Leaderboards.SubmitScoreResult>) null, leaderboardId, score, (String) null);
    }

    @Deprecated
    public void submitScore(String leaderboardId, long score, String scoreTag) {
        this.te.a((a.c<Leaderboards.SubmitScoreResult>) null, leaderboardId, score, scoreTag);
    }

    @Deprecated
    public void submitScoreImmediate(final OnScoreSubmittedListener listener, String leaderboardId, long score) {
        this.te.a((a.c<Leaderboards.SubmitScoreResult>) new a.c<Leaderboards.SubmitScoreResult>() {
            public void a(Leaderboards.SubmitScoreResult submitScoreResult) {
                listener.onScoreSubmitted(submitScoreResult.getStatus().getStatusCode(), new SubmitScoreResult(submitScoreResult.getScoreData().dx()));
            }
        }, leaderboardId, score, (String) null);
    }

    @Deprecated
    public void submitScoreImmediate(final OnScoreSubmittedListener listener, String leaderboardId, long score, String scoreTag) {
        this.te.a((a.c<Leaderboards.SubmitScoreResult>) new a.c<Leaderboards.SubmitScoreResult>() {
            public void a(Leaderboards.SubmitScoreResult submitScoreResult) {
                listener.onScoreSubmitted(submitScoreResult.getStatus().getStatusCode(), new SubmitScoreResult(submitScoreResult.getScoreData().dx()));
            }
        }, leaderboardId, score, scoreTag);
    }

    @Deprecated
    public void takeTurn(final OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, String pendingParticipantId) {
        this.te.a((a.c<TurnBasedMultiplayer.UpdateMatchResult>) new a.c<TurnBasedMultiplayer.UpdateMatchResult>() {
            public void a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, pendingParticipantId, (ParticipantResult[]) null);
    }

    @Deprecated
    public void takeTurn(final OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, String pendingParticipantId, List<ParticipantResult> results) {
        this.te.a((a.c<TurnBasedMultiplayer.UpdateMatchResult>) new a.c<TurnBasedMultiplayer.UpdateMatchResult>() {
            public void a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, pendingParticipantId, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    @Deprecated
    public void takeTurn(final OnTurnBasedMatchUpdatedListener listener, String matchId, byte[] matchData, String pendingParticipantId, ParticipantResult... results) {
        this.te.a((a.c<TurnBasedMultiplayer.UpdateMatchResult>) new a.c<TurnBasedMultiplayer.UpdateMatchResult>() {
            public void a(TurnBasedMultiplayer.UpdateMatchResult updateMatchResult) {
                listener.onTurnBasedMatchUpdated(updateMatchResult.getStatus().getStatusCode(), updateMatchResult.getMatch());
            }
        }, matchId, matchData, pendingParticipantId, results);
    }

    @Deprecated
    public void unlockAchievement(String id) {
        this.te.c((a.c<Achievements.UpdateAchievementResult>) null, id);
    }

    @Deprecated
    public void unlockAchievementImmediate(final OnAchievementUpdatedListener listener, String id) {
        this.te.c(new a.c<Achievements.UpdateAchievementResult>() {
            public void a(Achievements.UpdateAchievementResult updateAchievementResult) {
                listener.onAchievementUpdated(updateAchievementResult.getStatus().getStatusCode(), updateAchievementResult.getAchievementId());
            }
        }, id);
    }

    @Deprecated
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.te.unregisterConnectionCallbacks(listener);
    }

    @Deprecated
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.te.unregisterConnectionFailedListener(listener);
    }

    @Deprecated
    public void unregisterInvitationListener() {
        this.te.unregisterInvitationListener();
    }

    @Deprecated
    public void unregisterMatchUpdateListener() {
        this.te.unregisterMatchUpdateListener();
    }
}
