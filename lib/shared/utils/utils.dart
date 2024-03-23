class GeneralUtil {
  static String getEmojiFromText(String text) {
    switch (text) {
      case "fire":
        return "🔥";
      case "grass":
        return "🌿";
      case "poison":
        return "☠️";
      case "flying":
        return "🦋";
      case "bug":
        return "🐞";
      case "normal":
        return "🐻";
      default:
        return "";
    }
  }
}
