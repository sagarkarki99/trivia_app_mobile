class GameState {
  List<ConnectedUsers>? connectedUsers;
  ConnectedUsers? admin;

  GameState({this.connectedUsers, this.admin});

  GameState.fromJson(Map<String, dynamic> json) {
    if (json['connectedUsers'] != null) {
      connectedUsers = <ConnectedUsers>[];
      json['connectedUsers'].forEach((v) {
        connectedUsers!.add(ConnectedUsers.fromJson(v));
      });
    }
    admin =
        json['admin'] != null ? ConnectedUsers.fromJson(json['admin']) : null;
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
  String? id;
  String? imageUrl;
  String? name;

  ConnectedUsers({this.id, this.imageUrl, this.name});

  ConnectedUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    return data;
  }
}
