# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_d_session',
  :secret      => '3d7813f37b0fb9b2950d0f14a5d36d98fb0be192196dbcf71444eb558089593cdcdea3af04e66f6c85ee52ca20869543b252ada349eeaafc9586f8ce7275e35f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
