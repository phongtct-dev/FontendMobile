enum AppEnvironment { localhost, lan }

class EnvConfig {
  // BƯỚC 1: Chuyển sang .lan vì đang chạy trên thiết bị thật
  static const AppEnvironment _env = AppEnvironment.lan;

  // BƯỚC 2: Cập nhật đúng IPv4 từ lệnh ipconfig
  static const String _lanIp = "192.168.100.101";

  static String get baseUrl {
    switch (_env) {
      case AppEnvironment.localhost:
      // Dùng cho máy ảo Android (Emulator)
        return "http://10.0.2.2:8000/api";
      case AppEnvironment.lan:
      // Dùng cho thiết bị thật (Physical Device) kết nối cùng Wi-Fi
        return "http://$_lanIp:8000/api";
    }
  }
}