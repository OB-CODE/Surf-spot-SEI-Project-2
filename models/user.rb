def create_user(first_name, last_name, email, password, admin_stat)
  password_digest = BCrypt::Password.create(password)

  run_sql("INSERT INTO users(first_name, last_name, email, password_digest, admin_stat) VALUES($1, $2, $3, $4, $5)", [first_name, last_name, email, password_digest, admin_stat])
end
# ADMIN STATE NOTE - ADMIN_STAT takes a BOOL and is set to take in 0 on the USER_CONTROLLER page - Hence ALL users who create a sing up account will be set default to FALSE in regards to admin status. 


def find_user_by_email(email)
  users = run_sql('SELECT * FROM users WHERE email = $1', [email])

  # if more than one user is found with that email address, pick the first one with that email. Otherwise if no one is found, return nil.
  if users.to_a.count > 0
    users[0]
  else
    nil
  end
end

def find_user_by_id(id)
  run_sql('SELECT * FROM users WHERE id = $1', [id])[0]
end

