# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sparekey_session',
  :secret      => '62cf45a7c05ea828ce393b9234bed7d33be612e4c758806359669d9145e730320820bcc6d4eb485528c43f1c8c99fd38d2d75a136dfb9f40b31fa01458b41825'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
