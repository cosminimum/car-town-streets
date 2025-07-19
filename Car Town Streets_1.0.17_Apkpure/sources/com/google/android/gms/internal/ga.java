package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer;
import com.google.android.gms.games.multiplayer.realtime.RealTimeSocket;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomUpdateListener;
import java.util.List;
/* loaded from: classes.dex */
public final class ga implements RealTimeMultiplayer {
    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public void create(GoogleApiClient apiClient, RoomConfig config) {
        Games.j(apiClient).createRoom(config);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public void declineInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.j(apiClient).j(invitationId, 0);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public void dismissInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.j(apiClient).i(invitationId, 0);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers) {
        return Games.j(apiClient).getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return Games.j(apiClient).getRealTimeSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public RealTimeSocket getSocketForParticipant(GoogleApiClient apiClient, String roomId, String participantId) {
        return Games.j(apiClient).getRealTimeSocketForParticipant(roomId, participantId);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public Intent getWaitingRoomIntent(GoogleApiClient apiClient, Room room, int minParticipantsToStart) {
        return Games.j(apiClient).getRealTimeWaitingRoomIntent(room, minParticipantsToStart);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public void join(GoogleApiClient apiClient, RoomConfig config) {
        Games.j(apiClient).joinRoom(config);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public void leave(GoogleApiClient apiClient, RoomUpdateListener listener, String roomId) {
        Games.j(apiClient).leaveRoom(listener, roomId);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public int sendReliableMessage(GoogleApiClient apiClient, RealTimeMultiplayer.ReliableMessageSentCallback callback, byte[] messageData, String roomId, String recipientParticipantId) {
        return Games.j(apiClient).a(callback, messageData, roomId, recipientParticipantId);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public int sendUnreliableMessage(GoogleApiClient apiClient, byte[] messageData, String roomId, String recipientParticipantId) {
        return Games.j(apiClient).a(messageData, roomId, new String[]{recipientParticipantId});
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public int sendUnreliableMessage(GoogleApiClient apiClient, byte[] messageData, String roomId, List<String> recipientParticipantIds) {
        return Games.j(apiClient).a(messageData, roomId, (String[]) recipientParticipantIds.toArray(new String[recipientParticipantIds.size()]));
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer
    public int sendUnreliableMessageToAll(GoogleApiClient apiClient, byte[] messageData, String roomId) {
        return Games.j(apiClient).sendUnreliableRealTimeMessageToAll(messageData, roomId);
    }
}
