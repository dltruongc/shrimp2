enum roles {
  farmer,
  retailer,
  researcher,
}

class Role {
  final roles _type;

  Role(roles type) : _type = type;

  get role => _type;
}
