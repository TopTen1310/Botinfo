class Chat35Model {
  String? id;
  String? object;
  int? created;
  String? model;
  Usage? usage;
  List<Choices>? choices;

  Chat35Model(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.usage,
      this.choices});

  Chat35Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    usage = json['usage'] != null ? new Usage.fromJson(json['usage']) : null;
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['model'] = this.model;
    if (this.usage != null) {
      data['usage'] = this.usage!.toJson();
    }
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prompt_tokens'] = this.promptTokens;
    data['completion_tokens'] = this.completionTokens;
    data['total_tokens'] = this.totalTokens;
    return data;
  }
}

class Choices {
  Message? message;
  String? finishReason;
  int? index;

  Choices({this.message, this.finishReason, this.index});

  Choices.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
    finishReason = json['finish_reason'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['finish_reason'] = this.finishReason;
    data['index'] = this.index;
    return data;
  }
}

class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  Message.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['content'] = this.content;
    return data;
  }
}
