from authlib.integrations.flask_client import OAuth

AUTH_TYPE = AUTH_OAUTH
OAUTH_PROVIDERS = [{
    'name': 'google',
    'icon': 'fa-google',
    'token_key': 'access_token',
    'remote_app': {
        'consumer_key': 'your_google_client_id',
        'consumer_secret': 'your_google_client_secret',
        'base_url': 'https://www.googleapis.com/oauth2/v2/',
        'request_token_url': None,
        'access_token_url': 'https://accounts.google.com/o/oauth2/token',
        'authorize_url': 'https://accounts.google.com/o/oauth2/auth',
        'request_token_params': {
            'scope': 'email profile'
        }
    }
}]
