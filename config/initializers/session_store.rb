# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hangman_session',
  :secret      => '989ca0e9d720d15f7f4f1576bc618ec0e1572780bc8434898d5f7131b0a61bcadc13be50a14e7e72f9613bdee2c40c1a69fd66eacf6a3ebb5db81bc0ea4fb6e1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
