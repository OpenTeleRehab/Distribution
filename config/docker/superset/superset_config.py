FEATURE_FLAGS = {
    "ENABLE_TEMPLATE_PROCESSING": True,
    "EMBEDDED_SUPERSET": True,
    "ESCAPE_MARKDOWN_HTML": False,
}

HTTP_HEADERS = {
    "X-Frame-Options": "ALLOWALL",
}

GUEST_ROLE_NAME= 'embed_dashboard'

CACHE_CONFIG = {
    "CACHE_TYPE": "redis",
    "CACHE_DEFAULT_TIMEOUT": 300,
    "CACHE_KEY_PREFIX": "superset_",
    "CACHE_REDIS_URL": "redis://superset_cache:6379/0",
}

DATA_CACHE_CONFIG = CACHE_CONFIG

LANGUAGES = {
    'en': {'flag': 'us', 'name': 'English'},
    'ar': {'flag': 'sa', 'name': 'اَلْعَرَبِيَّةُ'},
    'es': {'flag': 'es', 'name': 'Español'},
    'my': {'flag': 'mm', 'name': 'မြန်မာစာ'},
    'fr': {'flag': 'fr', 'name': 'Français'},
    'km': {'flag': 'kh', 'name': 'ភាសាខ្មែរ'},
    'rw': {'flag': 'rw', 'name': 'Ikinyarwanda'},
    'lo': {'flag': 'la', 'name': 'ພາສາລາວ'},
    'th': {'flag': 'th', 'name': 'ภาษาไทย'},
    'vi': {'flag': 'vn', 'name': 'Tiếng Việt'},
}

HTML_SANITIZATION = True
HTML_SANITIZATION_SCHEMA_EXTENSIONS = {
  "attributes": {
    "*": ["className"],
  },
  "tagNames": ["style"],
}
