enum UserType {
  customer,
  admin;

  get value {
    switch (this) {
      case UserType.customer:
        return 'customer';
      case UserType.admin:
        return 'admin_user';
      default:
        return null;
    }
  }
}