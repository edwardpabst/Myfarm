# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_d_session',
  :secret      => 'c16962c3f5331211bd6754f4d4e30d7851ac6063c69ab3e73f8c2603064d78df7cfd1617062cf8daa2e741ba2a3912849644e3eb34555a95f7673b834defb4f8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
