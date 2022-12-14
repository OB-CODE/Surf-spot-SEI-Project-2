def create_user(first_name, last_name, email, password, admin_stat)
  password_digest = BCrypt::Password.create(password)

  run_sql("INSERT INTO users(first_name, last_name, email, password_digest, admin_stat) VALUES($1, $2, $3, $4, $5)", [first_name, last_name, email, password_digest, admin_stat])
end
