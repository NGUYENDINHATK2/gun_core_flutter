class MediaFileAccess {
  static const String contactInfo = "contact_info";
  static const String systemList = "systemList";
  static const String calendar = "calendar";
  static List<String> get mediaImageExtensions => [
    // Bitmap formats
    "bmp",
    "dib",

    // JPEG formats
    "jpg",
    "jpeg",
    "jpe",
    "jif",
    "jfif",
    "jfi",

    // PNG
    "png",

    // GIF
    "gif",

    // WebP
    "webp",

    // TIFF formats
    "tif",
    "tiff",

    // HEIF/HEIC (iOS, modern)
    "heif",
    "heic",

    // SVG (vector)
    "svg",
    "svgz",

    // ICO (icon format for Windows)
    "ico",

    // RAW formats (chuyên dụng máy ảnh DSLR)
    "raw",
    "cr2", // Canon
    "cr3", // Canon mới
    "nef", // Nikon
    "nrw", // Nikon mới
    "arw", // Sony
    "srf", // Sony
    "sr2", // Sony
    "orf", // Olympus
    "raf", // Fuji
    "rw2", // Panasonic
    "rwl", // Leica
    "dng", // Adobe Digital Negative
    // Photoshop, Illustrator, Postscript
    "psd", // Adobe Photoshop
    "ai", // Adobe Illustrator
    "eps", // Encapsulated Postscript
    // HDR / chuyên ngành
    "exr", // OpenEXR
    "hdr", // Radiance HDR
    // Multi-page image formats
    "jxr", // JPEG XR (HD Photo)
    "wdp", // Windows Media Photo
    // Less common / niche formats
    "pcx",
    "tga",
    "icns",
    "apng",
    "avif",
    "emf",
    "wmf",
    "xpm",
    "pbm",
    "pgm",
    "ppm",
    "pnm",
    "webm", // có thể chứa ảnh động
    "dds", // DirectDraw Surface (game)
    // Apple
    "qoi", // Quite OK Image (mới, nhanh)
  ];

  static List<String> get mediaVideoExtensions => [
    "mp4",
    "mkv",
    "avi",
    "mov",
    "wmv",
    "flv",
    "webm",
    "mpeg",
    "mpg",
    "m4v",
    "3gp",
    "3g2",
    "ts",
    "vob",
    "ogv"
  ];

  static List<String> get mediaAudioExtensions => [
    "mp3",
    "wav",
    "flac",
    "aac",
    "ogg",
    "wma",
    "m4a",
    "opus",
    "alac",
    "aiff",
    "ape", // Monkey's Audio
    "dts", // Digital Theater Systems
    "dsd", // Direct Stream Digital
    "mka"  // Matroska Audio
  ];

  static List<String> get mediaDocumentExtensions => [
    "pdf",
    "doc",
    "docx",
    "xls",
    "xlsx",
    "ppt",
    "csv",
    "pptx",
    "txt",
    "rtf",
    "odt", // OpenDocument Text
    "ods", // OpenDocument Spreadsheet
    "odp", // OpenDocument Presentation
    "epub", // Electronic Publication
    "mobi", // Mobipocket eBook
    "azw3"  // Amazon Kindle Format 8
  ];
}
