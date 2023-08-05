class InitialGameState {
  List<ConnectedUser>? connectedUsers;
  ConnectedUser? admin;
  String? gameId;

  InitialGameState({this.connectedUsers, this.admin, this.gameId});

  InitialGameState.fromJson(Map<String, dynamic> json) {
    if (json['connectedUsers'] != null) {
      connectedUsers = <ConnectedUser>[];
      json['connectedUsers'].forEach((v) {
        connectedUsers!.add(ConnectedUser.fromJson(v));
      });
    }
    admin =
        json['admin'] != null ? ConnectedUser.fromJson(json['admin']) : null;
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

class ConnectedUser {
  String id;
  String? imageUrl;
  String name;
  String email;

  ConnectedUser(
      {required this.id,
      this.imageUrl,
      required this.name,
      required this.email});

  factory ConnectedUser.fromJson(Map<String, dynamic> json) {
    return ConnectedUser(
        id: json['id']!,
        imageUrl: json['imageUrl'],
        name: json['name'] ?? 'Game User',
        email: json['email']!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    return data;
  }
}
