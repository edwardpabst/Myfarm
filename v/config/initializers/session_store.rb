# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_v_session',
  :secret      => '850de789a1ad19e566e20cb87c83451bd2497c6f443342dc4048c6ed2bfa7a0046b2327060ee2a418e3a147c6040df1238dc9654b8b4372a1ce057cdee1e312f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
