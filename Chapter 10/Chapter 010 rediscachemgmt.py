from cachelib.redis import RedisCache

# Set up caching
CACHE_CONFIG = {
    'CACHE_TYPE': 'redis',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_URL': 'redis://redis:6379/0'
}

# Configure session management
SESSION_TYPE = 'redis'
SESSION_REDIS = RedisCache.from_url('redis://redis:6379/1')
