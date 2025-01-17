class AuthService {
  // Mock usuarios
  static final Map<String, UserCredentials> _users = {
    'user@example.com': UserCredentials(
      password: 'user123',
      role: UserRole.user,
    ),
    'provider@example.com': UserCredentials(
      password: 'provider123',
      role: UserRole.provider,
    ),
  };

  static Future<UserCredentials?> login(String email, String password) async {
    // Simulamos un delay de red
    await Future.delayed(const Duration(milliseconds: 500));
    
    final user = _users[email];
    if (user != null && user.password == password) {
      return user;
    }
    return null;
  }
}

class UserCredentials {
  final String password;
  final UserRole role;

  UserCredentials({
    required this.password,
    required this.role,
  });
}

enum UserRole {
  user,
  provider,
  admin,
  superAdmin,
} 
