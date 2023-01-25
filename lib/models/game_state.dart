class InitialGameState {
  List<ConnectedUsers>? connectedUsers;
  ConnectedUsers? admin;
  String? gameId;

  InitialGameState({this.connectedUsers, this.admin, this.gameId});

  InitialGameState.fromJson(Map<String, dynamic> json) {
    if (json['connectedUsers'] != null) {
      connectedUsers = <ConnectedUsers>[];
      json['connectedUsers'].forEach((v) {
        connectedUsers!.add(ConnectedUsers.fromJson(v));
      });
    }
    admin =
        json['admin'] != null ? ConnectedUsers.fromJson(json['admin']) : null;
    gameId = json['gameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (connectedUsers != null) {
      data['connectedUsers'] = connectedUsers!.map((v) => v.toJson()).toList();
    }
    if (admin != null) {
      data['admin'] = admin!.toJson();
    }
    return data;
  }
}

class ConnectedUsers {
  String id;
  String? imageUrl;
  String name;

  ConnectedUsers({required this.id, this.imageUrl, required this.name});

  factory ConnectedUsers.fromJson(Map<String, dynamic> json) {
    return ConnectedUsers(
      id: json['id']!,
      imageUrl: json['imageUrl'],
      name: json['name'] ?? 'Game User',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    return data;
  }
}
