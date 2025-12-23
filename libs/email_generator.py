from datetime import datetime
import uuid


def generate_unique_email(prefix: str = "testuser", domain: str = "example.com") -> str:
    """Benzersiz (unique) bir test email adresi üretir."""
    timestamp = datetime.utcnow().strftime("%Y%m%d_%H%M%S")
    random_part = uuid.uuid4().hex[:6]
    local_part = f"{prefix}_{timestamp}_{random_part}"
    return f"{local_part}@{domain}"